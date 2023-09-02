Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574B0CCF99E
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5680.1693650553499292826
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MuG/mobR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CoWpZfWn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a55709070-785cdcf1-5a23-4e73-92b1-f02b8c3fdb7d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=METtB7m9uojKW/XsSR0MhcrYjWT52GJwiLjqcrfbijY=;
	b=MuG/mobRA3ayZRLaNUG8kTCy5XOo4M+CieGGZAZTberKnXlOtT/wlGRP/uvIkt5v
	G41lTMzn3o3ovSmsKTmR+buGrxY9hyV3JKjWe2Rk6WhpgZLu6XXyp62hk6aY37yXBhg
	lc1wCetpJWYmoK8yU3jespQAukNkKM/9evmkgMQE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=METtB7m9uojKW/XsSR0MhcrYjWT52GJwiLjqcrfbijY=;
	b=CoWpZfWn3zdx5tNzjdUaiEs9/QBiqMEIrRXO7koJZvrMZrxGNseU/gVw1+VmCma7
	vnBAL0E8XsJS1eyeyC+5cLKuAYjrSPYIlo2URqyGnZXCSCrDqMCCWzAYXBmfTFctZeD
	jErt85JFfm0isCuRJ21P5XVav0FFYb69CjJlAgro=
Content-Type: multipart/mixed; boundary="===============4256687652551710351=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c
 SUCCEEDED
Message-ID: <0101018a55709070-785cdcf1-5a23-4e73-92b1-f02b8c3fdb7d-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187110

--===============4256687652551710351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kmscube* to *ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmscube-upgrade-to-latest-revision.patch
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
From d6f6e42b09e1fc9bc0e51e9c9a3368d174c3e4ce Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 2 Sep 2023 00:15:40 +0000
Subject: [PATCH] kmscube: upgrade to latest revision

---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index b385ff7452..4cdc0f06bb 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "53ea71efe63470cf698726d983e9da5748a754a1"
+SRCREV = "ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.39.2


--===============4256687652551710351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-78a47a0f2758f9afa96ed6e5fd80f83ab64ed605"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78a47a0f2758f9afa96ed6e5fd80f83ab64ed605"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 81 Local 71 Mirrors 0 Missed 10 Current 551 (87% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 573 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 629 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libdrm/2.4.115/temp/log.do_packagedata_setscene.2693122
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 630 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_package_setscene)
NOTE: Running task 1581 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_recipe_qa)
NOTE: Running task 1653 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_write_config)
NOTE: recipe kmscube-git-r0: task do_recipe_qa: Started
NOTE: recipe kmscube-git-r0: task do_write_config: Started
NOTE: recipe kmscube-git-r0: task do_write_config: Succeeded
NOTE: recipe kmscube-git-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1718 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_fetch)
NOTE: recipe kmscube-git-r0: task do_fetch: Started
NOTE: recipe kmscube-git-r0: task do_fetch: Succeeded
NOTE: Running task 1719 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_unpack)
NOTE: recipe kmscube-git-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 632 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_recipe_qa_setscene)
NOTE: recipe kmscube-git-r0: task do_unpack: Succeeded
NOTE: Running task 1721 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_patch)
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmscube-git-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1733 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata)
NOTE: Running task 1739 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmscube-git-r0: task do_patch: Succeeded
NOTE: Running task 1740 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1742 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic unihash changed to cd053f5ff93989ce0fdbdd51d5dd722fc40c03501b4ebac7e69c6bffa3ad1c81
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Succeeded
NOTE: Running task 1748 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_collect_spdx_deps)
NOTE: recipe kmscube-git-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmscube-git-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1749 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_configure)
NOTE: recipe kmscube-git-r0: task do_configure: Started
NOTE: recipe kmscube-git-r0: task do_configure: Succeeded
NOTE: Running task 1750 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_compile)
NOTE: recipe kmscube-git-r0: task do_compile: Started
NOTE: recipe kmscube-git-r0: task do_compile: Succeeded
NOTE: Running task 1751 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_install)
NOTE: recipe kmscube-git-r0: task do_install: Started
NOTE: recipe kmscube-git-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package)
NOTE: Running task 1753 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot)
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Started
NOTE: recipe kmscube-git-r0: task do_package: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmscube-git-r0: task do_package: Succeeded
NOTE: Running task 1754 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata)
NOTE: recipe kmscube-git-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_packagedata: Succeeded
NOTE: Running task 1755 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_create_spdx)
NOTE: Running task 1756 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_write_rpm)
NOTE: Running task 1757 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_qa)
NOTE: recipe kmscube-git-r0: task do_create_spdx: Started
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Started
NOTE: recipe kmscube-git-r0: task do_create_spdx: Succeeded
NOTE: Running task 1758 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_create_runtime_spdx)
NOTE: recipe kmscube-git-r0: task do_package_qa: Succeeded
NOTE: recipe kmscube-git-r0: task do_create_runtime_spdx: Started
NOTE: recipe kmscube-git-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1759 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1759 tasks of which 1738 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4256687652551710351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kmscube/kmscube-dbg: PKGSIZE changed from 268792 to 270068 (+0%)
packages/core2-32-poky-linux/kmscube/kmscube-src: PKGSIZE changed from 4582698 to 4583630 (+0%)

