Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AFFC3600A
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:43 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.10333.1742048296258035835
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fprk5zQU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YKne6662;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101959a2bd149-7372ae01-f549-41ed-b2d3-fb9c5128eff4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048317;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+zkuexikUj0TWi/+yq7x1xff9YBU4gle+CMRkF98fCA=;
	b=fprk5zQUpPtIfZtaULg9I+K65M9BKVutBeM8iDaG9dww7QTuszaoTUIMmuQApHJM
	5PBlWKToBzhLOKPUwUm2942dta4IrNSTZrLMrCOWF82prIaYXrMPRYVFo+JL6dk4X8T
	4uuaQi6xCI1NVrecnyl2Dv/qY+Sj2pNRkBRPVi2c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048317;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+zkuexikUj0TWi/+yq7x1xff9YBU4gle+CMRkF98fCA=;
	b=YKne6662r53UYnnadIbvaAV3w5fR6KtN5YLRyGYxtKi6UtHiZeCeQbCBDutr8YBm
	hl9Jag9t20UTaG/h1jdu6gGYqSUbTcc0xJw+bzpAnH8HzwDbW7EWj+q3N9+e6si5Pdt
	fE7vdGRzfaBwY2+Q4KrB+181Axq6YrkCaMjCR8II=
Content-Type: multipart/mixed; boundary="===============1511089790002839739=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 7da46412223273b3adf6d513466342b9d3a5c869
 SUCCEEDED
Message-ID: <010101959a2bd149-7372ae01-f549-41ed-b2d3-fb9c5128eff4-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212973

--===============1511089790002839739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *puzzles* to *7da46412223273b3adf6d513466342b9d3a5c869* has Succeeded.

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
From 2cb48f2def656234f25d527e491c80de31e3a823 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 13:46:54 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 2df512a5cd..15f6979bec 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "79be403101d055d2fde3611a5f133135d4094ee9"
+SRCREV = "7da46412223273b3adf6d513466342b9d3a5c869"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.44.1


