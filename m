Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4C2D10DDC
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:10 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.148765.1733047562367592312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CtCmud8W;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1uOHg1Jm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019381af3224-a4afc34c-21f0-4419-8d02-ff249358ba33-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047562;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ujvW2eJEyLw3YZZzRG6aZvNN15VEvOrjIjAzYX4zWBA=;
	b=CtCmud8WM6OwmBZV7RizOPIi/Ool/XAiwPuIG4Dx7YluXs+M8xhlQPxVK+BR24S1
	5Ii1MHr35psuAKSxMAOZTMKwLWCAM8UmyF/hOlGdPyqPKJfwJ/X58XUDHP24Tq7xgL5
	a8/c5BZ4A3qVHyYk5SvbUWD3xdYJ/O/hRxOnpfxM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047562;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ujvW2eJEyLw3YZZzRG6aZvNN15VEvOrjIjAzYX4zWBA=;
	b=1uOHg1JmaTNzOakXaYmBxIMci3zou4ToNLqQV0wkG1UgFuV4dcqBfIIdv5CONes6
	IXnBLAfHY174taiLcZtbj5WyeQ1PquoJZps6JoC1tKHr+sbiTfCUD3KM+0tugZG/cnf
	wdYJcECnt9j5gRkSUQy77oawXRtRIBGtfbA+ZMeo=
Content-Type: multipart/mixed; boundary="===============8172941367402455568=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 d7b0ac1278591aea848a99258ccfdee8e4d454c1 FAILED
Message-ID: <0101019381af3224-a4afc34c-21f0-4419-8d02-ff249358ba33-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208086

--===============8172941367402455568==
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
Loaded 1877 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:a6ce576ac07b77e61017ebe08c2ed9f354c2fa97"

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
--===============8172941367402455568==--

