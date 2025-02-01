Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C68C02198
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.42725.1738416057550447511
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AVE2W1fX;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JB29ndcE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010194c1abeac1-eaceb2b5-4167-4213-a571-51698ba852a4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416057;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JdaZUu95SI24pM7Om8f0wg+3J6qftCbgdQtSVZhjYT0=;
	b=AVE2W1fXDUWWkWpodYGiPcDR4HUdpYflutrFbUAHsXMZlT418DRjshNERPKLFcJT
	cJhMppcIlnvBT66bBIOp5yDjpc2VzpxZt+xs8jbRRTf96yApxfwtRa4WHIJ/UNsWhFu
	3icerbqoeJIlI5YR0ZOxGSXlXouypq4PXQDhSRQI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416057;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JdaZUu95SI24pM7Om8f0wg+3J6qftCbgdQtSVZhjYT0=;
	b=JB29ndcEFl3UFViCK/dUmti4Vc61YEshvJ/nzZjIZ/QaN4KUizV1h66n5+ueOZ4/
	JxAaLPy16qNoPY/YEN6Lq72bFoY8CwKV4sTEB81+NXlDSM9bSw9pl0f9BhG157xLd/b
	LWviwBkDiUdijuN6Ppbd/JrkMAeQwINqhmZteYPo=
Content-Type: multipart/mixed; boundary="===============6238370315240985691=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.51 SUCCEEDED
Message-ID: <01010194c1abeac1-eaceb2b5-4167-4213-a571-51698ba852a4-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210553

--===============6238370315240985691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.51* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.50.1-2.51.patch
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
From 870b3a9137429fb0c8e4209ba3a3c65eb0574471 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 08:49:22 +0000
Subject: [PATCH] repo: upgrade 2.50.1 -> 2.51

