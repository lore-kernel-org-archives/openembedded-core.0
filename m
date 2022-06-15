Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6290BC43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.4452.1655298222736141377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=l9IGqL3L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 0101018167766785-131631d1-5c52-44d5-98fc-196aa1b09d6f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rJzUPnolyJAALRqMJDkOMxyTGpd2Ky9ntRuO4Z1nYVE=;
	b=l9IGqL3LtF1nyMC1M0fJy7f5/uVFsSX8hmzHmCEfgENAH3kMfMsySlu+Nu9ie39H
	alM+LP1Pjcr2R/LJN6RHY6HUE1YouzFiw/EtJPmzGiq5lXpDiEGyJLyCQZCru28xc1D
	ynW6cu4W4pdeht5/trTPb7LEq04PZCwxpFVpQS4o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rJzUPnolyJAALRqMJDkOMxyTGpd2Ky9ntRuO4Z1nYVE=;
	b=Vj6xT1sA2hlJVPO3Aam8Eft9ijSdmM76ByLz7yFkLAyyJJiCwCGr0jH0TPpCTq6N
	VRVlCj24VIxnceW0FH7MsyYO7BJg1WxZBxp4Ru6Y+HzfG0a5tTh331zWsMouO1gUNCX
	wnf8Ci45fLBCVIAJ40o1fVVotoqFPmeJmgKN1ntU=
Content-Type: multipart/mixed; boundary="===============0887544274517202090=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 387d323dd8d579db2c90b499b3b19f746cbdbce5
 SUCCEEDED
Message-ID: 
 <0101018167766785-131631d1-5c52-44d5-98fc-196aa1b09d6f-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166982

--===============0887544274517202090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *387d323dd8d579db2c90b499b3b19f746cbdbce5* has Succeeded.

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
--===============0887544274517202090==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

From 7d484b8f3bc11a4610c5541ce6a0741370acac20 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 12:51:26 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 0104f2672a..68bdee8b52 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "c43a34fbfe430d235bafc379595761880a19ed9f"
+SRCREV = "387d323dd8d579db2c90b499b3b19f746cbdbce5"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.31.1


