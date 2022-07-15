Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2E2C2BBF4
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web12.980.1657900667235614328
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=d2l4lnlF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 0101018202948de4-b464025a-37ad-4a4a-b66c-225b73c421b1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900666;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yB7t936wiXyEUc1Tx/LOKStNDX6QSUDHx0nUcN91bis=;
	b=d2l4lnlF7Ymit25FQEe7Oh0tpsql82cEq2re0cogY5AJF/8+6gOpCnsTZFkTPIWo
	xLE2GX5JGrYapVMMdZn2rpA5zyHcCt7jRvapMXEBEFgC9D5Zz2dgAk/ILaR/RNx2yVc
	1DAmifJJ+mPL6gU7poGxnMS7amHTHo33BHutCAvo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900666;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yB7t936wiXyEUc1Tx/LOKStNDX6QSUDHx0nUcN91bis=;
	b=GyaANqDUCPmzmxG3w2BXtKl6CcwBvD5NMujTwWTii/34Th4NpOhVCOPkymdct3AC
	miiYxrbahhNWJBVTvV0K5NW8/aqN+26ORUzTtzBtAgEevaiQenea1Jc5aq+BxteR5tO
	FJE2zbTDDQsx0PosR7Puoc5JgAt4OAQGheqwIYRE=
Content-Type: multipart/mixed; boundary="===============5853758248896232670=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd: upgrading to 251.3 FAILED
Message-ID: 
 <0101018202948de4-b464025a-37ad-4a4a-b66c-225b73c421b1-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168065

--===============5853758248896232670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd* to *251.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1660 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-cc247356a846538a80911fd5dad3140e6714d6da"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cc247356a846538a80911fd5dad3140e6714d6da"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 516108f273888df3dcfa4f42b140252a285a2288
WARNING: Command 'git rebase 516108f273888df3dcfa4f42b140252a285a2288' failed:
Auto-merging src/core/systemd.pc.in
CONFLICT (content): Merge conflict in src/core/systemd.pc.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 516108f273888df3dcfa4f42b140252a285a2288
WARNING: Command 'git rebase 516108f273888df3dcfa4f42b140252a285a2288' failed:
Auto-merging src/core/systemd.pc.in
CONFLICT (content): Merge conflict in src/core/systemd.pc.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/systemd
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/systemd/systemd_251.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5853758248896232670==--

