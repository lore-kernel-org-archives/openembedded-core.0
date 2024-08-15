Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9013AC5321D
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.131424.1723748334192821858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PZNZufUq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lF95Jn3R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019157684075-9a55e5be-6500-4409-8003-4cbb143ec741-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YcYW7vsa1Y9FThbA7o6ZWj331sPFdoAzW3jMNd/S878=;
	b=PZNZufUqiaFhfbDt5Xm0sBzfV7ryp0uOxPKvPPu0QgNJR/XLuxq4Gr4s+QAyI5mc
	z2se6PztiDR+cIKSdlqIBLuKRB0BCA4xQ0VZQs23IaglSRfRRGFplFmOrJuaUcyoFUi
	Ao8NeIs5/tb+clgr38TKC0BnJtZ7LatBuKMrSPT0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YcYW7vsa1Y9FThbA7o6ZWj331sPFdoAzW3jMNd/S878=;
	b=lF95Jn3R1KbudHo55pjhlKjIJnFl5InLObiPt5z19XYSBmBgWTrVND71vgdcA+V5
	7UOo2oBrFNcOa8QpBQ/T8RCDuB0Ajtg3Rv3vwDuVAYV6FqWUBkgZCZNEDJkTEA6nO5S
	Vh5bqsQ4X/LhpZXg7jGU02c7Xdd3U0h3qPhdZLc8=
Content-Type: multipart/mixed; boundary="===============7905250251929586328=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] p11-kit: upgrading to 0.25.5 FAILED
Message-ID: <0101019157684075-9a55e5be-6500-4409-8003-4cbb143ec741-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203443

--===============7905250251929586328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *p11-kit* to *0.25.5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade p11-kit -V 0.25.5 -S 0dd113361057e477f40ff4d8788f3e7e400af5f9
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-1e5cf1b0e2c264155ff1e8397898908e0946f403"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1e5cf1b0e2c264155ff1e8397898908e0946f403"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 0dd113361057e477f40ff4d8788f3e7e400af5f9
ERROR: Execution of 'git rev-list devtool-base..f973d0f6acebbe7ab2f4ab027b5adb32b97a758a' failed with exit code 128:
fatal: Invalid revision range devtool-base..f973d0f6acebbe7ab2f4ab027b5adb32b97a758a



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7905250251929586328==--

