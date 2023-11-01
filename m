Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2925C11F64
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.8648.1698848703572373311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=G5ply9yv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cePBW7Wd;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.191, mailfrom: 0101018b8b4608a4-783a6ebf-d9e5-4e13-b446-0f98cd3b8b77-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Hj+/lc/db7d8I49DRMv8lIC5Eq9/yFDDXw53g8DPl1Y=;
	b=G5ply9yv+uZ85hsGC7o7qlj1KByofUevt9MKBDtYim03xQMARFs6WkH/ZPtjYKyT
	T8hcy3XAeFPI6uYyJbmrrD5FKIAvvhPbr3dibliCLYxvgYaO1VP41Y6r00eairkXlEe
	p1T6koljLPjVaJHrV5GChW+iAhX33yrzqvl4WpW8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Hj+/lc/db7d8I49DRMv8lIC5Eq9/yFDDXw53g8DPl1Y=;
	b=cePBW7WdkN53VuuFKUoEEFy36NK94e/Srvy25P3C+HrTbFQF81eGE7zGGm4m0MfN
	LWvEOQsOW1sn3iBPs6btUVWE3ig44VEk/h9zqps5xI8LtB3Nxz5XzBPrrfkCQnDGktm
	WxESX4tQQnjro7kLHfy5KmZLgMdGTwCHZuvLGnT0=
Content-Type: multipart/mixed; boundary="===============0145792944278069449=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.19.0 FAILED
Message-ID: <0101018b8b4608a4-783a6ebf-d9e5-4e13-b446-0f98cd3b8b77-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189969

--===============0145792944278069449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpm* to *4.19.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (09:45:07.964747)
Loading cache...done.
Loaded 1843 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6e38f57c8f0bc68ea564765af10ac63d64160ab3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6e38f57c8f0bc68ea564765af10ac63d64160ab3"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 66ac70a597ba95517dfb8495e9e1a9ef254c37ea
WARNING: Command 'git rebase 66ac70a597ba95517dfb8495e9e1a9ef254c37ea' failed:
Auto-merging python/header-py.c
CONFLICT (content): Merge conflict in python/header-py.c
Auto-merging python/rpmds-py.c
CONFLICT (content): Merge conflict in python/rpmds-py.c
CONFLICT (modify/delete): python/rpmfi-py.c deleted in HEAD and modified in 84cda9af2 (Add bunch of deprecation/obsoletion warnings to python bindings).  Version 84cda9af2 (Add bunch of deprecation/obsoletion warnings to python bindings) of python/rpmfi-py.c left in tree.
Auto-merging python/rpmmodule.c
CONFLICT (content): Merge conflict in python/rpmmodule.c
Auto-merging python/rpmts-py.c
CONFLICT (content): Merge conflict in python/rpmts-py.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/rpm
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/rpm/rpm_4.19.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0145792944278069449==--

