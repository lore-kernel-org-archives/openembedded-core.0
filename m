Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5F1C2FC16
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.797.1686887481398404189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XP4DoiAk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010188c2544e6f-d40bb88c-4b00-44c5-b9c6-a050b8dc74db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7XBJmKXsuLOosHlFOAlpo91L5iAhNjootZ5N2t3YL4k=;
	b=XP4DoiAkLYlOmqpmQmQE3qoWC8AF+Xy5UlLcOY8E+hrRzb1a+K4PIUnbtYDPcv6O
	2ffiIMQEIUS2efiG/3zOuXpUFbs++RgFwbOyTFu/iqXmjCspOXmWS8XIaZGu6PLS3Cp
	dcsp0419O8Yc+IdN9P1nyF9UihOkSYBdFtS69brs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7XBJmKXsuLOosHlFOAlpo91L5iAhNjootZ5N2t3YL4k=;
	b=PWmXbB9cSqKnVwKGyLunDqp2h5uJcyJ/ktGt1Sg65rB7moKUC4zGLA6/8FioyyVl
	3KbZ6WzyN3s6TbN/xT7fsyq6dgX6WRIVw5hbfY2DMezjvPV0iZKW4nZbru0bu0s0qab
	ongOag61k98a/FBuV0PhX75KAJvv8LX0zkXqt8Tk=
Content-Type: multipart/mixed; boundary="===============2676985048374760113=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 1a316f47ad3d1749b9b31a99cdb1ebf472fe1d85
 SUCCEEDED
Message-ID: <01010188c2544e6f-d40bb88c-4b00-44c5-b9c6-a050b8dc74db-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182981

--===============2676985048374760113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *1a316f47ad3d1749b9b31a99cdb1ebf472fe1d85* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
From b38531964f43915a23559c28e25b4446ca798246 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 22:47:32 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 4b04588682..0d1af5b8c2 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "5a491c5ad333ef34c1e7713f920f51cbb205af60"
+SRCREV = "1a316f47ad3d1749b9b31a99cdb1ebf472fe1d85"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.39.2


--===============2676985048374760113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f61f8b1b278e9325388324b8151d595a120f7b8f"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 300 Local 291 Mirrors 0 Missed 9 Current 477 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2198 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_fetch: Succeeded
NOTE: Running task 2456 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2457 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_unpack: Succeeded
NOTE: Running task 2458 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 2459 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_patch: Succeeded
NOTE: Running task 2460 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2461 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2462 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2463 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_configure: Succeeded
NOTE: Running task 2464 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_compile: Succeeded
NOTE: Running task 2465 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_install: Succeeded
NOTE: Running task 2466 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2467 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package: Succeeded
NOTE: Running task 2468 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2468 tasks of which 2454 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+5a491c5ad3-r0 to 2:0.0+git0+1a316f47ad-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+5a491c5ad3-r0 to 2:0.0+git0+1a316f47ad-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+5a491c5ad3-r0 to 2:0.0+git0+1a316f47ad-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+5a491c5ad3-r0 to 2:0.0+git0+1a316f47ad-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+5a491c5ad3-r0 to 2:0.0+git0+1a316f47ad-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+5a491c5ad3-r0 to 2:0.0+git0+1a316f47ad-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+5a491c5ad3-r0 to 2:0.0+git0+1a316f47ad-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/temp/log.do_packagedata.1287320
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============2676985048374760113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1802 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f61f8b1b278e9325388324b8151d595a120f7b8f"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 40 Mirrors 0 Missed 10 Current 727 (80% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 747 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/xkeyboard-config/2.38-r0/temp/log.do_packagedata_setscene.1288071
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 776 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package_setscene)
NOTE: Running task 2167 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_fetch: Succeeded
NOTE: Running task 2394 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_unpack: Succeeded
NOTE: Running task 2423 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata)
NOTE: Running task 2429 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 2436 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_patch: Succeeded
NOTE: Running task 2438 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2439 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2440 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 10ba71f492d90836477a6c78b19c2f872951a7f2e4f3c761e213733c97c5f8ff
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2460 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2461 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2462 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_configure: Succeeded
NOTE: Running task 2463 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_compile: Succeeded
NOTE: Running task 2464 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Succeeded
NOTE: Running task 2465 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_install: Succeeded
NOTE: Running task 2466 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2467 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package: Succeeded
NOTE: Running task 2468 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_packagedata: Succeeded
NOTE: Running task 2469 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: Running task 2470 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2471 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_spdx: Succeeded
NOTE: Running task 2472 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_runtime_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_runtime_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2473 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2473 tasks of which 2451 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ar went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-he went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2676985048374760113==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBiMzg1MzE5NjRmNDM5MTVhMjM1NTljMjhlMjViNDQ0NmNhNzk4MjQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjI6NDc6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggNGIwNDU4ODY4Mi4uMGQxYWY1YjhjMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNL
X0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICI1YTQ5MWM1YWQzMzNlZjM0YzFlNzcxM2Y5MjBmNTFj
YmIyMDVhZjYwIgorU1JDUkVWID0gIjFhMzE2ZjQ3YWQzZDE3NDliOWIzMWE5OWNkYjFlYmY0NzJm
ZTFkODUiCiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjM5LjIKCg==

