Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BCFCA1009
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.89786.1756850180134297790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jdx5v/SJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hbz5VqyX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101990c6e4cd5-6df800f1-e622-4868-972d-b2d136717144-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850179;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IdeZWXUBlRP6/VMkVwYIMGuI3YEEbRDtZkRNE5qJV4M=;
	b=jdx5v/SJ9KRpDlFqnM2mSvLTDDBZ7Ho9jeBZwXCDf7U6IWNlUVkWaC65BL6xVcQE
	E1CSjqyGkXlVLxFK850V63wHL3bthyMH4/TY8GM81emvMI7KWGHpa5f/vGdBX38f/Ae
	ql9w3wSHlzc6tDD479V2YBc6aZ7CU2H3eC78bgD0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850179;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IdeZWXUBlRP6/VMkVwYIMGuI3YEEbRDtZkRNE5qJV4M=;
	b=hbz5VqyXQ2Uq9d1uemSns2qI9iy+Fbz4un6KIps3iyNIg12I/PlLq1/lwwydPgUI
	224MvIbANrm6jpup0nXfFIypfduZ+MyfndJCba1UJKQW9LOhf1FoU8nck2ttLDoaIbi
	0rLM0cWrOfBaz5ZI8xvU01EGcVQmDa29o16P87PE=
Content-Type: multipart/mixed; boundary="===============7189865679982449679=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm-project-source-20.1.8: upgrading to 21.1.0 FAILED
Message-ID: <010101990c6e4cd5-6df800f1-e622-4868-972d-b2d136717144-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222754

--===============7189865679982449679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm-project-source-20.1.8* to *21.1.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade llvm-project-source-20.1.8 -V 21.1.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1940 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-4ad510a63fd88b7907b2a1b8feceace9758397d0"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4ad510a63fd88b7907b2a1b8feceace9758397d0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 112 tasks of which 110 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250902143442.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250902143442.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: S should be set relative to UNPACKDIR, e.g. replace WORKDIR with UNPACKDIR in "S = ${WORKDIR}/llvm-project-20.1.8.src"
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work-shared/llvm-project-source-20.1.8-r0/devtooltmp-mdo62toj/temp/log.do_unpack.2338382
ERROR: Extracting source for llvm-project-source-20.1.8 failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7189865679982449679==--

