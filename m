Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32ACBC369BF
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:05 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.20168.1744723973912470264
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LctoMVUX;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ZjrsDeU1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019639a739e4-9d090876-3955-4ea1-8aac-b5f51c92000c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723982;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=J4IxHLGdYdYOsuFbHLVfBx4X5epdO7auWNI9K8o9Tzo=;
	b=LctoMVUXFxN8Nyd3RGt4xQw0XfaFP3WSP2HxCPtYCufysbDl31NKfRF4ygeYNQ4N
	SOqpRqu8zsS5IhN0WStz5kYE+1FPRf+qxcmd7QOZM+SNTaF85/kEOOZ8l5nc14Iwv/x
	uycpb35By/+CFxd9LeIsPsmGNYuuR2V9HdTGAeeY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723982;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=J4IxHLGdYdYOsuFbHLVfBx4X5epdO7auWNI9K8o9Tzo=;
	b=ZjrsDeU1PLgmm0Ow3j/fd4nOiOqV9UtLKIkrYTaVM0W+G6pEe5qoFLb6qLySJhuw
	Q+tpsiIZtQCJ0DH4hGiGnAnsaqLHWS9bI8QmiR9swSeYqzYxYd87fwdRSS9QDVpudaA
	FYIovpJoL1LCp1GauH72mkwBOih08jGlFJsFviPU=
Content-Type: multipart/mixed; boundary="===============1406121189260946380=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 dd59d6852dfb14d1df8ea02959345bc72cdc5c03 FAILED
Message-ID: <0101019639a739e4-9d090876-3955-4ea1-8aac-b5f51c92000c-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214899

--===============1406121189260946380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *dd59d6852dfb14d1df8ea02959345bc72cdc5c03* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S dd59d6852dfb14d1df8ea02959345bc72cdc5c03
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
workspace            = "tmp-auh-upgrades:2dc6fc4ec31809ff29af7b8589ac076047dd9331"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout dd59d6852dfb14d1df8ea02959345bc72cdc5c03' failed with exit code 128:
fatal: unable to read tree (dd59d6852dfb14d1df8ea02959345bc72cdc5c03)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1406121189260946380==--