--===============2676985048374760113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+5a491c5ad3 [default] to 0.0+gitAUTOINC+1a316f47ad [default]
packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+1a316f47ad"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+1a316f47ad
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+1a316f47ad"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 14447260 to 15589508 (+8%)
packages/core2-32-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+5a491c5ad3-r0'])", added "puzzles (['= 2:0.0+git0+1a316f47ad-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+1a316f47ad
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+1a316f47ad"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+1a316f47ad
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+1a316f47ad"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+1a316f47ad
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+1a316f47ad"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+1a316f47ad
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+1a316f47ad"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3542339 to 3695312 (+4%)
packages/core2-32-poky-linux/puzzles/puzzles-src: FILELIST: removed "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5
 ad3-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAU
 TOINC+5a491c5ad3-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pattern.c /usr/src/debug/puzzles/2_0.0+git
 AUTOINC+5a491c5ad3-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/printing.c /usr/src/debug/puzzles/2
 _0.0+gitAUTOINC+5a491c5ad3-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/palisade.c", added "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/gtk.h /usr/
 src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/v
 ersion.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/hat-tables.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/hat-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/hat.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOI
 NC+1a316f47ad-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/hat.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTO
 INC+1a316f47ad-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/lightup.c /usr/src/debug/puzzles/2_
 0.0+gitAUTOINC+1a316f47ad-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+1a316f47ad-r0/loopgen.h"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+1a316f47ad
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+5a491c5ad3-r0'])", added "puzzles-dev (['= 2:0.0+git0+1a316f47ad-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+1a316f47ad"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+1a316f47ad
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+1a316f47ad"
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 6847938 to 7445958 (+9%)

--===============2676985048374760113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 53 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f61f8b1b278e9325388324b8151d595a120f7b8f"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 41 Mirrors 0 Missed 10 Current 720 (80% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 741 of 771 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 771 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/xkeyboard-config/2.38-r0/temp/log.do_packagedata_setscene.1474079
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 770 of 771 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package_setscene)
NOTE: Running task 2149 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_setscene: Started
NOTE: Running task 2372 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2401 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata)
NOTE: Running task 2407 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 2414 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_patch: Succeeded
NOTE: Running task 2416 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2417 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2418 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 10ba71f492d90836477a6c78b19c2f872951a7f2e4f3c761e213733c97c5f8ff
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2438 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2439 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2440 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_configure: Succeeded
NOTE: Running task 2441 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_compile: Succeeded
NOTE: Running task 2442 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Succeeded
NOTE: Running task 2443 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_install: Succeeded
NOTE: Running task 2444 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2445 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package: Succeeded
NOTE: Running task 2446 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_packagedata: Succeeded
NOTE: Running task 2447 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: Running task 2448 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2449 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_spdx: Succeeded
NOTE: Running task 2450 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_runtime_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_runtime_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2451 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2451 tasks of which 2429 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ar went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-he went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2676985048374760113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 69 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f61f8b1b278e9325388324b8151d595a120f7b8f"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 41 Mirrors 0 Missed 10 Current 720 (80% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 741 of 771 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 771 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/xkeyboard-config/2.38-r0/temp/log.do_packagedata_setscene.1686402
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 770 of 771 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package_setscene)
NOTE: Running task 2149 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_fetch: Succeeded
NOTE: Running task 2372 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_unpack: Succeeded
NOTE: Running task 2373 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_patch: Succeeded
NOTE: Running task 2374 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2375 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2376 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2405 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata)
NOTE: Running task 2417 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 10ba71f492d90836477a6c78b19c2f872951a7f2e4f3c761e213733c97c5f8ff
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2438 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2439 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2440 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_configure: Succeeded
NOTE: Running task 2441 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_compile: Succeeded
NOTE: Running task 2442 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Succeeded
NOTE: Running task 2443 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_install: Succeeded
NOTE: Running task 2444 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2445 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package: Succeeded
NOTE: Running task 2446 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_packagedata: Succeeded
NOTE: Running task 2447 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: Running task 2448 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2449 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_spdx: Succeeded
NOTE: Running task 2450 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_runtime_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_runtime_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2451 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2451 tasks of which 2429 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ar went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-he went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2676985048374760113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+1a316f47ad
packages/core2-32-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+5a491c5ad3-r0'])", added "puzzles (['= 2:0.0+git0+1a316f47ad-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+1a316f47ad
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+1a316f47ad
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+1a316f47ad
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+1a316f47ad
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+1a316f47ad
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+5a491c5ad3-r0'])", added "puzzles-dev (['= 2:0.0+git0+1a316f47ad-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+1a316f47ad

