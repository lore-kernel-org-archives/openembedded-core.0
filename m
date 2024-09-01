Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5856ACD37B7
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:59 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.11351.1725172853594080946
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MA/APQO0;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qaQVUgWY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010191ac50a82a-bf2f66b3-2c01-48e1-96d2-448f2ec0b496-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4JloiJE+b8kY+W+30iga9yQ5QrHqFbxCFdFutRYzpw4=;
	b=MA/APQO066wUE94S8R0gx7N3VON3U8uFDEDyNnn0yPMbJcMsKuSpvnt0GPYdKPL/
	1efNciE+oVsttRWp49vhIYK0OvCayhLg6jAEbOFJvpxpplQ+iEtwtNcDrKZ34FySZ8M
	2dnpgBrTv6ZRvOUwly8XghgxMR0SJzYFEgzdu4fw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4JloiJE+b8kY+W+30iga9yQ5QrHqFbxCFdFutRYzpw4=;
	b=qaQVUgWYjo0rT5YhsPmsYWR7thbgCUhj7ZeswnNDTag9YoYUMxw5YcRPmoB69P4t
	hnWlsX3SzraxEnMpsV/NbrXjgbsNNwj0iNBxhUEsgfcfviFrDqg24W33v9F/skCWkWJ
	0JXfkStR00L0oxtTd2g1F4nE93gcUO8cMIIPCB3Q=
Content-Type: multipart/mixed; boundary="===============2419110606020538601=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysvinit: upgrading to 3.10 FAILED
Message-ID: <01010191ac50a82a-bf2f66b3-2c01-48e1-96d2-448f2ec0b496-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203997

--===============2419110606020538601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysvinit* to *3.10* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake sysvinit' failed
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
DISTRO_VERSION       = "5.0+snapshot-ae0abf6bc5a042b7a57fd7144e3af09a957ed950"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ae0abf6bc5a042b7a57fd7144e3af09a957ed950"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 132 Local 128 Mirrors 0 Missed 4 Current 218 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 221 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 225 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 226 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 229 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 230 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 232 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_package_qa_setscene)
NOTE: Running setscene task 235 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_populate_lic_setscene)
NOTE: recipe initscripts-1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r0: task do_package_write_deb_setscene: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sysvinit-inittab-2.88dsf-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sysvinit-3.04-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe sysvinit-3.04-r0: task do_package_qa_setscene: Started
NOTE: recipe sysvinit-3.04-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sysvinit-3.04-r0: task do_populate_lic_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sysvinit-3.04-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 322 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ttyrun/ttyrun_2.34.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/init-system-helpers_1.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_setscene)
NOTE: recipe sysvinit-3.04-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sysvinit-3.04-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe sysvinit-3.04-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: recipe init-system-helpers-1.66-r0: task do_packagedata_setscene: Started
NOTE: recipe ttyrun-2.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ttyrun-2.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe init-system-helpers-1.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 331 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_create_spdx_setscene)
NOTE: recipe sysvinit-inittab-2.88dsf-r0: task do_packagedata_setscene: Started
NOTE: recipe sysvinit-3.04-r0: task do_create_spdx_setscene: Started
NOTE: recipe sysvinit-3.04-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sysvinit-inittab-2.88dsf-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 343 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_populate_sysroot_setscene)
NOTE: recipe sysvinit-3.04-r0: task do_packagedata_setscene: Started
NOTE: recipe sysvinit-3.04-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sysvinit-3.04-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 347 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_package_setscene)
NOTE: recipe sysvinit-3.04-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_package_setscene: Started
NOTE: recipe sysvinit-3.04-r0: task do_package_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 348 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sysvinit-3.04-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 349 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 995 of 1018 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_write_ipk)
NOTE: Running task 996 of 1018 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_write_deb)
NOTE: recipe sysvinit-3.04-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_package_write_ipk: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_package_write_deb: Started
NOTE: recipe sysvinit-3.04-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 350 of 350 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_recipe_qa_setscene)
NOTE: recipe sysvinit-3.04-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sysvinit-3.04-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1013 of 1018 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_package_write_ipk)
NOTE: Running task 1014 of 1018 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_package_write_deb)
NOTE: recipe sysvinit-3.04-r0: task do_package_write_ipk: Started
NOTE: recipe sysvinit-3.04-r0: task do_package_write_deb: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_package_write_ipk: Failed
NOTE: recipe sysvinit-3.04-r0: task do_package_write_ipk: Failed
NOTE: recipe base-passwd-3.6.4-r0: task do_package_write_deb: Failed
NOTE: recipe sysvinit-3.04-r0: task do_package_write_deb: Failed
NOTE: Tasks Summary: Attempted 1017 tasks of which 1013 didn't need to be rerun and 4 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901061126.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901061126.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 4 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_write_ipk
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/base-passwd/3.6.4/temp/log.do_package_write_ipk.2598122
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_package_write_ipk
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/sysvinit/3.04/temp/log.do_package_write_ipk.2598158
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_write_deb
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/base-passwd/3.6.4/temp/log.do_package_write_deb.2598123
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_package_write_deb
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/sysvinit/3.04/temp/log.do_package_write_deb.2598159
Summary: There were 4 ERROR messages, returning a non-zero exit code.

ERROR: base-passwd-3.6.4-r0 do_package_write_ipk: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: sysvinit-3.04-r0 do_package_write_ipk: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/base-passwd/3.6.4/temp/log.do_package_write_ipk.2598122
ERROR: base-passwd-3.6.4-r0 do_package_write_deb: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_write_ipk) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/sysvinit/3.04/temp/log.do_package_write_ipk.2598158
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_package_write_ipk) failed with exit code '1'
ERROR: sysvinit-3.04-r0 do_package_write_deb: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/base-passwd/3.6.4/temp/log.do_package_write_deb.2598123
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_write_deb) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/sysvinit/3.04/temp/log.do_package_write_deb.2598159
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/sysvinit/sysvinit_3.04.bb:do_package_write_deb) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2419110606020538601==--

