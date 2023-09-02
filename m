Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B2BCCF974
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:15 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.5671.1693650552758403265
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=d3RXA+2b;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FQgSRbHp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a55708d52-cd4ace86-3568-4228-a6b3-f2930bb23410-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5xyIFsd6a9PVNVz1JkkmcaMSIrxltLiYohaTwV3FMVw=;
	b=d3RXA+2bkVkBNDw0C2yEv1AiDBuNMQlSZLcTUENRv78dLeJONbyCuufb8woR5sy3
	qAhEAACKzGVZ/SKm1iDR7RRLjqCzbhdrjyO1d0+QGNQYoDl5/pV+2s0tE1WKXFDzl61
	pVgljXbJp6FbaISfpaWQNMo4i8L7bZ/b2HGKPksM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5xyIFsd6a9PVNVz1JkkmcaMSIrxltLiYohaTwV3FMVw=;
	b=FQgSRbHpaxgrT8s5i55Dgqwufo0RT4fDh61mVXGQXRYXQ83dlQaTSssB+O/CuKqm
	WeFO0H7rBsHL9erJmiirAShXzVzY9TVc+QkfrdIsqrIjZHPtxRo2tUqQ8MqfhEEATYG
	n8mqMp7BuOe6PPaqz+oTtomgY2cv3QkRPFMo0SfU=
Content-Type: multipart/mixed; boundary="===============2170137075221806080=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] screen: upgrading to 4.9.1 FAILED
Message-ID: <0101018a55708d52-cd4ace86-3568-4228-a6b3-f2930bb23410-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187093

--===============2170137075221806080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *screen* to *4.9.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe screen failed.
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1807 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-616bba65af97f50c3dad8e9618eb29686d7ff266"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:616bba65af97f50c3dad8e9618eb29686d7ff266"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
Loading cache...done.
Loaded 1807 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1808 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-616bba65af97f50c3dad8e9618eb29686d7ff266"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:616bba65af97f50c3dad8e9618eb29686d7ff266"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/screen/screen-4.9.1.tar.gz...
INFO: Rebasing devtool onto ad0735b16a7c4cc8bc01ffd595683c6f5d9c447e
WARNING: Command 'git rebase ad0735b16a7c4cc8bc01ffd595683c6f5d9c447e' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/screen
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/screen/screen_4.9.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2170137075221806080==--