--===============0887544274517202090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-b60a0e5ab6836cfc4a4442a0022e2e0df3978b46"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b60a0e5ab6836cfc4a4442a0022e2e0df3978b46"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 20 Local 10 Mirrors 0 Missed 10 Current 565 (50% match, 98% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 571 of 585 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 585 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot_setscene)
NOTE: Running task 1369 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libx11/1_1.8-r0/temp/log.do_packagedata_setscene.168354
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 584 of 585 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_package_setscene)
NOTE: Running task 1817 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_fetch: Succeeded
NOTE: Running task 1865 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_unpack: Succeeded
NOTE: Running task 1866 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libx11-1_1.8-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_patch: Succeeded
NOTE: Running task 1867 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1868 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1869 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to e1673437b7eee1d00b465b14afb7bce71c732d2879652537bc9da0926ac5e0ed
NOTE: Running task 1870 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1871 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libx11-1_1.8-r0: task do_package_setscene: Succeeded
NOTE: Running task 1897 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 65b17ebcffa94b7f2b9452d2bd205777f4276a38b65464b4d238b2a804cb2a4d
NOTE: Setscene tasks completed
NOTE: Running task 2004 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2041 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 656728e8dec0d72a8fab5de1f4fa41bdbcc84231c5c7f67760b54a24cbeee47b
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2052 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_configure: Succeeded
NOTE: Running task 2053 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_compile: Succeeded
NOTE: Running task 2054 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_install: Succeeded
NOTE: Running task 2055 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2056 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package: Succeeded
NOTE: Running task 2057 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_packagedata: Succeeded
NOTE: Running task 2058 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2059 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2060 of 2060 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2060 tasks of which 2039 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0887544274517202090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1643 targets, 49 skipped, 0 masked, 0 errors.
Removing 90 recipes from the core2-32 sysroot...done.
Removing 90 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-b60a0e5ab6836cfc4a4442a0022e2e0df3978b46"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b60a0e5ab6836cfc4a4442a0022e2e0df3978b46"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 358 Local 348 Mirrors 0 Missed 10 Current 206 (97% match, 98% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 207 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 208 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 216 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb:do_populate_sysroot_setscene)
NOTE: Running task 933 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_fetch: Succeeded
NOTE: Running task 936 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_unpack: Succeeded
NOTE: Running task 941 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.34-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 224 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 225 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 227 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 228 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 229 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 231 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_patch: Succeeded
NOTE: Running task 946 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 947 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 948 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_lic: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 243 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 245 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 250 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 254 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 257 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.44.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 258 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.38.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 259 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to e1673437b7eee1d00b465b14afb7bce71c732d2879652537bc9da0926ac5e0ed
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-4.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-4.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 265 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-4.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 269 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 277 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.44.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 293 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe atk-2.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 298 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 305 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 311 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 318 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 320 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: Running setscene task 328 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 330 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 343 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 345 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1060 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 357 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 362 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running setscene task 364 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 365 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running setscene task 368 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1083 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1084 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 373 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 379 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 384 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 1123 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 402 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 410 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1150 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 413 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 417 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1164 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libx11/1_1.8-r0/temp/log.do_packagedata_setscene.185488
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 420 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 422 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1173 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 442 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libx11-1_1.8-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1238 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8-r0: task do_package_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 498 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 525 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 534 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1292 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 541 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f4dbf37d0910488479188d663f0d744ffe7d8ddc40ffece8c88dc02c11e5f966
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 558 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 564 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1671 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata)
NOTE: Running task 1696 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f7d0774acbd83db3cef7eae3640e95032ee101f90557c2a4e248ee39b560e499
NOTE: Running task 1980 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1984 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_configure: Succeeded
NOTE: Running task 1985 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_compile: Succeeded
NOTE: Running task 1986 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_install: Succeeded
NOTE: Running task 1987 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 1988 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package: Succeeded
NOTE: Running task 1989 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_packagedata: Succeeded
NOTE: Running task 1990 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 1991 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1992 of 1992 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1992 tasks of which 1965 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0887544274517202090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-b60a0e5ab6836cfc4a4442a0022e2e0df3978b46"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b60a0e5ab6836cfc4a4442a0022e2e0df3978b46"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 20 Local 10 Mirrors 0 Missed 10 Current 573 (50% match, 98% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 579 of 593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1379 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libx11/1_1.8-r0/temp/log.do_packagedata_setscene.158371
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 592 of 593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_package_setscene)
NOTE: Running task 1847 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_fetch: Succeeded
NOTE: Running task 1897 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_unpack: Succeeded
NOTE: Running task 1898 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libx11-1_1.8-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_patch: Succeeded
NOTE: Running task 1899 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1900 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1901 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to e1673437b7eee1d00b465b14afb7bce71c732d2879652537bc9da0926ac5e0ed
NOTE: Running task 1902 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1903 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libx11-1_1.8-r0: task do_package_setscene: Succeeded
NOTE: Running task 1929 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata)
NOTE: recipe libx11-1_1.8-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5ed870303c0f0e0c6c89ebd0b9380a1e9a66eea011259bf73fe3c430bec67250
NOTE: Setscene tasks completed
NOTE: Running task 2036 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2073 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b0e3b0d12ad862ed776625cc4e9c3615fd854e96416679a1d13b7b665f13755d
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2084 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_configure: Succeeded
NOTE: Running task 2085 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_compile: Succeeded
NOTE: Running task 2086 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_install: Succeeded
NOTE: Running task 2087 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2088 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package: Succeeded
NOTE: Running task 2089 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_packagedata: Succeeded
NOTE: Running task 2090 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2091 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2092 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2092 tasks of which 2071 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0887544274517202090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+c43a34fbfe" to "0.0+gitAUTOINC+387d323dd8"
packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+c43a34fbfe [default] to 0.0+gitAUTOINC+387d323dd8 [default]
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+c43a34fbfe" to "0.0+gitAUTOINC+387d323dd8"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+c43a34fbfe to 0.0+git0+387d323dd8
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+c43a34fbfe" to "0.0+gitAUTOINC+387d323dd8"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+c43a34fbfe to 0.0+git0+387d323dd8
packages/core2-32-poky-linux/puzzles/puzzles-dev: RDEPENDS: removed "puzzles (['= 2:0.0+git0+c43a34fbfe-r0'])", added "puzzles (['= 2:0.0+git0+387d323dd8-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+c43a34fbfe" to "0.0+gitAUTOINC+387d323dd8"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+c43a34fbfe to 0.0+git0+387d323dd8
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+c43a34fbfe" to "0.0+gitAUTOINC+387d323dd8"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+c43a34fbfe to 0.0+git0+387d323dd8
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+c43a34fbfe" to "0.0+gitAUTOINC+387d323dd8"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+c43a34fbfe to 0.0+git0+387d323dd8
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+c43a34fbfe" to "0.0+gitAUTOINC+387d323dd8"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+c43a34fbfe to 0.0+git0+387d323dd8
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+c43a34fbfe-r0'])", added "puzzles-dev (['= 2:0.0+git0+387d323dd8-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+c43a34fbfe" to "0.0+gitAUTOINC+387d323dd8"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+c43a34fbfe to 0.0+git0+387d323dd8

