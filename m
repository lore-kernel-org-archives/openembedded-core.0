Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647B8CD37B9
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:59 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11348.1725172853311020273
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hZi9rd61;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JMUXIaR4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010191ac50a7d8-d4d31d37-dce7-4212-84c4-b84da6f171fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SZ4uYxansbf/43fe5WPfdxgehD7GiyhEz8JGyBrVaQk=;
	b=hZi9rd61s6YJoNHTFWUoyf0X2JTUqeBFNZV/yO5KPShFIigSSa+iuJfPZZrWqTNz
	Jp3LjMyhVdsz56JlaUZ4JSR3+KThRwaDaQAl9qvAVgoAO0M6rK1KSKPEZ4RlvQE/UH6
	5UXa1HJfgD7hsAbJwwD1R2+WiPxB/TQq+lhHycSY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SZ4uYxansbf/43fe5WPfdxgehD7GiyhEz8JGyBrVaQk=;
	b=JMUXIaR4VzI2Vipm4VaI4U65YCKHG0EyzYrtq2sf7+T9c/AnupfNMFVCX5onHhUn
	XXyOGarGPhEVqv+BptC16MJlk5cW1iMnFUSTX5cG6eMC2f1knq4y3YvASnHAOROp+Tq
	c2t07jOOWB9Xa7qfUfEcM/jZAt1dYHr39PGifFWE=
Content-Type: multipart/mixed; boundary="===============7992785804001128458=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.10 FAILED
Message-ID: <01010191ac50a7d8-d4d31d37-dce7-4212-84c4-b84da6f171fe-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203987

--===============7992785804001128458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ofono* to *2.10* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake ofono' failed
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
Sstate summary: Wanted 427 Local 384 Mirrors 0 Missed 43 Current 655 (89% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 658 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 670 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_populate_lic_setscene)
NOTE: Running setscene task 681 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 682 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 683 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 744 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ofono-2.9-r0: task do_populate_lic_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1063 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_setscene)
NOTE: recipe ofono-2.9-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1067 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_package_setscene)
NOTE: Running setscene task 1068 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_package_setscene)
NOTE: Running setscene task 1069 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1512 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1680 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_package_setscene: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_package_setscene: Started
NOTE: Running task 2011 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_patch)
NOTE: Running task 2027 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack)
NOTE: Running task 2047 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_unpack)
NOTE: Running task 2103 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.18-r0: task do_patch: Started
NOTE: Running task 2203 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_unpack)
NOTE: recipe vala-0.56.17-r0: task do_unpack: Started
NOTE: recipe bluez5-5.77-r0: task do_unpack: Started
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2312 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_unpack)
NOTE: Running task 2346 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1073 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Started
NOTE: recipe ell-0.67-r0: task do_unpack: Started
NOTE: recipe ofono-2.9-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1074 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1075 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1076 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2593 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_write_config)
NOTE: Running setscene task 1077 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2594 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_write_config)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pycairo-1.26.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.26.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_write_config: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Started
NOTE: Running task 2726 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-dbus-1.3.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1078 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1079 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycairo-1.26.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1080 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.1.bb:do_package_setscene)
NOTE: Running task 2780 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_ipk)
NOTE: Running task 2781 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_deb)
NOTE: recipe python3-pycairo-1.26.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycairo-1.26.1-r0: task do_package_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_ipk: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_deb: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2785 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_fetch)
NOTE: Running task 2786 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_fetch)
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_fetch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.48.2-r0: task do_fetch: Succeeded
NOTE: Running task 2787 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_unpack)
NOTE: Running task 2788 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_unpack)
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.48.2-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.26.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1081 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2790 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_patch)
NOTE: recipe python3-pycairo-1.26.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Started
NOTE: recipe python3-pycairo-1.26.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1082 of 1082 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.1.bb:do_recipe_qa_setscene)
NOTE: recipe ofono-2.9-r0: task do_fetch: Succeeded
NOTE: Running task 2791 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_unpack)
NOTE: recipe python3-pycairo-1.26.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.9-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.26.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2793 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.1.bb:do_fetch)
NOTE: recipe python3-pycairo-1.26.1-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.26.1-r0: task do_fetch: Succeeded
NOTE: Running task 2794 of 2954 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycairo_1.26.1.bb:do_unpack)
NOTE: recipe python3-pycairo-1.26.1-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.26.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe libical-3.0.18-r0: task do_patch: Failed
NOTE: recipe vala-0.56.17-r0: task do_unpack: Failed
NOTE: recipe bluez5-5.77-r0: task do_unpack: Failed
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Failed
NOTE: recipe ell-0.67-r0: task do_unpack: Failed
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Failed
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_ipk: Failed
NOTE: recipe python3-pygobject-3.48.2-r0: task do_unpack: Failed
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Failed
NOTE: recipe ofono-2.9-r0: task do_unpack: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_package_write_deb: Failed
NOTE: Tasks Summary: Attempted 2796 tasks of which 2774 didn't need to be rerun and 14 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901060604.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901060604.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 14 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2586222
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libical/3.0.18/temp/log.do_patch.2586251
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vala/0.56.17/temp/log.do_unpack.2586254
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.77/temp/log.do_unpack.2586279
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cairo/1.18.0/temp/log.do_unpack.2586298
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ell/0.67/temp/log.do_unpack.2586345
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fontconfig/2.15.0/temp/log.do_collect_spdx_deps.2586593
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_ipk
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mobile-broadband-provider-info/20240407/temp/log.do_package_write_ipk.2586611
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pygobject/3.48.2/temp/log.do_unpack.2586674
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dbus/1.3.2/temp/log.do_patch.2586749
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/temp/log.do_unpack.2586775
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2586232
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vala/0.56.17/temp/log.do_prepare_recipe_sysroot.2586281
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_deb
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mobile-broadband-provider-info/20240407/temp/log.do_package_write_deb.2586612
Summary: There were 14 ERROR messages, returning a non-zero exit code.

ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: libical-3.0.18-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: vala-0.56.17-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: bluez5-5.77-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: cairo-1.18.0-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: ell-0.67-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: fontconfig-2.15.0-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: mobile-broadband-provider-info-1_20240407-r0 do_package_write_ipk: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-pygobject-3.48.2-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-dbus-1.3.2-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: ofono-2.9-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2586222
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libical/3.0.18/temp/log.do_patch.2586251
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vala/0.56.17/temp/log.do_unpack.2586254
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bluez5/5.77/temp/log.do_unpack.2586279
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cairo/1.18.0/temp/log.do_unpack.2586298
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ell/0.67/temp/log.do_unpack.2586345
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_unpack) failed with exit code '1'
ERROR: vala-0.56.17-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fontconfig/2.15.0/temp/log.do_collect_spdx_deps.2586593
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mobile-broadband-provider-info/20240407/temp/log.do_package_write_ipk.2586611
ERROR: mobile-broadband-provider-info-1_20240407-r0 do_package_write_deb: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_ipk) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pygobject/3.48.2/temp/log.do_unpack.2586674
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dbus/1.3.2/temp/log.do_patch.2586749
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/temp/log.do_unpack.2586775
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2586232
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vala/0.56.17/temp/log.do_prepare_recipe_sysroot.2586281
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mobile-broadband-provider-info/20240407/temp/log.do_package_write_deb.2586612
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_deb) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7992785804001128458==--

