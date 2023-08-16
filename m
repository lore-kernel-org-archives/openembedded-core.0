Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD90C3DA54
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.174027.1692224343491934516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fuV0HV/t;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=WcglnXP7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a006e49e1-dcbdc218-675d-46d9-9cc6-4ac28763b3e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=inpl1bGqYV6U9ggIpsDB/jH6kl4DqqXw9YtA4DicKFM=;
	b=fuV0HV/t1f1e06VSuF0SpHkxe4AN/XpPM6YNYYfsBV6egUn1oDR2izmoCHttxCYb
	xQFmgynO7QOWVNwpfc4X87etg3yyoUn6VRbbvTCbhw8F3E45RyuLE3k+nDxTETi0kxz
	cuIztx4RUSlDMf/QCsBvQpWmwjyAEnqQ/zoKUJ4o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=inpl1bGqYV6U9ggIpsDB/jH6kl4DqqXw9YtA4DicKFM=;
	b=WcglnXP7R6Gvpc8hkMTR8d4zcjaLxocjGpAmQ0vQamDfu7eSEcDtbyDBA7QRYkR4
	dC7kyCZ98VcBF6awKHWwqDj55hz+Q9FHFJOrUNLPTwMq9W3Y7csaGTV9eA7AJOYNBUQ
	ksaKHiI8rjWOgd+aCZvQK99LE7PvGhs5K1a17I1w=
Content-Type: multipart/mixed; boundary="===============8679988949546981446=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Lukasz Majewski <lukma@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glibc-tests: upgrading to 2.38 FAILED
Message-ID: <0101018a006e49e1-dcbdc218-675d-46d9-9cc6-4ac28763b3e4-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186161

--===============8679988949546981446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glibc-tests* to *2.38* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade glibc-tests -V 2.38 -S 78ca34d8c55eee6b0664f9c1d30fcca71077b843
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (00:28:11.527655)
NOTE: Directory listing: ['cache', 'sstate-cache', 'buildhistory', 'workspace', 'upgrade-helper', 'bitbake-cookerdaemon.log', 'downloads', 'tmp', 'conf']
NOTE: Retrying server connection (#1)... (00:28:11.664507)
Loading cache...done.
Loaded 1805 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:774f46b5df332375bd05eadff796c636c2730c66"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 30 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 78ca34d8c55eee6b0664f9c1d30fcca71077b843
WARNING: Command 'git rebase 78ca34d8c55eee6b0664f9c1d30fcca71077b843' failed:
Auto-merging NEWS
CONFLICT (content): Merge conflict in NEWS
Auto-merging time/Makefile
Auto-merging time/strftime_l.c

You will need to resolve conflicts in order to complete the upgrade.
ERROR: Could not decode SRC_URI: The URL: '${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc' is invalid and cannot be interpreted


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8679988949546981446==--

