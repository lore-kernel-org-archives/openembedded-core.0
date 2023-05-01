Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0318AC88C83
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.107883.1682976348773182789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=afUHp5tC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010187d9351721-714e98fd-a2dc-448f-8836-4c97ea9a425a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976348;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rm7cLzahAukv8vEfnAGsj+W/0asGF7Qfljv0LOVYHdY=;
	b=afUHp5tCYF6utjxu//HYWwvfslfTud+opmLvnT0UzDfyMHOuClv2jWuAlAt4aXmc
	8PJ6xUiXx3B1d9zaX6cazFv4KyWoK15MS/9Dbt8t0fv6m9k4+paX90CcytPiV0Ci+sy
	UL9QUUDlgGyS2/If87zbQ/pOYaTSfx/fnb189XYI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976348;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rm7cLzahAukv8vEfnAGsj+W/0asGF7Qfljv0LOVYHdY=;
	b=Gmggld1glCQ5UcoziBMFeZJNUh/E2XN2YHJBMEZNhOs9Z31/ZbuRCmVQLG3gCiYN
	hFE3BNi/PlGLieULD3TfHdVNfjw8/i8UkYuE8Vj1xi0MXXkMEIPVH2WuLkUjN+WHTPv
	YAw1tD1jlBD8C5r7ypBdeUBwWoZ8oOmcucRsIl3I=
Content-Type: multipart/mixed; boundary="===============3885139060262263906=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ppp: upgrading to 2.5.0 FAILED
Message-ID: <01010187d9351721-714e98fd-a2dc-448f-8836-4c97ea9a425a-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180590

--===============3885139060262263906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ppp* to *2.5.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade ppp -V 2.5.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (07:08:50.346073)
Loading cache...done.
Loaded 1799 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dd50b79a42a48f0c9e7e4a580eab65266b9f34f9"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1800 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dd50b79a42a48f0c9e7e4a580eab65266b9f34f9"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  42% |###############                     | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.samba.org/pub/ppp/ppp-2.5.0.tar.gz...
INFO: Rebasing devtool onto fc45375ba415b1d98d8b13d4a8f5c4b54ac86211
WARNING: Command 'git rebase fc45375ba415b1d98d8b13d4a8f5c4b54ac86211' failed:
CONFLICT (modify/delete): pppd/Makefile.linux deleted in HEAD and modified in fde63d7 (ppp: Fix reproducibility issue).  Version fde63d7 (ppp: Fix reproducibility issue) of pppd/Makefile.linux left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
pppd/Makefile.linux: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3885139060262263906==--

