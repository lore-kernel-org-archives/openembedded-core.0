Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EA7C4708C
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.11559.1650052686015644738
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=qlzms2Ny;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 010101802ecde767-616f9da5-0f62-4176-bad6-329ff56c739c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kc0KbcDiJIyOPDSSpId4eXlDyVi4ztqz1ti9jzpafh4=;
	b=qlzms2NyF0/97WYxSqdJz7K1pt+Domb5/ovtNvSaZyL+1D7mHupF0GOdjqoddpQO
	FktUquTV3fiAQSA/6YOCflkkRJcL1Vz1BhgDAFpcnI4xtMDmIB+1cG5X1JGE33NxbXc
	Zgu40stvcCMKMJNFbocq+gV5hgs8xqHOKUyv5+Mg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kc0KbcDiJIyOPDSSpId4eXlDyVi4ztqz1ti9jzpafh4=;
	b=eZ7P3Dng96lb8VloLLYMg7vUImXdaIpvcJahR5+dZYfu+zaITvHMftf2YnO1xcx6
	LHGpapXNn453nrjRFCf2Xnf78gh0w7YRY9eZlOCCxKJ/hFRHQyyEBtJvQo7qK7RwBOI
	3SGb/DYfcCGQJ9QvE6cI/J9U/Cao6Ogc0g29GQfI=
Content-Type: multipart/mixed; boundary="===============6452306456165090062=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] valgrind: upgrading to 3.19.0 FAILED
Message-ID: 
 <010101802ecde767-616f9da5-0f62-4176-bad6-329ff56c739c-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:07 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164468

--===============6452306456165090062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *valgrind* to *3.19.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe valgrind failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1640 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c6bd8776dbe0cfe424b7ab1a30a55d9b049dc6d0"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (881 cached, 2 parsed). 1641 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c6bd8776dbe0cfe424b7ab1a30a55d9b049dc6d0"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

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
Adding changed files:  28% |##########                          | ETA:  0:00:01
Adding changed files:  57% |####################                | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://sourceware.org/pub/valgrind/valgrind-3.19.0.tar.bz2...
INFO: Rebasing devtool onto 011a66d594341a26962958eaff8e82277142c2ec
WARNING: Command 'git rebase 011a66d594341a26962958eaff8e82277142c2ec' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/valgrind
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/valgrind/valgrind_3.19.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6452306456165090062==--

