Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFF1C02183
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:35 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.11487.1735723937668325027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Lgrk9khI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=T5dkBhKZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101942135a1e5-b8c9d717-7625-480c-a1fb-5a21cde0f904-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723950;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+NGsX1CECzY7hKdpvdYV90/uc8adcxt7AAX5U3KLXYs=;
	b=Lgrk9khI2570/OvLOG8vYAoMyPU2Y8TjNdKgDjlqdoKa2+ZOJN4vtvhO+zflbLiR
	ispqagL0EQZbG6D/OjyDKJgfIFBhC2faw+pbdQRg7bqQpmbQi3o12nbEUGsD4miHo2j
	YZJh3/kwZxvf1y+gKMsvvV+dhxiqVrjtBAxR6x+A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723950;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+NGsX1CECzY7hKdpvdYV90/uc8adcxt7AAX5U3KLXYs=;
	b=T5dkBhKZgTpQg/D8YJLwsnybHN6lo9KNisKmgn2bfdeFQd7urXGxKJKNpZcgE5ut
	z5hwBBLsefp5GVZS7B3I2gCLeT0X7JI7zYUkHrv1vqk+JV/zxxDIn233xWGOhIn732J
	SPS5TX5od/34KNcRI6Txub6N03PKCv++msIa4KCc=
Content-Type: multipart/mixed; boundary="===============1031186205760398167=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 40afcb705d05179afce97d51b6677e46b5b48bf5 FAILED
Message-ID: <010101942135a1e5-b8c9d717-7625-480c-a1fb-5a21cde0f904-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209228

--===============1031186205760398167==
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
workspace            = "tmp-auh-upgrades:ff3540d6756fd098144bfea8b0996a5170b590eb"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 40afcb705d05179afce97d51b6677e46b5b48bf5' failed with exit code 128:
fatal: reference is not a tree: 40afcb705d05179afce97d51b6677e46b5b48bf5



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1031186205760398167==--

