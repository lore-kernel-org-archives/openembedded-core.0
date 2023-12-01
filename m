Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FB0C46CC5
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:57 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.22211.1701436493030763498
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QSS3dObL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UQ26r6XJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018c258488e7-fc7da198-104e-4d0a-a8d4-06020ebf37ce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PmZ6R4Wc0swLclizX/T57s9u+RM1qksvV/4NLUh1UeI=;
	b=QSS3dObL+LlfuD6wuAjOf5a4zWG/dMdtaERgXxFm8uOh65QR0yK1Rm4pOOTVzDEd
	2WogNDNY+1MFieZ27QMqrxP8cWafMb3Zd1/bbJClQXD89iUtwCa1C4T3v5gMKS/Ae+c
	gVaM5Nh8VtW8mk4Ll3r+mhkcAHvP9fgHrZm6up24=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PmZ6R4Wc0swLclizX/T57s9u+RM1qksvV/4NLUh1UeI=;
	b=UQ26r6XJWiEOCKwvBUH7zchrQqPlNEYVogG3oz5TvphVDYTylUHAo55k7OVeuanP
	FaHrTorOJnKTAi1XNQvkq92MflZGxAOimy3pXRCB4GudvD+ek7W7YzeC+yd8967gjV/
	yeL42b098DKdG/d1jMwd0gf/6yTBiTXRLa2h2xRI=
Content-Type: multipart/mixed; boundary="===============7764717583228310004=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 1d6d2400d4027025cb8edc86a139c9c581d672f7 FAILED
Message-ID: <0101018c258488e7-fc7da198-104e-4d0a-a8d4-06020ebf37ce-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191647

--===============7764717583228310004==
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
Loaded 1844 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-addf01ab1c6fe65f73dfb22a4b0a3f37a8ad884d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:addf01ab1c6fe65f73dfb22a4b0a3f37a8ad884d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
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
--===============7764717583228310004==--

