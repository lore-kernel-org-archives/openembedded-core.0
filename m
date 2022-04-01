Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC87AC4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:41 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web12.10467.1648819420653214980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=uv7hurVX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101017fe54bbae2-e8ea09f2-5e75-4c5f-bc90-f817dad057ed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ViFW5SNpCJV8v5S3KnIFCz3GXDHjd2Yk7oQcHVrj1EY=;
	b=uv7hurVX9Z8yD3PBoeVJjicXVnligSdfWkcJKWu0UYaT4nR9VBJKvvS8nQkzaAX1
	PJ6lOPMChkTKcqM1lMMXOOTmYZsz2U7+bsx6Elq0Uxdb3Tsm97lyPlcE/Y/x4In6pxR
	rb3mGiZIDnBbpKDrN5BBBvZ9ohkgXq83/YlzDn+0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ViFW5SNpCJV8v5S3KnIFCz3GXDHjd2Yk7oQcHVrj1EY=;
	b=ArO9sshwAf0XLBhR4S7GT/r/xlp8JoGmm1yrJkNK4Dyfkihh5JkWni8u4f/BUw46
	RU4jNDH0xLephgzHZHVA/25N38Kdu9aT2cizX8OAwSupdsKQkkGcUvS8hFIixBUxQIn
	2w8adJpii9obCZz5Cg5/FsJEwdlXEhwtXEvPPoBg=
Content-Type: multipart/mixed; boundary="===============2880711950649432311=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 14.0.0 FAILED
Message-ID: 
 <0101017fe54bbae2-e8ea09f2-5e75-4c5f-bc90-f817dad057ed-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:39 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163894

--===============2880711950649432311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *14.0.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade llvm -V 14.0.0 -S 329fda39c507e8740978d10458451dcdb21563be
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1640 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7401936a0c52318f8451b82eb27025111b5d4e15"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 329fda39c507e8740978d10458451dcdb21563be' failed with exit code 1:
error: Your local changes to the following files would be overwritten by checkout:
	llvm/include/llvm/Analysis/TargetLibraryInfo.def
	llvm/tools/llvm-config/llvm-config.cpp
	llvm/utils/TableGen/AsmMatcherEmitter.cpp
Please commit your changes or stash them before you switch branches.
Aborting



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2880711950649432311==--

