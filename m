Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDBCC3ABAB
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:22 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.115631.1726410840309454265
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PcLAxy0T;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XGMlJem8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010191f61ad602-0ca675b0-10b1-4630-9f2e-0f31a725ff78-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KQ8aFGO8Fuv0sr93KkiUwsxpfeMeob+F/NOiYlEe4r0=;
	b=PcLAxy0TOAcib7JvSWqvCghmnfjmYYWH6dm5MY1I/4jI5g86f8LU8JKVsjtyM5n8
	46BVF+PysL3RfWia828Rrw1lqfcan2z9SzJ6dIvCjVgcGiag7rMVA/ZAPrSku+pa3EM
	H1xh0KpxXV48QjYO6tm0nVmliER/X+fyyKphT6Ag=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KQ8aFGO8Fuv0sr93KkiUwsxpfeMeob+F/NOiYlEe4r0=;
	b=XGMlJem8Y5ajNIsDWo4GduMRh5gGzvDqJVD07GrlDCKPURsZGkgg6qo0TFcNJmWP
	8Y3ka+N1MNzXoePs0TQaprHbruWi2TmMKPBQyGS/txCnWVPv04AWoSWJynh2pBwJrXF
	KSnF4noktqGndrU1F9dx9cJ7S35XIsININGi28zc=
Content-Type: multipart/mixed; boundary="===============3798287051619594381=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] connman: upgrading to 1.43 FAILED
Message-ID: <01010191f61ad602-0ca675b0-10b1-4630-9f2e-0f31a725ff78-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:33:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204510

--===============3798287051619594381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *connman* to *1.43* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe connman failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-5dfc85d44f8dc5bf4c0181b0311d63f05a31348f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5dfc85d44f8dc5bf4c0181b0311d63f05a31348f"

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
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1868 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-5dfc85d44f8dc5bf4c0181b0311d63f05a31348f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5dfc85d44f8dc5bf4c0181b0311d63f05a31348f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-49wtxsnh: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-ssacpx79/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-ssacpx79/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/network/connman/connman-1.43.tar.xz...
INFO: Rebasing devtool onto 9c66b8c40af062b3d1f46c3b20186b74f7bd2c50
WARNING: Command 'git rebase 9c66b8c40af062b3d1f46c3b20186b74f7bd2c50' failed:
Auto-merging src/log.c
CONFLICT (content): Merge conflict in src/log.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/connman
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/connman/connman_1.43.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3798287051619594381==--

