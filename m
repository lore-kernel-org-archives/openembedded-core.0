Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1C6D1A42D
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:29 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.53344.1728588936244469837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BEkXGvtJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=f0sSIonw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019277eea5c7-faa8c4f9-7611-462b-8af3-da84b71dd5ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4NOCplFksQW0y4FsdYIR20W2/gGxnIgYc7SyZuswFSk=;
	b=BEkXGvtJbjNNnsTOKlvti0Pbzv/HSm0OpcROIIb+NrdcrUj0+RBXVA0xYmfyNSg7
	bs0He8Z26Dc/Giq7Wl5YZDGWOaSVMa3FF2bgg+2SPoi3SRgDXpavpHiH1lBTu7ZzXTS
	eW50HYmJHu5xAOi35kGEhKOlPbY6V1fAL/uVuDgE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4NOCplFksQW0y4FsdYIR20W2/gGxnIgYc7SyZuswFSk=;
	b=f0sSIonwPAExrEyWHUDn+mmgNWsD7xwXcSy7UMM3glZnuazWA4cU2ysPQ5hxOOCe
	lVZyjsAzuZohVLGLgSyKoIBrXIXqLUxhKRa+zrXuQQ1ylNwbqPaDpzjuc922FMOUM8s
	LXRtP53dzAeNKQ7MCo6IT5+yWGfbVjJpzxOuvEJ4=
Content-Type: multipart/mixed; boundary="===============0219421953008751242=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-volk: upgrading to 1.3.296.0 SUCCEEDED
Message-ID: <0101019277eea5c7-faa8c4f9-7611-462b-8af3-da84b71dd5ad-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205563

--===============0219421953008751242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-volk* to *1.3.296.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-volk-upgrade-1.3.290.0-1.3.296.0.patch
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
From 4a6529eabcdcef022bbba8a8b5d631f4b3b09232 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 05:24:46 +0000
Subject: [PATCH] vulkan-volk: upgrade 1.3.290.0 -> 1.3.296.0

---
 .../{vulkan-volk_1.3.290.0.bb => vulkan-volk_1.3.296.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.3.290.0.bb => vulkan-volk_1.3.296.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.290.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.3.290.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb
index e1bad6a96d..bed4293490 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.290.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=12e6af3a0e2a5e5dbf7796aa82b64626"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "466085407d5d2f50583fd663c1d65f93a7709d3e"
+SRCREV = "59d26900f53c7621a8ba8ab0e3f18d3bd883fa9a"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============0219421953008751242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1872 targets, 51 skipped, 0 masked, 0 errors.
Removing 43 recipes from the core2-64 sysroot...done.
Removing 50 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a84af6d2eca6030af654c0bdbe02a001a46d83e3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 137 Local 126 Mirrors 0 Missed 11 Current 177 (91% match, 96% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 185 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 192 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_populate_lic_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 249 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 250 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 251 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 670 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_recipe_qa)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 254 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vulkan-headers/1.3.290.0/temp/log.do_packagedata_setscene.2764555
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 255 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_package_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 259 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 729 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_fetch: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_fetch: Succeeded
NOTE: Running task 730 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_unpack)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 270 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_unpack: Succeeded
NOTE: Running task 737 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_patch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 275 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_patch: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_patch: Succeeded
NOTE: Running task 738 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 739 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_generate_toolchain_file)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 277 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 278 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 280 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 285 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 287 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 291 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 301 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 302 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 307 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 908 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata)
NOTE: Running task 909 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata: Succeeded
NOTE: Running task 922 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_configure)
NOTE: Running task 924 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_configure: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_configure: Succeeded
NOTE: Running task 925 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_compile)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_compile: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_compile: Succeeded
NOTE: Running task 926 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_install)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_install: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_install: Succeeded
NOTE: Running task 927 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_package)
NOTE: Running task 928 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package: Succeeded
NOTE: Running task 929 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_packagedata)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_packagedata: Succeeded
NOTE: Running task 930 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_create_spdx)
NOTE: Running task 931 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_package_write_ipk)
NOTE: Running task 932 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_package_write_deb)
NOTE: Running task 933 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_package_write_rpm)
NOTE: Running task 934 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_package_qa)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_write_ipk: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_write_deb: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_qa: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 935 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_create_package_spdx)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_create_package_spdx: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_qa: Succeeded
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 936 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_build)
NOTE: Tasks Summary: Attempted 936 tasks of which 914 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.290.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.296.0-r0 to 0:1.3.290.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.290.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.296.0-r0 to 0:1.3.290.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.290.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.296.0-r0 to 0:1.3.290.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.290.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.296.0-r0 to 0:1.3.290.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.290.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.296.0-r0 to 0:1.3.290.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.290.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.296.0-r0 to 0:1.3.290.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.290.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.296.0-r0 to 0:1.3.290.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.290.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0219421953008751242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-volk: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-volk: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGSIZE changed from 387684 to 396738 (+2%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGSIZE changed from 379570 to 388624 (+2%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGSIZE changed from 651510 to 651558 (+0%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]

--===============0219421953008751242==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.3.290.0-1.3.296.0.patch"

RnJvbSA0YTY1MjllYWJjZGNlZjAyMmJiYmE4YThiNWQ2MzFmNGIzYjA5MjMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDU6MjQ6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdm9sazogdXBncmFkZSAxLjMuMjkwLjAgLT4gMS4zLjI5Ni4wCgotLS0KIC4uLi97dnVs
a2FuLXZvbGtfMS4zLjI5MC4wLmJiID0+IHZ1bGthbi12b2xrXzEuMy4yOTYuMC5iYn0gICAgICB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi12b2xrXzEuMy4yOTAuMC5i
YiA9PiB2dWxrYW4tdm9sa18xLjMuMjk2LjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9sa18xLjMuMjkwLjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuMy4yOTYuMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGth
bi12b2xrXzEuMy4yOTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdm9sa18xLjMuMjk2LjAuYmIKaW5kZXggZTFiYWQ2YTk2ZC4uYmVkNDI5MzQ5MCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9sa18xLjMu
MjkwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9sa18x
LjMuMjk2LjAuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT0xMmU2YWYzYTBlMmE1ZTVkYmY3Nzk2YWE4
MmI2NDYyNiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3pldXgvdm9say5naXQ7YnJh
bmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICI0NjYwODU0MDdkNWQyZjUwNTgz
ZmQ2NjNjMWQ2NWY5M2E3NzA5ZDNlIgorU1JDUkVWID0gIjU5ZDI2OTAwZjUzYzc2MjFhOGJhOGFi
MGUzZjE4ZDNiZDg4M2ZhOWEiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDQuMQoK

--===============0219421953008751242==--

