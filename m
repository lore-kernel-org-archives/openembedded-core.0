Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7F9CD37A9
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.11355.1725172853701603253
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=U/VuNFjP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=C6rOTgV6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010191ac50a9b3-b52163dd-eed3-492f-8dd0-6d3cc018d133-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6jDzsOtnkyX0885Wg/MzMv6Wdg/lSFtAcNSzb9sr/r0=;
	b=U/VuNFjPhAk2JTOiDEO/0cBfdwXPO6hffKy/hiYnvJyeXb9k+m2rhivckaxwd5+0
	Xp+0kbpnB4WP7vksxUvxuSrgiQQ90DhLPlS7J/PkCo8E5ESJ9/GausHFJM95QBj6i2l
	DDcVMsbqJjvC23DgWeRjIOPzWV1LYQMGU0jBkdAQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6jDzsOtnkyX0885Wg/MzMv6Wdg/lSFtAcNSzb9sr/r0=;
	b=C6rOTgV6Qe0kR6AmxlxK3FfTVurBGlz/f0pr03zMTSZ87wLnovud4KTrSE28wXc4
	dVUYosO7tEAqynkMhZAGYQebXVm9+A3z8XtRRl0GA/e3qtKRm0MEDz5tXcQYZAKUJ1q
	4saOjqAdYZDEAw/Iy6MDNGBDzMUDE+qhI5HKiyIg=
Content-Type: multipart/mixed; boundary="===============8831253301505229755=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 6.1.0 FAILED
Message-ID: <01010191ac50a9b3-b52163dd-eed3-492f-8dd0-6d3cc018d133-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204003

--===============8831253301505229755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pbr* to *6.1.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-pbr' failed
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
Sstate summary: Wanted 281 Local 264 Mirrors 0 Missed 17 Current 367 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 437 of 648 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 438 of 648 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pbr-6.0.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pbr-6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pbr-6.0.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 1460 of 1834 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_patch)
NOTE: recipe python3-pbr-6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 648 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1506 of 1834 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1518 of 1834 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1587 of 1834 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pip-24.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-pbr-6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pip-24.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1785 of 1834 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-pbr-6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 648 of 648 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pip-24.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pbr-6.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pbr-6.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1787 of 1834 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_fetch)
NOTE: recipe python3-pbr-6.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pbr-6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1788 of 1834 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_unpack)
NOTE: Running task 1789 of 1834 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pbr-6.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pbr-6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pbr-6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1790 of 1834 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_patch)
NOTE: Running task 1791 of 1834 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pbr-6.0.0-r0: task do_patch: Started
NOTE: recipe python3-pbr-6.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pip-24.2-r0: task do_patch: Failed
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe python3-pbr-6.0.0-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-pip-24.2-r0: task do_collect_spdx_deps: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-pbr-6.0.0-r0: task do_collect_spdx_deps: Failed
NOTE: recipe python3-pip-24.2-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-pbr-6.0.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1791 tasks of which 1781 didn't need to be rerun and 8 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901061944.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901061944.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 8 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pip/24.2/temp/log.do_patch.2631792
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2631800
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pbr/6.0.0/temp/log.do_prepare_recipe_sysroot.2631851
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pip/24.2/temp/log.do_collect_spdx_deps.2631824
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2631802
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pbr/6.0.0/temp/log.do_collect_spdx_deps.2631863
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pip/24.2/temp/log.do_prepare_recipe_sysroot.2631801
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pbr/6.0.0/temp/log.do_patch.2631862
Summary: There were 8 ERROR messages, returning a non-zero exit code.

ERROR: python3-pip-24.2-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-pbr-6.0.0-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pip/24.2/temp/log.do_patch.2631792
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_patch) failed with exit code '1'
ERROR: python3-pip-24.2-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2631800
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pbr/6.0.0/temp/log.do_prepare_recipe_sysroot.2631851
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: python3-pbr-6.0.0-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pip/24.2/temp/log.do_collect_spdx_deps.2631824
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2631802
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: python3-pip-24.2-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pbr/6.0.0/temp/log.do_collect_spdx_deps.2631863
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: python3-pbr-6.0.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pip/24.2/temp/log.do_prepare_recipe_sysroot.2631801
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-pbr/6.0.0/temp/log.do_patch.2631862
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pbr_6.0.0.bb:do_patch) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8831253301505229755==--

