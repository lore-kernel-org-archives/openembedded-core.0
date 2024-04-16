Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E335C52CD8
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.13605.1713248041378810230
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ep4qpfhw;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=braWK5Jx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018ee58a99ab-d46c6064-5df9-4496-a9f0-061f2074f4b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GprfpsmW+5GeQvURezzg0/219/Um8fddwX8ChzasHvg=;
	b=ep4qpfhwQfddvfIPAeUNkdUszHgSIM5CbQZLS3pRIyRHfAva/7cgrvPY+knNZo6x
	pgBcdlqIlzJ7MdJAK7xq3SZ9fQjauMeQ6Vdqp+c8y6AYcSrBDmC0ZVtSUYRHu74GxGk
	J9F79t3NqMfm0ZvuJKlVCG9RSoRmeadyXnjbVvsY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GprfpsmW+5GeQvURezzg0/219/Um8fddwX8ChzasHvg=;
	b=braWK5JxAqeuNodYOZmYF51Ea8OVChNs+RMbVv11jwG6+wS+WbxIZODmPydKw7ZG
	elpu6GVFBGeB8ZRZFa4rTjJkWIIh/obNM5uc2OxPdDqz/pEN7iHnP0kxZb9fD3vmf3P
	Xl0LsohD9gxVX/WIw8+9CSeqcPdB9qYVqKu4hxeM=
Content-Type: multipart/mixed; boundary="===============2945170111805723832=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-utility-libraries: upgrading to 1.3.280.0 SUCCEEDED
Message-ID: <0101018ee58a99ab-d46c6064-5df9-4496-a9f0-061f2074f4b4-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198372

--===============2945170111805723832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-utility-libraries* to *1.3.280.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-utility-libraries-upgrade-1.3.275.0-1.3.280.0.patch
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
From f186ac6381dc9021364210630928baea12b1d644 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 23:51:29 +0000
Subject: [PATCH] vulkan-utility-libraries: upgrade 1.3.275.0 -> 1.3.280.0

---
 ...aries_1.3.275.0.bb => vulkan-utility-libraries_1.3.280.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.3.275.0.bb => vulkan-utility-libraries_1.3.280.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb
index 759a03926b..3ab31af96a 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https"
-SRCREV = "4cfc176e3242b4dbdfd3f6c5680c5d8f2cb7db45"
+SRCREV = "a4140c5fd47dcf3a030726a60b293db61cfb54a3"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============2945170111805723832==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-utility-libraries-upgrade-1.3.275.0-1.3.280.0.patch"

RnJvbSBmMTg2YWM2MzgxZGM5MDIxMzY0MjEwNjMwOTI4YmFlYTEyYjFkNjQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjM6NTE6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdXRpbGl0eS1saWJyYXJpZXM6IHVwZ3JhZGUgMS4zLjI3NS4wIC0+IDEuMy4yODAuMAoK
LS0tCiAuLi5hcmllc18xLjMuMjc1LjAuYmIgPT4gdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEu
My4yODAuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tdXRp
bGl0eS1saWJyYXJpZXNfMS4zLjI3NS4wLmJiID0+IHZ1bGthbi11dGlsaXR5LWxpYnJhcmllc18x
LjMuMjgwLjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI3NS4wLmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI4MC4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxr
YW4vdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEuMy4yNzUuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI4MC4w
LmJiCmluZGV4IDc1OWEwMzkyNmIuLjNhYjMxYWY5NmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEuMy4yNzUuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmll
c18xLjMuMjgwLjAuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDRU5TRSA9ICJBcGFjaGUtMi4wIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9NGNhMmQ2Nzk5MDkxYWFh
OThhODUyMGYxYjc5MzkzOWIiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9z
R3JvdXAvVnVsa2FuLVV0aWxpdHktTGlicmFyaWVzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1o
dHRwcyIKLVNSQ1JFViA9ICI0Y2ZjMTc2ZTMyNDJiNGRiZGZkM2Y2YzU2ODBjNWQ4ZjJjYjdkYjQ1
IgorU1JDUkVWID0gImE0MTQwYzVmZDQ3ZGNmM2EwMzA3MjZhNjBiMjkzZGI2MWNmYjU0YTMiCiAK
IFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDIuMAoK

--===============2945170111805723832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-utility-libraries: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-utility-libraries: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dbg: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dbg: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dev: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dev: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dev: PKGSIZE changed from 920496 to 929384 (+1%)
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-doc: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-doc: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-locale: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-locale: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-src: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-src: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-staticdev: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-staticdev: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]

--===============2945170111805723832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 47 recipes from the core2-64 sysroot...done.
Removing 47 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6194fa3ce895e60ac9c9439f0505546197a9e9cf"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6194fa3ce895e60ac9c9439f0505546197a9e9cf"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 128 Local 119 Mirrors 0 Missed 9 Current 186 (92% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 194 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 201 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 203 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 258 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 259 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 260 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 349 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 262 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vulkan-headers/1.3.275.0/temp/log.do_packagedata_setscene.829848
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 263 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_package_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 267 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_fetch: Succeeded
NOTE: Running task 350 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_unpack: Succeeded
NOTE: Running task 781 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_patch: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_patch: Succeeded
NOTE: Running task 783 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 272 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 277 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 279 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 280 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 283 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 302 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 307 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 309 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 310 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 908 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_packagedata)
NOTE: Running task 910 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_packagedata: Succeeded
NOTE: Running task 923 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 924 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_configure)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_configure: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_configure: Succeeded
NOTE: Running task 925 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_compile)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_compile: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_compile: Succeeded
NOTE: Running task 926 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_install)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_install: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_install: Succeeded
NOTE: Running task 927 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_package)
NOTE: Running task 928 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_populate_sysroot unihash changed to bf24856abbeb0fb36e6897ff6d4db211db99d3d8d38cd60cf4741035e323c520
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_package unihash changed to 5ec23ff6cb2b5875d9035289a41e8c7d72816d415723d9f49120d283394ce121
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_packagedata became valid
NOTE: Running setscene task 314 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 930 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_create_spdx)
NOTE: Running task 931 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_package_write_ipk)
NOTE: Running task 932 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_package_write_deb)
NOTE: Running task 933 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_package_write_rpm)
NOTE: Running task 934 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_package_qa)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package_write_ipk: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package_write_deb: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package_qa: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 935 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_create_runtime_spdx)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_package_qa unihash changed to 0f88f55218dece928292cd747326a63cfcbc4928aa21c0ede9e777339433ca4b
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_package_write_ipk unihash changed to 8a37ea904b8b6cc38b8c1dfcdf365a0e71bff5d9575d0a6f3fe9bd63e25f76d9
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_package_write_rpm unihash changed to 0938e6f3ba68c6ad2bcdb0791e7b7020d3bd881a2c9671aa99359922f2e17b6a
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_package_write_deb unihash changed to 2574b99a4b5acd88ba29ebcd5bcec8aa14088383fc27e45206b18cfa3895b36b
NOTE: Running noexec task 936 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_build)
NOTE: Tasks Summary: Attempted 936 tasks of which 917 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.280.0-r0 to 0:1.3.275.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.280.0-r0 to 0:1.3.275.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.280.0-r0 to 0:1.3.275.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.280.0-r0 to 0:1.3.275.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.280.0-r0 to 0:1.3.275.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.280.0-r0 to 0:1.3.275.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.280.0-r0 to 0:1.3.275.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2945170111805723832==--

