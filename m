Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DF7CD12B9
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:28 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.2021.1711994603285575808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Obv169A3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=G4kG9ZJJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e9ad48535-121f9de9-2eb8-44ab-ae5b-dc6fa009893b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cyruqGkFybbAln5Ai028grt1K9Ck8csrDl9AFxMHyn0=;
	b=Obv169A3pBcZ3pPzuefoPn2TS5ncwJpT6qJezVaX3EC3x3H/rrB7HNagfk/0kX4z
	vWCa6V0mTvL8hYz+gEOWv44jrRdLfqeHiHtEyHmuHN3S/a+0iHPu9+cmpoQoc/QIMwa
	U0PXjLdQzTbxx5vxejccUaNTXr+H8x7A5lkoFKxw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cyruqGkFybbAln5Ai028grt1K9Ck8csrDl9AFxMHyn0=;
	b=G4kG9ZJJWqX6QVBa2bana9Iv18vHk55YCNa9FBIrJ0G5cbAVJ36NmAEhv5VdPfda
	WXYnu1ra7YUUV6xJpLiaxrabmW599pH/ytvpDB2g2V+JcQM/7/JWpxURG+DhKe6o3oH
	i84LSbhjrF3c99N9VlVrSX3WcpJPZOoUJyoDE6h0=
Content-Type: multipart/mixed; boundary="===============0809116587757541709=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-utility-libraries: upgrading to 1.3.280.0 SUCCEEDED
Message-ID: <0101018e9ad48535-121f9de9-2eb8-44ab-ae5b-dc6fa009893b-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197781

--===============0809116587757541709==
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
From 469e0e4a2e6b09fe762eca72176c9ba806d02ad7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 14:12:02 +0000
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


--===============0809116587757541709==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-utility-libraries-upgrade-1.3.275.0-1.3.280.0.patch"

RnJvbSA0NjllMGU0YTJlNmIwOWZlNzYyZWNhNzIxNzZjOWJhODA2ZDAyYWQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNDoxMjowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi11dGlsaXR5LWxpYnJhcmllczogdXBncmFkZSAxLjMuMjc1LjAgLT4gMS4zLjI4MC4wCgot
LS0KIC4uLmFyaWVzXzEuMy4yNzUuMC5iYiA9PiB2dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4z
LjI4MC4wLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi11dGls
aXR5LWxpYnJhcmllc18xLjMuMjc1LjAuYmIgPT4gdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEu
My4yODAuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjMuMjc1LjAuYmIgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjMuMjgwLjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI3NS4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjMuMjgwLjAu
YmIKaW5kZXggNzU5YTAzOTI2Yi4uM2FiMzFhZjk2YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI3NS4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXV0aWxpdHktbGlicmFyaWVz
XzEuMy4yODAuMC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT00Y2EyZDY3OTkwOTFhYWE5
OGE4NTIwZjFiNzkzOTM5YiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NH
cm91cC9WdWxrYW4tVXRpbGl0eS1MaWJyYXJpZXMuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0
dHBzIgotU1JDUkVWID0gIjRjZmMxNzZlMzI0MmI0ZGJkZmQzZjZjNTY4MGM1ZDhmMmNiN2RiNDUi
CitTUkNSRVYgPSAiYTQxNDBjNWZkNDdkY2YzYTAzMDcyNmE2MGIyOTNkYjYxY2ZiNTRhMyIKIAog
UyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40Mi4wCgo=

--===============0809116587757541709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1875 targets, 46 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-46ecf917c8edf1cd2989282f62634b06701fa786"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:46ecf917c8edf1cd2989282f62634b06701fa786"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 133 Local 124 Mirrors 0 Missed 9 Current 181 (93% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 189 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 196 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 198 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 199 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 259 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 260 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 261 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 696 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 263 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vulkan-headers/1.3.275.0/temp/log.do_packagedata_setscene.1519428
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 264 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_package_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 268 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_fetch: Succeeded
NOTE: Running task 697 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_unpack)
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
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
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
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 302 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 304 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 307 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 309 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
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
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 924 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_configure)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_configure: Started
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
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package: Succeeded
NOTE: Running task 929 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_packagedata)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_packagedata: Succeeded
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
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_package_qa unihash changed to 0f88f55218dece928292cd747326a63cfcbc4928aa21c0ede9e777339433ca4b
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 935 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_create_runtime_spdx)
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.280.0-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 936 of 936 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_build)
NOTE: Tasks Summary: Attempted 936 tasks of which 916 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.280.0-r0 to 0:1.3.275.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.280.0-r0 to 0:1.3.275.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.280.0-r0 to 0:1.3.275.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.280.0-r0 to 0:1.3.275.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.280.0-r0 to 0:1.3.275.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.280.0-r0 to 0:1.3.275.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.280.0-r0 to 0:1.3.275.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.275.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0809116587757541709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-utility-libraries: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-utility-libraries: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dbg: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dbg: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dev: PV changed from "1.3.275.0" to "1.3.280.0"
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dev: PKGSIZE changed from 920496 to 929384 (+1%)
packages/core2-64-poky-linux/vulkan-utility-libraries/vulkan-utility-libraries-dev: PKGV changed from 1.3.275.0 [default] to 1.3.280.0 [default]
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

--===============0809116587757541709==--

