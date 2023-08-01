Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E372C25B5C
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.17592.1690907329215296305
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=O0PzSn84;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Z/kkaoW9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010189b1ee3f70-44c929eb-d626-4305-a5d9-3e3ba7e6e086-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907328;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fRTZWCugJIg2pHGt3xXVfNfLMU6aqqQgt1b9ps2pEUQ=;
	b=O0PzSn84/vkintgaW/mSWxqRzv+FAByHPIV8HmHzjHDkuPhCWNPxIbbVw4exagI6
	6cYOZMxrVeqd8EtWFiEillVOt55b+lo+viCC/tWLwha0vFJ/V8nNp3SRfPHdfjmix5d
	CW+7nue7FEzGlL01A0kWTqEuCRx18tvVS6CqespU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907328;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fRTZWCugJIg2pHGt3xXVfNfLMU6aqqQgt1b9ps2pEUQ=;
	b=Z/kkaoW92yeNotxQXc5P575ut+n4L7kYxRLESfEar/1KyewPk6Y/wnuyXY1+LKwl
	MorL1oUMsdxoBe2pTMXH+kxkP5+H+GWT0dhlZlIEwiCxTezgd9tWQiblVxyXJgT8AZb
	9ygEAR+fL+5HlOr8V8zqkbkk0Y7uagu0icm7Bskc=
Content-Type: multipart/mixed; boundary="===============4229014889119864339=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glibc-testsuite: upgrading to 2.38 FAILED
Message-ID: <01010189b1ee3f70-44c929eb-d626-4305-a5d9-3e3ba7e6e086-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185264

--===============4229014889119864339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glibc-testsuite* to *2.38* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake glibc-testsuite' failed
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1805 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:37dfea4a99015745a13107286874111b2a6f0789"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 14 Mirrors 0 Missed 5 Current 306 (73% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 323 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_package_setscene)
NOTE: Running task 832 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_recipe_qa)
NOTE: recipe glibc-testsuite-2.37-r1: task do_recipe_qa: Started
NOTE: recipe glibc-testsuite-2.37-r1: task do_recipe_qa: Succeeded
NOTE: Running task 872 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.4-r0: task do_package_setscene: Started
NOTE: recipe glibc-testsuite-2.37-r1: task do_fetch: Started
NOTE: recipe glibc-testsuite-2.37-r1: task do_fetch: Succeeded
NOTE: Running task 873 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_unpack)
NOTE: recipe glibc-testsuite-2.37-r1: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 325 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 944 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_package_write_rpm)
NOTE: recipe linux-libc-headers-6.4-r0: task do_package_write_rpm: Started
NOTE: recipe glibc-testsuite-2.37-r1: task do_unpack: Succeeded
NOTE: Running task 946 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_collect_spdx_deps)
NOTE: Running task 947 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_patch)
NOTE: recipe glibc-testsuite-2.37-r1: task do_collect_spdx_deps: Started
NOTE: recipe glibc-testsuite-2.37-r1: task do_patch: Started
NOTE: recipe glibc-testsuite-2.37-r1: task do_collect_spdx_deps: Succeeded
NOTE: Running task 948 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_create_spdx)
NOTE: recipe glibc-testsuite-2.37-r1: task do_create_spdx: Started
NOTE: recipe glibc-testsuite-2.37-r1: task do_create_spdx: Failed
NOTE: recipe glibc-testsuite-2.37-r1: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 948 tasks of which 941 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_create_spdx
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: glibc-testsuite-2.37-r1 do_create_spdx: Recipe glibc-testsuite is trying to create package sln which was already written by recipe glibc. This will cause corruption, please resolve this and only provide the package from one recipe or the other or only build one of the recipes.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glibc-testsuite/2.37-r1/temp/log.do_create_spdx.1337716
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_create_spdx) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4229014889119864339==--

