Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C2DC4708A
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:43 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.10556.1648819421774183840
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=zy5Boq38;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 0101017fe54bbdc5-922e7837-6c8a-4d80-b88b-7117987ba41b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EnTR8GH4hbuwycZzrDe6tsZZrPaPR5FEkHz5goBefcI=;
	b=zy5Boq38HWcqjSKRGE1EIkZd7eSXIVmcporilFFayjhNFs3MiEOAW+nCXY/dMmd8
	V/iqcYwTCnrDX94gd1fqP0zxsDiO/hpIJZOOAts+X1TEybtC1sHapBRdP3F/zZNDnbh
	wp3PTCh9VAdjhkNTxRH4wkFpZyDph9QtxW2uaoIA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EnTR8GH4hbuwycZzrDe6tsZZrPaPR5FEkHz5goBefcI=;
	b=eoq8iQ0uubDMoggWFNNcQNqvEaQYS+3MsLVhPtW3L1p18bctr3WLprOIky+Q1cMA
	GgUYxSXM5X8mQsjn8ES1iiY35DlrItNHqsuBArAh5RoDf1Kdq/WrJYKUzPCt7IwLyQ7
	r/+ZdFbJO2INUQjkusaWqdvy7jaRFLNv3M8tsP84=
Content-Type: multipart/mixed; boundary="===============1817245418523060783=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 ad95e7f791d8e1e7e7ec7f7cedfc2f6b29f6c9e2 FAILED
Message-ID: 
 <0101017fe54bbdc5-922e7837-6c8a-4d80-b88b-7117987ba41b-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163925

--===============1817245418523060783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-helloworld* to *ad95e7f791d8e1e7e7ec7f7cedfc2f6b29f6c9e2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S ad95e7f791d8e1e7e7ec7f7cedfc2f6b29f6c9e2
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
meta-yocto-bsp       = "tmp-auh-upgrades:442bc0f975167ff8dcaf799613eb58f65bf4939e"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout ad95e7f791d8e1e7e7ec7f7cedfc2f6b29f6c9e2' failed with exit code 128:
fatal: reference is not a tree: ad95e7f791d8e1e7e7ec7f7cedfc2f6b29f6c9e2



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1817245418523060783==--

