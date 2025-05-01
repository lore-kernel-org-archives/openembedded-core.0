Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180B1C3ABB9
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1798.1746113609181675320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cptmRfN2;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tH9h4WCE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101968c7b9e47-ad5b35de-97fe-45a4-a5f1-f10e9a06b1bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Oy2rY7wBiqVVR0/Lrez/O2HmNL0IPJ4Su/2YxtvWESk=;
	b=cptmRfN2urocXDhBvS+OMeMKybxeofbZI3gRo6eL/c3k/RRdGC2rwchkshnQ/aOB
	RZtYwrwUWBHuOXRTOL3QDuS21rH29yrI3lsubu/PAisZPjPuZiZIhCwv/pBbufdJazv
	7cchH0m0kk0BjS+dfdujzABko5cCiGj28i01PidU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Oy2rY7wBiqVVR0/Lrez/O2HmNL0IPJ4Su/2YxtvWESk=;
	b=tH9h4WCEKegTVW9Pnq9MmopWLNFsUKGEXgkM0/aDFCl46ARkADQKmTrIrki6DqSt
	OEluvFs+ivn1J8dL3V7nGGmiyzGZRC5U++Dk8jzaSf6ovcarxsD2WnspETfW2Y2Nmlc
	BiY9Z90/jgM8unIdWXMSMPf4PgLvZhAF4lLUwcWQ=
Content-Type: multipart/mixed; boundary="===============2837441613319715500=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 cec93cb0b481ed4fe8cc0b567eddcd551757d097 FAILED
Message-ID: <010101968c7b9e47-ad5b35de-97fe-45a4-a5f1-f10e9a06b1bf-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215868

--===============2837441613319715500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *cec93cb0b481ed4fe8cc0b567eddcd551757d097* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S cec93cb0b481ed4fe8cc0b567eddcd551757d097
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cd84656a86d5e6124552e83a6c9463357c4c4cd5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto cec93cb0b481ed4fe8cc0b567eddcd551757d097
ERROR: Execution of 'git rev-list devtool-base..8db8ce9c528330f0b1261b07531b009732b08731' failed with exit code 128:
fatal: Invalid revision range devtool-base..8db8ce9c528330f0b1261b07531b009732b08731



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2837441613319715500==--

