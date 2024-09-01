Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80BBCD342F
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:57 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.11418.1725172854121231634
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PJz66Pn0;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fMRj14sv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010191ac50ab26-cc3165b3-02fe-4e77-be8c-bc08c690eae2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oAcX08u7zFEAK9F14/ro/xCXQp0qMuyZfgxO6AgAOUE=;
	b=PJz66Pn0JuiUutRfGr42Zg2zEOKXq6h/ogNGz7Rmo2V5GBkV5UDbKgPMhmoG3G9y
	Q8T7rmjLK+nrtt2+Sh/NE7b0AxnO1oL+jn2E69nj2iykuh06SjpKQOlqM5osddY3pw+
	KqDHbD5KoTRjX9TPRtGn9aLlyhzzebAhKmcwCidw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oAcX08u7zFEAK9F14/ro/xCXQp0qMuyZfgxO6AgAOUE=;
	b=fMRj14svnozbsLtg+c6fK+9LNBYm4rbjh/Auf7ip0LRcM9dELAW3ee3EQebrPE1Q
	3pxpe6oeSjYHDhZVW8UNFACNWZ9r72ZcLdtNYcvBR+igm0PY5mIQDSIplYGYAxwuSXA
	XJAlhsoHxPBA006I/IyEKcPAORVCDJ4KCGdpnLyY=
Content-Type: multipart/mixed; boundary="===============7945377305439201458=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.26.2 FAILED
Message-ID: <01010191ac50ab26-cc3165b3-02fe-4e77-be8c-bc08c690eae2-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204032

--===============7945377305439201458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.26.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake libinput' failed
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
Sstate summary: Wanted 288 Local 275 Mirrors 0 Missed 13 Current 479 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 573 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 575 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 576 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 629 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 630 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.2.bb:do_create_spdx_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevdev-1.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libinput-1.26.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe libinput-1.26.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libinput-1.26.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 752 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe libinput-1.26.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 753 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_recipe_qa_setscene)
NOTE: recipe libevdev-1.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 755 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libinput-1.26.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1544 of 2137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libinput-1.26.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1583 of 2137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_fetch)
NOTE: recipe libevdev-1.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1677 of 2137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running setscene task 765 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libevdev-1.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 767 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libinput-1.26.1-r0: task do_fetch: Started
NOTE: Running task 1807 of 2137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_write_config)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libevdev-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libinput-1.26.1-r0: task do_write_config: Started
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libevdev-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libinput-1.26.1-r0: task do_write_config: Succeeded
NOTE: recipe libinput-1.26.1-r0: task do_fetch: Succeeded
NOTE: Running task 2087 of 2137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_unpack)
NOTE: recipe libinput-1.26.1-r0: task do_unpack: Started
NOTE: recipe libinput-1.26.1-r0: task do_unpack: Succeeded
NOTE: Running task 2088 of 2137 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_patch)
NOTE: recipe libinput-1.26.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe libinput-1.26.1-r0: task do_patch: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: Tasks Summary: Attempted 2088 tasks of which 2082 didn't need to be rerun and 3 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901063228.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901063228.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 3 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2668691
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libinput/1.26.1/temp/log.do_patch.2669018
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2668741
Summary: There were 3 ERROR messages, returning a non-zero exit code.

ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: libinput-1.26.1-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2668691
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libinput/1.26.1/temp/log.do_patch.2669018
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.26.1.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2668741
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7945377305439201458==--

