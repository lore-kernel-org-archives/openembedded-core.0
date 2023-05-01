Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A65C77B7C
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:02 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.107910.1682976355964977498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=b/6tV0pW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010187d9352fe8-1c0d184d-6ff3-4150-88d9-4f35923fd3be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=i/vUHBQ/rAhZZaSlicxo+MYi1N2lXpE5fMB1sPBQOC8=;
	b=b/6tV0pWkR3YdHz3Y3pIiA4dmiOsXAIHeQA4scIFf7ch8xfoEmC7jPIx/UlZjjA+
	S5WgxgNjkL/k/WwdehoAF3H+Fx7RwZHVQo+JbgegzFF2qyDZ4CMJhBeFmr7gY7k9lo2
	DpW79LKre91h8QbvbiOHFe3xvIzcwJXK3pUyLrcQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=i/vUHBQ/rAhZZaSlicxo+MYi1N2lXpE5fMB1sPBQOC8=;
	b=IJoBAkTeZjxGHqVT5+f3Q2jHyhxEEYtFYk4w35pjrFtOSoYCWXD2gs2+OSkZEoGl
	0G5FKsJRsGV7Fqsw4anAncaMPsQQFQL9/Hdp8YrdLWQuJ3VTn8Ufe/IEB/KyjBGh2kS
	mtERjrgMKUAfeqR7yq7494QGc1sXB21ySiuDBgCw=
Content-Type: multipart/mixed; boundary="===============1959180489274509696=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgcrypt: upgrading to 1.10.2 FAILED
Message-ID: <01010187d9352fe8-1c0d184d-6ff3-4150-88d9-4f35923fd3be-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180709

--===============1959180489274509696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgcrypt* to *1.10.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libgcrypt failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (21:13:17.519775)
Loading cache...done.
Loaded 1799 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f954252493690732a470733584d50b7c557ff6af"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
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
meta-yocto-bsp       = "tmp-auh-upgrades:f954252493690732a470733584d50b7c557ff6af"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.2.tar.bz2...
INFO: Rebasing devtool onto 7b38754fb5ae166631e62903703b6968ef122e21
WARNING: Command 'git rebase 7b38754fb5ae166631e62903703b6968ef122e21' failed:
Auto-merging src/libgcrypt.m4
CONFLICT (content): Merge conflict in src/libgcrypt.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libgcrypt
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libgcrypt/libgcrypt_1.10.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1959180489274509696==--

