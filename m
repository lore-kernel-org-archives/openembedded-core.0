Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA1CC282CD
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:34 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.8066.1739623343288912062
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Af4AY1FO;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=MCme7AFA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019509a1bd99-47e716e0-4896-4279-bbed-737943407566-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=d3xtbBPMONE4zNgR0zhvUj94Et346S9LlQaLNQ6kuNA=;
	b=Af4AY1FOOTb7+vhpFy18cCUAhrp8igLHjBIPdLse8a4umdODvJdq2QC+BOjiX0k1
	sn/tVUa0Bjjyt8ZvG9/g3/YqO2P0soHF0XnrcNvPwOgpkI9o57EZFDpiBhtthEo3cKl
	BbM3PwGoGT2DNw+pvY+KkHEoWLT1Gqp0KWNlUPtM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=d3xtbBPMONE4zNgR0zhvUj94Et346S9LlQaLNQ6kuNA=;
	b=MCme7AFAoeTyOQXjIYdiwgvs50TYNW2vWs8zFydOglFvTRBAFPJOPyWdgHLUb6jG
	UyTOPRgtaYgnecjnpxZCq+crRDKUsjOzFG8xG+AR9dBWwC3CC+OkaDNlcTuBPN43uW8
	62xHn61KkokhaJEmSTMHxHgrTbosRBgKFxGLAVWo=
Content-Type: multipart/mixed; boundary="===============0357026822753198204=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] babeltrace2: upgrading to 2.1.0 FAILED
Message-ID: <0101019509a1bd99-47e716e0-4896-4279-bbed-737943407566-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211466

--===============0357026822753198204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *babeltrace2* to *2.1.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe babeltrace2 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:25c35baccd5cb286e5b71e2463e6487384bf402c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0
WARNING: Command 'git rebase e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0' failed:
Auto-merging ChangeLog
CONFLICT (content): Merge conflict in ChangeLog

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/babeltrace2
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/babeltrace2/babeltrace2_2.1.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0357026822753198204==--

