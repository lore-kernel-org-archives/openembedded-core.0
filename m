Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BA1C7618A
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.10294.1676508397477568224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QH+1/WJS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018657affce0-401f9376-f906-400a-91c7-b62b81c35348-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BJXJYRTI/ujZiIDL2kYXWNBsRf5E/jpPCpw2jO/jCRU=;
	b=QH+1/WJSYB3CAnBkKAF2qhH5LULbTCRtIuo4imhOXKwH1dIdJlGpW5uUcGPV64Kp
	xUQ8k9fpd+v4Ke4ctxAIJ6sAgt9kjHYOmySdeDiZYCe/jZqHfh+ksznbzkNgsIeaxXa
	A+saXEYPOcQY2r3UtNj7lXA3x9cvWBTrFeDbjJl4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BJXJYRTI/ujZiIDL2kYXWNBsRf5E/jpPCpw2jO/jCRU=;
	b=G5wVjPKh94mWTHB3M6aZOMxIsY1PAJKM0+EVatkH3caDAwrKKXlTjQsHlPbG3Mcs
	Ug1ZN4FmcVB8mDrlNogGkSOp0DkfjtkRS6FC+Hr7C0uT3ppmauE6sLl+w5pyzBuwEPL
	3bEW3YCn6zGExIK3BP/nUbIsbOlnpUzmR5dSVFfE=
Content-Type: multipart/mixed; boundary="===============1778546065868253838=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.13 FAILED
Message-ID: <0101018657affce0-401f9376-f906-400a-91c7-b62b81c35348-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177245

--===============1778546065868253838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sudo* to *1.9.13* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe sudo failed.
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1693 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-fda099a90ac30701248690922ff3f5511cb92454"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fda099a90ac30701248690922ff3f5511cb92454"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1693 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (894 cached, 2 parsed). 1694 targets, 37 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-fda099a90ac30701248690922ff3f5511cb92454"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fda099a90ac30701248690922ff3f5511cb92454"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  33% |###########                         | ETA:  0:00:00
Adding changed files:  66% |#######################             | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.sudo.ws/dist/sudo-1.9.13.tar.gz...
INFO: Rebasing devtool onto a58ae08c63d47644102b19a1c41d51aa769c1c31
WARNING: Command 'git rebase a58ae08c63d47644102b19a1c41d51aa769c1c31' failed:
Auto-merging examples/sudo.conf.in
CONFLICT (content): Merge conflict in examples/sudo.conf.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/sudo
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/sudo/sudo_1.9.13.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1778546065868253838==--

