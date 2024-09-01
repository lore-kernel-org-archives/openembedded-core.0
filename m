Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25CCCD3447
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.11409.1725172853435315336
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fHgCuVkS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dUYN4xvS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010191ac50aa13-e54398d9-25c1-4a30-8414-061d71bdbaee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D8i0mWQQ44qdYfcGnoRvr+St4WXJAnR6wKQbQDGRYGo=;
	b=fHgCuVkSOEmqWAKpQcGfzlmvR/suK1gt+WEjM8HjCf0fWoxLIolYrWTiQUAimtW1
	OUXK6w3h+gm2kRFmhlaFibhFi6A0vsptjI1vYBChIc20CaovSrcLrO//x7xg/tyWp6d
	f6aDSJqqjJX0VH0+S4mvCg5AOMV0DGo2t8jiz9lk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D8i0mWQQ44qdYfcGnoRvr+St4WXJAnR6wKQbQDGRYGo=;
	b=dUYN4xvSGzbOpdyGe3BB//cmyMsXd1XA+GGQTkCWksYReQTRnLlfzfJsobQVANPB
	qqRcsp6ao74UvQz+IdkLR15XIc2tjfejP1nagNECharVJ6MPykZZT5nzlfaTrECOMxA
	++5ifryUqa8g4VqXE9pASptwc9hLhUvOj3yc3lYQ=
Content-Type: multipart/mixed; boundary="===============4941578519408428778=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 88ba6f5abfa1105c375b9b34e7b146f809411706 FAILED
Message-ID: <01010191ac50aa13-e54398d9-25c1-4a30-8414-061d71bdbaee-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204008

--===============4941578519408428778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *88ba6f5abfa1105c375b9b34e7b146f809411706* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake go-helloworld' failed
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
Sstate summary: Wanted 107 Local 99 Mirrors 0 Missed 8 Current 198 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 223 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.22.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 230 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 231 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe go-runtime-1.22.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe go-helloworld-0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe go-helloworld-0.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe go-helloworld-0.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe go-runtime-1.22.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 296 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.22.6.bb:do_packagedata_setscene)
NOTE: recipe go-helloworld-0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 297 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe go-runtime-1.22.6-r0: task do_packagedata_setscene: Started
NOTE: recipe go-runtime-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe go-helloworld-0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe go-helloworld-0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 299 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_recipe_qa_setscene)
NOTE: recipe go-runtime-1.22.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe go-helloworld-0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe go-helloworld-0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 871 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_fetch)
NOTE: recipe go-helloworld-0.1-r0: task do_fetch: Started
NOTE: recipe go-runtime-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-binary-native_1.22.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.22.6.bb:do_recipe_qa_setscene)
NOTE: recipe go-binary-native-1.22.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe go-runtime-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe go-runtime-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe go-helloworld-0.1-r0: task do_fetch: Succeeded
NOTE: Running task 877 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_unpack)
NOTE: recipe go-helloworld-0.1-r0: task do_unpack: Started
NOTE: recipe go-binary-native-1.22.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 305 of 305 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-binary-native_1.22.6.bb:do_recipe_qa_setscene)
NOTE: recipe go-binary-native-1.22.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe go-helloworld-0.1-r0: task do_unpack: Succeeded
NOTE: Running task 878 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_patch)
NOTE: recipe go-binary-native-1.22.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 901 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 908 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_collect_spdx_deps)
NOTE: recipe go-helloworld-0.1-r0: task do_patch: Started
NOTE: recipe go-helloworld-0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe go-helloworld-0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe go-helloworld-0.1-r0: task do_patch: Failed
NOTE: recipe go-helloworld-0.1-r0: task do_collect_spdx_deps: Failed
NOTE: recipe go-helloworld-0.1-r0: task do_prepare_recipe_sysroot: Failed
NOTE: Tasks Summary: Attempted 908 tasks of which 903 didn't need to be rerun and 3 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062309.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062309.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 3 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/go-helloworld/0.1/temp/log.do_patch.2640117
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/go-helloworld/0.1/temp/log.do_collect_spdx_deps.2640121
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/go-helloworld/0.1/temp/log.do_prepare_recipe_sysroot.2640120
Summary: There were 3 ERROR messages, returning a non-zero exit code.

ERROR: go-helloworld-0.1-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/go-helloworld/0.1/temp/log.do_patch.2640117
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_patch) failed with exit code '1'
ERROR: go-helloworld-0.1-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/go-helloworld/0.1/temp/log.do_collect_spdx_deps.2640121
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: go-helloworld-0.1-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/go-helloworld/0.1/temp/log.do_prepare_recipe_sysroot.2640120
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/go-examples/go-helloworld_0.1.bb:do_prepare_recipe_sysroot) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4941578519408428778==--

