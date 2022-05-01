Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDCBC3E8A8
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2293.1651434544729379050
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=x0yFYSmh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010180812b5c8e-79c247b0-2001-4188-9494-2843c7751222-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kIDZgaY/yKkKSGjsy+tywqA7qEzliGeNIlLvtIAb79Q=;
	b=x0yFYSmh+3h2Mx1WxyRgLxLyY8hXYkoZjJb6nMCSBPVXfJDWaWiuQUxQ/6pMf3GD
	OSCI2ahOP74skAdBAgG/OtVkYVIpaqvU6eVwxEquwbX03EUod1WVCjj78ci6vuPOW3I
	Qk1qJ2WnCYMVU447TpfnGbukU5vX7sd3gRxfBJwU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kIDZgaY/yKkKSGjsy+tywqA7qEzliGeNIlLvtIAb79Q=;
	b=iN2POQGTEvesJcgcVRkTsC9zWz0yvn9F5tLj3S2ITQwH4o+ZSMqabpmC4qQZ1gXR
	BT5SnzErw3/kCLER6Qt82+t6eCNeO5/S/39+ohlBEU21yD1mtxN9/J0VxpoJ4t+BZBk
	dBQSWJXLjEdH72LEJpWUUwqqdHIXNd/YRQB/pGRs=
Content-Type: multipart/mixed; boundary="===============5888469966488307524=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.3.6 FAILED
Message-ID: 
 <01010180812b5c8e-79c247b0-2001-4188-9494-2843c7751222-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:04 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165151

--===============5888469966488307524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnupg* to *2.3.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gnupg failed.
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
DISTRO_VERSION       = "4.1+snapshot-e2007bb16f0b3d5c3a8c875930fcc1db8681ae5f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e2007bb16f0b3d5c3a8c875930fcc1db8681ae5f"
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
DISTRO_VERSION       = "4.1+snapshot-e2007bb16f0b3d5c3a8c875930fcc1db8681ae5f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e2007bb16f0b3d5c3a8c875930fcc1db8681ae5f"
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
Adding changed files:  44% |###############                     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.6.tar.bz2...
INFO: Rebasing devtool onto c781c6c8ed9fd0305c35745392d93e25c3576611
WARNING: Command 'git rebase c781c6c8ed9fd0305c35745392d93e25c3576611' failed:
Auto-merging dirmngr/Makefile.am
CONFLICT (content): Merge conflict in dirmngr/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto c781c6c8ed9fd0305c35745392d93e25c3576611
WARNING: Command 'git rebase c781c6c8ed9fd0305c35745392d93e25c3576611' failed:
Auto-merging dirmngr/Makefile.am
CONFLICT (content): Merge conflict in dirmngr/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto c781c6c8ed9fd0305c35745392d93e25c3576611
WARNING: Command 'git rebase c781c6c8ed9fd0305c35745392d93e25c3576611' failed:
Auto-merging dirmngr/Makefile.am
CONFLICT (content): Merge conflict in dirmngr/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/gnupg
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/gnupg/gnupg_2.3.6.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5888469966488307524==--

