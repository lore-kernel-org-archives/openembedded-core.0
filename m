Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92131C54E69
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:34 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.20342.1708018346896567258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Z4sCWyQy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kjj14Qmz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018dadd3a999-df2c89f6-1f9e-4059-8553-57a6e541717a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UjzAZy8e6CcEcCpN0VHdGYk8+H4K55GAC0wIPqIf+kM=;
	b=Z4sCWyQyzkh5NzuAr65kN8NuIJ7W9mb7NnQwtTd98Xu3B09HBncrklLWLPZUZL9s
	nzRsV2Q1BUcb/okSVUOuYy93a2HugKLoNHHKcOCEgZQID36hv2XMRhX5Eq+TvaQpB14
	tvB9whV+N8Rb6qFtzZfCdfZldjp/aGcvHWf1xWHg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UjzAZy8e6CcEcCpN0VHdGYk8+H4K55GAC0wIPqIf+kM=;
	b=kjj14Qmz3XYp422FqzRrb6teSWreIMtD8e0p1brQxRKRzyv6FN/JmZrmXCqBohJW
	Dcegsc73shLt4L50fpxLt17TtdY1QS2rGDpIwL7lmIEMkrmrke4vP3z4DE67DQSyIoP
	EH8Krl+SpK6y0w20iCkJkQX4GHLZPDoQnxV67Fdk=
Content-Type: multipart/mixed; boundary="===============8023090383003799530=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-utility-libraries: upgrading to 1.3.275.0 FAILED
Message-ID: <0101018dadd3a999-df2c89f6-1f9e-4059-8553-57a6e541717a-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195630

--===============8023090383003799530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-utility-libraries* to *1.3.275.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-utility-libraries-upgrade-1.3.268.0-1.3.275.0.patch
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
From 0d58ee560a2344b56b328cc6185f38809917242e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 14:04:29 +0000
Subject: [PATCH] vulkan-utility-libraries: upgrade 1.3.268.0 -> 1.3.275.0

---
 ...aries_1.3.268.0.bb => vulkan-utility-libraries_1.3.275.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.3.268.0.bb => vulkan-utility-libraries_1.3.275.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.268.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.268.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb
index fee4ba6cc9..759a03926b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.268.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https"
-SRCREV = "c9ca4ac620a238a93c65d864f2eaa33954d74509"
+SRCREV = "4cfc176e3242b4dbdfd3f6c5680c5d8f2cb7db45"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============8023090383003799530==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-utility-libraries-upgrade-1.3.268.0-1.3.275.0.patch"

RnJvbSAwZDU4ZWU1NjBhMjM0NGI1NmIzMjhjYzYxODVmMzg4MDk5MTcyNDJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTQ6MDQ6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdXRpbGl0eS1saWJyYXJpZXM6IHVwZ3JhZGUgMS4zLjI2OC4wIC0+IDEuMy4yNzUuMAoK
LS0tCiAuLi5hcmllc18xLjMuMjY4LjAuYmIgPT4gdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEu
My4yNzUuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tdXRp
bGl0eS1saWJyYXJpZXNfMS4zLjI2OC4wLmJiID0+IHZ1bGthbi11dGlsaXR5LWxpYnJhcmllc18x
LjMuMjc1LjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI2OC4wLmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI3NS4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxr
YW4vdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEuMy4yNjguMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI3NS4w
LmJiCmluZGV4IGZlZTRiYTZjYzkuLjc1OWEwMzkyNmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEuMy4yNjguMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmll
c18xLjMuMjc1LjAuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDRU5TRSA9ICJBcGFjaGUtMi4wIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9NGNhMmQ2Nzk5MDkxYWFh
OThhODUyMGYxYjc5MzkzOWIiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9z
R3JvdXAvVnVsa2FuLVV0aWxpdHktTGlicmFyaWVzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1o
dHRwcyIKLVNSQ1JFViA9ICJjOWNhNGFjNjIwYTIzOGE5M2M2NWQ4NjRmMmVhYTMzOTU0ZDc0NTA5
IgorU1JDUkVWID0gIjRjZmMxNzZlMzI0MmI0ZGJkZmQzZjZjNTY4MGM1ZDhmMmNiN2RiNDUiCiAK
IFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDIuMAoK

