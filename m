Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A83CD343F
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.11361.1725172853955006480
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=A6lj5rOD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=jdaf67hz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010191ac50aa67-a4768a2c-232b-44bd-9a02-20f3cd9c18fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=x4ydxKOYc1QoyWp9BbqzuA+cpuKO7ImA0yBGYAlAwKU=;
	b=A6lj5rODKUdHHkfSifMkq/k4uzbiSzof/l5IsMXHaaVeUNni1JLZSg0oQz9Cb3zc
	Othx4CMxFGFw46I7N+kVrp5lJoWU+AkQFC4Wl5INWHNA9MteibZntfSnAPwrcioOm5g
	2A1zr2Hy4oxrLbLMnoCbtRrLmPIZqeQt7ciMiYOM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=x4ydxKOYc1QoyWp9BbqzuA+cpuKO7ImA0yBGYAlAwKU=;
	b=jdaf67hzV2VbeUsarOT11BR5yYOtMArEUbJj8bIfmqPtHNqQhFDmi+YX/6UOdNyN
	7iF1XXU+R/qaiPDSX49H6kE9P0UM4I2FR+tyMUhuc5pfVdcl5MAX0eIDjugSCDUgOrQ
	eg8LIVWawtQeSYI7uyL5z8gCWpbMG6UoCfo/tbag=
Content-Type: multipart/mixed; boundary="===============3136710898150720591=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdrm: upgrading to 2.4.123 FAILED
Message-ID: <01010191ac50aa67-a4768a2c-232b-44bd-9a02-20f3cd9c18fe-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204017

--===============3136710898150720591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libdrm* to *2.4.123* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake libdrm' failed
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
Sstate summary: Wanted 118 Local 116 Mirrors 0 Missed 2 Current 259 (98% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 284 of 377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 285 of 377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_package_qa_setscene)
NOTE: Running setscene task 288 of 377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_populate_lic_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_populate_lic_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_package_qa_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.122-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libdrm-2.4.122-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 376 of 377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_package_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.122-r0: task do_package_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 377 of 377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1109 of 1114 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_package_write_ipk)
NOTE: Running task 1110 of 1114 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_package_write_deb)
NOTE: recipe libdrm-2.4.122-r0: task do_package_write_ipk: Started
NOTE: recipe libdrm-2.4.122-r0: task do_package_write_deb: Started
NOTE: recipe libdrm-2.4.122-r0: task do_package_write_ipk: Failed
NOTE: recipe libdrm-2.4.122-r0: task do_package_write_deb: Failed
NOTE: Tasks Summary: Attempted 1113 tasks of which 1111 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062800.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062800.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_package_write_ipk
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdrm/2.4.122/temp/log.do_package_write_ipk.2658006
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_package_write_deb
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdrm/2.4.122/temp/log.do_package_write_deb.2658007
Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: libdrm-2.4.122-r0 do_package_write_ipk: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdrm/2.4.122/temp/log.do_package_write_ipk.2658006
ERROR: libdrm-2.4.122-r0 do_package_write_deb: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_package_write_ipk) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libdrm/2.4.122/temp/log.do_package_write_deb.2658007
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_package_write_deb) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3136710898150720591==--

