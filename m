Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5087C3ABAC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:43 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1780.1746113612927889784
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OU40Xzru;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DSIw/WYS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101968c7b51bd-aab80849-b596-42db-bc5f-99da11b92fc9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113614;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=21qB+ekWoK1qvOYP5JFcFyuUyf6bzHfrB16ZDaNkbkg=;
	b=OU40XzruHh2Gc8H7r6LvgtIRy+cT44gIC5hUlGJwGMA/06o4q3+Ku4fz+MQON/jr
	Wh88y6yc4hZYrsNPiClPT11CGg+OWYQD/WL80pBZkv0diTBd3NDJvhvXud98x/pIsCQ
	I3OyYmnNhv/WCLrbYHm4m3+0Gq73qTGqnR12CNTQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113614;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=21qB+ekWoK1qvOYP5JFcFyuUyf6bzHfrB16ZDaNkbkg=;
	b=DSIw/WYSv6S+si+1f8s3l+80XXHFUos8oGssISiXGD5rPBzBa6tfPwiI7NP/Dn1e
	orzbJfNniL5QmCaV5tHUJ/cjRA93T97v97KkYcEOJGRqqrIwgmTdJ/ATuUqqs7G8QGW
	Iuxdr3cJMV7e9IkkL2tf6PHqzhpELWQcFlRJz3cU=
Content-Type: multipart/mixed; boundary="===============8481298825703341169=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] coreutils: upgrading to 9.7 FAILED
Message-ID: <010101968c7b51bd-aab80849-b596-42db-bc5f-99da11b92fc9-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215796

--===============8481298825703341169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *coreutils* to *9.7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe coreutils failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:677d670d94c53af8d2c7287e797b8cc782336630"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 929 .bb files complete (0 cached, 929 parsed). 1898 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:677d670d94c53af8d2c7287e797b8cc782336630"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-tblljyzt: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-08c7avw6/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-08c7avw6/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  24% |########                            | ETA:  0:00:00
Adding changed files:  49% |#################                   | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/coreutils/coreutils-9.7.tar.xz...
INFO: Rebasing devtool onto 2bd9eeb7a8be327737099cce8ca9f1c527aa2cfa
WARNING: Command 'git rebase 2bd9eeb7a8be327737099cce8ca9f1c527aa2cfa' failed:
Auto-merging NEWS
Auto-merging src/ls.c
CONFLICT (content): Merge conflict in src/ls.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/coreutils
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/coreutils/coreutils_9.7.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8481298825703341169==--

