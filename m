Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE54C54E56
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:18 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2152.1706810405225963034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=c6MZP+QN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=T4+SflRb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018d65d3f5b9-715f6eb9-92ec-49ee-a502-1ceb41644023-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+nmC/ovYueOetSMZZ6gZ9lTZCdap+bFJDiZFc+PbTfc=;
	b=c6MZP+QNJ7Ww3Ku/on+L/bjX7gW9tzMfJqx1Crr0OHMN4LliHo8/NbCqzpWlhXRT
	3zkBkXlnVJc8tj4MufapqZ3LrIXTK88ecwHRDWTEjuWcodMd4y2SY6UZLWRRpSqm1m1
	naBp2kFkGGfn9sQsw5WgZYeyo9F9qD5tmx98VpWs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+nmC/ovYueOetSMZZ6gZ9lTZCdap+bFJDiZFc+PbTfc=;
	b=T4+SflRbCnpHOB+qy0E+Y7oHIaKjAqCoecJBe3kGqIVz9NOMY8X+8s+YFQhzPUHe
	Cgi9Vv2DRg76IBdRfO2EemBZwFRKaT1WjP/mmg2vu8beqhh1ZybtGYJ+R/X3Wzcyv6Z
	ushTe+/1n9/6fLno4jb8Gc+8sqBXcz36XSgjaOZY=
Content-Type: multipart/mixed; boundary="===============7791325922230763689=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 1d6d2400d4027025cb8edc86a139c9c581d672f7 FAILED
Message-ID: <0101018d65d3f5b9-715f6eb9-92ec-49ee-a502-1ceb41644023-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194652

--===============7791325922230763689==
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
Loaded 1849 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e9e2e352933414a7c46568e511d9ce2dcc3ff812"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e9e2e352933414a7c46568e511d9ce2dcc3ff812"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
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
--===============7791325922230763689==--

