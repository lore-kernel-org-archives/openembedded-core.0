Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3F2C352A8
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:43 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.10621.1648819421865533440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=grfrSExH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101017fe54bbfc7-373539d6-4568-41db-9878-978ad4562db9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TPr8fY91fo+t3r1bXLZ0vYS2dQR2FCyPZ5zwlpid3wk=;
	b=grfrSExHvjwdRdU4M3h/05Ey51LGgkg2cTFXvbnXAL1sFuYEgWggOKIsU9S6o0dq
	dip0mboNTu0ScNtHdL+epZe9n1oWU4kLipafCCWYQPqpA/TF1S4rbmViCMgL9uHoLts
	7n28qRyeaR+zB5ZNILcFqxVfpNfO1B8oWdASGg8o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TPr8fY91fo+t3r1bXLZ0vYS2dQR2FCyPZ5zwlpid3wk=;
	b=YURiY+Z7pXnyYznKwPOH3QRgZePMKMANXAVptCwSj9D9ntM/WplOTQF9+xM7g//L
	eQSA21YX/HUWHDDjhDoKTn7NA3WK/YU8mEmNG/ciAy5Fa0YCgshPgN7ShPTOcpd94gQ
	EtoOT8koL7aYV8+LeaWuZz6/+Uqaopwa3luAB6qE=
Content-Type: multipart/mixed; boundary="===============0529377424289423913=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 445711587d461539a4d8f9d35a7fe996a86d3c8d
 FAILED
Message-ID: 
 <0101017fe54bbfc7-373539d6-4568-41db-9878-978ad4562db9-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163917

--===============0529377424289423913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *445711587d461539a4d8f9d35a7fe996a86d3c8d* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe piglit failed.
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
meta-yocto-bsp       = "tmp-auh-upgrades:be63bc315f8db40f90fd2855eb69deac3eed1571"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 445711587d461539a4d8f9d35a7fe996a86d3c8d
WARNING: Command 'git rebase 445711587d461539a4d8f9d35a7fe996a86d3c8d' failed:
Auto-merging tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
CONFLICT (content): Merge conflict in tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/piglit
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/piglit/piglit_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0529377424289423913==--

