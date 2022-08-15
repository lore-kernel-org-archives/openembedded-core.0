Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C78C28B2B
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.6459.1660589820968544550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KTVgvM0t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010182a2ddcb39-3057baaa-8f53-4a4d-b261-c785d4bd6be1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EMjl3/XA7g8iVO2TMCgmmT+5LbsyPndpPPt2wg+6oug=;
	b=KTVgvM0tdYzNBopErpUdrrSgyTPUpLB0V8fbCLaZpjXZ5rnGYcqZEI4g0EVkfHKl
	7EuP+EUhad8H9O4BhTogKq2yqQLY05AjEGDVBY8uB4mBj8lPgx/C07H6gBNJAsddC34
	BF/HxIX5qFwxa8dlgo4rGNUGCpsZDHTfmlJ6HaVk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EMjl3/XA7g8iVO2TMCgmmT+5LbsyPndpPPt2wg+6oug=;
	b=WrfFB+jVauB7gu6o9hntlTCvp88u93hOs25uj+u7WboyUMUl5W4L0mjbR8G/I7/y
	TPCTmkTdHGqBWjrQkCAfreO4+xsUut685mgpKG1iB28my/9jKWto9A/gg09feEuMCco
	IllKnKs4RoN8AUwJXG7ccyboUZQPkzxvuNQ5dCBA=
Content-Type: multipart/mixed; boundary="===============4630188013161971822=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] slang: upgrading to 2.3.3 FAILED
Message-ID: 
 <01010182a2ddcb39-3057baaa-8f53-4a4d-b261-c785d4bd6be1-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169391

--===============4630188013161971822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *slang* to *2.3.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe slang failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9332cc43e94f4165736f28925193eb177b1d6b2d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9332cc43e94f4165736f28925193eb177b1d6b2d"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (883 cached, 2 parsed). 1659 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9332cc43e94f4165736f28925193eb177b1d6b2d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9332cc43e94f4165736f28925193eb177b1d6b2d"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  40% |##############                      | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching http://www.jedsoft.org/releases/slang/slang-2.3.3.tar.bz2...
INFO: Rebasing devtool onto afa99fc7a7d7a65c3f33ee5eefd5b8f79154581d
WARNING: Command 'git rebase afa99fc7a7d7a65c3f33ee5eefd5b8f79154581d' failed:
Auto-merging slsh/Makefile.in
CONFLICT (content): Merge conflict in slsh/Makefile.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/slang
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/slang/slang_2.3.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4630188013161971822==--

