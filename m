Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BA1CD12D8
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:30 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.1986.1711994600842351272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=O4npi7Ee;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dUDHIZGH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018e9ad4824a-b827e391-6bb3-4d78-8e10-d45108994b3f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2Ds6iDi7+gy0wIcOj7sc/wAUFLMyURFXeRXmD+CmPE0=;
	b=O4npi7EeFJObG74NCvdNpYmAQLJL2iNT+CfOm9qiApGuRMIjfewDivBbujLPWGnT
	dqIWSpnxJaCvLzUQPMq7jreXnLXBFFhsXmIHDp/BHacbhvKimaEiVbapvY8FfXFSOl8
	zujNMUg6fTFVK8ij8cipWf6JXktNgNiPH6v4yuQo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2Ds6iDi7+gy0wIcOj7sc/wAUFLMyURFXeRXmD+CmPE0=;
	b=dUDHIZGHBh5Z/S26AHxrwU+mi889UlCqI/7ZDJTONk7s1lzTnHAOCioAeyeZk5FV
	r0OGc41v4GTLUD/xNERuMcCW+kjUaWuRctTIOj+46oTuDy0U9dkwwqNjFWydCybNvKC
	0BhwcKMz2WlVC6O56zoopFaeEXhUhyzBLMt5A2U0=
Content-Type: multipart/mixed; boundary="===============0478260215544488838=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 32022caedd6a177a7717aa8680cbe179e1045935 FAILED
Message-ID: <0101018e9ad4824a-b827e391-6bb3-4d78-8e10-d45108994b3f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197750

--===============0478260215544488838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-helloworld* to *32022caedd6a177a7717aa8680cbe179e1045935* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 32022caedd6a177a7717aa8680cbe179e1045935
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7a2c8f0ccd35e857d5d0728cde34a352ed5965dc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7a2c8f0ccd35e857d5d0728cde34a352ed5965dc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 32022caedd6a177a7717aa8680cbe179e1045935' failed with exit code 128:
fatal: reference is not a tree: 32022caedd6a177a7717aa8680cbe179e1045935



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0478260215544488838==--

