Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7938BC64E7E
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.5249.1668517536269618782
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kU434KDE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101847b651f4e-127dc25e-04a7-43dc-ab73-e2f391595045-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pm0HvNPO4O3FDVNIxFEadaNm4gCsN7TeI6MCwHWVi2k=;
	b=kU434KDEte0DxvgCBrdTLYlwOjO6Tc+b/paDRYJpgRByG+oUiFsny7eZOedHSTuG
	NItraHe5ipWdIRO8dsfTD7utAdXO076N8b1s2sk5QyZ5gLi9B0qvBV4U7q0myS6Hg0g
	//1x3+SnCVKjEYoGPRiqAn9bhnDYjLhhx6dKnI7A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pm0HvNPO4O3FDVNIxFEadaNm4gCsN7TeI6MCwHWVi2k=;
	b=cTXzfEMyVrw66nW1R9nsr217hWXc7VvM14e8RmBYgr0VJO4q8cW/P+1jpmLXv5DV
	/hbsEeK39pLkgX19lgiDhrEXhA8jGxPP9/C/gG06JEWM8SJpwMLeSuFfENTPHuTDIbH
	Q006Msc3jBfO8Yljf514EZjIDd6An9OtBL+L3DFw=
Content-Type: multipart/mixed; boundary="===============5912867360641824940=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rsync: upgrading to 3.2.7 FAILED
Message-ID: <010101847b651f4e-127dc25e-04a7-43dc-ab73-e2f391595045-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173299

--===============5912867360641824940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rsync* to *3.2.7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rsync failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4eb58bc0d12c1789ed30b58e099d103720120960"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (886 cached, 2 parsed). 1666 targets, 36 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4eb58bc0d12c1789ed30b58e099d103720120960"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

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
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.samba.org/pub/rsync/src/rsync-3.2.7.tar.gz...
INFO: Rebasing devtool onto 38a7485471a5cfab72b02d05762e8bc6b4f7e4c5
WARNING: Command 'git rebase 38a7485471a5cfab72b02d05762e8bc6b4f7e4c5' failed:
Auto-merging main.c
Auto-merging log.c
Auto-merging hlink.c
Auto-merging exclude.c
Auto-merging checksum.c
CONFLICT (content): Merge conflict in checksum.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/rsync
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/rsync/rsync_3.2.7.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5912867360641824940==--