--===============0887544274517202090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-b60a0e5ab6836cfc4a4442a0022e2e0df3978b46"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b60a0e5ab6836cfc4a4442a0022e2e0df3978b46"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 20 Local 10 Mirrors 0 Missed 10 Current 569 (50% match, 98% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 575 of 589 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 589 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot_setscene)
NOTE: Running task 1380 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libx11/1_1.8-r0/temp/log.do_packagedata_setscene.163367
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 588 of 589 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_package_setscene)
NOTE: Running task 1829 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_fetch: Succeeded
NOTE: Running task 1879 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_unpack: Succeeded
NOTE: Running task 1880 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libx11-1_1.8-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_patch: Succeeded
NOTE: Running task 1881 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1882 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1883 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1884 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1885 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to e1673437b7eee1d00b465b14afb7bce71c732d2879652537bc9da0926ac5e0ed
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libx11-1_1.8-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1911 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata)
NOTE: recipe libx11-1_1.8-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to dc0d3db9dacec36b3d96867e3c562f4b22fb5604cc27df94b9d900531a55cd39
NOTE: Running task 2018 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2055 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 101b7664e0b3bdada8186be4cb7cfc0075093b0291f572f9b5dc31a118d52e19
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2066 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_configure: Succeeded
NOTE: Running task 2067 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_compile: Succeeded
NOTE: Running task 2068 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_install: Succeeded
NOTE: Running task 2069 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2070 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package: Succeeded
NOTE: Running task 2071 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_packagedata: Succeeded
NOTE: Running task 2072 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2073 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2074 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2074 tasks of which 2053 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0887544274517202090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+c43a34fbfe to 0.0+git0+387d323dd8
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+c43a34fbfe to 0.0+git0+387d323dd8
packages/core2-32-poky-linux/puzzles/puzzles-dev: RDEPENDS: removed "puzzles (['= 2:0.0+git0+c43a34fbfe-r0'])", added "puzzles (['= 2:0.0+git0+387d323dd8-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+c43a34fbfe to 0.0+git0+387d323dd8
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+c43a34fbfe to 0.0+git0+387d323dd8
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+c43a34fbfe to 0.0+git0+387d323dd8
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+c43a34fbfe to 0.0+git0+387d323dd8
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+c43a34fbfe-r0'])", added "puzzles-dev (['= 2:0.0+git0+387d323dd8-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+c43a34fbfe to 0.0+git0+387d323dd8

--===============0887544274517202090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1642 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-b60a0e5ab6836cfc4a4442a0022e2e0df3978b46"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b60a0e5ab6836cfc4a4442a0022e2e0df3978b46"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 195 Local 188 Mirrors 0 Missed 7 Current 398 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1965 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_fetch: Succeeded
NOTE: Running task 2078 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2079 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_unpack: Succeeded
NOTE: Running task 2080 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_patch: Succeeded
NOTE: Running task 2081 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2082 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2083 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2084 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_configure: Succeeded
NOTE: Running task 2085 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_compile: Succeeded
NOTE: Running task 2086 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_install: Succeeded
NOTE: Running task 2087 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2088 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package: Succeeded
NOTE: Running task 2089 of 2092 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2089 tasks of which 2076 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: puzzles-2_0.0+gitAUTOINC+387d323dd8-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+c43a34fbfe-r0 to 2:0.0+git0+387d323dd8-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+387d323dd8-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+c43a34fbfe-r0 to 2:0.0+git0+387d323dd8-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+387d323dd8-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+c43a34fbfe-r0 to 2:0.0+git0+387d323dd8-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+387d323dd8-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+c43a34fbfe-r0 to 2:0.0+git0+387d323dd8-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+387d323dd8-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+c43a34fbfe-r0 to 2:0.0+git0+387d323dd8-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+387d323dd8-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+c43a34fbfe-r0 to 2:0.0+git0+387d323dd8-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+387d323dd8-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+c43a34fbfe-r0 to 2:0.0+git0+387d323dd8-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+387d323dd8-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/puzzles/2_0.0+gitAUTOINC+387d323dd8-r0/temp/log.do_packagedata.158012
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============0887544274517202090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-b60a0e5ab6836cfc4a4442a0022e2e0df3978b46"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b60a0e5ab6836cfc4a4442a0022e2e0df3978b46"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 20 Local 10 Mirrors 0 Missed 10 Current 569 (50% match, 98% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 575 of 589 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 589 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1379 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libx11/1_1.8-r0/temp/log.do_packagedata_setscene.173349
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 588 of 589 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_package_setscene)
NOTE: Running task 1829 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_fetch: Succeeded
NOTE: Running task 1879 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1880 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libx11-1_1.8-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_patch: Succeeded
NOTE: Running task 1881 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1882 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1883 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_lic: Started
NOTE: Running task 1884 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1885 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to e1673437b7eee1d00b465b14afb7bce71c732d2879652537bc9da0926ac5e0ed
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_package_setscene: Succeeded
NOTE: Running task 1911 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 6592d480d8aaae170902a68ee445a1803e9df6f4b3484c7fd1c9bbf86134282f
NOTE: Setscene tasks completed
NOTE: Running task 2018 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2055 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 08abae7ae8354982c1d0ddb8c615ca1c9dda908bb56086f651c88a0eb59290aa
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2066 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_configure: Succeeded
NOTE: Running task 2067 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_compile: Succeeded
NOTE: Running task 2068 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_install: Succeeded
NOTE: Running task 2069 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2070 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package: Succeeded
NOTE: Running task 2071 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_packagedata: Succeeded
NOTE: Running task 2072 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2073 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+387d323dd8-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2074 of 2074 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2074 tasks of which 2053 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.1-r0 to 1:1.8-r0) [version-going-backwards]
ERROR: libx11-1_1.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0887544274517202090==--

