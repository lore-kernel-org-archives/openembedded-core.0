Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A8CCD3448
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.11358.1725172853792637432
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OVLthrTJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pyvkc1Sa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191ac50a95f-55a17b4b-8f51-405f-8fa6-678e9dbf826f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HBNykChTlqlrXilYrN8T6w3KuprBQw62Wwo4BY05gl8=;
	b=OVLthrTJWFgdnbqZtfOh1CvTLyq3fZJAZdAPyiFoYG4EuZsHzOFDt7D02lBqWKp+
	hP1jTsd3xo8ecW18ma1TQoNoj8SGB4lTQfKdB9ESTaj9gXE4GqCXp+7aF4pZUB00X4b
	wBYNp8qVDLKgqhifqlf0NH5UFudwgqJWugltiXI4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HBNykChTlqlrXilYrN8T6w3KuprBQw62Wwo4BY05gl8=;
	b=pyvkc1Sa6JMA9Q5sUwtlSZbCzOZThAqYDzQ5rTglpj2Ptq07wGrYSMBV6XSMQCdA
	12CeZgKtGiqKIsCBqLeGJ5VYKBphFP/ior30NKIeHZaM7F/1h+0w8zvOTdHFWS3I3F7
	N5ZMrZe3e40pQEvygE6+2y2pRR16Pb4JStIjNxSw=
Content-Type: multipart/mixed; boundary="===============3626114661714216768=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acpica: upgrading to 20240827 FAILED
Message-ID: <01010191ac50a95f-55a17b4b-8f51-405f-8fa6-678e9dbf826f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204006

--===============3626114661714216768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *acpica* to *20240827* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake acpica' failed
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
Sstate summary: Wanted 101 Local 93 Mirrors 0 Missed 8 Current 200 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 224 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 231 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_populate_lic_setscene)
NOTE: Running setscene task 232 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acpica-20240322-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acpica-20240322-r0: task do_populate_lic_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acpica-20240322-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe acpica-20240322-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acpica-20240322-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acpica-20240322-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 301 of 301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_recipe_qa_setscene)
NOTE: recipe acpica-20240322-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acpica-20240322-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 888 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_fetch)
NOTE: recipe acpica-20240322-r0: task do_fetch: Started
NOTE: recipe acpica-20240322-r0: task do_fetch: Succeeded
NOTE: Running task 889 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_unpack)
NOTE: Running task 890 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_prepare_recipe_sysroot)
NOTE: recipe acpica-20240322-r0: task do_unpack: Started
NOTE: recipe acpica-20240322-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acpica-20240322-r0: task do_unpack: Succeeded
NOTE: Running task 891 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_patch)
NOTE: Running task 892 of 907 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_collect_spdx_deps)
NOTE: recipe acpica-20240322-r0: task do_patch: Started
NOTE: recipe acpica-20240322-r0: task do_collect_spdx_deps: Started
NOTE: recipe acpica-20240322-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe acpica-20240322-r0: task do_patch: Failed
NOTE: recipe acpica-20240322-r0: task do_collect_spdx_deps: Failed
NOTE: Tasks Summary: Attempted 892 tasks of which 887 didn't need to be rerun and 3 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062225.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062225.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 3 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/acpica/20240322/temp/log.do_prepare_recipe_sysroot.2638489
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/acpica/20240322/temp/log.do_patch.2638566
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/acpica/20240322/temp/log.do_collect_spdx_deps.2638567
Summary: There were 3 ERROR messages, returning a non-zero exit code.

ERROR: acpica-20240322-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/acpica/20240322/temp/log.do_prepare_recipe_sysroot.2638489
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: acpica-20240322-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/acpica/20240322/temp/log.do_patch.2638566
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_patch) failed with exit code '1'
ERROR: acpica-20240322-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/acpica/20240322/temp/log.do_collect_spdx_deps.2638567
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_collect_spdx_deps) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3626114661714216768==--

