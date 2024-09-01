Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5EACD37BE
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:59 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11346.1725172853220865906
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cUyfNNMG;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=w08Ujqud;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010191ac50a6e7-ec48a90e-b2dd-40da-a934-4198db53c3ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zUtrL1DRx9UhbTFC1Qi2O5lnnf7WzddeCoPzGOtlv3g=;
	b=cUyfNNMGX8IWB5iyizHAB/iiDVGbBom5DpAHejd1pANHMwOjmkpFF7RrtrBiLWPe
	yu9IGIGKx7l3BoRy8lG1dBOgRgWdx/yI82f8DRbgfgo5oROBL+04AkxwH+u2wJbGcZq
	81HbxZ3w3dPE+f7m7Y0h2P696hr7ddDYfDk7mPbI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zUtrL1DRx9UhbTFC1Qi2O5lnnf7WzddeCoPzGOtlv3g=;
	b=w08Ujqudd26HezpaCFitxrXQZ+HG9TwnLJHKiy/wn2NmIaPLbfAPVTl6XfX0/zYs
	Zivm2X5Z1AsTADXgC7lsxmeXSB8z2sMOVNYs5ycxJ+ldXTPUNXDslytvMVwcyRumy1F
	1LVz4Wbu3nqUSNyXO/GbXITWcTH0sEIHRWsXACnQ=
Content-Type: multipart/mixed; boundary="===============2073101047389361486=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dhcpcd: upgrading to 10.0.10 FAILED
Message-ID: <01010191ac50a6e7-ec48a90e-b2dd-40da-a934-4198db53c3ba-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203985

--===============2073101047389361486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dhcpcd* to *10.0.10* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake dhcpcd' failed
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
Sstate summary: Wanted 323 Local 302 Mirrors 0 Missed 21 Current 507 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 516 of 830 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb:do_populate_lic_setscene)
NOTE: Running setscene task 518 of 830 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 545 of 830 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 548 of 830 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/os-release/os-release.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 549 of 830 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 830 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 830 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 830 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.5.bb:do_package_setscene)
NOTE: Running setscene task 558 of 830 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/volatile-binds/volatile-binds.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 830 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_packagedata_setscene)
NOTE: recipe os-release-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe volatile-binds-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dhcpcd-10.0.8-r0: task do_populate_lic_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dhcpcd-10.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tar-1.35-r0: task do_packagedata_setscene: Started
NOTE: recipe os-release-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 811 of 830 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/os-release/os-release.bb:do_recipe_qa_setscene)
NOTE: recipe dhcpcd-10.0.8-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe dhcpcd-10.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe volatile-binds-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 813 of 830 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 816 of 830 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe os-release-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dhcpcd-10.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kbd-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe os-release-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dhcpcd-10.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kbd-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_256.5-r0: task do_package_setscene: Started
NOTE: Running task 1927 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb:do_fetch)
NOTE: Running task 1938 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch)
NOTE: Running task 2013 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2071 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_fetch)
NOTE: Running noexec task 2072 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/os-release/os-release.bb:do_fetch)
NOTE: Running noexec task 2101 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/os-release/os-release.bb:do_unpack)
NOTE: Running noexec task 2106 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/os-release/os-release.bb:do_patch)
NOTE: recipe dhcpcd-10.0.8-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_patch: Started
NOTE: Running task 2180 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/os-release/os-release.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.47.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kbd-2.6.4-r0: task do_fetch: Started
NOTE: recipe os-release-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kbd-2.6.4-r0: task do_fetch: Succeeded
NOTE: Running task 2263 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_unpack)
NOTE: Running task 2264 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe kbd-2.6.4-r0: task do_unpack: Started
NOTE: recipe kbd-2.6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_256.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 830 of 830 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_256.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2267 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 2268 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2271 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_256.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_256.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe dhcpcd-10.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 2276 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb:do_unpack)
NOTE: recipe dhcpcd-10.0.8-r0: task do_unpack: Started
NOTE: recipe dhcpcd-10.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2277 of 2344 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb:do_patch)
NOTE: recipe dhcpcd-10.0.8-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.47.1-r0: task do_patch: Failed
NOTE: recipe os-release-1.0-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe kbd-2.6.4-r0: task do_unpack: Failed
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Failed
NOTE: recipe dhcpcd-10.0.8-r0: task do_patch: Failed
NOTE: recipe e2fsprogs-1.47.1-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe kbd-2.6.4-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: Tasks Summary: Attempted 2277 tasks of which 2262 didn't need to be rerun and 9 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901060424.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901060424.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 9 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.1/temp/log.do_patch.2580907
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/os-release/os-release.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/os-release/1.0/temp/log.do_prepare_recipe_sysroot.2580914
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kbd/2.6.4/temp/log.do_unpack.2580938
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_collect_spdx_deps.2581612
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dhcpcd/10.0.8/temp/log.do_patch.2581764
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.1/temp/log.do_prepare_recipe_sysroot.2580908
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kbd/2.6.4/temp/log.do_prepare_recipe_sysroot.2580939
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2581610
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2581611
Summary: There were 9 ERROR messages, returning a non-zero exit code.

ERROR: e2fsprogs-1.47.1-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: os-release-1.0-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: kbd-2.6.4-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: base-files-3.0.14-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: dhcpcd-10.0.8-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.1/temp/log.do_patch.2580907
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_patch) failed with exit code '1'
ERROR: e2fsprogs-1.47.1-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/os-release/1.0/temp/log.do_prepare_recipe_sysroot.2580914
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/os-release/os-release.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kbd/2.6.4/temp/log.do_unpack.2580938
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_unpack) failed with exit code '1'
ERROR: kbd-2.6.4-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_collect_spdx_deps.2581612
ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dhcpcd/10.0.8/temp/log.do_patch.2581764
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/e2fsprogs/1.47.1/temp/log.do_prepare_recipe_sysroot.2580908
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/kbd/2.6.4/temp/log.do_prepare_recipe_sysroot.2580939
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/kbd/kbd_2.6.4.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2581610
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2581611
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2073101047389361486==--

