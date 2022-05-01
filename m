Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267C4C4708C
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.2289.1651434543820387850
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=L1nlPc+3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010180812b571d-ae92d0a5-a127-48b2-9c40-597801b64664-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1Ok9KiA2xhz0TXQbKmzcg0qFUOcAoFo0ng+XtY20f8Y=;
	b=L1nlPc+37ILy/gk4MooUWk5OyiQgldojz59muBLyolNYa/BEp2E+9Va4pK7A6Dl+
	GjuMGncXJ0XfxHBqHKtCdcUzESWrsw+3QAMQfxUt/lD2nsrn/2KP3m5e1NHMCIoY+pl
	05nkQTC7QzDDVzk5Z6mZTE7ab61ByXEbjJxxN+fE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1Ok9KiA2xhz0TXQbKmzcg0qFUOcAoFo0ng+XtY20f8Y=;
	b=A10VMA38g8Vl58RyJK7N6uadGVQzKEeJ/m39PcGCVSTjILbz25c2a9SvoOnJDhQ4
	ABpxeUKA8NVF5iZPGxfNv3ecPRyj3ZyqhhuFHkPgtrcH619rXCSYu8GIWaGF4bVT9eQ
	fMtKvA+NHhdFg6PrA6OvVvKAqx+TaD/nKWUUxM2w=
Content-Type: multipart/mixed; boundary="===============7940585831737981798=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rsync: upgrading to 3.2.4 FAILED
Message-ID: 
 <01010180812b571d-ae92d0a5-a127-48b2-9c40-597801b64664-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165127

--===============7940585831737981798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rsync* to *3.2.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rsync failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1642 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-0942b1309f7270ba428f77f36bec6fbbace65354"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0942b1309f7270ba428f77f36bec6fbbace65354"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (883 cached, 2 parsed). 1643 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-0942b1309f7270ba428f77f36bec6fbbace65354"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0942b1309f7270ba428f77f36bec6fbbace65354"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

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
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.samba.org/pub/rsync/src/rsync-3.2.4.tar.gz...
INFO: Rebasing devtool onto 7fce129b9a4534a6a51ed4a4d508fb0546956e79
WARNING: Command 'git rebase 7fce129b9a4534a6a51ed4a4d508fb0546956e79' failed:
Auto-merging Makefile.in
CONFLICT (content): Merge conflict in Makefile.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/rsync
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/rsync/rsync_3.2.4.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7940585831737981798==--