--===============2676985048374760113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 63 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f61f8b1b278e9325388324b8151d595a120f7b8f"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 41 Mirrors 0 Missed 10 Current 715 (80% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 736 of 766 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 766 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/xkeyboard-config/2.38-r0/temp/log.do_packagedata_setscene.1620261
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 765 of 766 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package_setscene)
NOTE: Running task 2137 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_fetch: Succeeded
NOTE: Running task 2356 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_unpack: Succeeded
NOTE: Running task 2357 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2386 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata)
NOTE: Running task 2398 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Started
NOTE: Running task 2400 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2401 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2402 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 10ba71f492d90836477a6c78b19c2f872951a7f2e4f3c761e213733c97c5f8ff
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2422 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2423 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2424 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_configure: Succeeded
NOTE: Running task 2425 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_compile: Succeeded
NOTE: Running task 2426 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_install: Succeeded
NOTE: Running task 2427 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2428 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Succeeded
NOTE: Running task 2429 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package: Succeeded
NOTE: Running task 2430 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_packagedata: Succeeded
NOTE: Running task 2431 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: Running task 2432 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2433 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_spdx: Succeeded
NOTE: Running task 2434 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_runtime_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_runtime_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2435 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2435 tasks of which 2413 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ar went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-he went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2676985048374760113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 47 skipped, 0 masked, 0 errors.
Removing 89 recipes from the core2-32 sysroot...done.
Removing 89 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f61f8b1b278e9325388324b8151d595a120f7b8f"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 458 Local 449 Mirrors 0 Missed 9 Current 281 (98% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 282 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 295 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 834 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 313 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_fetch: Succeeded
NOTE: Running task 872 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 394 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 398 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_unpack: Succeeded
NOTE: Running task 1101 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_patch: Succeeded
NOTE: Running task 1141 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1142 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1143 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 10ba71f492d90836477a6c78b19c2f872951a7f2e4f3c761e213733c97c5f8ff
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 403 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/xkeyboard-config/2.38-r0/temp/log.do_packagedata_setscene.2008732
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 446 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 458 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 474 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 495 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 503 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 505 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 512 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 527 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 535 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 552 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_package_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2250 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata)
NOTE: Running task 2289 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2344 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2345 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_compile: Succeeded
NOTE: Running task 2347 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_install: Succeeded
NOTE: Running task 2348 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2349 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package: Succeeded
NOTE: Running task 2350 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_packagedata: Succeeded
NOTE: Running task 2351 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: Running task 2352 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2353 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_spdx: Succeeded
NOTE: Running task 2354 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_runtime_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_runtime_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+1a316f47ad-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2355 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2355 tasks of which 2335 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 52 ERROR messages, returning a non-zero exit code.
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ar went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-he went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.39-r0 to 0:2.38-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.38-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2676985048374760113==--

