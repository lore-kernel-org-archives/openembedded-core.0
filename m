Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A662CD343D
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11346.1725172853220865906
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Vd6ysO/l;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1oTRJQUj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010191ac50abe6-ee24585b-7d31-473b-8575-97924b3c2b1f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Htu5bWXDvj8Ywh2tpa75wbKNEbQWTWibJ8gkCqpuXGc=;
	b=Vd6ysO/lTpz13/Lr12eATRoY2HemtAxA+PR+bLk5b5YIrhtwOKMr9poVsFCeTVij
	trPpDqb53a1Wc7J8IX7r22dTX2CBccGHh5dhJIeOMMdBYzPsT5kOYuh9JkoReF5BXDJ
	aWg/gV9E9MPsTGsSMQDxH8tlbHAkLCrYSEy/yPqE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Htu5bWXDvj8Ywh2tpa75wbKNEbQWTWibJ8gkCqpuXGc=;
	b=1oTRJQUjDIVmo7OlWMEIXuvXjc93EpHmeLKGU5sbQ9yU42BcsBpVcGDX9lc1Oxst
	PofH82+Fur9Yhvn4a7at+hjH4Iu+HPmJfRegQZob2AUaxodiftwKoEXfIMLqSRae2VQ
	tJG1S31oYyER25n05D+bBR8p5xeWhUyAHdtLwMvA=
Content-Type: multipart/mixed; boundary="===============1155729338478277599=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] taglib: upgrading to 2.0.2 FAILED
Message-ID: <01010191ac50abe6-ee24585b-7d31-473b-8575-97924b3c2b1f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204018

--===============1155729338478277599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *taglib* to *2.0.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake taglib' failed
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
Sstate summary: Wanted 106 Local 104 Mirrors 0 Missed 2 Current 208 (98% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 235 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 236 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 239 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_populate_lic_setscene)
NOTE: recipe taglib-2.0.1-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_package_qa_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe taglib-2.0.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe taglib-2.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe taglib-2.0.1-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: Running setscene task 303 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_create_spdx_setscene)
NOTE: recipe taglib-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 304 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe taglib-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe taglib-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_package_setscene)
NOTE: recipe taglib-2.0.1-r0: task do_package_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 308 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 309 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe utfcpp-4.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe utfcpp-4.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe utfcpp-4.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe taglib-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 312 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe utfcpp-4.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 314 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe taglib-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe utfcpp-4.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe utfcpp-4.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 935 of 940 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_package_write_ipk)
NOTE: Running task 936 of 940 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_package_write_deb)
NOTE: recipe taglib-2.0.1-r0: task do_package_write_ipk: Started
NOTE: recipe taglib-2.0.1-r0: task do_package_write_deb: Started
NOTE: recipe taglib-2.0.1-r0: task do_package_write_ipk: Failed
NOTE: recipe taglib-2.0.1-r0: task do_package_write_deb: Failed
NOTE: Tasks Summary: Attempted 939 tasks of which 937 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901064029.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901064029.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_package_write_ipk
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0.1/temp/log.do_package_write_ipk.2694246
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_package_write_deb
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0.1/temp/log.do_package_write_deb.2694247
Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: taglib-2.0.1-r0 do_package_write_ipk: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0.1/temp/log.do_package_write_ipk.2694246
ERROR: taglib-2.0.1-r0 do_package_write_deb: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_package_write_ipk) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0.1/temp/log.do_package_write_deb.2694247
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_package_write_deb) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1155729338478277599==--

