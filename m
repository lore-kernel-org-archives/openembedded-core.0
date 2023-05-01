Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5720FC88CBF
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:03 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.107907.1682976353463098520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Hd7eqt34;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010187d9352f78-bd155b41-f17a-4c8e-a30c-f97ba985d1d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c7dih3eV7oXVPsRTXKfMfNK6IgqZSPzDD/1+DEkrgZ8=;
	b=Hd7eqt34xuSPM2fQTVrG1UJXQrkkPu+9VYfwNfKPrbMsX5zpwo/mR0mGel43jAIT
	4BBH9mUdRFc1fU6RHcz2ZcB31K6GCm9QPd0MpukxkYKM7dM6WdZ5QLe38gEVZxURP7r
	rPljWnI6Akp7KYrMo9sSFVbaecaqSmhB2xDT/BM8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c7dih3eV7oXVPsRTXKfMfNK6IgqZSPzDD/1+DEkrgZ8=;
	b=YeQ+wZCS52VfNztkUlNbbca5PIdQX/SRBI+ekrtznsOZGWz1P75RCsjLt1vJET36
	vKmRmhXChiuXrE2fIvDM32iT5mMlqdJ6wEIXeZW1rBdfYMgnxk01ETS/P1/2qZS6ZUl
	GDrPAqz0yk4GOvEIXLlL/09GpKe2/0pFwLWQSRuI=
Content-Type: multipart/mixed; boundary="===============7679844738960927780=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 1.20.0 FAILED
Message-ID: <01010187d9352f78-bd155b41-f17a-4c8e-a30c-f97ba985d1d0-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180697

--===============7679844738960927780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gpgme* to *1.20.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gpgme failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (21:07:36.011100)
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
meta-yocto-bsp       = "tmp-auh-upgrades:78b0986a99be9cc72deee61c497da0f1326fbf06"
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
meta-yocto-bsp       = "tmp-auh-upgrades:78b0986a99be9cc72deee61c497da0f1326fbf06"
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
Adding changed files:  41% |###############                     | ETA:  0:00:00
Adding changed files:  83% |##############################      | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.20.0.tar.bz2...
INFO: Rebasing devtool onto 34c2e2f57f5414e0e63bb9f28345c1dddee27a7b
WARNING: Command 'git rebase 34c2e2f57f5414e0e63bb9f28345c1dddee27a7b' failed:
Auto-merging src/gpgme.m4
CONFLICT (content): Merge conflict in src/gpgme.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/gpgme
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/gpgme/gpgme_1.20.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7679844738960927780==--

