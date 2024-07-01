Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBAFC53204
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:02 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.2200.1719853077692089355
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Hn7hEP/8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=IfdJ9uco;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101906f3b52b7-add8671e-82f0-4de2-8dbb-e14b02fa41c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853077;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZFZm8FVfZhBR1PQiKrLYa9Ou4Ew+wKuvDqI1Wg/EJaw=;
	b=Hn7hEP/8yMjFUTLtNzux9JCIHOW4wbY8+kP6sc+jbIx+SA14niFGGNMkrxThIgT6
	rPNA1VktZlFI9cb5h1PXPvHhWtiw9s5CTC90fmNLLEaaK3LA8luOeiUT+eA/XpeTh+9
	0iUj9Ye3COJX6FQlPlv5gEReUDSuLLCjIBpCKaIE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853077;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZFZm8FVfZhBR1PQiKrLYa9Ou4Ew+wKuvDqI1Wg/EJaw=;
	b=IfdJ9ucoGoxKw/uC/+bmrFkEK2imaYHn2+KxLMdWyGF7wns039jE5LaqshRPq31G
	tVI+rkOBGXhoR2L3olKP3Ox+OhYV73c0OkuKS1kO8K72z0+OPhYpxJvyKc0DD5W6giO
	1uaFnm2kineNlaIQHBu7mPEDXXOPVQu0ChIitqSI=
Content-Type: multipart/mixed; boundary="===============0692170210764295991=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgpg-error: upgrading to 1.50 FAILED
Message-ID: <010101906f3b52b7-add8671e-82f0-4de2-8dbb-e14b02fa41c0-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201391

--===============0692170210764295991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgpg-error* to *1.50* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libgpg-error failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-6b3e6d1b80649bdd13ba1d07bdb97b477ccec0bd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6b3e6d1b80649bdd13ba1d07bdb97b477ccec0bd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (917 cached, 2 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-6b3e6d1b80649bdd13ba1d07bdb97b477ccec0bd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6b3e6d1b80649bdd13ba1d07bdb97b477ccec0bd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-9ykhy75b: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-_pzkii8b/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-_pzkii8b/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.50.tar.bz2...
INFO: Rebasing devtool onto 8836c1401811c4ab6ea562a8376bd57a899cb59c
WARNING: Command 'git rebase 8836c1401811c4ab6ea562a8376bd57a899cb59c' failed:
Auto-merging src/gpg-error.m4
CONFLICT (content): Merge conflict in src/gpg-error.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libgpg-error
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libgpg-error/libgpg-error_1.50.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0692170210764295991==--

