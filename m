Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CFAC47081
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.11562.1650052687147625460
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=3Gr56zSz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101802ecde1ad-620a252d-90a1-4c52-9dd2-6576633be3e6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PEXJZZCjPFl6/fNhKTLcZXIl93b5GA8TQczvXS07H2k=;
	b=3Gr56zSzNjOHdQJI2lAYTCTW+n0/9+7Y5AmKSwITjABIz2TbcXjdprkVPT3L+7uH
	qCrLxBxeUKnyvL1PEAERZDLjH9aqvXgbF7406sGYxy+y5HDzdvo9a7zAh6cIUcuENsk
	cHC+AVo6p+LZ2WFIw/0avTsT5LVSiDjOQWiTB9r0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PEXJZZCjPFl6/fNhKTLcZXIl93b5GA8TQczvXS07H2k=;
	b=ErIFCx+IGS2RrqADexp4qa1e+YQLcR7/KcmF2Ru7CvCUEYdd9gzk2ZoyYRhcZu66
	4/mTNalvtfZKC2RUFuPajagFlr2sqF0OywgJA31DDmG4eT46Wh5jmpgxdIV0vpM+p+G
	JB6M4y9pZ0IHySCzqgf7U1pG9k9n46+2bqXjGSWo=
Content-Type: multipart/mixed; boundary="===============7998200946457674778=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gptfdisk: upgrading to 1.0.9 FAILED
Message-ID: 
 <010101802ecde1ad-620a252d-90a1-4c52-9dd2-6576633be3e6-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:06 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164444

--===============7998200946457674778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gptfdisk* to *1.0.9* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gptfdisk failed.
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
meta-yocto-bsp       = "tmp-auh-upgrades:9afc11124650385808d2e6cd8aa381a7145269b1"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
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
meta-yocto-bsp       = "tmp-auh-upgrades:9afc11124650385808d2e6cd8aa381a7145269b1"
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
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/gptfdisk/1.0.9/gptfdisk-1.0.9.tar.gz...
INFO: Rebasing devtool onto b37f0d4d28e928e807832a309d7936d5c6c923c3
WARNING: Command 'git rebase b37f0d4d28e928e807832a309d7936d5c6c923c3' failed:
Auto-merging gptcurses.cc
CONFLICT (content): Merge conflict in gptcurses.cc

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/gptfdisk
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/gptfdisk/gptfdisk_1.0.9.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7998200946457674778==--

