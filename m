Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C2FCFD312
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:54 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.53344.1728588936244469837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KzZtt3zr;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=o+NuBvhv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019277ee3824-d62512c8-a47b-4a18-aeab-d4ac13e953b7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588953;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IIXo8OBBOUEx3iRO038UJmQr+eRofxqiGtemzym/KSw=;
	b=KzZtt3zrnPLvs9IrfiYQS9ibkgQfyiUxlaxY07rTGGU1nX9Y3bpanAqDuS87GXFa
	krViqALhfc9o55jAaALvjYd62r6hbTN8i0xYiUEHQID3BFPL8auprhvIfe1nI17Mvxv
	IIMmDX3wfP4y8hWzfjj3eiUC6hLc/3fgZggFxF60=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588953;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IIXo8OBBOUEx3iRO038UJmQr+eRofxqiGtemzym/KSw=;
	b=o+NuBvhv8y//Ja9Edo6hpfOKB/wje7WDQErvOLlSZRubLQQ6YEv3lVJOEXgLTRi1
	G4aaHSdTp+K6qRtC0FJWJ4zVH5AZyTuEV5sAGlsi/mIoqT2tNYHW9ZAnpezPsO55/Km
	0Jf7QtqPq0t3qdcCzCzxSXwyUREOwLy2u0IU7KmQ=
Content-Type: multipart/mixed; boundary="===============5179563968360711527=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-volk: upgrading to 1.3.296.0 SUCCEEDED
Message-ID: <0101019277ee3824-d62512c8-a47b-4a18-aeab-d4ac13e953b7-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205472

--===============5179563968360711527==
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
From 75d0cf5850afc88f0a1308d8c9c183e2e0f6e6c6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 15:41:42 +0000
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


--===============5179563968360711527==
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
workspace            = "tmp-auh-upgrades:59fb7f9ba0cec59687809c776a1984a54532f227"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 149 Local 149 Mirrors 0 Missed 0 Current 165 (100% match, 100% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 173 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 174 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 175 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 176 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 177 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 178 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_populate_lic_setscene)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_qa_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: Running setscene task 238 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 248 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 265 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 266 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-volk-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vulkan-headers/1.3.290.0/temp/log.do_packagedata_setscene.1917006
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 269 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 270 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 275 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 277 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 278 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 280 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
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
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 291 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 301 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 306 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 310 of 314 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 909 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata: Succeeded
NOTE: Running noexec task 936 of 936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb:do_build)
NOTE: Tasks Summary: Attempted 936 tasks of which 934 didn't need to be rerun and all succeeded.
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

--===============5179563968360711527==
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

--===============5179563968360711527==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.3.290.0-1.3.296.0.patch"

RnJvbSA3NWQwY2Y1ODUwYWZjODhmMGExMzA4ZDhjOWMxODNlMmUwZjZlNmM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTU6NDE6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
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

--===============5179563968360711527==--

