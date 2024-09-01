Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3463ACD37B3
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:59 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.11350.1725172853459342503
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KtV9VUbW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=hkDK+BzM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010191ac50a818-47c337ee-ac1c-4e0a-86bc-4ab88dab58c2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WkeXiCsYzj0C9Otxdf4T6SJSPkECp0zN+vaihDsSs5E=;
	b=KtV9VUbWdmZaJCT1ByXJZ4G3BIEJLeNDC1Sc/CnPK7jOhGmpJ/11sPmo1/zhm9XQ
	xhcqDyqD5s4vlGZMvfEW9cI1JITc1krvj/0QznubKpdNiufnGa/mdgE8PAxdWMpbxx6
	rufa42bq/mwemjTvdLGAHLE0TTA+uyocGYN02Y0g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WkeXiCsYzj0C9Otxdf4T6SJSPkECp0zN+vaihDsSs5E=;
	b=hkDK+BzMS5Cd1forJL3WKdyzrNsOByrh4GYaakpem/BvD2eC/2TyrjYHw3Aqarnd
	16UowJvxMDxBFjesbG5lDaEXOePXKweKPSM4bY1Fd5Mehy+omVY9NJMj1z0fPz0TJPI
	fzEe2TZ6FeMJzqBuMwpFAEgtj/Hdk2/9O0fgo/Is=
Content-Type: multipart/mixed; boundary="===============9032769261977404657=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] socat: upgrading to 1.8.0.1 FAILED
Message-ID: <01010191ac50a818-47c337ee-ac1c-4e0a-86bc-4ab88dab58c2-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203992

--===============9032769261977404657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *socat* to *1.8.0.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake socat' failed
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
Sstate summary: Wanted 107 Local 105 Mirrors 0 Missed 2 Current 223 (98% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 226 of 330 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 227 of 330 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 230 of 330 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 330 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_populate_lic_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: Running setscene task 326 of 330 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_create_spdx_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 327 of 330 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_setscene)
NOTE: Running setscene task 328 of 330 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe socat-1.8.0.0-r0: task do_package_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 329 of 330 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 330 of 330 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 975 of 980 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_ipk)
NOTE: Running task 976 of 980 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_deb)
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_deb: Started
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_ipk: Failed
NOTE: recipe socat-1.8.0.0-r0: task do_package_write_deb: Failed
NOTE: Tasks Summary: Attempted 979 tasks of which 977 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901060634.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901060634.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_ipk
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/log.do_package_write_ipk.2588250
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_deb
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/log.do_package_write_deb.2588251
Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: socat-1.8.0.0-r0 do_package_write_ipk: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/log.do_package_write_ipk.2588250
ERROR: socat-1.8.0.0-r0 do_package_write_deb: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_ipk) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/socat/1.8.0.0/temp/log.do_package_write_deb.2588251
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_package_write_deb) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9032769261977404657==--

