Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE88C47DB3
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.63609.1702649863334516342
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B76SknLX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AHD0xkBz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018c6dd72b03-bf53a64b-ec8d-4619-a9e0-033f4a7fe2db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vwvjs8dvPDQw+8t3/38jz1dIrrLFSmWFVmPSuqknB6U=;
	b=B76SknLXIUJgVW4Whx9wyzQDfQ+AbfEDxr5c1DVL00Phj5l3zIsh4pf+rxPQ3fmz
	MQMG6t5CmlKATPE0twLHY0pj5Dor2GCANYN3WLbR5steieVsaiTAH2imToVHtV/G0KR
	8KjYxcBCsl45MDVIA6zQOxXhAUq9z0LIQUcB0Fgw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vwvjs8dvPDQw+8t3/38jz1dIrrLFSmWFVmPSuqknB6U=;
	b=AHD0xkBz1/bgB2hrr1YxAQ9BBGluz5E+YSsWMffHY/ex0w67gmPRwannYYTYa/+A
	1OgRtYeozb7ygOjBebBzL/ZRm+boeqnjWWrg+TpXqevMjSY1ovgnm70RZj9yT1cCPkl
	/BjfMa7kNrqqhEBC/k0KvAgSLMzRJw+LJiQB2lHo=
Content-Type: multipart/mixed; boundary="===============1401777774841963546=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 1d6d2400d4027025cb8edc86a139c9c581d672f7 FAILED
Message-ID: <0101018c6dd72b03-bf53a64b-ec8d-4619-a9e0-033f4a7fe2db-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192487

--===============1401777774841963546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-helloworld* to *1d6d2400d4027025cb8edc86a139c9c581d672f7* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 1d6d2400d4027025cb8edc86a139c9c581d672f7
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1842 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-5fad32ccb600ac11c33feba97b57efb4dd3b07dd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5fad32ccb600ac11c33feba97b57efb4dd3b07dd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 1d6d2400d4027025cb8edc86a139c9c581d672f7' failed with exit code 128:
fatal: reference is not a tree: 1d6d2400d4027025cb8edc86a139c9c581d672f7



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1401777774841963546==--

