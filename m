Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ACEC7EE24
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.107891.1682976350563435097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=b9ubFSnF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010187d9351de1-4f418de3-d057-4002-81de-7d5f85060020-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iEFc6vFR/UT+5Bfrh4usGivFSypF5SRgOtz5r7AKO7E=;
	b=b9ubFSnFxQInBklenDd9t9rtBpIo0CtqpeJzgqxU5kjXQXTCFdrpiALXLzJ/ApPo
	zJatWpyEdC0JVzIyCR064lrtzW+XBbrkqacnRGfn423T7MlzxRhxMEvFF08qhEaPilA
	DouIBsSCLiKicV8+XFfpZdrrO4LbYQ/jxFyiJlbM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iEFc6vFR/UT+5Bfrh4usGivFSypF5SRgOtz5r7AKO7E=;
	b=LTE0hAHjk9BkrxLQ3IqR/ZNEJ1xowrMqAmcka9K3DE43FJUL/tdk5ibpBlArUJku
	ZVQehj7XAWcD5Y4+WI9X3nIPn1Du73bxo6ituFa3zzw69F5MjD+NmHTC8wo8Db6ZmpW
	BMb3a/F/9OrOHhHH1zM0w6qWqzFHd2YJspRqilbg=
Content-Type: multipart/mixed; boundary="===============8833475933580884906=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] perl: upgrading to 5.36.1 FAILED
Message-ID: <01010187d9351de1-4f418de3-d057-4002-81de-7d5f85060020-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180618

--===============8833475933580884906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *perl* to *5.36.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe perl failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (09:27:35.552466)
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
meta-yocto-bsp       = "tmp-auh-upgrades:e0a65d4874e2a9bd2c473a84a78fca9982d5ec47"
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
meta-yocto-bsp       = "tmp-auh-upgrades:e0a65d4874e2a9bd2c473a84a78fca9982d5ec47"
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
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.cpan.org/src/5.0/perl-5.36.1.tar.gz;name=perl...
INFO: Rebasing devtool onto 8bd01d7d49f2fb21c4d6a716510a85ca8189d289
WARNING: Command 'git rebase 8bd01d7d49f2fb21c4d6a716510a85ca8189d289' failed:
Auto-merging proto.h
CONFLICT (content): Merge conflict in proto.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 8bd01d7d49f2fb21c4d6a716510a85ca8189d289
WARNING: Command 'git rebase 8bd01d7d49f2fb21c4d6a716510a85ca8189d289' failed:
Auto-merging proto.h
CONFLICT (content): Merge conflict in proto.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 8bd01d7d49f2fb21c4d6a716510a85ca8189d289
WARNING: Command 'git rebase 8bd01d7d49f2fb21c4d6a716510a85ca8189d289' failed:
Auto-merging proto.h
CONFLICT (content): Merge conflict in proto.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/perl
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/perl/perl_5.36.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8833475933580884906==--

