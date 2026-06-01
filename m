Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF46CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:40 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1569.1780328135766942518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dvbatM6x;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=C6VqkxrZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019e83d37a2b-e0453b0d-0fd7-455d-9ccf-f1c4053af07d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328135;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TvqdarmdgATIIplMtkECCUVowExObTVUGzzHC2uan4w=;
	b=dvbatM6x4/xYSdt5Nt3QJmaBm/8sTitu+F3C7nsNDY2qbNEcknaereD5bql7ECc5
	/dCEx9/3HIxTWZk4Mj8vVg5u+UbhM3iDJS+/RuhG6l9vDOuc1Oq3tTe+Ss7kHLjVwtv
	cHCVD/TtGlSkMs/2sdzfb9Ts0bQQA5l/YTz5facY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328135;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TvqdarmdgATIIplMtkECCUVowExObTVUGzzHC2uan4w=;
	b=C6VqkxrZlA+SzECZia018npW7fnDkESqCbgKePfMPV7o6ygMfkoI6Eygh1+X/VbW
	OjG9+q1Py6/S8nFEFa8dxj3nm5Ixa55q/58w03h2gMK8g09NF25IjZ4vbtfQSB1c5cn
	2GA4oBAqgt/L6tlGoEj5Vvoxlbft1X864AZtZzG4=
Content-Type: multipart/mixed; boundary="===============6971519709117748347=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] elfutils: upgrading to 0.195 FAILED
Message-ID: <0101019e83d37a2b-e0453b0d-0fd7-455d-9ccf-f1c4053af07d-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237872

--===============6971519709117748347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *elfutils* to *0.195* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe elfutils failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1975 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-574899c18d003fc8706f4eec66b8230feaf6c550"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:574899c18d003fc8706f4eec66b8230feaf6c550"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-574899c18d003fc8706f4eec66b8230feaf6c550"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:574899c18d003fc8706f4eec66b8230feaf6c550"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  45% |################                    | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://sourceware.org/elfutils/ftp/0.195/elfutils-0.195.tar.bz2...
INFO: Rebasing devtool onto feed68fc2747484c6630c80ee6f0cacb9a00e795
WARNING: Command 'git rebase feed68fc2747484c6630c80ee6f0cacb9a00e795' failed:
Auto-merging config/eu.am
CONFLICT (content): Merge conflict in config/eu.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto feed68fc2747484c6630c80ee6f0cacb9a00e795
WARNING: Command 'git rebase feed68fc2747484c6630c80ee6f0cacb9a00e795' failed:
Auto-merging config/eu.am
CONFLICT (content): Merge conflict in config/eu.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/elfutils
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/elfutils/elfutils_0.195.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6971519709117748347==--

