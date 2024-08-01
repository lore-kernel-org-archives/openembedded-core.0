Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AA5C52D73
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:25 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.75496.1722536827840124860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VPIFazbA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=iLH+Cw3w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101910f323354-4cce766b-066d-422a-90dd-2a3838623c38-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w0RJDOZGx5YOUjRgLo/ouNIh2yCB6ac+QGQY0YeekPo=;
	b=VPIFazbAvtbnwhs2uBNTFNVOsKBwcku52BcgFizb1NoEMEX0cw4PNqLe/cWdcjqZ
	zwy9ctPeJOgE4Tci4T7Oom16iJdqMt4dd1DVkzyXVQUNZ+I/Di+dL4zsoEFrGAPr3kp
	EIl0Q4sGWUYJDD9A9TMOXd2usmdI6p/I+FAm57VE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w0RJDOZGx5YOUjRgLo/ouNIh2yCB6ac+QGQY0YeekPo=;
	b=iLH+Cw3wHXrQsUaDHNvs1hjxkR/sKJ+is67vQTjPqc6Sl27E1pRB13v2gEEEcdNs
	irhHwnZg7faCSECOOf0+RRdCDDXxIKel/ThIObfCW2CjgXvm14HDNN6M1cgpQD0MWdK
	Md8tVAvckHLWR5/yuKeCrcIZ0Y7vr0S+mfjWu1IE=
Content-Type: multipart/mixed; boundary="===============8997525626269925105=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-utility-libraries: upgrading to 1.3.290.0 FAILED
Message-ID: <010101910f323354-4cce766b-066d-422a-90dd-2a3838623c38-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202854

--===============8997525626269925105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-utility-libraries* to *1.3.290.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-utility-libraries-upgrade-1.3.283.0-1.3.290.0.patch
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
From 31a3f14fd9c42b20066e9408ef28bf1ed35a0290 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 14:37:36 +0000
Subject: [PATCH] vulkan-utility-libraries: upgrade 1.3.283.0 -> 1.3.290.0

---
 ...aries_1.3.283.0.bb => vulkan-utility-libraries_1.3.290.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.3.283.0.bb => vulkan-utility-libraries_1.3.290.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb
index 3274bea8fd..475386069f 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https"
-SRCREV = "ad7f699a7b2b5deb66eb3de19f24aa33597ed65b"
+SRCREV = "5f26cf65a18bc89a8e3d6569c14314b6fdac8d4d"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============8997525626269925105==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-utility-libraries-upgrade-1.3.283.0-1.3.290.0.patch"

RnJvbSAzMWEzZjE0ZmQ5YzQyYjIwMDY2ZTk0MDhlZjI4YmYxZWQzNWEwMjkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNDozNzozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi11dGlsaXR5LWxpYnJhcmllczogdXBncmFkZSAxLjMuMjgzLjAgLT4gMS4zLjI5MC4wCgot
LS0KIC4uLmFyaWVzXzEuMy4yODMuMC5iYiA9PiB2dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4z
LjI5MC4wLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi11dGls
aXR5LWxpYnJhcmllc18xLjMuMjgzLjAuYmIgPT4gdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEu
My4yOTAuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjMuMjgzLjAuYmIgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjMuMjkwLjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI4My4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjMuMjkwLjAu
YmIKaW5kZXggMzI3NGJlYThmZC4uNDc1Mzg2MDY5ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI4My4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXV0aWxpdHktbGlicmFyaWVz
XzEuMy4yOTAuMC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT00Y2EyZDY3OTkwOTFhYWE5
OGE4NTIwZjFiNzkzOTM5YiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NH
cm91cC9WdWxrYW4tVXRpbGl0eS1MaWJyYXJpZXMuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0
dHBzIgotU1JDUkVWID0gImFkN2Y2OTlhN2IyYjVkZWI2NmViM2RlMTlmMjRhYTMzNTk3ZWQ2NWIi
CitTUkNSRVYgPSAiNWYyNmNmNjVhMThiYzg5YThlM2Q2NTY5YzE0MzE0YjZmZGFjOGQ0ZCIKIAog
UyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40NC4wCgo=

--===============8997525626269925105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1883 targets, 37 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-d560c91a4e4bb9937f891f1593ece04281ea2b24"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d560c91a4e4bb9937f891f1593ece04281ea2b24"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 94 Local 85 Mirrors 0 Missed 9 Current 214 (90% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 246 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 248 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 308 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 903 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb:do_fetch)
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_fetch: Started
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_fetch: Succeeded
NOTE: Running task 904 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb:do_unpack)
NOTE: Running task 905 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_unpack: Started
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_unpack: Succeeded
NOTE: Running task 906 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb:do_patch)
NOTE: Running task 907 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_patch: Started
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_patch: Succeeded
NOTE: Running task 909 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 911 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb:do_configure)
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_configure: Started
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_configure: Succeeded
NOTE: Running task 912 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb:do_compile)
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build --target all --
| Change Dir: '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/12] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/po
 kybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hi
 dden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/layer/vk_layer_settings_helper.cpp
| [2/12] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/po
 kybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hi
 dden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_manual.cpp.o -MF src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_manual.cpp.o.d -o src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_manual.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_manual.cpp
