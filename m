Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9E1C63707
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:45 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5323.1668517536764453370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HdaAGXZp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101847b652595-dd151745-43fd-4dd9-8e20-0a807781026b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GjFn5CIMVEURBbYVqJ3TBmKWzHOns7DfXprkjBZPeIw=;
	b=HdaAGXZpU5EDxxAPXW+SGtM3suWkOaY4Ef1J6ENoJwf6qOqd+Unsk+NzzWtZbS1l
	dOSa4qiveGJiK4fpQU6TCqJhLIqeakAju9YCLeh90saUqHe+mBvDNDA1LfMBLzdf7nn
	8c0NGjgjqDWJaaWbd2ECLohCbKrAPPWlWFzHBrIA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GjFn5CIMVEURBbYVqJ3TBmKWzHOns7DfXprkjBZPeIw=;
	b=HQTvzoVCedWoheQSotJuFfgZ2e7Tkafak63JDFklEvHzvmUZB8zNoxhZSftLT9MB
	B+Jluh89MNmd1jR3qlFLimWkfMLyMs9pUGzK9lUTDDipzgT0CF01u9g2zrC63dYiCxb
	Ph0RLh9CcxwbFItLidoXeS4vqJ/4/fNSMDkB9YXM=
Content-Type: multipart/mixed; boundary="===============7683028778656563858=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.70.1 FAILED
Message-ID: <010101847b652595-dd151745-43fd-4dd9-8e20-0a807781026b-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:37 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173336

--===============7683028778656563858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vte* to *0.70.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vte -V 0.70.1
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:659bab3d6a32bca6a77fcb4952ab05a7aa221394"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (886 cached, 2 parsed). 1666 targets, 36 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:659bab3d6a32bca6a77fcb4952ab05a7aa221394"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 16 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//vte/0.70/vte-0.70.1.tar.xz;name=archive...
INFO: Rebasing devtool onto 187621c77ea9b8cd1ff73a566120f0a49c4fca46
WARNING: Command 'git rebase 187621c77ea9b8cd1ff73a566120f0a49c4fca46' failed:
CONFLICT (modify/delete): doc/reference/Makefile.docs deleted in HEAD and modified in 03f611e (Makefile.docs: correctly substitute gtkdoc qemu wrapper). Version 03f611e (Makefile.docs: correctly substitute gtkdoc qemu wrapper) of doc/reference/Makefile.docs left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
doc/reference/Makefile.docs: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7683028778656563858==--