--===============8023090383003799530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1857 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1857 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-760e9878e2889dea9c2269e1dd9bba5aba3a5be8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:760e9878e2889dea9c2269e1dd9bba5aba3a5be8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 106 Local 97 Mirrors 0 Missed 9 Current 202 (91% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 236 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 238 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 308 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 903 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_fetch)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_fetch: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_fetch: Succeeded
NOTE: Running task 904 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_unpack)
NOTE: Running task 905 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_unpack: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_unpack: Succeeded
NOTE: Running task 906 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_patch)
NOTE: Running task 907 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_patch: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_patch: Succeeded
NOTE: Running task 909 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 911 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_configure)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_configure: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_configure: Succeeded
NOTE: Running task 912 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_compile)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build --target all --
| Change Dir: '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.
 3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-na
 tive=  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings_helper.cpp
| FAILED: src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native= 
  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings_helper.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.hpp:12,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings_helper.cpp:9:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:19:37: error: 'VK_LAYER_SETTING_TYPE_BOOL32_EXT' was not declared in this scope
|    19 |     VKU_LAYER_SETTING_TYPE_BOOL32 = VK_LAYER_SETTING_TYPE_BOOL32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:20:36: error: 'VK_LAYER_SETTING_TYPE_INT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_BOOL32'?
|    20 |     VKU_LAYER_SETTING_TYPE_INT32 = VK_LAYER_SETTING_TYPE_INT32_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_BOOL32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:21:36: error: 'VK_LAYER_SETTING_TYPE_INT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    21 |     VKU_LAYER_SETTING_TYPE_INT64 = VK_LAYER_SETTING_TYPE_INT64_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:22:37: error: 'VK_LAYER_SETTING_TYPE_UINT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    22 |     VKU_LAYER_SETTING_TYPE_UINT32 = VK_LAYER_SETTING_TYPE_UINT32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:23:37: error: 'VK_LAYER_SETTING_TYPE_UINT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT64'?
|    23 |     VKU_LAYER_SETTING_TYPE_UINT64 = VK_LAYER_SETTING_TYPE_UINT64_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:24:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT32'?
|    24 |     VKU_LAYER_SETTING_TYPE_FLOAT32 = VK_LAYER_SETTING_TYPE_FLOAT32_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_UINT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:25:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_FLOAT32'?
|    25 |     VKU_LAYER_SETTING_TYPE_FLOAT64 = VK_LAYER_SETTING_TYPE_FLOAT64_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_FLOAT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:26:37: error: 'VK_LAYER_SETTING_TYPE_STRING_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT64'?
|    26 |     VKU_LAYER_SETTING_TYPE_STRING = VK_LAYER_SETTING_TYPE_STRING_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_UINT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:50:65: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    50 | VkResult vkuCreateLayerSettingSet(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:67:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    67 | const VkLayerSettingsCreateInfoEXT *vkuFindLayerSettingsCreateInfo(const VkInstanceCreateInfo *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:70:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    70 | const VkLayerSettingsCreateInfoEXT *vkuNextLayerSettingsCreateInfo(const VkLayerSettingsCreateInfoEXT *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:73:38: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    73 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.hpp:61:38: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    61 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings_helper.cpp:200:38: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|   200 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VkImageViewMinLodCreateInfoEXT
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.
 3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-na
 tive=  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp
| FAILED: src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native= 
  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:11,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp:9:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:19:37: error: 'VK_LAYER_SETTING_TYPE_BOOL32_EXT' was not declared in this scope
|    19 |     VKU_LAYER_SETTING_TYPE_BOOL32 = VK_LAYER_SETTING_TYPE_BOOL32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:20:36: error: 'VK_LAYER_SETTING_TYPE_INT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_BOOL32'?
|    20 |     VKU_LAYER_SETTING_TYPE_INT32 = VK_LAYER_SETTING_TYPE_INT32_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_BOOL32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:21:36: error: 'VK_LAYER_SETTING_TYPE_INT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    21 |     VKU_LAYER_SETTING_TYPE_INT64 = VK_LAYER_SETTING_TYPE_INT64_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:22:37: error: 'VK_LAYER_SETTING_TYPE_UINT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    22 |     VKU_LAYER_SETTING_TYPE_UINT32 = VK_LAYER_SETTING_TYPE_UINT32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:23:37: error: 'VK_LAYER_SETTING_TYPE_UINT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT64'?
|    23 |     VKU_LAYER_SETTING_TYPE_UINT64 = VK_LAYER_SETTING_TYPE_UINT64_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:24:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT32'?
|    24 |     VKU_LAYER_SETTING_TYPE_FLOAT32 = VK_LAYER_SETTING_TYPE_FLOAT32_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_UINT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:25:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_FLOAT32'?
|    25 |     VKU_LAYER_SETTING_TYPE_FLOAT64 = VK_LAYER_SETTING_TYPE_FLOAT64_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_FLOAT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:26:37: error: 'VK_LAYER_SETTING_TYPE_STRING_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT64'?
|    26 |     VKU_LAYER_SETTING_TYPE_STRING = VK_LAYER_SETTING_TYPE_STRING_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_UINT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:50:65: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    50 | VkResult vkuCreateLayerSettingSet(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:67:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    67 | const VkLayerSettingsCreateInfoEXT *vkuFindLayerSettingsCreateInfo(const VkInstanceCreateInfo *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:70:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    70 | const VkLayerSettingsCreateInfoEXT *vkuNextLayerSettingsCreateInfo(const VkLayerSettingsCreateInfoEXT *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:73:38: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    73 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:21:49: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    21 |     LayerSettings(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:39:11: error: 'VkLayerSettingEXT' does not name a type; did you mean 'VkuLayerSettingSet'?
|    39 |     const VkLayerSettingEXT *GetAPISetting(const char *pSettingName);
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkuLayerSettingSet
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:46:11: error: 'VkLayerSettingEXT' does not name a type; did you mean 'VkuLayerSettingSet'?
|    46 |     const VkLayerSettingEXT *FindLayerSettingValue(const char *pSettingName);
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkuLayerSettingSet
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:60:11: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    60 |     const VkLayerSettingsCreateInfoEXT *first_create_info{nullptr};
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:60:67: warning: extra ';' [-Wpedantic]
|    60 |     const VkLayerSettingsCreateInfoEXT *first_create_info{nullptr};
|       |                                                                   ^
|       |                                                                   -
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp:10:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_util.hpp:19:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    19 | const VkLayerSettingsCreateInfoEXT *FindSettingsInChain(const void *next);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp:113:60: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|   113 | LayerSettings::LayerSettings(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp: In constructor 'vl::LayerSettings::LayerSettings(const char*, const int*, const VkAllocationCallbacks*, VkuLayerSettingLogCallback)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp:115:31: error: class 'vl::LayerSettings' does not have any field named 'first_create_info'
|   115 |     : layer_name(pLayerName), first_create_info(pFirstCreateInfo), pCallback(pCallback) {
|       |                               ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp:227:7: error: 'VkLayerSettingEXT' does not name a type; did you mean 'VkuLayerSettingSet'?
|   227 | const VkLayerSettingEXT *LayerSettings::FindLayerSettingValue(const char *pSettingName) {
|       |       ^~~~~~~~~~~~~~~~~
|       |       VkuLayerSettingSet
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp: In member function 'bool vl::LayerSettings::HasAPISetting(const char*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp:293:18: error: 'class vl::LayerSettings' has no member named 'FindLayerSettingValue'
|   293 |     return this->FindLayerSettingValue(pSettingName) != nullptr;
|       |                  ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp:342:7: error: 'VkLayerSettingEXT' does not name a type; did you mean 'VkuLayerSettingSet'?
|   342 | const VkLayerSettingEXT *LayerSettings::GetAPISetting(const char *pSettingName) {
|       |       ^~~~~~~~~~~~~~~~~
|       |       VkuLayerSettingSet
| [3/5] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.
 3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-na
 tive=  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_util.cpp
| FAILED: src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native= 
  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_util.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_util.hpp:11,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_util.cpp:9:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:19:37: error: 'VK_LAYER_SETTING_TYPE_BOOL32_EXT' was not declared in this scope
|    19 |     VKU_LAYER_SETTING_TYPE_BOOL32 = VK_LAYER_SETTING_TYPE_BOOL32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:20:36: error: 'VK_LAYER_SETTING_TYPE_INT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_BOOL32'?
|    20 |     VKU_LAYER_SETTING_TYPE_INT32 = VK_LAYER_SETTING_TYPE_INT32_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_BOOL32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:21:36: error: 'VK_LAYER_SETTING_TYPE_INT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    21 |     VKU_LAYER_SETTING_TYPE_INT64 = VK_LAYER_SETTING_TYPE_INT64_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:22:37: error: 'VK_LAYER_SETTING_TYPE_UINT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    22 |     VKU_LAYER_SETTING_TYPE_UINT32 = VK_LAYER_SETTING_TYPE_UINT32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:23:37: error: 'VK_LAYER_SETTING_TYPE_UINT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT64'?
|    23 |     VKU_LAYER_SETTING_TYPE_UINT64 = VK_LAYER_SETTING_TYPE_UINT64_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:24:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT32'?
|    24 |     VKU_LAYER_SETTING_TYPE_FLOAT32 = VK_LAYER_SETTING_TYPE_FLOAT32_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_UINT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:25:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_FLOAT32'?
|    25 |     VKU_LAYER_SETTING_TYPE_FLOAT64 = VK_LAYER_SETTING_TYPE_FLOAT64_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_FLOAT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:26:37: error: 'VK_LAYER_SETTING_TYPE_STRING_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT64'?
|    26 |     VKU_LAYER_SETTING_TYPE_STRING = VK_LAYER_SETTING_TYPE_STRING_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_UINT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:50:65: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    50 | VkResult vkuCreateLayerSettingSet(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:67:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    67 | const VkLayerSettingsCreateInfoEXT *vkuFindLayerSettingsCreateInfo(const VkInstanceCreateInfo *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:70:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    70 | const VkLayerSettingsCreateInfoEXT *vkuNextLayerSettingsCreateInfo(const VkLayerSettingsCreateInfoEXT *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:73:38: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    73 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_util.hpp:19:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    19 | const VkLayerSettingsCreateInfoEXT *FindSettingsInChain(const void *next);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| [4/5] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.
 3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-na
 tive=  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp
| FAILED: src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native= 
  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:9:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:19:37: error: 'VK_LAYER_SETTING_TYPE_BOOL32_EXT' was not declared in this scope
|    19 |     VKU_LAYER_SETTING_TYPE_BOOL32 = VK_LAYER_SETTING_TYPE_BOOL32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:20:36: error: 'VK_LAYER_SETTING_TYPE_INT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_BOOL32'?
|    20 |     VKU_LAYER_SETTING_TYPE_INT32 = VK_LAYER_SETTING_TYPE_INT32_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_BOOL32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:21:36: error: 'VK_LAYER_SETTING_TYPE_INT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    21 |     VKU_LAYER_SETTING_TYPE_INT64 = VK_LAYER_SETTING_TYPE_INT64_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:22:37: error: 'VK_LAYER_SETTING_TYPE_UINT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    22 |     VKU_LAYER_SETTING_TYPE_UINT32 = VK_LAYER_SETTING_TYPE_UINT32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:23:37: error: 'VK_LAYER_SETTING_TYPE_UINT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT64'?
|    23 |     VKU_LAYER_SETTING_TYPE_UINT64 = VK_LAYER_SETTING_TYPE_UINT64_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:24:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT32'?
|    24 |     VKU_LAYER_SETTING_TYPE_FLOAT32 = VK_LAYER_SETTING_TYPE_FLOAT32_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_UINT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:25:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_FLOAT32'?
|    25 |     VKU_LAYER_SETTING_TYPE_FLOAT64 = VK_LAYER_SETTING_TYPE_FLOAT64_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_FLOAT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:26:37: error: 'VK_LAYER_SETTING_TYPE_STRING_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT64'?
|    26 |     VKU_LAYER_SETTING_TYPE_STRING = VK_LAYER_SETTING_TYPE_STRING_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_UINT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:50:65: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    50 | VkResult vkuCreateLayerSettingSet(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:67:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    67 | const VkLayerSettingsCreateInfoEXT *vkuFindLayerSettingsCreateInfo(const VkInstanceCreateInfo *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:70:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    70 | const VkLayerSettingsCreateInfoEXT *vkuNextLayerSettingsCreateInfo(const VkLayerSettingsCreateInfoEXT *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:73:38: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    73 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VkImageViewMinLodCreateInfoEXT
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:10:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_util.hpp:19:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    19 | const VkLayerSettingsCreateInfoEXT *FindSettingsInChain(const void *next);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:11:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:21:49: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    21 |     LayerSettings(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:39:11: error: 'VkLayerSettingEXT' does not name a type; did you mean 'VkuLayerSettingSet'?
|    39 |     const VkLayerSettingEXT *GetAPISetting(const char *pSettingName);
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkuLayerSettingSet
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:46:11: error: 'VkLayerSettingEXT' does not name a type; did you mean 'VkuLayerSettingSet'?
|    46 |     const VkLayerSettingEXT *FindLayerSettingValue(const char *pSettingName);
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkuLayerSettingSet
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:60:11: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    60 |     const VkLayerSettingsCreateInfoEXT *first_create_info{nullptr};
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:60:67: warning: extra ';' [-Wpedantic]
|    60 |     const VkLayerSettingsCreateInfoEXT *first_create_info{nullptr};
|       |                                                                   ^
|       |                                                                   -
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:34:65: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    34 | VkResult vkuCreateLayerSettingSet(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp: In function 'VkResult vkuGetLayerSettingValues(VkuLayerSettingSet, const char*, VkuLayerSettingType, uint32_t*, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:98:11: error: 'VkLayerSettingEXT' does not name a type; did you mean 'VkuLayerSettingSet'?
|    98 |     const VkLayerSettingEXT *api_setting = layer_setting_set->GetAPISetting(pSettingName);
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkuLayerSettingSet
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:103:33: error: 'api_setting' was not declared in this scope
|   103 |     if (setting_list.empty() && api_setting == nullptr) {
|       |                                 ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:146:24: error: 'api_setting' was not declared in this scope
|   146 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:191:24: error: 'api_setting' was not declared in this scope
|   191 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:245:24: error: 'api_setting' was not declared in this scope
|   245 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:299:24: error: 'api_setting' was not declared in this scope
|   299 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:353:24: error: 'api_setting' was not declared in this scope
|   353 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:398:24: error: 'api_setting' was not declared in this scope
|   398 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:443:24: error: 'api_setting' was not declared in this scope
|   443 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:488:24: error: 'api_setting' was not declared in this scope
|   488 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:491:42: error: 'VK_LAYER_SETTING_TYPE_UINT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT32'?
|   491 |                 if (api_setting->type != VK_LAYER_SETTING_TYPE_UINT32_EXT) {
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          VKU_LAYER_SETTING_TYPE_UINT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:526:24: error: 'api_setting' was not declared in this scope
|   526 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:535:30: error: 'VK_LAYER_SETTING_TYPE_STRING_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_STRING'?
|   535 |                         case VK_LAYER_SETTING_TYPE_STRING_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_STRING
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:540:30: error: 'VK_LAYER_SETTING_TYPE_BOOL32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_BOOL32'?
|   540 |                         case VK_LAYER_SETTING_TYPE_BOOL32_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_BOOL32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:546:30: error: 'VK_LAYER_SETTING_TYPE_INT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|   546 |                         case VK_LAYER_SETTING_TYPE_INT32_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:551:30: error: 'VK_LAYER_SETTING_TYPE_INT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT64'?
|   551 |                         case VK_LAYER_SETTING_TYPE_INT64_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_INT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:556:30: error: 'VK_LAYER_SETTING_TYPE_UINT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT32'?
|   556 |                         case VK_LAYER_SETTING_TYPE_UINT32_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_UINT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:561:30: error: 'VK_LAYER_SETTING_TYPE_UINT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT64'?
|   561 |                         case VK_LAYER_SETTING_TYPE_UINT64_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_UINT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:567:30: error: 'VK_LAYER_SETTING_TYPE_FLOAT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_FLOAT32'?
|   567 |                         case VK_LAYER_SETTING_TYPE_FLOAT32_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_FLOAT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:572:30: error: 'VK_LAYER_SETTING_TYPE_FLOAT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_FLOAT64'?
|   572 |                         case VK_LAYER_SETTING_TYPE_FLOAT64_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_FLOAT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:609:24: error: 'api_setting' was not declared in this scope
|   609 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:621:30: error: 'VK_LAYER_SETTING_TYPE_STRING_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_STRING'?
|   621 |                         case VK_LAYER_SETTING_TYPE_STRING_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_STRING
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:626:30: error: 'VK_LAYER_SETTING_TYPE_UINT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT32'?
|   626 |                         case VK_LAYER_SETTING_TYPE_UINT32_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_UINT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:653:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|   653 | const VkLayerSettingsCreateInfoEXT *vkuFindLayerSettingsCreateInfo(const VkInstanceCreateInfo *pCreateInfo) {
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:667:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|   667 | const VkLayerSettingsCreateInfoEXT *vkuNextLayerSettingsCreateInfo(const VkLayerSettingsCreateInfoEXT *pCreateInfo) {
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:691:38: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|   691 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp: In function 'VkResult vkuGetUnknownSettings(const int*, uint32_t, const char**, uint32_t*, const char**)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:695:11: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|   695 |     const VkLayerSettingsCreateInfoEXT *current_create_info = pCreateInfo;
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:698:12: error: 'current_create_info' was not declared in this scope; did you mean 'VkEventCreateInfo'?
|   698 |     while (current_create_info != nullptr) {
|       |            ^~~~~~~~~~~~~~~~~~~
|       |            VkEventCreateInfo
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:710:31: error: 'vkuNextLayerSettingsCreateInfo' was not declared in this scope
|   710 |         current_create_info = vkuNextLayerSettingsCreateInfo(current_create_info);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:691:68: warning: unused parameter 'pCreateInfo' [-Wunused-parameter]
|   691 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
| ninja: build stopped: subcommand failed.
| 
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/temp/run.do_compile.3748266:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/temp/run.do_compile.3748266, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/temp/run.do_compile.3748266, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/temp/run.do_compile.3748266, line 142
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/temp/run.do_compile.3748266, line 166
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 912 tasks of which 904 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215140414.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215140414.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-utility-libraries-1.3.275.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/temp/run.do_compile.3748266', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/temp/log.do_compile.3748266
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_compile) failed with exit code '1'

--===============8023090383003799530==--

