Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B384C3DA58
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.174025.1692224343347269417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JY6m6C+V;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YIOTH7W3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018a006e48dc-a4b9b7fd-d9fa-4330-8f63-deeae5bddcb3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1csO59W4hAcxkqR5FRU042bJMvUzEjosIZlbr4ZuuVs=;
	b=JY6m6C+V7toE2i9BXDAZEr55WAbeMVy1ysVr3DLCCmoPagHYRA2y6Mfr0PNeDLQ+
	8/3sW5ZOH7Jw+ZB08e0qEIIwa1rAdlOGCXz74wdfrW3mOg3sDq/vLk/y5iR6OCyxb97
	GN5gUrz4DOY5Vrz6TLT1AIPW38zywjuDalwK/L/A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1csO59W4hAcxkqR5FRU042bJMvUzEjosIZlbr4ZuuVs=;
	b=YIOTH7W3UuqNeFQQT5veIbJ1DoSd67Z7f8dUwjK+bMslGh0Wso6HTj+Ph68YRq6/
	IzEh63uRZkWZ/75+NLoTzQfUfO857bJpPZG0PXl6pyPsOziby6nRFV+aEK93Ew+dcek
	8J1GwaRKW8dMDoxnYlAb2hjZPMR7b4S2fMyUGEck=
Content-Type: multipart/mixed; boundary="===============2546497725659672200=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glibc-testsuite: upgrading to 2.38 FAILED
Message-ID: <0101018a006e48dc-a4b9b7fd-d9fa-4330-8f63-deeae5bddcb3-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186159

--===============2546497725659672200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glibc-testsuite* to *2.38* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake glibc-testsuite' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:774f46b5df332375bd05eadff796c636c2730c66"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 19 Mirrors 0 Missed 5 Current 301 (79% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 319 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_package_setscene)
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
NOTE: Running task 945 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_package_write_rpm)
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
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_create_spdx
Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: glibc-testsuite-2.37-r1 do_create_spdx: Recipe glibc-testsuite is trying to create package sln which was already written by recipe glibc. This will cause corruption, please resolve this and only provide the package from one recipe or the other or only build one of the recipes.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glibc-testsuite/2.37/temp/log.do_create_spdx.3578679
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_create_spdx) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2546497725659672200==--

