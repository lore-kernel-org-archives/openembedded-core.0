Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB2EC54E5E
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.36629.1709330716637856504
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fu8mMNvC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=H0SkBZ0G;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018dfc0cd50a-f007b91f-f2d9-46c9-9358-e020f5689b3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yLHr2Gxf8nsNrXmhoHvywp2ib+C36+dzK8/gki9MGxo=;
	b=fu8mMNvCOHueHKt73gBE3HjvZgP93PHa9/RgYq9IW4MxwBamDCI/LBadgf40prbk
	YVBF/e5MMwn0UeVnf0dPw5awEbJHG3QK8ncM7/vlmRz8cd6LSt//oRbFJGTXvNRDag4
	gFEmMdi572Ag9PeMuvHgTA3HljlV6pS7xe6Dj/Zs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yLHr2Gxf8nsNrXmhoHvywp2ib+C36+dzK8/gki9MGxo=;
	b=H0SkBZ0Gh4xl6r3BGTDm+jKD7fuTBDIHYwoCbhlgY7i8d/hwh9nlu68/TDBi9PrR
	j9Ba2isyPU+JiqECSgrWGvageSdB2ZgzumIIclwxum40m3jmjpsOu/4zRAzLXFdjun2
	aw1yQs3ctG5t5RT6m7HajNpcxnSjwJepIi+jCSlM=
Content-Type: multipart/mixed; boundary="===============6077530772635032158=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gptfdisk: upgrading to 1.0.10 FAILED
Message-ID: <0101018dfc0cd50a-f007b91f-f2d9-46c9-9358-e020f5689b3c-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196479

--===============6077530772635032158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gptfdisk* to *1.0.10* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gptfdisk failed.
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
DISTRO_VERSION       = "4.3+snapshot-6efb960d0860fe43e93ac19651553c6ce088a469"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6efb960d0860fe43e93ac19651553c6ce088a469"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1863 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (915 cached, 2 parsed). 1864 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6efb960d0860fe43e93ac19651553c6ce088a469"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6efb960d0860fe43e93ac19651553c6ce088a469"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/gptfdisk/1.0.10/gptfdisk-1.0.10.tar.gz...
INFO: Rebasing devtool onto e20af8235aa770e65333ddc840ad3f104c3cbd90
WARNING: Command 'git rebase e20af8235aa770e65333ddc840ad3f104c3cbd90' failed:
Auto-merging NEWS
CONFLICT (content): Merge conflict in NEWS
Auto-merging gptcl.cc
CONFLICT (content): Merge conflict in gptcl.cc

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/gptfdisk
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gptfdisk/gptfdisk_1.0.10.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6077530772635032158==--

