Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01361C36004
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:43 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.10349.1742048315124015990
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=La+YAK9+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qLRe3hwf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101959a2bc3ef-b390b552-15f8-440a-90d6-bf54909ec763-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048314;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kL+jcFAAnE7M7fSjgPNnogE+mDVhwNOa+9YTF+LTCv4=;
	b=La+YAK9+eov+IuMTP8ZMayOePQmX/Z9+wyWy8IRy5S+dWzgbafhrJOIXz/3r0aX6
	QTV8v8RSd5LBvcRFLvY0TV6UrAynJ4XiMT7zrDgDyDJefvt1jtihV1WVoUSysxiC2tC
	iXI/fJvpz7l6WdxY1p2xvAgvO1DOmLehFwwIgU7o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048314;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kL+jcFAAnE7M7fSjgPNnogE+mDVhwNOa+9YTF+LTCv4=;
	b=qLRe3hwfrXksql3b+s6l6cXwXEIZYZ6j8vKkldw9E+slLgVyr8re+KR6VEcdizvj
	GMnxhBeSpglJtVuRDTr3aGNZ+6dkCtx4u+8I56jkpDoGoQacEn877gibZIn+0hM+h/V
	UN3o/cyZeejL35NYJYQ56sT6q/jchPazL6Xg/T4o=
Content-Type: multipart/mixed; boundary="===============6819724866303602627=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-volk: upgrading to 1.4.309.0 SUCCEEDED
Message-ID: <010101959a2bc3ef-b390b552-15f8-440a-90d6-bf54909ec763-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212958

--===============6819724866303602627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-volk* to *1.4.309.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-volk-upgrade-1.3.296.0-1.4.309.0.patch
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
From ba511b3c51e19e35b54bdcc9a80a2782a531f573 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 13:00:56 +0000
Subject: [PATCH] vulkan-volk: upgrade 1.3.296.0 -> 1.4.309.0

