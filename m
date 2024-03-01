Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D791C54ED3
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.36987.1709330717458504742
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VKAHp95g;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IGJavBEW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018dfc0cd882-e4fb2ea7-65c4-41d1-9951-13f4cdcef966-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+ybrvGrDnu7CrMV22NIOWcklPRKaHmix7FM4+iNhyuI=;
	b=VKAHp95g7Oc4boWwMkUt7u/0dc+JiQgHCQ6RQJ+uNy6d3FmcY/EqkPUdOipt5CwQ
	xu1rNUAXx3zYJp3KbRI98lqJ9njXa1Jgbly5TdlEDs2s9+a4XJ6tHxEZahIfphdlLRI
	cfT2Hdq1SNCHbk/wLiTsWbjbdz8Y9sAQYe8IGOpY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+ybrvGrDnu7CrMV22NIOWcklPRKaHmix7FM4+iNhyuI=;
	b=IGJavBEWQS0AvN4ynfwdqBPzn0QMNwhHLoSiut4D1lS+5xvtSEWoTmjv4CiC6gYe
	1lJX1X2Jmjtake9+3zaXMfM9CakHE749hRMqV3D91ggrAoOCVYEvKOHeJnEpHMo7AI+
	LeRCU0muPcjZUHH19GYDSy209SJ8QijBpZfezbng=
Content-Type: multipart/mixed; boundary="===============3771901509258537013=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 32022caedd6a177a7717aa8680cbe179e1045935 FAILED
Message-ID: <0101018dfc0cd882-e4fb2ea7-65c4-41d1-9951-13f4cdcef966-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196508

--===============3771901509258537013==
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
Loaded 1863 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-a30b04fc3d291640473f5bae89f1a138b5986fec"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a30b04fc3d291640473f5bae89f1a138b5986fec"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 32022caedd6a177a7717aa8680cbe179e1045935' failed with exit code 128:
fatal: reference is not a tree: 32022caedd6a177a7717aa8680cbe179e1045935



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3771901509258537013==--

