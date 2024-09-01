Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75A4CD3434
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:57 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11349.1725172853324347384
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=X/wjNKd+;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=AnOwU1+j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010191ac50abe4-35a55465-b750-4b4e-8094-0d9912a403f7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BMYFtXx13jBPM26l6NsLTV36a7pC9HcBcwN5GcmuCss=;
	b=X/wjNKd+EIDksm+Nd5Z+D5EkgXFvu2VQnMRavlOOXOVD85nCzZTdU5ewW0qaoWZ7
	TYqOkFq7mWOl20oa98yB9mLf4IJIY+ZF5mO1deMhg/1NT3HSeQ5vMvq3LmxDG9uplaG
	oELomXceTF9pUTgCrQ90lWTHOXwW4a2vz2JZdEWs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BMYFtXx13jBPM26l6NsLTV36a7pC9HcBcwN5GcmuCss=;
	b=AnOwU1+jMLvec0S2OI7EX94ku/lhgVjNhh8z3Z8AR2x1+OaGgmnBhG77Zbxm1B3s
	LPkja8cvz9lmlYSYGUwCZSGclHx8z1jcE4cJZOJT/NFeMIwCJQToJ0W2zqRuhNSSocu
	2e+Nav+N5ZWeJxIjOh1mJEeWRafd/+HtKM7qMzv8=
Content-Type: multipart/mixed; boundary="===============0951621381112101032=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburcu: upgrading to 0.14.1 FAILED
Message-ID: <01010191ac50abe4-35a55465-b750-4b4e-8094-0d9912a403f7-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204028

--===============0951621381112101032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *liburcu* to *0.14.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake liburcu' failed
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
Sstate summary: Wanted 96 Local 88 Mirrors 0 Missed 8 Current 199 (91% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 233 of 295 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 234 of 295 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe liburcu-0.14.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 294 of 295 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 295 of 295 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 878 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_fetch)
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 879 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_unpack)
NOTE: Running task 880 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Started
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 881 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_patch)
NOTE: Running task 882 of 897 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_collect_spdx_deps)
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Failed
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 882 tasks of which 877 didn't need to be rerun and 3 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901063925.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901063925.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 3 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/liburcu/0.14.0/temp/log.do_prepare_recipe_sysroot.2691099
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/liburcu/0.14.0/temp/log.do_collect_spdx_deps.2691115
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/liburcu/0.14.0/temp/log.do_patch.2691113
Summary: There were 3 ERROR messages, returning a non-zero exit code.

ERROR: liburcu-0.14.0-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/liburcu/0.14.0/temp/log.do_prepare_recipe_sysroot.2691099
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: liburcu-0.14.0-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/liburcu/0.14.0/temp/log.do_collect_spdx_deps.2691115
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: liburcu-0.14.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/liburcu/0.14.0/temp/log.do_patch.2691113
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_patch) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0951621381112101032==--

