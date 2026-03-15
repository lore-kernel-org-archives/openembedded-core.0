Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DE8EFCBA6
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:55 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28796.1773582114739051237
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wHGZeJgu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=sMsrvbzW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019cf1bb5ce7-bab20a10-79b5-42fc-96fa-d60460020349-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pZBwuuiaOwamx/5bOH6b57UfXHdBNdST3Bb+x4rTbZw=;
	b=wHGZeJguB1A34qtFckMfKBntlkliu67TNOjLnlawBgaS+lQ7Aoh5KwsXXBPDkFcr
	rKvJPouMbD7+jHoIfSz/GBM6dtqEeV3Gi0TdvwFN7XUkw9CDunl0DhJVysYrp5KDEXK
	i/ZAkjwUiR7FIa3+9rXm5zyTHW2Op8QjLVI+F3tg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pZBwuuiaOwamx/5bOH6b57UfXHdBNdST3Bb+x4rTbZw=;
	b=sMsrvbzWpUnL0AlxtK0iWnQkk7HqUcswgzB7w4k354HQFwIRWs3uh2/26B5WtAR9
	IAOvC1Xi4sH0l9Dyxi2bqgo/E1quVRTCZm4YOEsHwkj31W0SvZaaQmWspFniLKKupFk
	v0LlAsxUOehXJ1NLHwoLA0+AQBbPHn6m9Wr3jQWI=
Content-Type: multipart/mixed; boundary="===============7240205462449602916=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debugedit: upgrading to 5.3 FAILED
Message-ID: <0101019cf1bb5ce7-bab20a10-79b5-42fc-96fa-d60460020349-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233129

--===============7240205462449602916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *debugedit* to *5.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe debugedit failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1971 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-03bd2a89737a10fa293e825a1e575cd8a8688f1f"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:03bd2a89737a10fa293e825a1e575cd8a8688f1f"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1972 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-03bd2a89737a10fa293e825a1e575cd8a8688f1f"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:03bd2a89737a10fa293e825a1e575cd8a8688f1f"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://sourceware.org/ftp/debugedit/5.3/debugedit-5.3.tar.xz...
INFO: Rebasing devtool onto 57f4b93cdcdeb9ea84884f426922db89f9724b9d
WARNING: Command 'git rebase 57f4b93cdcdeb9ea84884f426922db89f9724b9d' failed:
Auto-merging Makefile.am
CONFLICT (content): Merge conflict in Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/debugedit
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/debugedit/debugedit_5.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7240205462449602916==--