--===============1511089790002839739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (922 cached, 1 parsed). 1884 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:bdad1cd95135334c6e959225b00f9ed5c7de38db"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 404 Local 393 Mirrors 0 Missed 11 Current 627 (97% match, 98% complete)
Removing 10 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2506 of 2847 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 2828 of 2847 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2829 of 2847 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 2830 of 2847 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 2831 of 2847 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: Running task 2832 of 2847 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2833 of 2847 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2834 of 2847 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to a3f7604db05e2a8d8494c36ea3e44891250d6dc2de7849de5e5b7bcdd6333557
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2835 of 2847 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 2836 of 2847 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 2837 of 2847 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Succeeded
NOTE: Running task 2838 of 2847 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2839 of 2847 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot unihash changed to 550ea6fbe687984b27886255305555b81c5bb7bf3c0dd6f4d82f29b93ecd5421
NOTE: Setscene tasks completed
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Succeeded
NOTE: Running task 2840 of 2847 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2840 tasks of which 2826 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315134534.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315134534.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/puzzles/0.0+git/temp/log.do_packagedata.1412262
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+79be403101-r0 to 2:0.0+git0+7da4641222-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+79be403101-r0 to 2:0.0+git0+7da4641222-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+79be403101-r0 to 2:0.0+git0+7da4641222-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+79be403101-r0 to 2:0.0+git0+7da4641222-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+79be403101-r0 to 2:0.0+git0+7da4641222-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+79be403101-r0 to 2:0.0+git0+7da4641222-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+79be403101-r0 to 2:0.0+git0+7da4641222-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/puzzles/0.0+git/temp/log.do_packagedata.1412262
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============1511089790002839739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (0 cached, 923 parsed). 1885 targets, 50 skipped, 0 masked, 0 errors.
Removing 89 recipes from the core2-64 sysroot...done.
Removing 89 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:bdad1cd95135334c6e959225b00f9ed5c7de38db"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 648 Local 638 Mirrors 0 Missed 10 Current 341 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 360 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 437 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 442 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 445 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 533 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 537 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: Running task 1197 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 1343 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 554 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 561 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.56.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.56.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/pango/1.56.1/temp/log.do_packagedata_setscene.1413707
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxkbcommon/1.8.0/temp/log.do_packagedata_setscene.1413706
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 565 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_package_setscene)
NOTE: recipe libxkbcommon-1.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.56.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 567 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: Running setscene task 569 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_package_setscene)
NOTE: Running setscene task 571 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 574 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1349 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running setscene task 585 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 586 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 587 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 588 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 595 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 599 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 603 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 615 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 617 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.56.1-r0: task do_package_setscene: Started
NOTE: Running setscene task 618 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.8.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 622 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 633 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 642 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 646 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 649 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 660 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 664 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 666 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 668 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 674 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 678 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 679 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 680 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.56.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 681 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 683 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 686 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 687 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 689 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 695 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 699 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 705 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.41-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 707 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 710 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 712 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 714 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 716 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 717 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.56.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 722 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 724 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 726 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 727 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-10.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 731 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 734 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata_setscene)
NOTE: recipe pango-1.56.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 736 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 737 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 740 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-10.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-10.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 756 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 764 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 775 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 777 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 780 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 782 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1653 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1654 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 801 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 806 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.47.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 811 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 816 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 818 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 820 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 823 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 829 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 830 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 832 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 837 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 840 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 841 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 849 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 856 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-75.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-75.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 859 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 865 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 867 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 868 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 869 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 871 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 872 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 873 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 875 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 876 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 883 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 886 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 887 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 889 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 890 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 892 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 893 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 896 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 897 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 898 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 903 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 904 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 908 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 911 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 913 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 914 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 918 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 920 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 922 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 924 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 926 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 929 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 930 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 933 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 934 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 938 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 939 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 941 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 943 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 945 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 949 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 954 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 956 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 957 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 958 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 961 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 962 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 963 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 968 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 969 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 972 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 977 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 980 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 981 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 985 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 987 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2633 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.1.bb:do_packagedata)
NOTE: Running task 2634 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.8.0.bb:do_packagedata)
NOTE: Running task 2643 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.56.1-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.56.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2724 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2725 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 2726 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 2727 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Succeeded
NOTE: Running task 2728 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2729 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Succeeded
NOTE: Running task 2730 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Succeeded
NOTE: Running task 2731 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: Running task 2732 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_ipk)
NOTE: Running task 2733 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_deb)
NOTE: Running task 2734 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2735 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_ipk: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_deb: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 2736 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_package_spdx)
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_package_spdx: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_package_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa unihash changed to 1b65e64bb2886b317336747ec21c58f97ee61198ad1b05f742b06c01546b6861
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2737 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2737 tasks of which 2715 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: libxkbcommon-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-src went backwards which would break package feeds (from 0:1.8.1-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: pango-1.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.56.2-r0 to 0:1.56.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-dbg went backwards which would break package feeds (from 0:1.8.1-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: pango-1.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.56.2-r0 to 0:1.56.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-staticdev went backwards which would break package feeds (from 0:1.8.1-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: pango-1.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.56.2-r0 to 0:1.56.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-dev went backwards which would break package feeds (from 0:1.8.1-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: pango-1.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.56.2-r0 to 0:1.56.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-doc went backwards which would break package feeds (from 0:1.8.1-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: pango-1.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.56.2-r0 to 0:1.56.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-locale went backwards which would break package feeds (from 0:1.8.1-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: pango-1.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.56.2-r0 to 0:1.56.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package xkbcli went backwards which would break package feeds (from 0:1.8.1-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: pango-1.56.1-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.56.2-r0 to 0:1.56.1-r0) [version-going-backwards]
ERROR: pango-1.56.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libxkbcommon-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon went backwards which would break package feeds (from 0:1.8.1-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-bash-completion went backwards which would break package feeds (from 0:1.8.1-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-x11 went backwards which would break package feeds (from 0:1.8.1-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.8.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbregistry went backwards which would break package feeds (from 0:1.8.1-r0 to 0:1.8.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.8.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1511089790002839739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 22025240 to 22028824 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+7da4641222
packages/core2-64-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+79be403101-r0'])", added "puzzles (['= 2:0.0+git0+7da4641222-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+7da4641222
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+7da4641222
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+7da4641222
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3849408 to 3856462 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+7da4641222
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+7da4641222
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+79be403101-r0'])", added "puzzles-dev (['= 2:0.0+git0+7da4641222-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+7da4641222

--===============1511089790002839739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+7da4641222
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+7da4641222
packages/core2-64-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+79be403101-r0'])", added "puzzles (['= 2:0.0+git0+7da4641222-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+7da4641222
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+7da4641222
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+7da4641222
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+7da4641222
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+79be403101-r0'])", added "puzzles-dev (['= 2:0.0+git0+7da4641222-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+7da4641222

--===============1511089790002839739==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSAyY2I0OGYyZGVmNjU2MjM0ZjI1ZDUyN2U0OTFjODBkZTMxZTNhODIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTM6NDY6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggMmRmNTEyYTVjZC4uMTVmNjk3OWJlYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNL
X0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICI3OWJlNDAzMTAxZDA1NWQyZmRlMzYxMWE1ZjEzMzEz
NWQ0MDk0ZWU5IgorU1JDUkVWID0gIjdkYTQ2NDEyMjIzMjczYjNhZGY2ZDUxMzQ2NjM0MmI5ZDNh
NWM4NjkiCiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCIKIAotLSAKMi40NC4xCgo=

--===============1511089790002839739==--

