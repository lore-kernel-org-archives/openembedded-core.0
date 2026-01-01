Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532FAEEB58A
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102975.1767267476453047688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GjHFGA9p;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CrSsaKl7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b7959aa99-d26b085f-b355-4b32-8c26-673010ab27d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267478;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vTy/646xPFbO8luAm9iRXdNOMIYP9QtKEvwZUzAnGjc=;
	b=GjHFGA9pLrmkUbBiX/Xai8pWnds1dAtCPB+VAy+c+KJ3RozAchgvYrDvkWu8A3X7
	wVCvCp0ccrfVSxwDLyvrmy7DdbFs7tqFc2IhRu+q0l/EKKOp6aKgwgt1TV2ja8OQhds
	bkXXNSr+rLnl2oIDDVQw4Dw9s9z52EHFvdQYQjUY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267478;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vTy/646xPFbO8luAm9iRXdNOMIYP9QtKEvwZUzAnGjc=;
	b=CrSsaKl7OXUuMXULf+qL55cqiTMPSO+cQk7FG2OnPg23D/nbOj2Wp8oOvhG/LN4V
	TB1PI/BrLu+KkNXDbiehczcqq41vMa6Etyk6thADdGeYv5ka1RTe02i3yKWEOHydWfx
	ymNAYdoC079iGCIfVqK4a63/rWb0Stp/vkvxTXCs=
Content-Type: multipart/mixed; boundary="===============8062900406986229267=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] glew: upgrading to 2.3.0 FAILED
Message-ID: <0101019b7959aa99-d26b085f-b355-4b32-8c26-673010ab27d7-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228788

--===============8062900406986229267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glew* to *2.3.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glew failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1954 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-9b3f292f776e51cb898dce988d86821f71a2d442"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:9b3f292f776e51cb898dce988d86821f71a2d442"
meta-yocto-bsp       
meta-poky            = "master:853589ccc3445f5952efc02a7102587cb4d4f075"
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
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1955 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-9b3f292f776e51cb898dce988d86821f71a2d442"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:9b3f292f776e51cb898dce988d86821f71a2d442"
meta-yocto-bsp       
meta-poky            = "master:853589ccc3445f5952efc02a7102587cb4d4f075"
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
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/project/glew/glew/2.3.0/glew-2.3.0.tgz...
INFO: Rebasing devtool onto ed484b97f69df2a57faee63c85352be30f3faf49
WARNING: Command 'git rebase ed484b97f69df2a57faee63c85352be30f3faf49' failed:
Auto-merging Makefile
CONFLICT (content): Merge conflict in Makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/glew
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/glew/glew_2.3.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8062900406986229267==--