--===============4256687652551710351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 50 skipped, 0 masked, 0 errors.
Removing 45 recipes from the core2-32 sysroot...done.
Removing 45 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-78a47a0f2758f9afa96ed6e5fd80f83ab64ed605"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78a47a0f2758f9afa96ed6e5fd80f83ab64ed605"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 335 Local 325 Mirrors 0 Missed 10 Current 297 (97% match, 98% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 308 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 309 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 926 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_recipe_qa)
NOTE: Running task 957 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_write_config)
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 335 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx_setscene)
NOTE: Running setscene task 336 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_packagedata_setscene)
NOTE: recipe kmscube-git-r0: task do_recipe_qa: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe kmscube-git-r0: task do_write_config: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmscube-git-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 377 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe kmscube-git-r0: task do_recipe_qa: Succeeded
NOTE: Running task 970 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_fetch)
NOTE: recipe kmscube-git-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 383 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe kmscube-git-r0: task do_fetch: Succeeded
NOTE: Running task 985 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 398 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmscube-git-r0: task do_unpack: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 410 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 416 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 419 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 422 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 425 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libdrm/2.4.115/temp/log.do_packagedata_setscene.2717259
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 427 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmscube-git-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 436 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 440 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1053 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_patch)
NOTE: Running setscene task 446 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 450 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmscube-git-r0: task do_patch: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmscube-git-r0: task do_patch: Succeeded
NOTE: Running task 1076 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1077 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 458 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 463 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmscube-git-r0: task do_populate_lic: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic unihash changed to cd053f5ff93989ce0fdbdd51d5dd722fc40c03501b4ebac7e69c6bffa3ad1c81
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 469 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_package_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 478 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 481 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_package_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 484 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 485 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 502 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 509 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 510 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 517 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 519 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 522 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 533 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 537 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 542 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 550 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 552 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 555 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 556 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 558 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 561 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 562 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 567 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 569 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 574 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 576 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 580 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 586 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 596 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 620 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 625 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1665 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata)
NOTE: Running task 1694 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Succeeded
NOTE: Running task 1747 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_collect_spdx_deps)
NOTE: recipe kmscube-git-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmscube-git-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1748 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_configure)
NOTE: recipe kmscube-git-r0: task do_configure: Started
NOTE: recipe kmscube-git-r0: task do_configure: Succeeded
NOTE: Running task 1749 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_compile)
NOTE: recipe kmscube-git-r0: task do_compile: Started
NOTE: recipe kmscube-git-r0: task do_compile: Succeeded
NOTE: Running task 1750 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_install)
NOTE: recipe kmscube-git-r0: task do_install: Started
NOTE: recipe kmscube-git-r0: task do_install: Succeeded
NOTE: Running task 1751 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package)
NOTE: Running task 1752 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot)
NOTE: recipe kmscube-git-r0: task do_package: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmscube-git-r0: task do_package: Succeeded
NOTE: Running task 1753 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata)
NOTE: recipe kmscube-git-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_packagedata: Succeeded
NOTE: Running task 1754 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_create_spdx)
NOTE: Running task 1755 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_write_rpm)
NOTE: Running task 1756 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_qa)
NOTE: recipe kmscube-git-r0: task do_create_spdx: Started
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Started
NOTE: recipe kmscube-git-r0: task do_create_spdx: Succeeded
NOTE: Running task 1757 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_create_runtime_spdx)
NOTE: recipe kmscube-git-r0: task do_package_qa: Succeeded
NOTE: recipe kmscube-git-r0: task do_create_runtime_spdx: Started
NOTE: recipe kmscube-git-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1758 of 1758 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1758 tasks of which 1737 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4256687652551710351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-78a47a0f2758f9afa96ed6e5fd80f83ab64ed605"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78a47a0f2758f9afa96ed6e5fd80f83ab64ed605"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 81 Local 71 Mirrors 0 Missed 10 Current 551 (87% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 573 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 629 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: Running task 1581 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_recipe_qa)
NOTE: Running task 1653 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_write_config)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libdrm/2.4.115/temp/log.do_packagedata_setscene.2672177
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 630 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_package_setscene)
NOTE: recipe kmscube-git-r0: task do_recipe_qa: Started
NOTE: recipe kmscube-git-r0: task do_write_config: Started
NOTE: recipe kmscube-git-r0: task do_write_config: Succeeded
NOTE: recipe kmscube-git-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1718 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_fetch)
NOTE: recipe kmscube-git-r0: task do_fetch: Started
NOTE: recipe kmscube-git-r0: task do_fetch: Succeeded
NOTE: Running task 1719 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_unpack)
NOTE: recipe kmscube-git-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package_setscene: Started
NOTE: recipe kmscube-git-r0: task do_unpack: Succeeded
NOTE: Running task 1720 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_patch)
NOTE: recipe kmscube-git-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 632 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_recipe_qa_setscene)
NOTE: recipe kmscube-git-r0: task do_patch: Succeeded
NOTE: Running task 1722 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1723 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic)
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Started
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1735 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata)
NOTE: Running task 1741 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmscube-git-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic unihash changed to cd053f5ff93989ce0fdbdd51d5dd722fc40c03501b4ebac7e69c6bffa3ad1c81
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Succeeded
NOTE: Running task 1748 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_collect_spdx_deps)
NOTE: recipe kmscube-git-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1749 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_configure)
NOTE: recipe kmscube-git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kmscube-git-r0: task do_configure: Started
NOTE: recipe kmscube-git-r0: task do_configure: Succeeded
NOTE: Running task 1750 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_compile)
NOTE: recipe kmscube-git-r0: task do_compile: Started
NOTE: recipe kmscube-git-r0: task do_compile: Succeeded
NOTE: Running task 1751 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_install)
NOTE: recipe kmscube-git-r0: task do_install: Started
NOTE: recipe kmscube-git-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package)
NOTE: Running task 1753 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot)
NOTE: recipe kmscube-git-r0: task do_package: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmscube-git-r0: task do_package: Succeeded
NOTE: Running task 1754 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata)
NOTE: recipe kmscube-git-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_packagedata: Succeeded
NOTE: Running task 1755 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_create_spdx)
NOTE: Running task 1756 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_write_rpm)
NOTE: Running task 1757 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_qa)
NOTE: recipe kmscube-git-r0: task do_create_spdx: Started
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Started
NOTE: recipe kmscube-git-r0: task do_create_spdx: Succeeded
NOTE: Running task 1758 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_create_runtime_spdx)
NOTE: recipe kmscube-git-r0: task do_package_qa: Succeeded
NOTE: recipe kmscube-git-r0: task do_create_runtime_spdx: Started
NOTE: recipe kmscube-git-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1759 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1759 tasks of which 1738 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4256687652551710351==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSBkNmY2ZTQyYjA5ZTFmYzliYzBlNTFlOWM5YTMzNjhkMTc0YzNlNGNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMiBTZXAgMjAyMyAwMDoxNTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtt
c2N1YmU6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3Vi
ZS9rbXNjdWJlX2dpdC5iYgppbmRleCBiMzg1ZmY3NDUyLi40Y2RjMGYwNmJiIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgpAQCAtMTAsNyArMTAsNyBA
QCBERVBFTkRTID0gInZpcnR1YWwvbGliZ2xlczMgdmlydHVhbC9saWJnbGVzMiB2aXJ0dWFsL2Vn
bCBsaWJkcm0gdmlydHVhbC9saWJnYm0iCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2tt
c2N1YmUuYztiZWdpbmxpbmU9MTtlbmRsaW5lPTIzO21kNT04YjMwOWQ0ZWU2N2I3MzE1ZmY3Mzgx
MjcwZGQ2MzFmYiIKIAotU1JDUkVWID0gIjUzZWE3MWVmZTYzNDcwY2Y2OTg3MjZkOTgzZTlkYTU3
NDhhNzU0YTEiCitTUkNSRVYgPSAiZWE2YzVkMWVlZWZiZmIwYTFjMjdhYjc0YTZlNDYyMWYxZDlh
ZGY0YyIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2ttc2N1
YmU7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKIAogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlU
UyA9ICIxIgotLSAKMi4zOS4yCgo=