| FAILED: src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_manual.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild
 /yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -s
 td=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_manual.cpp.o -MF src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_manual.cpp.o.d -o src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_manual.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_manual.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_manual.cpp:12:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8506:15: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8506 |         const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* in_struct, PNextCopyState* copy_state = {},
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8514:27: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8514 |     void initialize(const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8517:5: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8517 |     VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8520:5: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8520 |     VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8529:56: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8529 |     safe_VkPhysicalDeviceMaintenance7FeaturesKHR(const VkPhysicalDeviceMaintenance7FeaturesKHR* in_struct,
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8535:27: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8535 |     void initialize(const VkPhysicalDeviceMaintenance7FeaturesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8537:5: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8537 |     VkPhysicalDeviceMaintenance7FeaturesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceMaintenance7FeaturesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8538:5: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8538 |     VkPhysicalDeviceMaintenance7FeaturesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8554:58: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8554 |     safe_VkPhysicalDeviceMaintenance7PropertiesKHR(const VkPhysicalDeviceMaintenance7PropertiesKHR* in_struct,
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8560:27: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8560 |     void initialize(const VkPhysicalDeviceMaintenance7PropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8562:5: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8562 |     VkPhysicalDeviceMaintenance7PropertiesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceMaintenance7PropertiesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8563:5: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8563 |     VkPhysicalDeviceMaintenance7PropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8572:5: error: 'VkPhysicalDeviceLayeredApiKHR' does not name a type; did you mean 'VkPhysicalDeviceFeatures2KHR'?
|  8572 |     VkPhysicalDeviceLayeredApiKHR layeredAPI;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceFeatures2KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8575:56: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8575 |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR(const VkPhysicalDeviceLayeredApiPropertiesKHR* in_struct,
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8581:27: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8581 |     void initialize(const VkPhysicalDeviceLayeredApiPropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8583:5: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8583 |     VkPhysicalDeviceLayeredApiPropertiesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceLayeredApiPropertiesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8584:5: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8584 |     VkPhysicalDeviceLayeredApiPropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8594:60: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8594 |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR(const VkPhysicalDeviceLayeredApiPropertiesListKHR* in_struct,
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8600:27: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8600 |     void initialize(const VkPhysicalDeviceLayeredApiPropertiesListKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8602:5: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8602 |     VkPhysicalDeviceLayeredApiPropertiesListKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8605:5: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8605 |     VkPhysicalDeviceLayeredApiPropertiesListKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8614:62: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8614 |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR(const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* in_struct,
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8621:27: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8621 |     void initialize(const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8623:5: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8623 |     VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8626:5: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8626 |     VkPhysicalDeviceLayeredApiVulkanPropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17256:66: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17256 |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT(const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* in_struct,
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17263:27: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17263 |     void initialize(const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17265:5: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17265 |     VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17268:5: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17268 |     VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17277:68: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17277 |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT(const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* in_struct,
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17285:27: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17285 |     void initialize(const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17287:5: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17287 |     VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17290:5: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17290 |     VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18033:15: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18033 |         const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* in_struct, PNextCopyState* copy_state = {},
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18041:27: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18041 |     void initialize(const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18043:5: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18043 |     VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18046:5: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18046 |     VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18076:66: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18076 |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA(const VkPhysicalDeviceImageAlignmentControlFeaturesMESA* in_struct,
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18083:27: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18083 |     void initialize(const VkPhysicalDeviceImageAlignmentControlFeaturesMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18085:5: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18085 |     VkPhysicalDeviceImageAlignmentControlFeaturesMESA* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18088:5: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18088 |     VkPhysicalDeviceImageAlignmentControlFeaturesMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18097:68: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18097 |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA(const VkPhysicalDeviceImageAlignmentControlPropertiesMESA* in_struct,
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18105:27: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18105 |     void initialize(const VkPhysicalDeviceImageAlignmentControlPropertiesMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18107:5: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18107 |     VkPhysicalDeviceImageAlignmentControlPropertiesMESA* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18110:5: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18110 |     VkPhysicalDeviceImageAlignmentControlPropertiesMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18119:54: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18119 |     safe_VkImageAlignmentControlCreateInfoMESA(const VkImageAlignmentControlCreateInfoMESA* in_struct,
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18125:27: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18125 |     void initialize(const VkImageAlignmentControlCreateInfoMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18127:5: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18127 |     VkImageAlignmentControlCreateInfoMESA* ptr() { return reinterpret_cast<VkImageAlignmentControlCreateInfoMESA*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18128:5: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18128 |     VkImageAlignmentControlCreateInfoMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkImageAlignmentControlCreateInfoMESA
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_manual.cpp:13:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:456:45: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|   456 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:456:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   456 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:457:45: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|   457 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7FeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:457:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   457 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7FeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:458:45: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|   458 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7PropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:458:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   458 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7PropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:459:45: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|   459 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:459:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   459 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:460:45: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|   460 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesListKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:460:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   460 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesListKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:461:45: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|   461 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiVulkanPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:461:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   461 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiVulkanPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:911:45: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
|   911 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:911:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   911 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:912:45: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
|   912 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:912:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   912 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:951:45: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
|   951 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:951:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   951 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:953:45: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
|   953 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:953:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   953 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:954:45: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
|   954 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlPropertiesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:954:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   954 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlPropertiesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:955:45: error: 'VkImageAlignmentControlCreateInfoMESA' was not declared in this scope; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
|   955 | template <> inline VkStructureType GetSType<VkImageAlignmentControlCreateInfoMESA>() { return VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:955:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   955 | template <> inline VkStructureType GetSType<VkImageAlignmentControlCreateInfoMESA>() { return VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| [3/12] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/po
 kybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hi
 dden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/layer/layer_settings_manager.cpp
| [4/12] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/po
 kybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hi
 dden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_core.cpp.o -MF src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_core.cpp.o.d -o src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_core.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_core.cpp
| FAILED: src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_core.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild
 /yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -s
 td=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_core.cpp.o -MF src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_core.cpp.o.d -o src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_core.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_core.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_core.cpp:17:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8506:15: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8506 |         const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* in_struct, PNextCopyState* copy_state = {},
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8514:27: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8514 |     void initialize(const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8517:5: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8517 |     VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8520:5: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8520 |     VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8529:56: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8529 |     safe_VkPhysicalDeviceMaintenance7FeaturesKHR(const VkPhysicalDeviceMaintenance7FeaturesKHR* in_struct,
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8535:27: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8535 |     void initialize(const VkPhysicalDeviceMaintenance7FeaturesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8537:5: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8537 |     VkPhysicalDeviceMaintenance7FeaturesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceMaintenance7FeaturesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8538:5: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8538 |     VkPhysicalDeviceMaintenance7FeaturesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8554:58: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8554 |     safe_VkPhysicalDeviceMaintenance7PropertiesKHR(const VkPhysicalDeviceMaintenance7PropertiesKHR* in_struct,
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8560:27: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8560 |     void initialize(const VkPhysicalDeviceMaintenance7PropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8562:5: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8562 |     VkPhysicalDeviceMaintenance7PropertiesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceMaintenance7PropertiesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8563:5: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8563 |     VkPhysicalDeviceMaintenance7PropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8572:5: error: 'VkPhysicalDeviceLayeredApiKHR' does not name a type; did you mean 'VkPhysicalDeviceFeatures2KHR'?
|  8572 |     VkPhysicalDeviceLayeredApiKHR layeredAPI;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceFeatures2KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8575:56: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8575 |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR(const VkPhysicalDeviceLayeredApiPropertiesKHR* in_struct,
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8581:27: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8581 |     void initialize(const VkPhysicalDeviceLayeredApiPropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8583:5: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8583 |     VkPhysicalDeviceLayeredApiPropertiesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceLayeredApiPropertiesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8584:5: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8584 |     VkPhysicalDeviceLayeredApiPropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8594:60: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8594 |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR(const VkPhysicalDeviceLayeredApiPropertiesListKHR* in_struct,
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8600:27: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8600 |     void initialize(const VkPhysicalDeviceLayeredApiPropertiesListKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8602:5: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8602 |     VkPhysicalDeviceLayeredApiPropertiesListKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8605:5: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8605 |     VkPhysicalDeviceLayeredApiPropertiesListKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8614:62: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8614 |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR(const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* in_struct,
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8621:27: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8621 |     void initialize(const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8623:5: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8623 |     VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8626:5: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8626 |     VkPhysicalDeviceLayeredApiVulkanPropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17256:66: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17256 |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT(const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* in_struct,
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17263:27: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17263 |     void initialize(const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17265:5: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17265 |     VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17268:5: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17268 |     VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17277:68: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17277 |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT(const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* in_struct,
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17285:27: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17285 |     void initialize(const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17287:5: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17287 |     VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17290:5: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17290 |     VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18033:15: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18033 |         const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* in_struct, PNextCopyState* copy_state = {},
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18041:27: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18041 |     void initialize(const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18043:5: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18043 |     VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18046:5: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18046 |     VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18076:66: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18076 |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA(const VkPhysicalDeviceImageAlignmentControlFeaturesMESA* in_struct,
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18083:27: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18083 |     void initialize(const VkPhysicalDeviceImageAlignmentControlFeaturesMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18085:5: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18085 |     VkPhysicalDeviceImageAlignmentControlFeaturesMESA* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18088:5: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18088 |     VkPhysicalDeviceImageAlignmentControlFeaturesMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18097:68: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18097 |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA(const VkPhysicalDeviceImageAlignmentControlPropertiesMESA* in_struct,
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18105:27: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18105 |     void initialize(const VkPhysicalDeviceImageAlignmentControlPropertiesMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18107:5: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18107 |     VkPhysicalDeviceImageAlignmentControlPropertiesMESA* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18110:5: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18110 |     VkPhysicalDeviceImageAlignmentControlPropertiesMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18119:54: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18119 |     safe_VkImageAlignmentControlCreateInfoMESA(const VkImageAlignmentControlCreateInfoMESA* in_struct,
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18125:27: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18125 |     void initialize(const VkImageAlignmentControlCreateInfoMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18127:5: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18127 |     VkImageAlignmentControlCreateInfoMESA* ptr() { return reinterpret_cast<VkImageAlignmentControlCreateInfoMESA*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18128:5: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18128 |     VkImageAlignmentControlCreateInfoMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkImageAlignmentControlCreateInfoMESA
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_core.cpp:18:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:456:45: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|   456 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:456:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   456 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:457:45: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|   457 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7FeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:457:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   457 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7FeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:458:45: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|   458 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7PropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:458:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   458 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7PropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:459:45: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|   459 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:459:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   459 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:460:45: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|   460 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesListKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:460:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   460 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesListKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:461:45: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|   461 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiVulkanPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:461:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   461 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiVulkanPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:911:45: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
|   911 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:911:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   911 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:912:45: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
|   912 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:912:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   912 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:951:45: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
|   951 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:951:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   951 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:953:45: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
|   953 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:953:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   953 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:954:45: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
|   954 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlPropertiesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:954:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   954 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlPropertiesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:955:45: error: 'VkImageAlignmentControlCreateInfoMESA' was not declared in this scope; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
|   955 | template <> inline VkStructureType GetSType<VkImageAlignmentControlCreateInfoMESA>() { return VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:955:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   955 | template <> inline VkStructureType GetSType<VkImageAlignmentControlCreateInfoMESA>() { return VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| [5/12] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/po
 kybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hi
 dden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_ext.cpp.o -MF src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_ext.cpp.o.d -o src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_ext.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp
| FAILED: src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_ext.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild
 /yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -s
 td=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_ext.cpp.o -MF src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_ext.cpp.o.d -o src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_ext.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:17:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8506:15: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8506 |         const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* in_struct, PNextCopyState* copy_state = {},
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8514:27: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8514 |     void initialize(const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8517:5: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8517 |     VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8520:5: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8520 |     VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8529:56: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8529 |     safe_VkPhysicalDeviceMaintenance7FeaturesKHR(const VkPhysicalDeviceMaintenance7FeaturesKHR* in_struct,
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8535:27: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8535 |     void initialize(const VkPhysicalDeviceMaintenance7FeaturesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8537:5: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8537 |     VkPhysicalDeviceMaintenance7FeaturesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceMaintenance7FeaturesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8538:5: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8538 |     VkPhysicalDeviceMaintenance7FeaturesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8554:58: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8554 |     safe_VkPhysicalDeviceMaintenance7PropertiesKHR(const VkPhysicalDeviceMaintenance7PropertiesKHR* in_struct,
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8560:27: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8560 |     void initialize(const VkPhysicalDeviceMaintenance7PropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8562:5: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8562 |     VkPhysicalDeviceMaintenance7PropertiesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceMaintenance7PropertiesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8563:5: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8563 |     VkPhysicalDeviceMaintenance7PropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8572:5: error: 'VkPhysicalDeviceLayeredApiKHR' does not name a type; did you mean 'VkPhysicalDeviceFeatures2KHR'?
|  8572 |     VkPhysicalDeviceLayeredApiKHR layeredAPI;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceFeatures2KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8575:56: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8575 |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR(const VkPhysicalDeviceLayeredApiPropertiesKHR* in_struct,
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8581:27: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8581 |     void initialize(const VkPhysicalDeviceLayeredApiPropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8583:5: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8583 |     VkPhysicalDeviceLayeredApiPropertiesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceLayeredApiPropertiesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8584:5: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8584 |     VkPhysicalDeviceLayeredApiPropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8594:60: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8594 |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR(const VkPhysicalDeviceLayeredApiPropertiesListKHR* in_struct,
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8600:27: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8600 |     void initialize(const VkPhysicalDeviceLayeredApiPropertiesListKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8602:5: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8602 |     VkPhysicalDeviceLayeredApiPropertiesListKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8605:5: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8605 |     VkPhysicalDeviceLayeredApiPropertiesListKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8614:62: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8614 |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR(const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* in_struct,
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8621:27: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8621 |     void initialize(const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8623:5: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8623 |     VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8626:5: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8626 |     VkPhysicalDeviceLayeredApiVulkanPropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17256:66: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17256 |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT(const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* in_struct,
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17263:27: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17263 |     void initialize(const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17265:5: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17265 |     VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17268:5: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17268 |     VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17277:68: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17277 |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT(const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* in_struct,
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17285:27: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17285 |     void initialize(const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17287:5: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17287 |     VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17290:5: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17290 |     VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18033:15: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18033 |         const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* in_struct, PNextCopyState* copy_state = {},
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18041:27: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18041 |     void initialize(const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18043:5: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18043 |     VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18046:5: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18046 |     VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18076:66: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18076 |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA(const VkPhysicalDeviceImageAlignmentControlFeaturesMESA* in_struct,
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18083:27: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18083 |     void initialize(const VkPhysicalDeviceImageAlignmentControlFeaturesMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18085:5: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18085 |     VkPhysicalDeviceImageAlignmentControlFeaturesMESA* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18088:5: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18088 |     VkPhysicalDeviceImageAlignmentControlFeaturesMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18097:68: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18097 |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA(const VkPhysicalDeviceImageAlignmentControlPropertiesMESA* in_struct,
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18105:27: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18105 |     void initialize(const VkPhysicalDeviceImageAlignmentControlPropertiesMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18107:5: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18107 |     VkPhysicalDeviceImageAlignmentControlPropertiesMESA* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18110:5: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18110 |     VkPhysicalDeviceImageAlignmentControlPropertiesMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18119:54: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18119 |     safe_VkImageAlignmentControlCreateInfoMESA(const VkImageAlignmentControlCreateInfoMESA* in_struct,
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18125:27: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18125 |     void initialize(const VkImageAlignmentControlCreateInfoMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18127:5: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18127 |     VkImageAlignmentControlCreateInfoMESA* ptr() { return reinterpret_cast<VkImageAlignmentControlCreateInfoMESA*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18128:5: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18128 |     VkImageAlignmentControlCreateInfoMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkImageAlignmentControlCreateInfoMESA
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:18:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:456:45: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|   456 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:456:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   456 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:457:45: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|   457 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7FeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:457:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   457 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7FeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:458:45: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|   458 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7PropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:458:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   458 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7PropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:459:45: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|   459 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:459:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   459 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:460:45: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|   460 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesListKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:460:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   460 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesListKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:461:45: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|   461 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiVulkanPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:461:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   461 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiVulkanPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:911:45: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
|   911 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:911:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   911 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:912:45: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
|   912 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:912:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   912 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:951:45: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
|   951 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:951:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   951 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:953:45: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
|   953 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:953:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   953 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:954:45: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
|   954 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlPropertiesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:954:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   954 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlPropertiesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:955:45: error: 'VkImageAlignmentControlCreateInfoMESA' was not declared in this scope; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
|   955 | template <> inline VkStructureType GetSType<VkImageAlignmentControlCreateInfoMESA>() { return VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:955:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   955 | template <> inline VkStructureType GetSType<VkImageAlignmentControlCreateInfoMESA>() { return VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14792:11: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 14792 |     const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* in_struct, [[maybe_unused]] PNextCopyState* copy_state,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp: In constructor 'vku::safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT::safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT(const int*, vku::PNextCopyState*, bool)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14794:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14794 |     : sType(in_struct->sType), legacyVertexAttributes(in_struct->legacyVertexAttributes) {
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14794:66: error: request for member 'legacyVertexAttributes' in '* in_struct', which is of non-class type 'const int'
| 14794 |     : sType(in_struct->sType), legacyVertexAttributes(in_struct->legacyVertexAttributes) {
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14796:42: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14796 |         pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp: In constructor 'vku::safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT::safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT()':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14801:13: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT'?
| 14801 |     : sType(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT), pNext(nullptr), legacyVertexAttributes() {}
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14828:11: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 14828 |     const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* in_struct, [[maybe_unused]] PNextCopyState* copy_state) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp: In member function 'void vku::safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT::initialize(const int*, vku::PNextCopyState*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14830:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14830 |     sType = in_struct->sType;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14831:41: error: request for member 'legacyVertexAttributes' in '* in_struct', which is of non-class type 'const int'
| 14831 |     legacyVertexAttributes = in_struct->legacyVertexAttributes;
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14832:38: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14832 |     pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                      ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14843:11: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 14843 |     const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* in_struct, [[maybe_unused]] PNextCopyState* copy_state,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp: In constructor 'vku::safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT::safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT(const int*, vku::PNextCopyState*, bool)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14845:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14845 |     : sType(in_struct->sType), nativeUnalignedPerformance(in_struct->nativeUnalignedPerformance) {
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14845:70: error: request for member 'nativeUnalignedPerformance' in '* in_struct', which is of non-class type 'const int'
| 14845 |     : sType(in_struct->sType), nativeUnalignedPerformance(in_struct->nativeUnalignedPerformance) {
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14847:42: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14847 |         pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp: In constructor 'vku::safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT::safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT()':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14852:13: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT'?
| 14852 |     : sType(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT),
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14881:11: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 14881 |     const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* in_struct, [[maybe_unused]] PNextCopyState* copy_state) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp: In member function 'void vku::safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT::initialize(const int*, vku::PNextCopyState*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14883:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14883 |     sType = in_struct->sType;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14884:45: error: request for member 'nativeUnalignedPerformance' in '* in_struct', which is of non-class type 'const int'
| 14884 |     nativeUnalignedPerformance = in_struct->nativeUnalignedPerformance;
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:14885:38: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14885 |     pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                      ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:15207:11: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 15207 |     const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* in_struct, [[maybe_unused]] PNextCopyState* copy_state,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp: In constructor 'vku::safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT::safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT(const int*, vku::PNextCopyState*, bool)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:15209:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 15209 |     : sType(in_struct->sType), shaderReplicatedComposites(in_struct->shaderReplicatedComposites) {
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:15209:70: error: request for member 'shaderReplicatedComposites' in '* in_struct', which is of non-class type 'const int'
| 15209 |     : sType(in_struct->sType), shaderReplicatedComposites(in_struct->shaderReplicatedComposites) {
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:15211:42: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 15211 |         pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp: In constructor 'vku::safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT::safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT()':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:15216:13: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT'?
| 15216 |     : sType(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT),
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:15245:11: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 15245 |     const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* in_struct, [[maybe_unused]] PNextCopyState* copy_state) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp: In member function 'void vku::safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT::initialize(const int*, vku::PNextCopyState*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:15247:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 15247 |     sType = in_struct->sType;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:15248:45: error: request for member 'shaderReplicatedComposites' in '* in_struct', which is of non-class type 'const int'
| 15248 |     shaderReplicatedComposites = in_struct->shaderReplicatedComposites;
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_ext.cpp:15249:38: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 15249 |     pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                      ^~~~~
| [6/12] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/po
 kybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hi
 dden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_vendor.cpp.o -MF src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_vendor.cpp.o.d -o src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_vendor.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp
| FAILED: src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_vendor.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild
 /yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -s
 td=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_vendor.cpp.o -MF src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_vendor.cpp.o.d -o src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_vendor.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:17:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8506:15: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8506 |         const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* in_struct, PNextCopyState* copy_state = {},
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8514:27: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8514 |     void initialize(const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8517:5: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8517 |     VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8520:5: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8520 |     VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8529:56: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8529 |     safe_VkPhysicalDeviceMaintenance7FeaturesKHR(const VkPhysicalDeviceMaintenance7FeaturesKHR* in_struct,
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8535:27: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8535 |     void initialize(const VkPhysicalDeviceMaintenance7FeaturesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8537:5: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8537 |     VkPhysicalDeviceMaintenance7FeaturesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceMaintenance7FeaturesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8538:5: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8538 |     VkPhysicalDeviceMaintenance7FeaturesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8554:58: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8554 |     safe_VkPhysicalDeviceMaintenance7PropertiesKHR(const VkPhysicalDeviceMaintenance7PropertiesKHR* in_struct,
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8560:27: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8560 |     void initialize(const VkPhysicalDeviceMaintenance7PropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8562:5: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8562 |     VkPhysicalDeviceMaintenance7PropertiesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceMaintenance7PropertiesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8563:5: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8563 |     VkPhysicalDeviceMaintenance7PropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8572:5: error: 'VkPhysicalDeviceLayeredApiKHR' does not name a type; did you mean 'VkPhysicalDeviceFeatures2KHR'?
|  8572 |     VkPhysicalDeviceLayeredApiKHR layeredAPI;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceFeatures2KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8575:56: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8575 |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR(const VkPhysicalDeviceLayeredApiPropertiesKHR* in_struct,
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8581:27: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8581 |     void initialize(const VkPhysicalDeviceLayeredApiPropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8583:5: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8583 |     VkPhysicalDeviceLayeredApiPropertiesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceLayeredApiPropertiesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8584:5: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8584 |     VkPhysicalDeviceLayeredApiPropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8594:60: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8594 |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR(const VkPhysicalDeviceLayeredApiPropertiesListKHR* in_struct,
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8600:27: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8600 |     void initialize(const VkPhysicalDeviceLayeredApiPropertiesListKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8602:5: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8602 |     VkPhysicalDeviceLayeredApiPropertiesListKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8605:5: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8605 |     VkPhysicalDeviceLayeredApiPropertiesListKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8614:62: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8614 |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR(const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* in_struct,
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8621:27: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8621 |     void initialize(const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8623:5: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8623 |     VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8626:5: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8626 |     VkPhysicalDeviceLayeredApiVulkanPropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17256:66: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17256 |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT(const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* in_struct,
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17263:27: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17263 |     void initialize(const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17265:5: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17265 |     VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17268:5: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17268 |     VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17277:68: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17277 |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT(const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* in_struct,
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17285:27: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17285 |     void initialize(const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17287:5: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17287 |     VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17290:5: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17290 |     VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18033:15: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18033 |         const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* in_struct, PNextCopyState* copy_state = {},
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18041:27: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18041 |     void initialize(const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18043:5: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18043 |     VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18046:5: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18046 |     VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18076:66: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18076 |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA(const VkPhysicalDeviceImageAlignmentControlFeaturesMESA* in_struct,
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18083:27: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18083 |     void initialize(const VkPhysicalDeviceImageAlignmentControlFeaturesMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18085:5: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18085 |     VkPhysicalDeviceImageAlignmentControlFeaturesMESA* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18088:5: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18088 |     VkPhysicalDeviceImageAlignmentControlFeaturesMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18097:68: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18097 |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA(const VkPhysicalDeviceImageAlignmentControlPropertiesMESA* in_struct,
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18105:27: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18105 |     void initialize(const VkPhysicalDeviceImageAlignmentControlPropertiesMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18107:5: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18107 |     VkPhysicalDeviceImageAlignmentControlPropertiesMESA* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18110:5: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18110 |     VkPhysicalDeviceImageAlignmentControlPropertiesMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18119:54: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18119 |     safe_VkImageAlignmentControlCreateInfoMESA(const VkImageAlignmentControlCreateInfoMESA* in_struct,
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18125:27: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18125 |     void initialize(const VkImageAlignmentControlCreateInfoMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18127:5: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18127 |     VkImageAlignmentControlCreateInfoMESA* ptr() { return reinterpret_cast<VkImageAlignmentControlCreateInfoMESA*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18128:5: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18128 |     VkImageAlignmentControlCreateInfoMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkImageAlignmentControlCreateInfoMESA
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:18:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:456:45: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|   456 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:456:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   456 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:457:45: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|   457 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7FeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:457:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   457 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7FeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:458:45: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|   458 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7PropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:458:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   458 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7PropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:459:45: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|   459 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:459:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   459 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:460:45: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|   460 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesListKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:460:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   460 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesListKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:461:45: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|   461 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiVulkanPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:461:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   461 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiVulkanPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:911:45: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
|   911 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:911:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   911 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:912:45: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
|   912 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:912:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   912 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:951:45: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
|   951 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:951:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   951 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:953:45: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
|   953 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:953:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   953 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:954:45: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
|   954 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlPropertiesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:954:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   954 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlPropertiesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:955:45: error: 'VkImageAlignmentControlCreateInfoMESA' was not declared in this scope; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
|   955 | template <> inline VkStructureType GetSType<VkImageAlignmentControlCreateInfoMESA>() { return VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:955:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   955 | template <> inline VkStructureType GetSType<VkImageAlignmentControlCreateInfoMESA>() { return VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15122:11: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 15122 |     const VkPhysicalDeviceImageAlignmentControlFeaturesMESA* in_struct, [[maybe_unused]] PNextCopyState* copy_state,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp: In constructor 'vku::safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA::safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA(const int*, vku::PNextCopyState*, bool)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15124:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 15124 |     : sType(in_struct->sType), imageAlignmentControl(in_struct->imageAlignmentControl) {
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15124:65: error: request for member 'imageAlignmentControl' in '* in_struct', which is of non-class type 'const int'
| 15124 |     : sType(in_struct->sType), imageAlignmentControl(in_struct->imageAlignmentControl) {
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15126:42: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 15126 |         pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp: In constructor 'vku::safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA::safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA()':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15131:13: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT'?
| 15131 |     : sType(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA), pNext(nullptr), imageAlignmentControl() {}
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15158:11: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 15158 |     const VkPhysicalDeviceImageAlignmentControlFeaturesMESA* in_struct, [[maybe_unused]] PNextCopyState* copy_state) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp: In member function 'void vku::safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA::initialize(const int*, vku::PNextCopyState*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15160:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 15160 |     sType = in_struct->sType;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15161:40: error: request for member 'imageAlignmentControl' in '* in_struct', which is of non-class type 'const int'
| 15161 |     imageAlignmentControl = in_struct->imageAlignmentControl;
|       |                                        ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15162:38: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 15162 |     pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                      ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15173:11: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 15173 |     const VkPhysicalDeviceImageAlignmentControlPropertiesMESA* in_struct, [[maybe_unused]] PNextCopyState* copy_state,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp: In constructor 'vku::safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA::safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA(const int*, vku::PNextCopyState*, bool)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15175:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 15175 |     : sType(in_struct->sType), supportedImageAlignmentMask(in_struct->supportedImageAlignmentMask) {
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15175:71: error: request for member 'supportedImageAlignmentMask' in '* in_struct', which is of non-class type 'const int'
| 15175 |     : sType(in_struct->sType), supportedImageAlignmentMask(in_struct->supportedImageAlignmentMask) {
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15177:42: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 15177 |         pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp: In constructor 'vku::safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA::safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA()':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15182:13: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT'?
| 15182 |     : sType(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA),
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15211:11: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 15211 |     const VkPhysicalDeviceImageAlignmentControlPropertiesMESA* in_struct, [[maybe_unused]] PNextCopyState* copy_state) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp: In member function 'void vku::safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA::initialize(const int*, vku::PNextCopyState*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15213:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 15213 |     sType = in_struct->sType;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15214:46: error: request for member 'supportedImageAlignmentMask' in '* in_struct', which is of non-class type 'const int'
| 15214 |     supportedImageAlignmentMask = in_struct->supportedImageAlignmentMask;
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15215:38: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 15215 |     pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                      ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15226:11: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 15226 |     const VkImageAlignmentControlCreateInfoMESA* in_struct, [[maybe_unused]] PNextCopyState* copy_state, bool copy_pnext)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp: In constructor 'vku::safe_VkImageAlignmentControlCreateInfoMESA::safe_VkImageAlignmentControlCreateInfoMESA(const int*, vku::PNextCopyState*, bool)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15227:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 15227 |     : sType(in_struct->sType), maximumRequestedAlignment(in_struct->maximumRequestedAlignment) {
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15227:69: error: request for member 'maximumRequestedAlignment' in '* in_struct', which is of non-class type 'const int'
| 15227 |     : sType(in_struct->sType), maximumRequestedAlignment(in_struct->maximumRequestedAlignment) {
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15229:42: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 15229 |         pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp: In constructor 'vku::safe_VkImageAlignmentControlCreateInfoMESA::safe_VkImageAlignmentControlCreateInfoMESA()':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15234:13: error: 'VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT'?
| 15234 |     : sType(VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA), pNext(nullptr), maximumRequestedAlignment() {}
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15258:67: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 15258 | void safe_VkImageAlignmentControlCreateInfoMESA::initialize(const VkImageAlignmentControlCreateInfoMESA* in_struct,
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                   safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp: In member function 'void vku::safe_VkImageAlignmentControlCreateInfoMESA::initialize(const int*, vku::PNextCopyState*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15261:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 15261 |     sType = in_struct->sType;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15262:44: error: request for member 'maximumRequestedAlignment' in '* in_struct', which is of non-class type 'const int'
| 15262 |     maximumRequestedAlignment = in_struct->maximumRequestedAlignment;
|       |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_vendor.cpp:15263:38: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 15263 |     pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                      ^~~~~
| [7/12] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/po
 kybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hi
 dden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/layer/vk_layer_settings.cpp
| [8/12] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/po
 kybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hi
 dden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_khr.cpp.o -MF src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_khr.cpp.o.d -o src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_khr.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp
| FAILED: src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_khr.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild
 /yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -s
 td=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_khr.cpp.o -MF src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_khr.cpp.o.d -o src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_khr.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:17:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8506:15: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8506 |         const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* in_struct, PNextCopyState* copy_state = {},
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8514:27: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8514 |     void initialize(const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8517:5: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8517 |     VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8520:5: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8520 |     VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8529:56: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8529 |     safe_VkPhysicalDeviceMaintenance7FeaturesKHR(const VkPhysicalDeviceMaintenance7FeaturesKHR* in_struct,
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8535:27: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8535 |     void initialize(const VkPhysicalDeviceMaintenance7FeaturesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8537:5: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8537 |     VkPhysicalDeviceMaintenance7FeaturesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceMaintenance7FeaturesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8538:5: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8538 |     VkPhysicalDeviceMaintenance7FeaturesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8554:58: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8554 |     safe_VkPhysicalDeviceMaintenance7PropertiesKHR(const VkPhysicalDeviceMaintenance7PropertiesKHR* in_struct,
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8560:27: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8560 |     void initialize(const VkPhysicalDeviceMaintenance7PropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8562:5: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8562 |     VkPhysicalDeviceMaintenance7PropertiesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceMaintenance7PropertiesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8563:5: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8563 |     VkPhysicalDeviceMaintenance7PropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8572:5: error: 'VkPhysicalDeviceLayeredApiKHR' does not name a type; did you mean 'VkPhysicalDeviceFeatures2KHR'?
|  8572 |     VkPhysicalDeviceLayeredApiKHR layeredAPI;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceFeatures2KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8575:56: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8575 |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR(const VkPhysicalDeviceLayeredApiPropertiesKHR* in_struct,
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8581:27: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8581 |     void initialize(const VkPhysicalDeviceLayeredApiPropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8583:5: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8583 |     VkPhysicalDeviceLayeredApiPropertiesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceLayeredApiPropertiesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8584:5: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8584 |     VkPhysicalDeviceLayeredApiPropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8594:60: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8594 |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR(const VkPhysicalDeviceLayeredApiPropertiesListKHR* in_struct,
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8600:27: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8600 |     void initialize(const VkPhysicalDeviceLayeredApiPropertiesListKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8602:5: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8602 |     VkPhysicalDeviceLayeredApiPropertiesListKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8605:5: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8605 |     VkPhysicalDeviceLayeredApiPropertiesListKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8614:62: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8614 |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR(const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* in_struct,
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8621:27: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8621 |     void initialize(const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8623:5: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8623 |     VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8626:5: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8626 |     VkPhysicalDeviceLayeredApiVulkanPropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17256:66: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17256 |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT(const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* in_struct,
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17263:27: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17263 |     void initialize(const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17265:5: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17265 |     VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17268:5: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17268 |     VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17277:68: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17277 |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT(const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* in_struct,
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17285:27: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17285 |     void initialize(const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17287:5: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17287 |     VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17290:5: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17290 |     VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18033:15: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18033 |         const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* in_struct, PNextCopyState* copy_state = {},
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18041:27: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18041 |     void initialize(const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18043:5: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18043 |     VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18046:5: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18046 |     VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18076:66: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18076 |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA(const VkPhysicalDeviceImageAlignmentControlFeaturesMESA* in_struct,
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18083:27: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18083 |     void initialize(const VkPhysicalDeviceImageAlignmentControlFeaturesMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18085:5: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18085 |     VkPhysicalDeviceImageAlignmentControlFeaturesMESA* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18088:5: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18088 |     VkPhysicalDeviceImageAlignmentControlFeaturesMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18097:68: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18097 |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA(const VkPhysicalDeviceImageAlignmentControlPropertiesMESA* in_struct,
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18105:27: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18105 |     void initialize(const VkPhysicalDeviceImageAlignmentControlPropertiesMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18107:5: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18107 |     VkPhysicalDeviceImageAlignmentControlPropertiesMESA* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18110:5: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18110 |     VkPhysicalDeviceImageAlignmentControlPropertiesMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18119:54: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18119 |     safe_VkImageAlignmentControlCreateInfoMESA(const VkImageAlignmentControlCreateInfoMESA* in_struct,
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18125:27: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18125 |     void initialize(const VkImageAlignmentControlCreateInfoMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18127:5: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18127 |     VkImageAlignmentControlCreateInfoMESA* ptr() { return reinterpret_cast<VkImageAlignmentControlCreateInfoMESA*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18128:5: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18128 |     VkImageAlignmentControlCreateInfoMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkImageAlignmentControlCreateInfoMESA
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:18:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:456:45: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|   456 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:456:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   456 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:457:45: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|   457 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7FeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:457:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   457 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7FeaturesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:458:45: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|   458 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7PropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:458:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   458 | template <> inline VkStructureType GetSType<VkPhysicalDeviceMaintenance7PropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:459:45: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|   459 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:459:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   459 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:460:45: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|   460 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesListKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:460:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   460 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiPropertiesListKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:461:45: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|   461 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiVulkanPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:461:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   461 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLayeredApiVulkanPropertiesKHR>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:911:45: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
|   911 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:911:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   911 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:912:45: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
|   912 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:912:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   912 | template <> inline VkStructureType GetSType<VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:951:45: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
|   951 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:951:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   951 | template <> inline VkStructureType GetSType<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:953:45: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
|   953 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:953:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   953 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:954:45: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
|   954 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlPropertiesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:954:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   954 | template <> inline VkStructureType GetSType<VkPhysicalDeviceImageAlignmentControlPropertiesMESA>() { return VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:955:45: error: 'VkImageAlignmentControlCreateInfoMESA' was not declared in this scope; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
|   955 | template <> inline VkStructureType GetSType<VkImageAlignmentControlCreateInfoMESA>() { return VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA; }
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:955:36: error: template-id 'GetSType<<expression error> >' for 'VkStructureType vku::GetSType()' does not match any template declaration
|   955 | template <> inline VkStructureType GetSType<VkImageAlignmentControlCreateInfoMESA>() { return VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA; }
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_struct_helper.hpp:17:17: note: candidate is: 'template<class T> VkStructureType vku::GetSType()'
|    17 | VkStructureType GetSType() {
|       |                 ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14088:11: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
| 14088 |     const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* in_struct, [[maybe_unused]] PNextCopyState* copy_state,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In constructor 'vku::safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR::safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR(const int*, vku::PNextCopyState*, bool)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14090:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14090 |     : sType(in_struct->sType), shaderRelaxedExtendedInstruction(in_struct->shaderRelaxedExtendedInstruction) {
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14090:76: error: request for member 'shaderRelaxedExtendedInstruction' in '* in_struct', which is of non-class type 'const int'
| 14090 |     : sType(in_struct->sType), shaderRelaxedExtendedInstruction(in_struct->shaderRelaxedExtendedInstruction) {
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14092:42: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14092 |         pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In constructor 'vku::safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR::safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR()':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14097:13: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR'?
| 14097 |     : sType(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR),
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14128:11: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
| 14128 |     const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* in_struct, [[maybe_unused]] PNextCopyState* copy_state) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In member function 'void vku::safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR::initialize(const int*, vku::PNextCopyState*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14130:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14130 |     sType = in_struct->sType;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14131:51: error: request for member 'shaderRelaxedExtendedInstruction' in '* in_struct', which is of non-class type 'const int'
| 14131 |     shaderRelaxedExtendedInstruction = in_struct->shaderRelaxedExtendedInstruction;
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14132:38: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14132 |     pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                      ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14143:11: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
| 14143 |     const VkPhysicalDeviceMaintenance7FeaturesKHR* in_struct, [[maybe_unused]] PNextCopyState* copy_state, bool copy_pnext)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In constructor 'vku::safe_VkPhysicalDeviceMaintenance7FeaturesKHR::safe_VkPhysicalDeviceMaintenance7FeaturesKHR(const int*, vku::PNextCopyState*, bool)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14144:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14144 |     : sType(in_struct->sType), maintenance7(in_struct->maintenance7) {
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14144:56: error: request for member 'maintenance7' in '* in_struct', which is of non-class type 'const int'
| 14144 |     : sType(in_struct->sType), maintenance7(in_struct->maintenance7) {
|       |                                                        ^~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14146:42: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14146 |         pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In constructor 'vku::safe_VkPhysicalDeviceMaintenance7FeaturesKHR::safe_VkPhysicalDeviceMaintenance7FeaturesKHR()':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14151:13: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR'?
| 14151 |     : sType(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR), pNext(nullptr), maintenance7() {}
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14175:69: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
| 14175 | void safe_VkPhysicalDeviceMaintenance7FeaturesKHR::initialize(const VkPhysicalDeviceMaintenance7FeaturesKHR* in_struct,
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                     VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In member function 'void vku::safe_VkPhysicalDeviceMaintenance7FeaturesKHR::initialize(const int*, vku::PNextCopyState*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14178:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14178 |     sType = in_struct->sType;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14179:31: error: request for member 'maintenance7' in '* in_struct', which is of non-class type 'const int'
| 14179 |     maintenance7 = in_struct->maintenance7;
|       |                               ^~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14180:38: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14180 |     pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                      ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14191:11: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
| 14191 |     const VkPhysicalDeviceMaintenance7PropertiesKHR* in_struct, [[maybe_unused]] PNextCopyState* copy_state, bool copy_pnext)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In constructor 'vku::safe_VkPhysicalDeviceMaintenance7PropertiesKHR::safe_VkPhysicalDeviceMaintenance7PropertiesKHR(const int*, vku::PNextCopyState*, bool)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14192:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14192 |     : sType(in_struct->sType),
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14193:60: error: request for member 'robustFragmentShadingRateAttachmentAccess' in '* in_struct', which is of non-class type 'const int'
| 14193 |       robustFragmentShadingRateAttachmentAccess(in_struct->robustFragmentShadingRateAttachmentAccess),
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14194:55: error: request for member 'separateDepthStencilAttachmentAccess' in '* in_struct', which is of non-class type 'const int'
| 14194 |       separateDepthStencilAttachmentAccess(in_struct->separateDepthStencilAttachmentAccess),
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14195:61: error: request for member 'maxDescriptorSetTotalUniformBuffersDynamic' in '* in_struct', which is of non-class type 'const int'
| 14195 |       maxDescriptorSetTotalUniformBuffersDynamic(in_struct->maxDescriptorSetTotalUniformBuffersDynamic),
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14196:61: error: request for member 'maxDescriptorSetTotalStorageBuffersDynamic' in '* in_struct', which is of non-class type 'const int'
| 14196 |       maxDescriptorSetTotalStorageBuffersDynamic(in_struct->maxDescriptorSetTotalStorageBuffersDynamic),
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14197:54: error: request for member 'maxDescriptorSetTotalBuffersDynamic' in '* in_struct', which is of non-class type 'const int'
| 14197 |       maxDescriptorSetTotalBuffersDynamic(in_struct->maxDescriptorSetTotalBuffersDynamic),
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14199:22: error: request for member 'maxDescriptorSetUpdateAfterBindTotalUniformBuffersDynamic' in '* in_struct', which is of non-class type 'const int'
| 14199 |           in_struct->maxDescriptorSetUpdateAfterBindTotalUniformBuffersDynamic),
|       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14201:22: error: request for member 'maxDescriptorSetUpdateAfterBindTotalStorageBuffersDynamic' in '* in_struct', which is of non-class type 'const int'
| 14201 |           in_struct->maxDescriptorSetUpdateAfterBindTotalStorageBuffersDynamic),
|       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14202:69: error: request for member 'maxDescriptorSetUpdateAfterBindTotalBuffersDynamic' in '* in_struct', which is of non-class type 'const int'
| 14202 |       maxDescriptorSetUpdateAfterBindTotalBuffersDynamic(in_struct->maxDescriptorSetUpdateAfterBindTotalBuffersDynamic) {
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14204:42: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14204 |         pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In constructor 'vku::safe_VkPhysicalDeviceMaintenance7PropertiesKHR::safe_VkPhysicalDeviceMaintenance7PropertiesKHR()':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14209:13: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR'?
| 14209 |     : sType(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR),
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14256:71: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
| 14256 | void safe_VkPhysicalDeviceMaintenance7PropertiesKHR::initialize(const VkPhysicalDeviceMaintenance7PropertiesKHR* in_struct,
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                       VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In member function 'void vku::safe_VkPhysicalDeviceMaintenance7PropertiesKHR::initialize(const int*, vku::PNextCopyState*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14259:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14259 |     sType = in_struct->sType;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14260:60: error: request for member 'robustFragmentShadingRateAttachmentAccess' in '* in_struct', which is of non-class type 'const int'
| 14260 |     robustFragmentShadingRateAttachmentAccess = in_struct->robustFragmentShadingRateAttachmentAccess;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14261:55: error: request for member 'separateDepthStencilAttachmentAccess' in '* in_struct', which is of non-class type 'const int'
| 14261 |     separateDepthStencilAttachmentAccess = in_struct->separateDepthStencilAttachmentAccess;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14262:61: error: request for member 'maxDescriptorSetTotalUniformBuffersDynamic' in '* in_struct', which is of non-class type 'const int'
| 14262 |     maxDescriptorSetTotalUniformBuffersDynamic = in_struct->maxDescriptorSetTotalUniformBuffersDynamic;
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14263:61: error: request for member 'maxDescriptorSetTotalStorageBuffersDynamic' in '* in_struct', which is of non-class type 'const int'
| 14263 |     maxDescriptorSetTotalStorageBuffersDynamic = in_struct->maxDescriptorSetTotalStorageBuffersDynamic;
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14264:54: error: request for member 'maxDescriptorSetTotalBuffersDynamic' in '* in_struct', which is of non-class type 'const int'
| 14264 |     maxDescriptorSetTotalBuffersDynamic = in_struct->maxDescriptorSetTotalBuffersDynamic;
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14266:20: error: request for member 'maxDescriptorSetUpdateAfterBindTotalUniformBuffersDynamic' in '* in_struct', which is of non-class type 'const int'
| 14266 |         in_struct->maxDescriptorSetUpdateAfterBindTotalUniformBuffersDynamic;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14268:20: error: request for member 'maxDescriptorSetUpdateAfterBindTotalStorageBuffersDynamic' in '* in_struct', which is of non-class type 'const int'
| 14268 |         in_struct->maxDescriptorSetUpdateAfterBindTotalStorageBuffersDynamic;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14269:69: error: request for member 'maxDescriptorSetUpdateAfterBindTotalBuffersDynamic' in '* in_struct', which is of non-class type 'const int'
| 14269 |     maxDescriptorSetUpdateAfterBindTotalBuffersDynamic = in_struct->maxDescriptorSetUpdateAfterBindTotalBuffersDynamic;
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14270:38: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14270 |     pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                      ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14288:11: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
| 14288 |     const VkPhysicalDeviceLayeredApiPropertiesKHR* in_struct, [[maybe_unused]] PNextCopyState* copy_state, bool copy_pnext)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In constructor 'vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR::safe_VkPhysicalDeviceLayeredApiPropertiesKHR(const int*, vku::PNextCopyState*, bool)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14289:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14289 |     : sType(in_struct->sType), vendorID(in_struct->vendorID), deviceID(in_struct->deviceID), layeredAPI(in_struct->layeredAPI) {
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14289:52: error: request for member 'vendorID' in '* in_struct', which is of non-class type 'const int'
| 14289 |     : sType(in_struct->sType), vendorID(in_struct->vendorID), deviceID(in_struct->deviceID), layeredAPI(in_struct->layeredAPI) {
|       |                                                    ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14289:83: error: request for member 'deviceID' in '* in_struct', which is of non-class type 'const int'
| 14289 |     : sType(in_struct->sType), vendorID(in_struct->vendorID), deviceID(in_struct->deviceID), layeredAPI(in_struct->layeredAPI) {
|       |                                                                                   ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14289:94: error: class 'vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR' does not have any field named 'layeredAPI'
| 14289 |     : sType(in_struct->sType), vendorID(in_struct->vendorID), deviceID(in_struct->deviceID), layeredAPI(in_struct->layeredAPI) {
|       |                                                                                              ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14289:116: error: request for member 'layeredAPI' in '* in_struct', which is of non-class type 'const int'
| 14289 |     : sType(in_struct->sType), vendorID(in_struct->vendorID), deviceID(in_struct->deviceID), layeredAPI(in_struct->layeredAPI) {
|       |                                                                                                                    ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14291:42: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14291 |         pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14294:36: error: request for member 'deviceName' in '* in_struct', which is of non-class type 'const int'
| 14294 |         deviceName[i] = in_struct->deviceName[i];
|       |                                    ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In constructor 'vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR::safe_VkPhysicalDeviceLayeredApiPropertiesKHR()':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14299:13: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT'?
| 14299 |     : sType(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR), pNext(nullptr), vendorID(), deviceID(), layeredAPI() {}
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14299:116: error: class 'vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR' does not have any field named 'layeredAPI'
| 14299 |     : sType(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR), pNext(nullptr), vendorID(), deviceID(), layeredAPI() {}
|       |                                                                                                                    ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In copy constructor 'vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR::safe_VkPhysicalDeviceLayeredApiPropertiesKHR(const vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14306:5: error: 'layeredAPI' was not declared in this scope
| 14306 |     layeredAPI = copy_src.layeredAPI;
|       |     ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14306:27: error: 'const struct vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR' has no member named 'layeredAPI'
| 14306 |     layeredAPI = copy_src.layeredAPI;
|       |                           ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In member function 'vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR& vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR::operator=(const vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14323:5: error: 'layeredAPI' was not declared in this scope
| 14323 |     layeredAPI = copy_src.layeredAPI;
|       |     ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14323:27: error: 'const struct vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR' has no member named 'layeredAPI'
| 14323 |     layeredAPI = copy_src.layeredAPI;
|       |                           ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14335:69: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
| 14335 | void safe_VkPhysicalDeviceLayeredApiPropertiesKHR::initialize(const VkPhysicalDeviceLayeredApiPropertiesKHR* in_struct,
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                     safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In member function 'void vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR::initialize(const int*, vku::PNextCopyState*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14338:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14338 |     sType = in_struct->sType;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14339:27: error: request for member 'vendorID' in '* in_struct', which is of non-class type 'const int'
| 14339 |     vendorID = in_struct->vendorID;
|       |                           ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14340:27: error: request for member 'deviceID' in '* in_struct', which is of non-class type 'const int'
| 14340 |     deviceID = in_struct->deviceID;
|       |                           ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14341:5: error: 'layeredAPI' was not declared in this scope
| 14341 |     layeredAPI = in_struct->layeredAPI;
|       |     ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14341:29: error: request for member 'layeredAPI' in '* in_struct', which is of non-class type 'const int'
| 14341 |     layeredAPI = in_struct->layeredAPI;
|       |                             ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14342:38: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14342 |     pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                      ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14345:36: error: request for member 'deviceName' in '* in_struct', which is of non-class type 'const int'
| 14345 |         deviceName[i] = in_struct->deviceName[i];
|       |                                    ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In member function 'void vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR::initialize(const vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR*, vku::PNextCopyState*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14354:5: error: 'layeredAPI' was not declared in this scope
| 14354 |     layeredAPI = copy_src->layeredAPI;
|       |     ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14354:28: error: 'const struct vku::safe_VkPhysicalDeviceLayeredApiPropertiesKHR' has no member named 'layeredAPI'
| 14354 |     layeredAPI = copy_src->layeredAPI;
|       |                            ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14363:11: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
| 14363 |     const VkPhysicalDeviceLayeredApiPropertiesListKHR* in_struct, [[maybe_unused]] PNextCopyState* copy_state, bool copy_pnext)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In constructor 'vku::safe_VkPhysicalDeviceLayeredApiPropertiesListKHR::safe_VkPhysicalDeviceLayeredApiPropertiesListKHR(const int*, vku::PNextCopyState*, bool)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14364:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14364 |     : sType(in_struct->sType), layeredApiCount(in_struct->layeredApiCount), pLayeredApis(nullptr) {
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14364:59: error: request for member 'layeredApiCount' in '* in_struct', which is of non-class type 'const int'
| 14364 |     : sType(in_struct->sType), layeredApiCount(in_struct->layeredApiCount), pLayeredApis(nullptr) {
|       |                                                           ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14366:42: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14366 |         pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14368:39: error: request for member 'pLayeredApis' in '* in_struct', which is of non-class type 'const int'
| 14368 |     if (layeredApiCount && in_struct->pLayeredApis) {
|       |                                       ^~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14371:52: error: request for member 'pLayeredApis' in '* in_struct', which is of non-class type 'const int'
| 14371 |             pLayeredApis[i].initialize(&in_struct->pLayeredApis[i]);
|       |                                                    ^~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In constructor 'vku::safe_VkPhysicalDeviceLayeredApiPropertiesListKHR::safe_VkPhysicalDeviceLayeredApiPropertiesListKHR()':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14377:13: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT'?
| 14377 |     : sType(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR),
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14422:73: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
| 14422 | void safe_VkPhysicalDeviceLayeredApiPropertiesListKHR::initialize(const VkPhysicalDeviceLayeredApiPropertiesListKHR* in_struct,
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                         safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In member function 'void vku::safe_VkPhysicalDeviceLayeredApiPropertiesListKHR::initialize(const int*, vku::PNextCopyState*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14426:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14426 |     sType = in_struct->sType;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14427:34: error: request for member 'layeredApiCount' in '* in_struct', which is of non-class type 'const int'
| 14427 |     layeredApiCount = in_struct->layeredApiCount;
|       |                                  ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14429:38: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14429 |     pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                      ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14430:39: error: request for member 'pLayeredApis' in '* in_struct', which is of non-class type 'const int'
| 14430 |     if (layeredApiCount && in_struct->pLayeredApis) {
|       |                                       ^~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14433:52: error: request for member 'pLayeredApis' in '* in_struct', which is of non-class type 'const int'
| 14433 |             pLayeredApis[i].initialize(&in_struct->pLayeredApis[i]);
|       |                                                    ^~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14453:11: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
| 14453 |     const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* in_struct, [[maybe_unused]] PNextCopyState* copy_state, bool copy_pnext)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In constructor 'vku::safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR::safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR(const int*, vku::PNextCopyState*, bool)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14454:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14454 |     : sType(in_struct->sType), properties(&in_struct->properties) {
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14454:55: error: request for member 'properties' in '* in_struct', which is of non-class type 'const int'
| 14454 |     : sType(in_struct->sType), properties(&in_struct->properties) {
|       |                                                       ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14456:42: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14456 |         pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In constructor 'vku::safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR::safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR()':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14461:13: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT'?
| 14461 |     : sType(VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR), pNext(nullptr) {}
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14485:75: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
| 14485 | void safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR::initialize(const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* in_struct,
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                           safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp: In member function 'void vku::safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR::initialize(const int*, vku::PNextCopyState*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14488:24: error: request for member 'sType' in '* in_struct', which is of non-class type 'const int'
| 14488 |     sType = in_struct->sType;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14489:39: error: request for member 'properties' in '* in_struct', which is of non-class type 'const int'
| 14489 |     properties.initialize(&in_struct->properties);
|       |                                       ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_khr.cpp:14490:38: error: request for member 'pNext' in '* in_struct', which is of non-class type 'const int'
| 14490 |     pNext = SafePnextCopy(in_struct->pNext, copy_state);
|       |                                      ^~~~~
| [9/12] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/po
 kybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hi
 dden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_utils.cpp.o -MF src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_utils.cpp.o.d -o src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_utils.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp
| FAILED: src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_utils.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild
 /yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -s
 td=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_utils.cpp.o -MF src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_utils.cpp.o.d -o src/vulkan/CMakeFiles/VulkanSafeStruct.dir/vk_safe_struct_utils.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:18:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8506:15: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8506 |         const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* in_struct, PNextCopyState* copy_state = {},
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8514:27: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8514 |     void initialize(const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8517:5: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8517 |     VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8520:5: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|  8520 |     VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8529:56: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8529 |     safe_VkPhysicalDeviceMaintenance7FeaturesKHR(const VkPhysicalDeviceMaintenance7FeaturesKHR* in_struct,
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8535:27: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8535 |     void initialize(const VkPhysicalDeviceMaintenance7FeaturesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8537:5: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8537 |     VkPhysicalDeviceMaintenance7FeaturesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceMaintenance7FeaturesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8538:5: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  8538 |     VkPhysicalDeviceMaintenance7FeaturesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8554:58: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8554 |     safe_VkPhysicalDeviceMaintenance7PropertiesKHR(const VkPhysicalDeviceMaintenance7PropertiesKHR* in_struct,
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8560:27: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8560 |     void initialize(const VkPhysicalDeviceMaintenance7PropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8562:5: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8562 |     VkPhysicalDeviceMaintenance7PropertiesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceMaintenance7PropertiesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8563:5: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  8563 |     VkPhysicalDeviceMaintenance7PropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8572:5: error: 'VkPhysicalDeviceLayeredApiKHR' does not name a type; did you mean 'VkPhysicalDeviceFeatures2KHR'?
|  8572 |     VkPhysicalDeviceLayeredApiKHR layeredAPI;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceFeatures2KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8575:56: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8575 |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR(const VkPhysicalDeviceLayeredApiPropertiesKHR* in_struct,
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8581:27: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8581 |     void initialize(const VkPhysicalDeviceLayeredApiPropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8583:5: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8583 |     VkPhysicalDeviceLayeredApiPropertiesKHR* ptr() { return reinterpret_cast<VkPhysicalDeviceLayeredApiPropertiesKHR*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8584:5: error: 'VkPhysicalDeviceLayeredApiPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesKHR'?
|  8584 |     VkPhysicalDeviceLayeredApiPropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8594:60: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8594 |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR(const VkPhysicalDeviceLayeredApiPropertiesListKHR* in_struct,
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8600:27: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8600 |     void initialize(const VkPhysicalDeviceLayeredApiPropertiesListKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8602:5: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8602 |     VkPhysicalDeviceLayeredApiPropertiesListKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8605:5: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|  8605 |     VkPhysicalDeviceLayeredApiPropertiesListKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8614:62: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8614 |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR(const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* in_struct,
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8621:27: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8621 |     void initialize(const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8623:5: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8623 |     VkPhysicalDeviceLayeredApiVulkanPropertiesKHR* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:8626:5: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' does not name a type; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|  8626 |     VkPhysicalDeviceLayeredApiVulkanPropertiesKHR const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17256:66: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17256 |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT(const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* in_struct,
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17263:27: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17263 |     void initialize(const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17265:5: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17265 |     VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17268:5: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
| 17268 |     VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17277:68: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17277 |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT(const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* in_struct,
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17285:27: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17285 |     void initialize(const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17287:5: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17287 |     VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:17290:5: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
| 17290 |     VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18033:15: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18033 |         const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* in_struct, PNextCopyState* copy_state = {},
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18041:27: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18041 |     void initialize(const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18043:5: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18043 |     VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18046:5: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
| 18046 |     VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18076:66: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18076 |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA(const VkPhysicalDeviceImageAlignmentControlFeaturesMESA* in_struct,
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18083:27: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18083 |     void initialize(const VkPhysicalDeviceImageAlignmentControlFeaturesMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18085:5: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18085 |     VkPhysicalDeviceImageAlignmentControlFeaturesMESA* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18088:5: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
| 18088 |     VkPhysicalDeviceImageAlignmentControlFeaturesMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18097:68: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18097 |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA(const VkPhysicalDeviceImageAlignmentControlPropertiesMESA* in_struct,
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18105:27: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18105 |     void initialize(const VkPhysicalDeviceImageAlignmentControlPropertiesMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18107:5: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18107 |     VkPhysicalDeviceImageAlignmentControlPropertiesMESA* ptr() {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18110:5: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' does not name a type; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
| 18110 |     VkPhysicalDeviceImageAlignmentControlPropertiesMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18119:54: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18119 |     safe_VkImageAlignmentControlCreateInfoMESA(const VkImageAlignmentControlCreateInfoMESA* in_struct,
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18125:27: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18125 |     void initialize(const VkImageAlignmentControlCreateInfoMESA* in_struct, PNextCopyState* copy_state = {});
|       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                           safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18127:5: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18127 |     VkImageAlignmentControlCreateInfoMESA* ptr() { return reinterpret_cast<VkImageAlignmentControlCreateInfoMESA*>(this); }
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include/vulkan/utility/vk_safe_struct.hpp:18128:5: error: 'VkImageAlignmentControlCreateInfoMESA' does not name a type; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
| 18128 |     VkImageAlignmentControlCreateInfoMESA const* ptr() const {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp: In function 'void* vku::SafePnextCopy(const void*, PNextCopyState*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:772:18: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR'?
|   772 |             case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR:
|       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:773:122: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|   773 |                 safe_pNext = new safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR(reinterpret_cast<const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR *>(pNext), copy_state, false);
|       |                                                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:773:122: error: expected '>' before 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:773:122: error: expected '(' before 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'
|   773 |                 safe_pNext = new safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR(reinterpret_cast<const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR *>(pNext), copy_state, false);
|       |                                                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                          (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:773:122: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'?
|   773 |                 safe_pNext = new safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR(reinterpret_cast<const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR *>(pNext), copy_state, false);
|       |                                                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                          safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:773:183: error: expected primary-expression before '>' token
|   773 |                 safe_pNext = new safe_VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR(reinterpret_cast<const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR *>(pNext), copy_state, false);
|       |                                                                                                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:775:18: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR'?
|   775 |             case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR:
|       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:776:102: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|   776 |                 safe_pNext = new safe_VkPhysicalDeviceMaintenance7FeaturesKHR(reinterpret_cast<const VkPhysicalDeviceMaintenance7FeaturesKHR *>(pNext), copy_state, false);
|       |                                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:776:102: error: expected '>' before 'VkPhysicalDeviceMaintenance7FeaturesKHR'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:776:102: error: expected '(' before 'VkPhysicalDeviceMaintenance7FeaturesKHR'
|   776 |                 safe_pNext = new safe_VkPhysicalDeviceMaintenance7FeaturesKHR(reinterpret_cast<const VkPhysicalDeviceMaintenance7FeaturesKHR *>(pNext), copy_state, false);
|       |                                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                      (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:776:102: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|   776 |                 safe_pNext = new safe_VkPhysicalDeviceMaintenance7FeaturesKHR(reinterpret_cast<const VkPhysicalDeviceMaintenance7FeaturesKHR *>(pNext), copy_state, false);
|       |                                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                      VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:776:143: error: expected primary-expression before '>' token
|   776 |                 safe_pNext = new safe_VkPhysicalDeviceMaintenance7FeaturesKHR(reinterpret_cast<const VkPhysicalDeviceMaintenance7FeaturesKHR *>(pNext), copy_state, false);
|       |                                                                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:778:18: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR'?
|   778 |             case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR:
|       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:779:104: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|   779 |                 safe_pNext = new safe_VkPhysicalDeviceMaintenance7PropertiesKHR(reinterpret_cast<const VkPhysicalDeviceMaintenance7PropertiesKHR *>(pNext), copy_state, false);
|       |                                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:779:104: error: expected '>' before 'VkPhysicalDeviceMaintenance7PropertiesKHR'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:779:104: error: expected '(' before 'VkPhysicalDeviceMaintenance7PropertiesKHR'
|   779 |                 safe_pNext = new safe_VkPhysicalDeviceMaintenance7PropertiesKHR(reinterpret_cast<const VkPhysicalDeviceMaintenance7PropertiesKHR *>(pNext), copy_state, false);
|       |                                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                        (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:779:104: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|   779 |                 safe_pNext = new safe_VkPhysicalDeviceMaintenance7PropertiesKHR(reinterpret_cast<const VkPhysicalDeviceMaintenance7PropertiesKHR *>(pNext), copy_state, false);
|       |                                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                        VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:779:147: error: expected primary-expression before '>' token
|   779 |                 safe_pNext = new safe_VkPhysicalDeviceMaintenance7PropertiesKHR(reinterpret_cast<const VkPhysicalDeviceMaintenance7PropertiesKHR *>(pNext), copy_state, false);
|       |                                                                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:781:18: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT'?
|   781 |             case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR:
|       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:782:106: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|   782 |                 safe_pNext = new safe_VkPhysicalDeviceLayeredApiPropertiesListKHR(reinterpret_cast<const VkPhysicalDeviceLayeredApiPropertiesListKHR *>(pNext), copy_state, false);
|       |                                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:782:106: error: expected '>' before 'VkPhysicalDeviceLayeredApiPropertiesListKHR'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:782:106: error: expected '(' before 'VkPhysicalDeviceLayeredApiPropertiesListKHR'
|   782 |                 safe_pNext = new safe_VkPhysicalDeviceLayeredApiPropertiesListKHR(reinterpret_cast<const VkPhysicalDeviceLayeredApiPropertiesListKHR *>(pNext), copy_state, false);
|       |                                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                          (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:782:106: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiPropertiesListKHR'?
|   782 |                 safe_pNext = new safe_VkPhysicalDeviceLayeredApiPropertiesListKHR(reinterpret_cast<const VkPhysicalDeviceLayeredApiPropertiesListKHR *>(pNext), copy_state, false);
|       |                                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                          safe_VkPhysicalDeviceLayeredApiPropertiesListKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:782:151: error: expected primary-expression before '>' token
|   782 |                 safe_pNext = new safe_VkPhysicalDeviceLayeredApiPropertiesListKHR(reinterpret_cast<const VkPhysicalDeviceLayeredApiPropertiesListKHR *>(pNext), copy_state, false);
|       |                                                                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:784:18: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT'?
|   784 |             case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR:
|       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:785:108: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|   785 |                 safe_pNext = new safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR(reinterpret_cast<const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR *>(pNext), copy_state, false);
|       |                                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:785:108: error: expected '>' before 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:785:108: error: expected '(' before 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'
|   785 |                 safe_pNext = new safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR(reinterpret_cast<const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR *>(pNext), copy_state, false);
|       |                                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                            (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:785:108: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'?
|   785 |                 safe_pNext = new safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR(reinterpret_cast<const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR *>(pNext), copy_state, false);
|       |                                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                            safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:785:155: error: expected primary-expression before '>' token
|   785 |                 safe_pNext = new safe_VkPhysicalDeviceLayeredApiVulkanPropertiesKHR(reinterpret_cast<const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR *>(pNext), copy_state, false);
|       |                                                                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1714:18: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT'?
|  1714 |             case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT:
|       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1715:112: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1715 |                 safe_pNext = new safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT(reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT *>(pNext), copy_state, false);
|       |                                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1715:112: error: expected '>' before 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1715:112: error: expected '(' before 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'
|  1715 |                 safe_pNext = new safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT(reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT *>(pNext), copy_state, false);
|       |                                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1715:112: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'?
|  1715 |                 safe_pNext = new safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT(reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT *>(pNext), copy_state, false);
|       |                                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1715:163: error: expected primary-expression before '>' token
|  1715 |                 safe_pNext = new safe_VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT(reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT *>(pNext), copy_state, false);
|       |                                                                                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1717:18: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT'?
|  1717 |             case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT:
|       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1718:114: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1718 |                 safe_pNext = new safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT(reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT *>(pNext), copy_state, false);
|       |                                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1718:114: error: expected '>' before 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1718:114: error: expected '(' before 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'
|  1718 |                 safe_pNext = new safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT(reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT *>(pNext), copy_state, false);
|       |                                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                  (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1718:114: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'?
|  1718 |                 safe_pNext = new safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT(reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT *>(pNext), copy_state, false);
|       |                                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                  safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1718:167: error: expected primary-expression before '>' token
|  1718 |                 safe_pNext = new safe_VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT(reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT *>(pNext), copy_state, false);
|       |                                                                                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1809:18: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT'?
|  1809 |             case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT:
|       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1810:116: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1810 |                 safe_pNext = new safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT(reinterpret_cast<const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT *>(pNext), copy_state, false);
|       |                                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1810:116: error: expected '>' before 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1810:116: error: expected '(' before 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'
|  1810 |                 safe_pNext = new safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT(reinterpret_cast<const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT *>(pNext), copy_state, false);
|       |                                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                    (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1810:116: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'?
|  1810 |                 safe_pNext = new safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT(reinterpret_cast<const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT *>(pNext), copy_state, false);
|       |                                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                    safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1810:171: error: expected primary-expression before '>' token
|  1810 |                 safe_pNext = new safe_VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT(reinterpret_cast<const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT *>(pNext), copy_state, false);
|       |                                                                                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1815:18: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT'?
|  1815 |             case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA:
|       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1816:112: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1816 |                 safe_pNext = new safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA(reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlFeaturesMESA *>(pNext), copy_state, false);
|       |                                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1816:112: error: expected '>' before 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1816:112: error: expected '(' before 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA'
|  1816 |                 safe_pNext = new safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA(reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlFeaturesMESA *>(pNext), copy_state, false);
|       |                                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1816:112: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA'?
|  1816 |                 safe_pNext = new safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA(reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlFeaturesMESA *>(pNext), copy_state, false);
|       |                                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1816:163: error: expected primary-expression before '>' token
|  1816 |                 safe_pNext = new safe_VkPhysicalDeviceImageAlignmentControlFeaturesMESA(reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlFeaturesMESA *>(pNext), copy_state, false);
|       |                                                                                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1818:18: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT'?
|  1818 |             case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA:
|       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1819:114: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1819 |                 safe_pNext = new safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA(reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlPropertiesMESA *>(pNext), copy_state, false);
|       |                                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1819:114: error: expected '>' before 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1819:114: error: expected '(' before 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA'
|  1819 |                 safe_pNext = new safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA(reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlPropertiesMESA *>(pNext), copy_state, false);
|       |                                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                  (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1819:114: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' was not declared in this scope; did you mean 'safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA'?
|  1819 |                 safe_pNext = new safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA(reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlPropertiesMESA *>(pNext), copy_state, false);
|       |                                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                  safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1819:167: error: expected primary-expression before '>' token
|  1819 |                 safe_pNext = new safe_VkPhysicalDeviceImageAlignmentControlPropertiesMESA(reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlPropertiesMESA *>(pNext), copy_state, false);
|       |                                                                                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1821:18: error: 'VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT'?
|  1821 |             case VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA:
|       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                  VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1822:100: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1822 |                 safe_pNext = new safe_VkImageAlignmentControlCreateInfoMESA(reinterpret_cast<const VkImageAlignmentControlCreateInfoMESA *>(pNext), copy_state, false);
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1822:100: error: expected '>' before 'VkImageAlignmentControlCreateInfoMESA'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1822:100: error: expected '(' before 'VkImageAlignmentControlCreateInfoMESA'
|  1822 |                 safe_pNext = new safe_VkImageAlignmentControlCreateInfoMESA(reinterpret_cast<const VkImageAlignmentControlCreateInfoMESA *>(pNext), copy_state, false);
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                    (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1822:100: error: 'VkImageAlignmentControlCreateInfoMESA' was not declared in this scope; did you mean 'safe_VkImageAlignmentControlCreateInfoMESA'?
|  1822 |                 safe_pNext = new safe_VkImageAlignmentControlCreateInfoMESA(reinterpret_cast<const VkImageAlignmentControlCreateInfoMESA *>(pNext), copy_state, false);
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                    safe_VkImageAlignmentControlCreateInfoMESA
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:1822:139: error: expected primary-expression before '>' token
|  1822 |                 safe_pNext = new safe_VkImageAlignmentControlCreateInfoMESA(reinterpret_cast<const VkImageAlignmentControlCreateInfoMESA *>(pNext), copy_state, false);
|       |                                                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp: In function 'void vku::FreePnextChain(const void*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:2604:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR'?
|  2604 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:2607:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR'?
|  2607 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:2610:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR'?
|  2610 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:2613:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT'?
|  2613 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:2616:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT'?
|  2616 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:3546:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT'?
|  3546 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:3549:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT'?
|  3549 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:3641:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT'?
|  3641 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:3647:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT'?
|  3647 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:3650:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT'?
|  3650 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/vulkan/vk_safe_struct_utils.cpp:3653:14: error: 'VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT'?
|  3653 |         case VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT
| [10/12] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/p
 okybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-h
 idden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/git/src/layer/layer_settings_util.cpp
| ninja: build stopped: subcommand failed.
| 
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/temp/run.do_compile.3730244:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/temp/run.do_compile.3730244, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/temp/run.do_compile.3730244, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/temp/run.do_compile.3730244, line 142
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/temp/run.do_compile.3730244, line 166
NOTE: recipe vulkan-utility-libraries-1.3.290.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 912 tasks of which 904 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801143712.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801143712.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-utility-libraries-1.3.290.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/temp/run.do_compile.3730244', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.290.0/temp/log.do_compile.3730244
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb:do_compile) failed with exit code '1'

--===============8997525626269925105==--

