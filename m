Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8789CD379F
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.11357.1725172853780614343
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OaAMA7rS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nz6RYguV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191ac50a9dc-a82f960e-ca03-4234-af31-d5d1dc258e22-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EunWCwXL+Rz8YiWl3bwT5ywZiZgD1yVB6xIoTeEBSqI=;
	b=OaAMA7rSQPBzczClhqkXgfYishUJ2XKZbU6pR+Z41dG4sgsxm6R9c89sG+jNkJ/v
	foGjjdlp6qqiuJf2QFq38+20iWiUbJRISeN749YUjc0e43Sa+Tp4ZeyrR4RvryXZ+HD
	LapDUkQpbJiuPlmVDiLVJyV0wrXZFWGYNSoVzYlI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EunWCwXL+Rz8YiWl3bwT5ywZiZgD1yVB6xIoTeEBSqI=;
	b=nz6RYguV0bfoGF2w8lGSw2fEpXSgUUw5GkffqyJsJH6Gjhe7RtxB0WPxl6ZrBijU
	/THXNPAegj++a2zESiSvQLxvF3B6eBc5BTi5ekRPfVY9EA99nybPbMIdZbdZENxuIco
	dhSaUvMY/l4KD2Jsj4m3RLtkJOC2PZxaSDIUsx3c=
Content-Type: multipart/mixed; boundary="===============3139559616457051845=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] screen: upgrading to 5.0.0 FAILED
Message-ID: <01010191ac50a9dc-a82f960e-ca03-4234-af31-d5d1dc258e22-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204007

--===============3139559616457051845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *screen* to *5.0.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake screen' failed
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
Sstate summary: Wanted 126 Local 110 Mirrors 0 Missed 16 Current 242 (87% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 276 of 368 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 285 of 368 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/screen/screen_4.9.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 287 of 368 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/screen/screen_4.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 893 of 1068 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 903 of 1068 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 982 of 1068 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe screen-4.9.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe screen-4.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe screen-4.9.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe screen-4.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 356 of 368 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/screen/screen_4.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 357 of 368 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb:do_create_spdx_setscene)
NOTE: recipe screen-4.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe screen-4.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1013 of 1068 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/screen/screen_4.9.1.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe screen-4.9.1-r0: task do_fetch: Started
NOTE: recipe screen-4.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 1039 of 1068 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/screen/screen_4.9.1.bb:do_unpack)
NOTE: Running task 1040 of 1068 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/screen/screen_4.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe screen-4.9.1-r0: task do_unpack: Started
NOTE: recipe screen-4.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe screen-4.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1041 of 1068 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/screen/screen_4.9.1.bb:do_patch)
NOTE: Running task 1042 of 1068 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/screen/screen_4.9.1.bb:do_collect_spdx_deps)
NOTE: recipe screen-4.9.1-r0: task do_patch: Started
NOTE: recipe screen-4.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe screen-4.9.1-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe screen-4.9.1-r0: task do_patch: Failed
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Failed
NOTE: recipe screen-4.9.1-r0: task do_collect_spdx_deps: Failed
NOTE: Tasks Summary: Attempted 1042 tasks of which 1034 didn't need to be rerun and 6 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062529.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062529.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 6 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2645954
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/screen/screen_4.9.1.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/screen/4.9.1/temp/log.do_prepare_recipe_sysroot.2646109
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2645955
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/screen/screen_4.9.1.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/screen/4.9.1/temp/log.do_patch.2646123
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_collect_spdx_deps.2645956
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/screen/screen_4.9.1.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/screen/4.9.1/temp/log.do_collect_spdx_deps.2646124
Summary: There were 6 ERROR messages, returning a non-zero exit code.

ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: screen-4.9.1-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2645954
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/screen/4.9.1/temp/log.do_prepare_recipe_sysroot.2646109
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/screen/screen_4.9.1.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: screen-4.9.1-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2645955
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/screen/4.9.1/temp/log.do_patch.2646123
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/screen/screen_4.9.1.bb:do_patch) failed with exit code '1'
ERROR: screen-4.9.1-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_collect_spdx_deps.2645956
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/screen/4.9.1/temp/log.do_collect_spdx_deps.2646124
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/screen/screen_4.9.1.bb:do_collect_spdx_deps) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3139559616457051845==--