---
 ..._1.3.296.0.bb => vulkan-volk_1.4.309.0.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.3.296.0.bb => vulkan-volk_1.4.309.0.bb} (57%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb
similarity index 57%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb
index bed4293490..438416db0b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb
@@ -1,3 +1,22 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.md
+# +++ LICENSE.md
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2018-2024 Arseny Kapoulkine
+# +Copyright (c) 2018-2025 Arseny Kapoulkine
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# 
+#
+
 SUMMARY = "A meta-loader for Vulkan"
 DESCRIPTION = "Volk allows one to dynamically load entrypoints required \
 to use Vulkan without linking to vulkan-1.dll or statically linking Vulkan loader. \
@@ -7,10 +26,10 @@ BUGTRACKER = "https://github.com/zeux/volk"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=12e6af3a0e2a5e5dbf7796aa82b64626"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb3d6e8051a71edca1e54bc38d35e5af"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "59d26900f53c7621a8ba8ab0e3f18d3bd883fa9a"
+SRCREV = "58689c063427f5bad4f133625049b1a3c5dd8287"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============6819724866303602627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (0 cached, 923 parsed). 1885 targets, 50 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:ee5753e837fdc440a1acd8db6dd4d0483dc7270f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 129 Local 118 Mirrors 0 Missed 11 Current 188 (91% match, 96% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 241 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 253 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 728 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_recipe_qa)
NOTE: Running setscene task 259 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 261 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 263 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vulkan-headers/1.3.296.0/temp/log.do_packagedata_setscene.883197
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 264 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_package_setscene)
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 268 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: Running task 729 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_fetch: Succeeded
NOTE: Running task 793 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_unpack)
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_unpack: Succeeded
NOTE: Running task 794 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_patch)
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 277 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 795 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 796 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_generate_toolchain_file)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 283 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 289 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 292 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 300 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 308 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 309 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 313 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 315 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 919 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata)
NOTE: Running task 920 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata: Succeeded
NOTE: Running task 934 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 935 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_configure)
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_configure: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_configure: Succeeded
NOTE: Running task 936 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_compile)
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_compile: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_compile: Succeeded
NOTE: Running task 937 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_install)
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_install: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_install: Succeeded
NOTE: Running task 938 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_package)
NOTE: Running task 939 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_package: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_package: Succeeded
NOTE: Running task 940 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_packagedata)
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_packagedata: Succeeded
NOTE: Running task 941 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_create_spdx)
NOTE: Running task 942 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_package_write_ipk)
NOTE: Running task 943 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_package_write_deb)
NOTE: Running task 944 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_package_write_rpm)
NOTE: Running task 945 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_package_qa)
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_package_write_ipk: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_package_write_deb: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_package_qa: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 946 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_create_package_spdx)
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_create_package_spdx: Started
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_package_qa: Succeeded
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe vulkan-volk-1.4.309.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 947 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb:do_build)
NOTE: Tasks Summary: Attempted 947 tasks of which 925 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.4.309.0-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.4.309.0-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.4.309.0-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.4.309.0-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.4.309.0-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.4.309.0-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.4.309.0-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6819724866303602627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-volk: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/vulkan-volk: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGSIZE changed from 396738 to 419384 (+6%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGSIZE changed from 388624 to 411270 (+6%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGSIZE changed from 672328 to 672408 (+0%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PV changed from "1.3.296.0" to "1.4.309.0"

--===============6819724866303602627==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.3.296.0-1.4.309.0.patch"

RnJvbSBiYTUxMWIzYzUxZTE5ZTM1YjU0YmRjYzlhODBhMjc4MmE1MzFmNTczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTM6MDA6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdm9sazogdXBncmFkZSAxLjMuMjk2LjAgLT4gMS40LjMwOS4wCgotLS0KIC4uLl8xLjMu
Mjk2LjAuYmIgPT4gdnVsa2FuLXZvbGtfMS40LjMwOS4wLmJifSB8IDIzICsrKysrKysrKysrKysr
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi12b2xrXzEuMy4yOTYu
MC5iYiA9PiB2dWxrYW4tdm9sa18xLjQuMzA5LjAuYmJ9ICg1NyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9sa18xLjMuMjk2LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuNC4zMDkuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDU3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1
bGthbi12b2xrXzEuMy4yOTYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tdm9sa18xLjQuMzA5LjAuYmIKaW5kZXggYmVkNDI5MzQ5MC4uNDM4NDE2ZGIw
YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9sa18x
LjMuMjk2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9s
a18xLjQuMzA5LjAuYmIKQEAgLTEsMyArMSwyMiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19D
SEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBU
aGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5l
dyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVl
ZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2
aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBj
b3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJ
Q0VOU0UubWQKKyMgKysrIExJQ0VOU0UubWQKKyMgQEAgLTEsNCArMSw0IEBACisjIC1Db3B5cmln
aHQgKGMpIDIwMTgtMjAyNCBBcnNlbnkgS2Fwb3Vsa2luZQorIyArQ29weXJpZ2h0IChjKSAyMDE4
LTIwMjUgQXJzZW55IEthcG91bGtpbmUKKyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3Jh
bnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyAg
b2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUg
IlNvZnR3YXJlIiksIHRvIGRlYWwKKyMgCisjCisKIFNVTU1BUlkgPSAiQSBtZXRhLWxvYWRlciBm
b3IgVnVsa2FuIgogREVTQ1JJUFRJT04gPSAiVm9sayBhbGxvd3Mgb25lIHRvIGR5bmFtaWNhbGx5
IGxvYWQgZW50cnlwb2ludHMgcmVxdWlyZWQgXAogdG8gdXNlIFZ1bGthbiB3aXRob3V0IGxpbmtp
bmcgdG8gdnVsa2FuLTEuZGxsIG9yIHN0YXRpY2FsbHkgbGlua2luZyBWdWxrYW4gbG9hZGVyLiBc
CkBAIC03LDEwICsyNiwxMCBAQCBCVUdUUkFDS0VSID0gImh0dHBzOi8vZ2l0aHViLmNvbS96ZXV4
L3ZvbGsiCiBTRUNUSU9OID0gImxpYnMiCiAKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9MTJlNmFmM2EwZTJhNWU1ZGJmNzc5NmFhODJi
NjQ2MjYiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT1mYjNkNmU4
MDUxYTcxZWRjYTFlNTRiYzM4ZDM1ZTVhZiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L3pldXgvdm9say5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICI1
OWQyNjkwMGY1M2M3NjIxYThiYThhYjBlM2YxOGQzYmQ4ODNmYTlhIgorU1JDUkVWID0gIjU4Njg5
YzA2MzQyN2Y1YmFkNGYxMzM2MjUwNDliMWEzYzVkZDgyODciCiAKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCiAKLS0gCjIuNDQuMQoK

--===============6819724866303602627==--

