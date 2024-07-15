Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FE9C5475C
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1365.1721071146745455117
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=N2RP3c7m;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pCLulAOH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010190b7d5932a-453b9683-24f4-466d-9263-2923a2d4ac2f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NpWrXFtopWdXNJPyMSJPOLZRfMotSoioHwHdpElY4D4=;
	b=N2RP3c7mfd4wI04s/v5QpNiQ7dsaYUtCbAkPWpqMzXB82zZPddiCmba1CLFEhjbM
	R7OJU4I4wYqWYo1TNp4iFD1wlo7n6lDjLCOQB0ac01jdgOhEpkFTwxypEWOLk1YYrTv
	rp9dQNWJHnBkA8MKwkwm96omyLQVwe0EKdbruCXY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NpWrXFtopWdXNJPyMSJPOLZRfMotSoioHwHdpElY4D4=;
	b=pCLulAOHQWIOQ2GQRBh5YQ+Hqb5gNpsPKyrBwb074toTTK3VlSWZkC7dtCnnshLo
	U25tf6JS7ES4oYIKFjpRVkPhAnSZrDM2EiiXcgGDGRhq5iZ+iZPLQfovS8nZ4nruo0/
	wV9EX+qCDMQLJ8WwR/qN4MLu4UuNv7Hg8PyM8UyI=
Content-Type: multipart/mixed; boundary="===============5850009472392597083=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fmt: upgrading to 11.0.1 FAILED
Message-ID: <01010190b7d5932a-453b9683-24f4-466d-9263-2923a2d4ac2f-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201971

--===============5850009472392597083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *fmt* to *11.0.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe fmt failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-e9bb518713cd820dc747bdb204f7b03123c5aec1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e9bb518713cd820dc747bdb204f7b03123c5aec1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto b50e685db996c167e6c831dcef582aba6e14276a
WARNING: Command 'git rebase b50e685db996c167e6c831dcef582aba6e14276a' failed:
Auto-merging ChangeLog.md
CONFLICT (content): Merge conflict in ChangeLog.md
Auto-merging include/fmt/core.h
CONFLICT (content): Merge conflict in include/fmt/core.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/fmt
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/fmt/fmt_11.0.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5850009472392597083==--

