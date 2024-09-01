Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC98CD343B
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11363.1725172853996007497
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bYA517cR;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QodkIQfn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010191ac50a9b9-3b798919-ffa4-43f5-bd78-f263109fcc0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7fjzvlPuX42Lf/SOPGzCMjD16+GD/2tnm+uhFURm1Yw=;
	b=bYA517cRaNIIpIT3E0TzPd3amQZl7QhZUAHj5LZXxKMlLrXi7DR+yrU+TjlO/O65
	Pd1pHfJKO4K98xkLzeapeXjG8plw9+QtnxQ0AuNywFp+kSHGOHFhZb5kiIc13pfThv8
	cGGVbSP/IiOJE7W5N+W8+ludlDnmGlVkmPUP24YI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7fjzvlPuX42Lf/SOPGzCMjD16+GD/2tnm+uhFURm1Yw=;
	b=QodkIQfn5IXPvX69lPYGjUJ5kG1qST/n6bxcyU/sOfWT/to1QvsW4/qkHZkSqUvY
	g7i9WG8LUKYpi6RJldUZ6g7pnLoco6e55Tvy3s99A+EMs69ZzdwkyzI2XZK2IOHnwZq
	dWmU3BjhUecninMef4D7ebAH0NrMt3zarUid5ySQ=
Content-Type: multipart/mixed; boundary="===============1395705980239804213=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mc: upgrading to 4.8.32 FAILED
Message-ID: <01010191ac50a9b9-3b798919-ffa4-43f5-bd78-f263109fcc0f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204022

--===============1395705980239804213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mc* to *4.8.32* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake mc' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-69fe8a0f5dace7480b8e2d398b3560c8d7759a73"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:69fe8a0f5dace7480b8e2d398b3560c8d7759a73"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 270 Local 251 Mirrors 0 Missed 19 Current 452 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 466 of 722 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 500 of 722 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 513 of 722 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 520 of 722 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mc/mc_4.8.31.bb:do_populate_lic_setscene)
NOTE: Running setscene task 522 of 722 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mc/mc_4.8.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 602 of 722 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mc-4.8.31-r0: task do_populate_lic_setscene: Started
NOTE: recipe mc-4.8.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-native-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mc-4.8.31-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 674 of 722 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package_setscene)
NOTE: recipe mc-4.8.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-native-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 677 of 722 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 678 of 722 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mc/mc_4.8.31.bb:do_recipe_qa_setscene)
NOTE: Running task 1386 of 2046 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe mc-4.8.31-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1510 of 2046 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe mc-4.8.31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1622 of 2046 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mc/mc_4.8.31.bb:do_fetch)
NOTE: Running task 1673 of 2046 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mc-4.8.31-r0: task do_fetch: Started
NOTE: recipe procps-4.0.4-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_package_setscene: Started
NOTE: recipe mc-4.8.31-r0: task do_fetch: Succeeded
NOTE: Running task 1885 of 2046 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mc/mc_4.8.31.bb:do_unpack)
NOTE: recipe mc-4.8.31-r0: task do_unpack: Started
NOTE: recipe mc-4.8.31-r0: task do_unpack: Succeeded
NOTE: Running task 1886 of 2046 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mc/mc_4.8.31.bb:do_patch)
NOTE: recipe mc-4.8.31-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 722 of 722 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1965 of 2046 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mc/mc_4.8.31.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1998 of 2046 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mc/mc_4.8.31.bb:do_collect_spdx_deps)
NOTE: Running task 1999 of 2046 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package_write_ipk)
NOTE: Running task 2000 of 2046 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package_write_deb)
NOTE: recipe mc-4.8.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mc-4.8.31-r0: task do_collect_spdx_deps: Started
NOTE: recipe ncurses-6.5-r0: task do_package_write_ipk: Started
NOTE: recipe ncurses-6.5-r0: task do_package_write_deb: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe procps-4.0.4-r0: task do_patch: Failed
NOTE: recipe mc-4.8.31-r0: task do_patch: Failed
NOTE: recipe ncurses-6.5-r0: task do_package_write_ipk: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe mc-4.8.31-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe ncurses-6.5-r0: task do_package_write_deb: Failed
NOTE: recipe mc-4.8.31-r0: task do_collect_spdx_deps: Failed
NOTE: Tasks Summary: Attempted 2001 tasks of which 1991 didn't need to be rerun and 8 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062453.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062453.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 8 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2644460
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/procps/4.0.4/temp/log.do_patch.2644506
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mc/mc_4.8.31.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mc/4.8.31/temp/log.do_patch.2644580
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package_write_ipk
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ncurses/6.5/temp/log.do_package_write_ipk.2644765
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2644461
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mc/mc_4.8.31.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mc/4.8.31/temp/log.do_prepare_recipe_sysroot.2644763
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package_write_deb
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ncurses/6.5/temp/log.do_package_write_deb.2644766
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mc/mc_4.8.31.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mc/4.8.31/temp/log.do_collect_spdx_deps.2644764
Summary: There were 8 ERROR messages, returning a non-zero exit code.

ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: procps-4.0.4-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: mc-4.8.31-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: ncurses-6.5-r0 do_package_write_ipk: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2644460
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/procps/4.0.4/temp/log.do_patch.2644506
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mc/4.8.31/temp/log.do_patch.2644580
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mc/mc_4.8.31.bb:do_patch) failed with exit code '1'
ERROR: mc-4.8.31-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ncurses/6.5/temp/log.do_package_write_ipk.2644765
ERROR: ncurses-6.5-r0 do_package_write_deb: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package_write_ipk) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2644461
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mc/4.8.31/temp/log.do_prepare_recipe_sysroot.2644763
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mc/mc_4.8.31.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: mc-4.8.31-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ncurses/6.5/temp/log.do_package_write_deb.2644766
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package_write_deb) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mc/4.8.31/temp/log.do_collect_spdx_deps.2644764
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/mc/mc_4.8.31.bb:do_collect_spdx_deps) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1395705980239804213==--

