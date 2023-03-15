Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B52C7EE22
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.12290.1678895724521947343
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dKpVBSx5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010186e5fbbc05-41cd5834-24e8-428f-a717-e0a4ffe2dc92-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895725;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=I8tjPF1iAjwQiiUxZKkfF5aoVaGCiK6fK00nFkE2hYA=;
	b=dKpVBSx5EZbmn6dwjrlAh80F9QXMo35vYUAO6bzFVVUFSruXFz5dKJt6xZDkkoOA
	Q8lrGunIYNrtrUCOF7mLsiD+AmGEeyqmV+FOHNj4P5HE8YLnqal6/m/thnIN4KNLu0u
	TVzL2C8qfe917qTVwznUI4gPjeLNKbuQK29WoEl8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895725;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=I8tjPF1iAjwQiiUxZKkfF5aoVaGCiK6fK00nFkE2hYA=;
	b=KiloXPfJfz73ROHcpBspivlGDs2epL3fph7VuHChbQROwANGaCXHYmxi6WxH3AdU
	Hqn9oFxEfDujOxhqbtM4fQSXszEtn/cy4v7KCDpT50qT0U5KdHQtBxRulHlRtYJln0i
	ABrxkGLhiMLkCp0eBt0NjAlCRj7hITfOlJfwSY18=
Content-Type: multipart/mixed; boundary="===============1644318989410501959=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.18.1 FAILED
Message-ID: <01010186e5fbbc05-41cd5834-24e8-428f-a717-e0a4ffe2dc92-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178596

--===============1644318989410501959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpm* to *4.18.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:44:43.422043)
Loading cache...done.
Loaded 1791 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-044ee69054b731b22aeb1010539eaaecd5ef8379"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:044ee69054b731b22aeb1010539eaaecd5ef8379"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 4588bc3f994338502d2770ad24cbfcdaa6c335ec
WARNING: Command 'git rebase 4588bc3f994338502d2770ad24cbfcdaa6c335ec' failed:
Auto-merging build/rpmfc.c
CONFLICT (content): Merge conflict in build/rpmfc.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/rpm
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/rpm/rpm_4.18.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1644318989410501959==--

