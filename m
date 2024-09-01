Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF0ECD3438
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:57 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.11408.1725172853358145710
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YEfffv1t;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=K4zTAk1N;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010191ac50abe0-59e37af4-a59b-4808-b937-82ddda0065d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Uv9uDMV81oygmHHAtscOPg+4Ot5TxxWwy9j28nHSL/o=;
	b=YEfffv1tuusN67Haw0avFszEHpD0lBwCSG9pvWvtmYAtkGQ3JmgFk4bvmVTLfXPg
	4FnhSziD5nxprRd/lyz2hq5k7h+u+hHeenR1fwZ3W6sKDQWSazCM5lCrhsKKPfcPXCN
	rajvwZrN0cHd/Bj1UO0QNDOUWxAdHOWMHKlmuUBU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Uv9uDMV81oygmHHAtscOPg+4Ot5TxxWwy9j28nHSL/o=;
	b=K4zTAk1NwHlPKTegBahlNlA+pNLRLBbJX8C0U95KKC/uKAza4BmAW7QZTBw+gyfe
	UmF//pffYJm2eW6z5Gxo66CQopqcQydK/1cRETzQdUhoe8trG0i/TaWoqwdvzsIbhQO
	coI9yI9u8f5D97Wj/lx3QzoVNfaemhytJEJlgIC8=
Content-Type: multipart/mixed; boundary="===============0456118156389624384=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Enet=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnutls: upgrading to 3.8.7.1 FAILED
Message-ID: <01010191ac50abe0-59e37af4-a59b-4808-b937-82ddda0065d7-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204025

--===============0456118156389624384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnutls* to *3.8.7.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake gnutls' failed
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
Sstate summary: Wanted 229 Local 223 Mirrors 0 Missed 6 Current 398 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 510 of 627 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 511 of 627 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_package_qa_setscene)
NOTE: Running setscene task 514 of 627 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 515 of 627 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_populate_lic_setscene)
NOTE: recipe gnutls-3.8.6-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_package_qa_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_populate_lic_setscene: Started
NOTE: Running task 1254 of 1754 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1324 of 1754 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.6-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 626 of 627 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.6-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: recipe gnutls-3.8.6-r0: task do_package_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 627 of 627 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: Tasks Summary: Attempted 1725 tasks of which 1723 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901063829.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901063829.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2687986
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2688032
Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2687986
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2688032
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0456118156389624384==--

