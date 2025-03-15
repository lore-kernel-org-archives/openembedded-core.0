Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316F2C369AB
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:32 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.10344.1742048304574414035
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gTC7MChG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WMsRRBek;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101959a2b9fbe-d5aa04a4-3e4b-47ac-bb61-f020ec4f5cba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eE6q6fWt0QzwCTSseL59Z6qAeXagxXSdzHlC28qHh+8=;
	b=gTC7MChGYCaO51/UYGSpS5Z1OSR5730QUQe+ndcHyTIBJMZ0l52oKbccGo0joqmP
	ZHvlBPjboB3cMFzT95i28ulTmkS0DaASNJSxEeMp9yqI2dRwRu1RXcAZ8pcotDa+Cn8
	bgFIMvSCGLlBVSQQvPtf6sAjLOpNM+5RHKmImqCg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eE6q6fWt0QzwCTSseL59Z6qAeXagxXSdzHlC28qHh+8=;
	b=WMsRRBekjpEEySEviW7boRn1o/Wjp9jKUxcjAiMOGmKDRgMowt+O0ERS1VygJyiJ
	LDE0poOtRlyjh/McKEq4pK7vu2YlecdXT1Ps7uyfTqxkXxe+6CTsQ/cFlaFmDTLClvm
	xxj7lagV/33hHud3WZoZMB7Xa19s2IWqQr/rJ2aA=
Content-Type: multipart/mixed; boundary="===============5243263645545477984=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 40afcb705d05179afce97d51b6677e46b5b48bf5 FAILED
Message-ID: <010101959a2b9fbe-d5aa04a4-3e4b-47ac-bb61-f020ec4f5cba-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212930

--===============5243263645545477984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *40afcb705d05179afce97d51b6677e46b5b48bf5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 40afcb705d05179afce97d51b6677e46b5b48bf5
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:d14400f786536af7718984d4bf7be5b2875629c5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 40afcb705d05179afce97d51b6677e46b5b48bf5' failed with exit code 128:
fatal: reference is not a tree: 40afcb705d05179afce97d51b6677e46b5b48bf5



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5243263645545477984==--

