Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFA3CD3440
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.11359.1725172853815165161
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LsMV436Y;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qlHvxWaR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010191ac50a916-4614b929-98d5-49cc-be7e-54f02cf0edee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+Q1gK1sGWVeqZil5zuQzeaSI9X8ws3ENjfewdcA8KvA=;
	b=LsMV436YhFlIjfLVRyQFLcv7jLvM5OYI5/aTi4ZsvTETOIQLMxlG0UoO58PLR9QF
	ekZWv8zMmoSGMMRfFU7aXJBZFt+LbTmJ28s/i2x4FcqtR4B2Oswv8hyJj60XBeyTu00
	PV1XoE8Wcu7I2EOOgqh5rmHbLpbPwoTQBBO4Iook=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+Q1gK1sGWVeqZil5zuQzeaSI9X8ws3ENjfewdcA8KvA=;
	b=qlHvxWaRtThuyfw48FFwo+Rgt9RK3Tb0RoeeNe5c8wd/gwY0d8N8Be8EItGp6myQ
	CFwzioE1Gu2+3Os6rX6e4Q3COTO5vQdjZ8VZfxfu+MhQzfo3RbcWTVTix3NWw/5OUse
	8uHQ6SCqRLq4TxHxGOPNX0GygSxet8+o+xtt/yNo=
Content-Type: multipart/mixed; boundary="===============0539770228372716541=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-websockets: upgrading to 13.0.1 FAILED
Message-ID: <01010191ac50a916-4614b929-98d5-49cc-be7e-54f02cf0edee-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204015

--===============0539770228372716541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-websockets* to *13.0.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-websockets' failed
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
Sstate summary: Wanted 275 Local 264 Mirrors 0 Missed 11 Current 360 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 430 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 431 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-websockets-12.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-websockets-12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-websockets-12.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1497 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-websockets-12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1564 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 634 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-websockets-12.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-websockets-12.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 635 of 635 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-websockets-12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-websockets-12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1770 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_fetch)
NOTE: recipe python3-websockets-12.0-r0: task do_fetch: Started
NOTE: recipe python3-websockets-12.0-r0: task do_fetch: Succeeded
NOTE: Running task 1771 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_unpack)
NOTE: Running task 1772 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-websockets-12.0-r0: task do_unpack: Started
NOTE: recipe python3-websockets-12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-websockets-12.0-r0: task do_unpack: Succeeded
NOTE: Running task 1773 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_patch)
NOTE: Running task 1774 of 1805 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-websockets-12.0-r0: task do_patch: Started
NOTE: recipe python3-websockets-12.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe python3-websockets-12.0-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-websockets-12.0-r0: task do_collect_spdx_deps: Failed
NOTE: recipe python3-websockets-12.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1774 tasks of which 1767 didn't need to be rerun and 5 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062119.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062119.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 5 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2635717
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-websockets/12.0/temp/log.do_prepare_recipe_sysroot.2635770
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2635725
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-websockets/12.0/temp/log.do_collect_spdx_deps.2635781
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-websockets/12.0/temp/log.do_patch.2635780
Summary: There were 5 ERROR messages, returning a non-zero exit code.

ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-websockets-12.0-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2635717
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-websockets/12.0/temp/log.do_prepare_recipe_sysroot.2635770
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: python3-websockets-12.0-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2635725
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-websockets/12.0/temp/log.do_collect_spdx_deps.2635781
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: python3-websockets-12.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-websockets/12.0/temp/log.do_patch.2635780
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-websockets_12.0.bb:do_patch) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0539770228372716541==--

