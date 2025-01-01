Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8792C02187
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:35 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.11329.1735723934603909309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CbHxNqPV;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=J5LyQ2nd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019421359c18-f61bf937-340e-4cdd-b9d3-b6a525759366-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723949;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0V3e3aw3jYU/opsB7A/9h1B7uVlq7NDdkjhydY9CXOs=;
	b=CbHxNqPVW6avG0kF8g+t/TCh9kwvawsscqjAFxvot+2IfRgF8FUioyWrKRGcxS15
	lIQPdvRotH7b5ZcbhismxmuGmVkAUIU1jrLbNfefiM10WTApX9Zcah23tXHH6R2TT65
	8/oPd0sd5xoXnHYUEJRpmZFbHX4XpH6eBnjgXoMc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723949;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0V3e3aw3jYU/opsB7A/9h1B7uVlq7NDdkjhydY9CXOs=;
	b=J5LyQ2ndOtNcPnMIOnMBW/ATBnxC8JcUZFf3WZKjHl4O4ItnX7jL/jqxCZmagttx
	hfOXWSM4rSwLehlrI2nkNrEUXndg5YPrQLYf/FwNe4rJah0TaErxaqphbrEQz2iHo4V
	5qXFGj+rq0q5hIlbYJ/YCcIN4Mmw92P2sDxPxc8A=
Content-Type: multipart/mixed; boundary="===============6993041001281966252=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] valgrind: upgrading to 3.24.0 FAILED
Message-ID: <0101019421359c18-f61bf937-340e-4cdd-b9d3-b6a525759366-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209223

--===============6993041001281966252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *valgrind* to *3.24.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe valgrind failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:934d021b8a654a550f27d1ffb35aed14373d41c4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:934d021b8a654a550f27d1ffb35aed14373d41c4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-390n4wd9: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-nnj268a8/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-nnj268a8/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  23% |########                            | ETA:  0:00:00
Adding changed files:  47% |#################                   | ETA:  0:00:00
Adding changed files:  71% |#########################           | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://sourceware.org/pub/valgrind/valgrind-3.24.0.tar.bz2...
INFO: Rebasing devtool onto f7cdee95fece15947670562e58a2470eeb8944b7
WARNING: Command 'git rebase f7cdee95fece15947670562e58a2470eeb8944b7' failed:
Auto-merging tests/vg_regtest.in
CONFLICT (content): Merge conflict in tests/vg_regtest.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/valgrind
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/valgrind/valgrind_3.24.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6993041001281966252==--

