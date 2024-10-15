Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5611D1F9BB
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.11793.1728994550468410346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JT1Re0tU;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fDdiOubT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010192901b5303-5bc17b98-5456-4396-8f22-d2acd884dcd6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8ZLuSfsUeJj+v7QN5Id7u1Njsr6zTPdmEdNtsiGMWBc=;
	b=JT1Re0tUGzMpuWjIi5oEvSA0j1/VjjFpDSes++d8i7BtwDXJZMXgApjZ7W6qKR81
	UtrBB72M99QsfzxxsoF9hvXKeDtQek3Ea0NLAD/Q/az0mbHsSlhWFd4VwEQ2K7xw59F
	/Hr7YqWSVdAlyAgF3nQXkxRy1fpw4eWnRZuDyWG8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8ZLuSfsUeJj+v7QN5Id7u1Njsr6zTPdmEdNtsiGMWBc=;
	b=fDdiOubTh/myN/D8NzH2NQjbyF4Z/o8dRvsTGs9juNGc6zQsF05E93xlbVz1AhC/
	R3u2zeOtW0CaWkxLEcMyJMKBsEAr/0pNele4ubdIjQ3jyuIAZmLnI6iUyr0rc/tEPGK
	N6GxemIFvnZDelpS2eV0LnX8WDXhUyM2nrz3dL/4=
Content-Type: multipart/mixed; boundary="===============8404541982455831874=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 d7b0ac1278591aea848a99258ccfdee8e4d454c1 FAILED
Message-ID: <01010192901b5303-5bc17b98-5456-4396-8f22-d2acd884dcd6-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205865

--===============8404541982455831874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *d7b0ac1278591aea848a99258ccfdee8e4d454c1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S d7b0ac1278591aea848a99258ccfdee8e4d454c1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:d419658800718b0e74795f223824509a4e8d77fc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout d7b0ac1278591aea848a99258ccfdee8e4d454c1' failed with exit code 128:
fatal: reference is not a tree: d7b0ac1278591aea848a99258ccfdee8e4d454c1



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8404541982455831874==--

