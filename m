Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED68CD3420
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:57 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.11424.1725172854658941380
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=J41mHeEW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=tO4AEUa0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010191ac50abe7-e3d88c78-6ece-4495-a2c9-937509edc997-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=j8LKtKKnPB4pm+LGJFGlGZxeebsbnB5J15PtB5Pd12w=;
	b=J41mHeEWSQdcoSMom7WkcNMSzCjB7FcE9o6yzg+6E9zFYS88ussXe5z3dKDg5K+W
	GDE93mq3gBi6W7CeoUupSktTTMCJmmzgtz1Qlr3BB4+pF70GwHPs5UahGZpv09XzRIK
	XsT1ZHFmzWusU2dhxy3mJPqMnafziFX3PEF0NotI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=j8LKtKKnPB4pm+LGJFGlGZxeebsbnB5J15PtB5Pd12w=;
	b=tO4AEUa0O0VDr5FBpB3cVGX0+EJ73AU+r61kiqhfoDY1Jm6KBogZKG2/EBv3omTv
	C75XM9DH0Nc2n3Jv3584QLUKppKVuZV9al+hOriAXjH1DUM47pc3F4WIDy5MIDUN7cd
	Dwa9MOd2B3l5K4ZHvUxkvEQVdgZtncDuIBG6XSVk=
Content-Type: multipart/mixed; boundary="===============6673999773501802644=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apr: upgrading to 1.7.5 FAILED
Message-ID: <01010191ac50abe7-e3d88c78-6ece-4495-a2c9-937509edc997-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204038

--===============6673999773501802644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *apr* to *1.7.5* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake apr' failed
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
Sstate summary: Wanted 187 Local 174 Mirrors 0 Missed 13 Current 316 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 347 of 503 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 348 of 503 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 349 of 503 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 503 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 353 of 503 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 354 of 503 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 384 of 503 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 385 of 503 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 393 of 503 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/apr/apr_1.7.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 395 of 503 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/apr/apr_1.7.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtool-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libtool-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libtool-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe apr-1.7.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe apr-1.7.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libtool-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe apr-1.7.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe apr-1.7.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 493 of 503 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/apr/apr_1.7.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtool-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libtool-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 500 of 503 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe apr-1.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe apr-1.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1009 of 1418 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/apr/apr_1.7.4.bb:do_fetch)
NOTE: Running task 1047 of 1418 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1099 of 1418 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe apr-1.7.4-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-1.7.4-r0: task do_fetch: Succeeded
NOTE: Running task 1374 of 1418 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/apr/apr_1.7.4.bb:do_unpack)
NOTE: Running task 1375 of 1418 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/apr/apr_1.7.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe apr-1.7.4-r0: task do_unpack: Started
NOTE: recipe apr-1.7.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-1.7.4-r0: task do_unpack: Succeeded
NOTE: Running task 1376 of 1418 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/apr/apr_1.7.4.bb:do_patch)
NOTE: Running task 1377 of 1418 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/apr/apr_1.7.4.bb:do_collect_spdx_deps)
NOTE: recipe apr-1.7.4-r0: task do_patch: Started
NOTE: recipe apr-1.7.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe apr-1.7.4-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe apr-1.7.4-r0: task do_collect_spdx_deps: Failed
NOTE: recipe apr-1.7.4-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1377 tasks of which 1370 didn't need to be rerun and 5 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901063723.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901063723.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 5 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2684551
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/apr/apr_1.7.4.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apr/1.7.4/temp/log.do_prepare_recipe_sysroot.2684583
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2684566
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/apr/apr_1.7.4.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apr/1.7.4/temp/log.do_collect_spdx_deps.2684607
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/apr/apr_1.7.4.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apr/1.7.4/temp/log.do_patch.2684606
Summary: There were 5 ERROR messages, returning a non-zero exit code.

ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: apr-1.7.4-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2684551
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apr/1.7.4/temp/log.do_prepare_recipe_sysroot.2684583
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/apr/apr_1.7.4.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: apr-1.7.4-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2684566
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apr/1.7.4/temp/log.do_collect_spdx_deps.2684607
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/apr/apr_1.7.4.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: apr-1.7.4-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apr/1.7.4/temp/log.do_patch.2684606
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/apr/apr_1.7.4.bb:do_patch) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6673999773501802644==--