--===============4256687652551710351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1807 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-78a47a0f2758f9afa96ed6e5fd80f83ab64ed605"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78a47a0f2758f9afa96ed6e5fd80f83ab64ed605"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 73 Local 63 Mirrors 0 Missed 10 Current 559 (86% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 576 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx_setscene)
NOTE: Running setscene task 583 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 629 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: Running task 1581 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_recipe_qa)
NOTE: Running task 1653 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_write_config)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libdrm/2.4.115/temp/log.do_packagedata_setscene.2585687
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 630 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_package_setscene)
NOTE: recipe kmscube-git-r0: task do_write_config: Started
NOTE: recipe kmscube-git-r0: task do_recipe_qa: Started
NOTE: recipe kmscube-git-r0: task do_write_config: Succeeded
NOTE: recipe kmscube-git-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1718 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_fetch)
NOTE: recipe kmscube-git-r0: task do_fetch: Started
NOTE: recipe kmscube-git-r0: task do_fetch: Succeeded
NOTE: Running task 1719 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_unpack)
NOTE: recipe kmscube-git-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package_setscene: Started
NOTE: recipe kmscube-git-r0: task do_unpack: Succeeded
NOTE: Running task 1720 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_patch)
NOTE: recipe kmscube-git-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 632 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_recipe_qa_setscene)
NOTE: recipe kmscube-git-r0: task do_patch: Succeeded
NOTE: Running task 1722 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1723 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic)
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Started
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1735 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata)
NOTE: Running task 1741 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmscube-git-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic unihash changed to cd053f5ff93989ce0fdbdd51d5dd722fc40c03501b4ebac7e69c6bffa3ad1c81
NOTE: Setscene tasks completed
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Succeeded
NOTE: Running task 1748 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_collect_spdx_deps)
NOTE: recipe kmscube-git-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmscube-git-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1749 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_configure)
NOTE: recipe kmscube-git-r0: task do_configure: Started
NOTE: recipe kmscube-git-r0: task do_configure: Succeeded
NOTE: Running task 1750 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_compile)
NOTE: recipe kmscube-git-r0: task do_compile: Started
NOTE: recipe kmscube-git-r0: task do_compile: Succeeded
NOTE: Running task 1751 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_install)
NOTE: recipe kmscube-git-r0: task do_install: Started
NOTE: recipe kmscube-git-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package)
NOTE: Running task 1753 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot)
NOTE: recipe kmscube-git-r0: task do_package: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmscube-git-r0: task do_package: Succeeded
NOTE: Running task 1754 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata)
NOTE: recipe kmscube-git-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_packagedata: Succeeded
NOTE: Running task 1755 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_create_spdx)
NOTE: Running task 1756 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_write_rpm)
NOTE: Running task 1757 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_qa)
NOTE: recipe kmscube-git-r0: task do_create_spdx: Started
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Started
NOTE: recipe kmscube-git-r0: task do_create_spdx: Succeeded
NOTE: Running task 1758 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_create_runtime_spdx)
NOTE: recipe kmscube-git-r0: task do_package_qa: Succeeded
NOTE: recipe kmscube-git-r0: task do_create_runtime_spdx: Started
NOTE: recipe kmscube-git-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1759 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1759 tasks of which 1738 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4256687652551710351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-78a47a0f2758f9afa96ed6e5fd80f83ab64ed605"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78a47a0f2758f9afa96ed6e5fd80f83ab64ed605"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 81 Local 71 Mirrors 0 Missed 10 Current 551 (87% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 573 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 629 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: Running task 1581 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_recipe_qa)
NOTE: Running task 1653 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_write_config)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libdrm/2.4.115/temp/log.do_packagedata_setscene.2631971
NOTE: recipe kmscube-git-r0: task do_recipe_qa: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 630 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_package_setscene)
NOTE: recipe kmscube-git-r0: task do_write_config: Started
NOTE: recipe kmscube-git-r0: task do_write_config: Succeeded
NOTE: recipe kmscube-git-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1718 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_fetch)
NOTE: recipe kmscube-git-r0: task do_fetch: Started
NOTE: recipe kmscube-git-r0: task do_fetch: Succeeded
NOTE: Running task 1719 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_unpack)
NOTE: recipe kmscube-git-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package_setscene: Started
NOTE: recipe kmscube-git-r0: task do_unpack: Succeeded
NOTE: Running task 1720 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_patch)
NOTE: recipe kmscube-git-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 632 of 632 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_recipe_qa_setscene)
NOTE: recipe kmscube-git-r0: task do_patch: Succeeded
NOTE: Running task 1722 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1723 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic)
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmscube-git-r0: task do_populate_lic: Started
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1735 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata)
NOTE: Running task 1741 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmscube-git-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic unihash changed to cd053f5ff93989ce0fdbdd51d5dd722fc40c03501b4ebac7e69c6bffa3ad1c81
NOTE: Setscene tasks completed
NOTE: recipe kmscube-git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata: Succeeded
NOTE: Running task 1748 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_collect_spdx_deps)
NOTE: recipe kmscube-git-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmscube-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1749 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_configure)
NOTE: recipe kmscube-git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kmscube-git-r0: task do_configure: Started
NOTE: recipe kmscube-git-r0: task do_configure: Succeeded
NOTE: Running task 1750 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_compile)
NOTE: recipe kmscube-git-r0: task do_compile: Started
NOTE: recipe kmscube-git-r0: task do_compile: Succeeded
NOTE: Running task 1751 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_install)
NOTE: recipe kmscube-git-r0: task do_install: Started
NOTE: recipe kmscube-git-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package)
NOTE: Running task 1753 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot)
NOTE: recipe kmscube-git-r0: task do_package: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Started
NOTE: recipe kmscube-git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmscube-git-r0: task do_package: Succeeded
NOTE: Running task 1754 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata)
NOTE: recipe kmscube-git-r0: task do_packagedata: Started
NOTE: recipe kmscube-git-r0: task do_packagedata: Succeeded
NOTE: Running task 1755 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_create_spdx)
NOTE: Running task 1756 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_write_rpm)
NOTE: Running task 1757 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package_qa)
NOTE: recipe kmscube-git-r0: task do_create_spdx: Started
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Started
NOTE: recipe kmscube-git-r0: task do_package_qa: Succeeded
NOTE: recipe kmscube-git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kmscube-git-r0: task do_create_spdx: Succeeded
NOTE: Running task 1758 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_create_runtime_spdx)
NOTE: recipe kmscube-git-r0: task do_create_runtime_spdx: Started
NOTE: recipe kmscube-git-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 1759 of 1759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/kmscube/kmscube_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1759 tasks of which 1738 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.116-r0 to 0:2.4.115-r0) [version-going-backwards]
ERROR: libdrm-2.4.115-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4256687652551710351==--

