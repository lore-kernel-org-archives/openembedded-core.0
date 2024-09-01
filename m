Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417A4CD37B5
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:59 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.11407.1725172853090346564
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LfdXEIgA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fSm+F+/s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010191ac50a996-1dbba2cb-4ede-4e77-a5d5-ac8084760d67-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xSPhepqv8F+Mi5iLPl8Fpv8t0Lq6bI3v/ri2WnBByMA=;
	b=LfdXEIgAwOQOsUHGjyFZTtan+oGW9DftzwlGJOsPVtW10kg+1c0fYZBOVrA0D71Z
	xr5F27Kbj4/Bpf32EYMlF+hqUi2qLw5jY6ay9Kylt8CsmPdxRXrZykE3mBrjcaGIukH
	3Jtx2w7smD32QEeIcX+bHw38mn1ySciJk9wXeU9M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xSPhepqv8F+Mi5iLPl8Fpv8t0Lq6bI3v/ri2WnBByMA=;
	b=fSm+F+/svd5gc9HQJr1cA6m0do+O1mUk1dlib7VQ8yGR9Zp/zwjnwGbwpHTetiVe
	QKWF2UBpr9PAMN8gHJYvs5SByAc4TIMhe1fdbjrNUrgl2dHgZl9vmm/HuFp+NTJfpnl
	a0R03tzE3avoAKHqTa3IQHnk1tlg3U1c0l9B4dUg=
Content-Type: multipart/mixed; boundary="===============4425370346814293089=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpipeline: upgrading to 1.5.8 FAILED
Message-ID: <01010191ac50a996-1dbba2cb-4ede-4e77-a5d5-ac8084760d67-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203991

--===============4425370346814293089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpipeline* to *1.5.8* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake libpipeline' failed
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
Sstate summary: Wanted 97 Local 89 Mirrors 0 Missed 8 Current 198 (91% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 229 of 295 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_populate_lic_setscene)
NOTE: Running setscene task 230 of 295 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libpipeline-1.5.7-r0: task do_populate_lic_setscene: Started
NOTE: recipe libpipeline-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpipeline-1.5.7-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libpipeline-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 294 of 295 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpipeline-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpipeline-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 295 of 295 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpipeline-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpipeline-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 878 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_fetch)
NOTE: recipe libpipeline-1.5.7-r0: task do_fetch: Started
NOTE: recipe libpipeline-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 879 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_unpack)
NOTE: Running task 880 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpipeline-1.5.7-r0: task do_unpack: Started
NOTE: recipe libpipeline-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpipeline-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 881 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_patch)
NOTE: Running task 882 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_collect_spdx_deps)
NOTE: recipe libpipeline-1.5.7-r0: task do_patch: Started
NOTE: recipe libpipeline-1.5.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpipeline-1.5.7-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe libpipeline-1.5.7-r0: task do_patch: Failed
NOTE: recipe libpipeline-1.5.7-r0: task do_collect_spdx_deps: Failed
NOTE: Tasks Summary: Attempted 882 tasks of which 877 didn't need to be rerun and 3 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062344.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062344.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 3 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpipeline/1.5.7/temp/log.do_prepare_recipe_sysroot.2641427
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpipeline/1.5.7/temp/log.do_patch.2641438
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpipeline/1.5.7/temp/log.do_collect_spdx_deps.2641439
Summary: There were 3 ERROR messages, returning a non-zero exit code.

ERROR: libpipeline-1.5.7-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpipeline/1.5.7/temp/log.do_prepare_recipe_sysroot.2641427
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: libpipeline-1.5.7-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpipeline/1.5.7/temp/log.do_patch.2641438
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_patch) failed with exit code '1'
ERROR: libpipeline-1.5.7-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpipeline/1.5.7/temp/log.do_collect_spdx_deps.2641439
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_collect_spdx_deps) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4425370346814293089==--