---
 meta/recipes-devtools/repo/{repo_2.50.1.bb => repo_2.51.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.50.1.bb => repo_2.51.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.50.1.bb b/meta/recipes-devtools/repo/repo_2.51.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.50.1.bb
rename to meta/recipes-devtools/repo/repo_2.51.bb
index f1fcc9c8a1..b78b4867f1 100644
--- a/meta/recipes-devtools/repo/repo_2.50.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.51.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "13d6588bf60f0980ffa3d178441fa707655fee95"
+SRCREV = "db111d392407797e170355e1c0ec98e71d4a8278"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.44.1


--===============6238370315240985691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: PKGV changed from 2.50.1 [default] to 2.51 [default]
packages/core2-64-poky-linux/repo: PV changed from "2.50.1" to "2.51"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.50.1 [default] to 2.51 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.50.1" to "2.51"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.50.1 [default] to 2.51 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.50.1" to "2.51"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.50.1 [default] to 2.51 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.50.1" to "2.51"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.50.1 [default] to 2.51 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.50.1" to "2.51"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.50.1 [default] to 2.51 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.50.1" to "2.51"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.50.1 [default] to 2.51 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.50.1" to "2.51"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.50.1 [default] to 2.51 [default]
packages/core2-64-poky-linux/repo/repo: PV changed from "2.50.1" to "2.51"

--===============6238370315240985691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1875 targets, 52 skipped, 0 masked, 0 errors.
Removing 7 recipes from the core2-64 sysroot...done.
Removing 59 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:c4cc0c7a0f6ede51487bb8830eeffe11749956e9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 450 Local 439 Mirrors 0 Missed 11 Current 235 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 247 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.47.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 259 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.47.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 260 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.47.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_populate_lic_setscene)
NOTE: Running setscene task 284 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 285 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 291 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 297 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.47.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 299 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 308 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.47.1.bb:do_package_qa_setscene)
NOTE: recipe repo-2.51-r0: task do_populate_lic_setscene: Started
NOTE: recipe git-2.47.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe git-2.47.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe git-2.47.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe git-2.47.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.47.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe repo-2.51-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe git-2.47.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe git-2.47.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 669 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_recipe_qa)
NOTE: recipe python3-3.13.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 342 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe repo-2.51-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 344 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe repo-2.51-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running task 872 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_fetch)
NOTE: recipe git-2.47.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 348 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe repo-2.51-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 349 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe git-2.47.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe git-2.47.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 360 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.47.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.51-r0: task do_fetch: Succeeded
NOTE: Running task 891 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_unpack)
NOTE: recipe git-2.47.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.51-r0: task do_unpack: Started
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 374 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/git/2.47.1/temp/log.do_packagedata_setscene.3492610
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.47.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 389 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.47.1.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.51-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: Running task 986 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_patch)
NOTE: recipe python3-3.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe repo-2.51-r0: task do_patch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.51-r0: task do_patch: Succeeded
NOTE: Running task 1022 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe git-2.47.1-r0: task do_package_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_packagedata_setscene)
NOTE: recipe repo-2.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 559 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.47.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 597 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.47.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 598 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe git-2.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 661 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 677 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 685 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1747 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1769 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.47.1.bb:do_packagedata)
NOTE: Running task 1890 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_collect_spdx_deps)
NOTE: recipe repo-2.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.47.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.51-r0: task do_collect_spdx_deps: Started
NOTE: recipe repo-2.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.51-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1924 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_configure)
NOTE: recipe repo-2.51-r0: task do_configure: Started
NOTE: recipe repo-2.51-r0: task do_configure: Succeeded
NOTE: Running task 1925 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_compile)
NOTE: recipe git-2.47.1-r0: task do_packagedata: Succeeded
NOTE: recipe repo-2.51-r0: task do_compile: Started
NOTE: recipe repo-2.51-r0: task do_compile: Succeeded
NOTE: Running task 1931 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_install)
NOTE: recipe repo-2.51-r0: task do_install: Started
NOTE: recipe repo-2.51-r0: task do_install: Succeeded
NOTE: Running task 1932 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_package)
NOTE: Running task 1933 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_populate_sysroot)
NOTE: recipe repo-2.51-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.51-r0: task do_package: Started
NOTE: recipe repo-2.51-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.51-r0: task do_package: Succeeded
NOTE: Running task 1934 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_packagedata)
NOTE: recipe repo-2.51-r0: task do_packagedata: Started
NOTE: recipe repo-2.51-r0: task do_packagedata: Succeeded
NOTE: Running task 1935 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_create_spdx)
NOTE: Running task 1936 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_package_write_ipk)
NOTE: Running task 1937 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_package_write_deb)
NOTE: Running task 1938 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_package_write_rpm)
NOTE: Running task 1939 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_package_qa)
NOTE: recipe repo-2.51-r0: task do_create_spdx: Started
NOTE: recipe repo-2.51-r0: task do_package_write_ipk: Started
NOTE: recipe repo-2.51-r0: task do_package_write_deb: Started
NOTE: recipe repo-2.51-r0: task do_package_write_rpm: Started
NOTE: recipe repo-2.51-r0: task do_package_qa: Started
NOTE: recipe repo-2.51-r0: task do_create_spdx: Succeeded
NOTE: Running task 1940 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_create_package_spdx)
NOTE: recipe repo-2.51-r0: task do_create_package_spdx: Started
NOTE: recipe repo-2.51-r0: task do_package_qa: Succeeded
NOTE: recipe repo-2.51-r0: task do_package_write_ipk: Succeeded
NOTE: recipe repo-2.51-r0: task do_create_package_spdx: Succeeded
NOTE: recipe repo-2.51-r0: task do_package_write_deb: Succeeded
NOTE: recipe repo-2.51-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1941 of 1941 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.51.bb:do_build)
NOTE: Tasks Summary: Attempted 1941 tasks of which 1920 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: git-2.47.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.48.1-r0 to 0:2.47.1-r0) [version-going-backwards]
ERROR: git-2.47.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.48.1-r0 to 0:2.47.1-r0) [version-going-backwards]
ERROR: git-2.47.1-r0 do_packagedata_setscene: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.48.1-r0 to 0:2.47.1-r0) [version-going-backwards]
ERROR: git-2.47.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.48.1-r0 to 0:2.47.1-r0) [version-going-backwards]
ERROR: git-2.47.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.48.1-r0 to 0:2.47.1-r0) [version-going-backwards]
ERROR: git-2.47.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.48.1-r0 to 0:2.47.1-r0) [version-going-backwards]
ERROR: git-2.47.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.48.1-r0 to 0:2.47.1-r0) [version-going-backwards]
ERROR: git-2.47.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.48.1-r0 to 0:2.47.1-r0) [version-going-backwards]
ERROR: git-2.47.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.48.1-r0 to 0:2.47.1-r0) [version-going-backwards]
ERROR: git-2.47.1-r0 do_packagedata_setscene: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.48.1-r0 to 0:2.47.1-r0) [version-going-backwards]
ERROR: git-2.47.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.48.1-r0 to 0:2.47.1-r0) [version-going-backwards]
ERROR: git-2.47.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6238370315240985691==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.50.1-2.51.patch"

RnJvbSA4NzBiM2E5MTM3NDI5ZmIwYzhlNDIwOWJhM2EzYzY1ZWIwNTc0NDcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwODo0OToyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi41MC4xIC0+IDIuNTEKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Jl
cG8ve3JlcG9fMi41MC4xLmJiID0+IHJlcG9fMi41MS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcmVwby97cmVwb18yLjUwLjEuYmIgPT4gcmVwb18yLjUxLmJifSAoOTQlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41MC4xLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjUxLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41MC4xLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTEuYmIKaW5kZXggZjFmY2M5
YzhhMS4uYjc4YjQ4NjdmMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8v
cmVwb18yLjUwLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjUx
LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDov
L2dlcnJpdC5nb29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFu
Y2g9bWFpbiBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICIxM2Q2NTg4YmY2MGYwOTgwZmZhM2Qx
Nzg0NDFmYTcwNzY1NWZlZTk1IgorU1JDUkVWID0gImRiMTExZDM5MjQwNzc5N2UxNzAzNTVlMWMw
ZWM5OGU3MWQ0YTgyNzgiCiAKIE1JUlJPUlMgKz0gImdpdDovL2dlcnJpdC5nb29nbGVzb3VyY2Uu
Y29tL2dpdC1yZXBvLmdpdCBnaXQ6Ly9naXRodWIuY29tL0dlcnJpdENvZGVSZXZpZXcvZ2l0LXJl
cG8uZ2l0IgogCi0tIAoyLjQ0LjEKCg==

--===============6238370315240985691==--

