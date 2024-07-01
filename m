Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527E9C531DE
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:02 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.2202.1719853078735912703
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CoCWCHfe;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=R//2iUUY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101906f3b52bc-e63ef702-a64e-4ec2-83e1-c55d98709d72-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853077;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VK8U5i0ZTwpPKsZVNh0iTs1zKH5TA41PzTul6gBx4iE=;
	b=CoCWCHfeL3NYRfg9UZIWbAclpVTD6uqA3P/m9T7BjHj8z+cOT3JAUwVTkJsa5opX
	bJFBAyXQvWXAWF/QUPoFynG3bkONEAxQn007Ftr0arrJJHGFjnzHUkRZ/uuqFr8/Fux
	O0w4GRWFiBA0yX8pKPiAepbU+koz1YZn3NnvdCr4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853077;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VK8U5i0ZTwpPKsZVNh0iTs1zKH5TA41PzTul6gBx4iE=;
	b=R//2iUUYHDf2gNPK58nCLO8FEIy/eR9GNOsyDQO3h8CypAX8n3nGeqnAX/K8p6pv
	/Mv+QJnTV3F5fu2S+Qf98kVJl9R8EuV83Bn6nu2LHtBoXw/jTNSyGGf1mqXIQjprba5
	pqBmcR/2+luLw00zuCEPdHZIsq24fvSrAQFLOqto=
Content-Type: multipart/mixed; boundary="===============7513957312204128986=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libksba: upgrading to 1.6.7 FAILED
Message-ID: <010101906f3b52bc-e63ef702-a64e-4ec2-83e1-c55d98709d72-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201406

--===============7513957312204128986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libksba* to *1.6.7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libksba failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
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
Loaded 1881 entries from dependency cache.
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
WARNING: tmp-recipetool-ep7ytdn6: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-zym6twsg/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-zym6twsg/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.6.7.tar.bz2...
INFO: Rebasing devtool onto 31aec0420d51458da63df98c87ace16fc3424099
WARNING: Command 'git rebase 31aec0420d51458da63df98c87ace16fc3424099' failed:
Auto-merging src/ksba.m4
CONFLICT (content): Merge conflict in src/ksba.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libksba
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libksba/libksba_1.6.7.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7513957312204128986==--

