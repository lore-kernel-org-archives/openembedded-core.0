Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278D8C52D7F
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.2203.1719853078938021555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=feH/BQ4x;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZVhdatA4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101906f3b52f8-5a650594-7e4b-4c32-aece-bcc03bfafe28-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853077;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=JVA1iG0ZxTHElslIIIuO2ZQlbfq03O71Y5a59Hvs14A=;
	b=feH/BQ4x7nAq6pGVFYbRtarjWcMcVl6qfHMRAGvKnc6dIYASBlsqqG2PWmyeYOhz
	uteeWV8Gxj2ffc8wBDPHZnzhxmD7v9jrA+7nlAod3M+ZKTudqsY8bhp3Xl+1oUd1T9h
	cxt/Ay/eMo9gyrush1Um47sWytLswyQJcEGa9c/E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853077;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=JVA1iG0ZxTHElslIIIuO2ZQlbfq03O71Y5a59Hvs14A=;
	b=ZVhdatA496K+I74/RfLuSaqr747oxd7g4hTGYlm72U4X3Q9VAOOgSxow80qXowCk
	j6Y2oAUWgJaiBZqP4Mk/aoIfNdok9tsv34IsYeGw0C9/ECxjA/THe4a0HRAV4GzJd/A
	XiZQCWM0kAYImvoWa+Zz8GHrkVbMu2LgkUX7yr0M=
Content-Type: multipart/mixed; boundary="===============7761077197077172520=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] nettle: upgrading to 3.10 FAILED
Message-ID: <010101906f3b52f8-5a650594-7e4b-4c32-aece-bcc03bfafe28-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201409

--===============7761077197077172520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nettle* to *3.10* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe nettle failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ecbd6b282b1e514cb3cf056ea6b1f39cda55cf66"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ecbd6b282b1e514cb3cf056ea6b1f39cda55cf66"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1878 entries from dependency cache.
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
DISTRO_VERSION       = "5.0+snapshot-ecbd6b282b1e514cb3cf056ea6b1f39cda55cf66"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ecbd6b282b1e514cb3cf056ea6b1f39cda55cf66"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-55s1xawl: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-6_dp7zs3/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-6_dp7zs3/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  53% |###################                 | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/nettle/nettle-3.10.tar.gz...
INFO: Rebasing devtool onto 2b98d25633784bf46ff6057e990f29743a52572d
WARNING: Command 'git rebase 2b98d25633784bf46ff6057e990f29743a52572d' failed:
Auto-merging Makefile.in
Auto-merging testsuite/Makefile.in
CONFLICT (content): Merge conflict in testsuite/Makefile.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/nettle
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/nettle/nettle_3.10.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7761077197077172520==--

