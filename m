Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867A0CD3445
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.11414.1725172853878132824
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=J0e7DTzl;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=OtiGyRz5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010191ac50aa14-87f1c3cc-a79c-4994-8648-06e9c3d56636-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jKyv5rOF2VlNMvhvXOhh8vV/bP2bKkSjL/ZV+ijEqO4=;
	b=J0e7DTzl8fRI9G19z1WE6UmCpORNzZSCBKTnKLmDDOlFcvYSk9t4Gx8vAuuHAVJh
	ca46T4iLdU1ywh5yYUhbUJ2p8CSQTcL+TNRK/8hbl0QoHiLmWjKhB5J3tIF6vYyk7B2
	+vLmyHcczpgIO8awOu2a/d5IwTnilQBiWAINIfPc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jKyv5rOF2VlNMvhvXOhh8vV/bP2bKkSjL/ZV+ijEqO4=;
	b=OtiGyRz56jbQf+KAWhXi/f4DYMkMkd5g0v3moJ1pMAvtSu8g50vlV+auEuz65gIf
	CyjXLgmDgrnGDvwZuGNTq9/DvdQ6xXqGhFZx1A6j3kk4HT4S8iHMkY/ne2XPADLPDdf
	W4klwLHDHSV8O67TaiW4+fus7Jd2i678wRLd66Ns=
Content-Type: multipart/mixed; boundary="===============2250981643299008358=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.7 FAILED
Message-ID: <01010191ac50aa14-87f1c3cc-a79c-4994-8648-06e9c3d56636-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204011

--===============2250981643299008358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markdown* to *3.7* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-markdown' failed
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
Sstate summary: Wanted 292 Local 285 Mirrors 0 Missed 7 Current 352 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 417 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 418 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_package_qa_setscene)
NOTE: Running setscene task 421 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 422 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_populate_lic_setscene)
NOTE: Running setscene task 425 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-markdown-3.6-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe python3-markdown-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-markdown-3.6-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-markdown-3.6-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-setuptools-72.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-markdown-3.6-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-markdown-3.6-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-markdown-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-setuptools-72.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-markdown-3.6-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: Running setscene task 636 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 638 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb:do_package_setscene)
NOTE: recipe python3-markdown-3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-markdown-3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 639 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 1503 of 1822 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1581 of 1822 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markdown-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markdown-3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markdown-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_package_setscene)
NOTE: recipe python3-markdown-3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-72.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-markdown-3.6-r0: task do_package_setscene: Started
NOTE: recipe python3-markdown-3.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 642 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-markdown-3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-markdown-3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 643 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-markdown-3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-markdown-3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 644 of 644 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-72.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-72.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1798 of 1822 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb:do_package_write_ipk)
NOTE: Running task 1799 of 1822 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb:do_package_write_deb)
NOTE: Running task 1801 of 1822 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_package_write_ipk)
NOTE: Running task 1802 of 1822 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_package_write_deb)
NOTE: recipe python3-setuptools-72.2.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-setuptools-72.2.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-markdown-3.6-r0: task do_package_write_ipk: Started
NOTE: recipe python3-markdown-3.6-r0: task do_package_write_deb: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe python3-setuptools-72.2.0-r0: task do_package_write_ipk: Failed
NOTE: recipe python3-markdown-3.6-r0: task do_package_write_ipk: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-setuptools-72.2.0-r0: task do_package_write_deb: Failed
NOTE: recipe python3-markdown-3.6-r0: task do_package_write_deb: Failed
NOTE: Tasks Summary: Attempted 1805 tasks of which 1799 didn't need to be rerun and 6 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901061739.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901061739.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 6 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2625824
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb:do_package_write_ipk
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-setuptools/72.2.0/temp/log.do_package_write_ipk.2626102
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_package_write_ipk
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-markdown/3.6/temp/log.do_package_write_ipk.2626104
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2625825
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb:do_package_write_deb
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-setuptools/72.2.0/temp/log.do_package_write_deb.2626103
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_package_write_deb
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-markdown/3.6/temp/log.do_package_write_deb.2626105
Summary: There were 6 ERROR messages, returning a non-zero exit code.

ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-setuptools-72.2.0-r0 do_package_write_ipk: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-markdown-3.6-r0 do_package_write_ipk: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2625824
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-setuptools/72.2.0/temp/log.do_package_write_ipk.2626102
ERROR: python3-setuptools-72.2.0-r0 do_package_write_deb: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb:do_package_write_ipk) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-markdown/3.6/temp/log.do_package_write_ipk.2626104
ERROR: python3-markdown-3.6-r0 do_package_write_deb: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_package_write_ipk) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2625825
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-setuptools/72.2.0/temp/log.do_package_write_deb.2626103
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.2.0.bb:do_package_write_deb) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-markdown/3.6/temp/log.do_package_write_deb.2626105
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markdown_3.6.bb:do_package_write_deb) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2250981643299008358==--

