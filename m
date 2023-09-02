Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05687CCF980
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:26 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.5718.1693650551528939319
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A7BAM3Qo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ns60/dvR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018a5570949d-bbed9bcc-83d0-4470-88db-627771c1a59c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Nml3y95g2kU+nZqffrhZ3zSxDiu8dBnq2EOJdT7aQeE=;
	b=A7BAM3QoWnAaOiaNK7vphqmiSA9/JMhlRhbmnUR/HZYCeuP+lcufUBFFu4gP4JF4
	ExNIvObm75hTbAN1rx4XMF7N7OuveMFsK0eVsv5bcOXJv98ebmlhwYCik0XnS27GP61
	KPFvjQPfGPEukD6D0N04XwjFd9bYKHSefpK7ZIOk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Nml3y95g2kU+nZqffrhZ3zSxDiu8dBnq2EOJdT7aQeE=;
	b=Ns60/dvRGpfHXCdG+TbzFcVvv9HaqBCZ/HhQhnSnIILPg5DESNOslrPIqTVq/P5x
	32K7S7c3XoGz+VriA9QtsAVta/+b97jbcohXBB45LkAipGfLgRSlKo+08jL6s8vXFXY
	KAbBVdz7aOn77EMat1SrDlDAE2AQKbZhzrb7r3vw=
Content-Type: multipart/mixed; boundary="===============5937938273101746886=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 1.22.0 FAILED
Message-ID: <0101018a5570949d-bbed9bcc-83d0-4470-88db-627771c1a59c-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187138

--===============5937938273101746886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gpgme* to *1.22.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gpgme failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (07:08:19.673550)
NOTE: Directory listing: ['tmp', 'cache', 'bitbake-cookerdaemon.log', 'downloads', 'buildhistory', 'workspace', 'conf', 'sstate-cache', 'upgrade-helper']
NOTE: Retrying server connection (#1)... (07:08:19.945326)
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
DISTRO_VERSION       = "4.2+snapshot-2f5c28ad2798efab5939925bc77749b6260dd0fd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2f5c28ad2798efab5939925bc77749b6260dd0fd"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
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
DISTRO_VERSION       = "4.2+snapshot-2f5c28ad2798efab5939925bc77749b6260dd0fd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2f5c28ad2798efab5939925bc77749b6260dd0fd"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.22.0.tar.bz2...
INFO: Rebasing devtool onto ea8f778e0cdec35acf4da28d5d1c13ab9531e776
WARNING: Command 'git rebase ea8f778e0cdec35acf4da28d5d1c13ab9531e776' failed:
Auto-merging configure.ac
Auto-merging lang/python/Makefile.am
CONFLICT (content): Merge conflict in lang/python/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/gpgme
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/gpgme/gpgme_1.22.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5937938273101746886==--

