Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EB6CCA460
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.3706.1684186746887989658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LZTVtkup;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010188215a4cac-aa3eb459-7612-4a6c-9a19-379c924a011a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7XdyodtNMREmnoODMk5PuQQl75VG4PRteywb8M9BbVE=;
	b=LZTVtkupTsPqn/vdjJIkHxT7N7uEdEgHQfZLd6sZYAxl8jBpAnKEq+cbhh1i/Umh
	fDGXFPL/OeJwg1Bv3LnMe5JnfXihksit5Q2LxeZtx3SPaz2sEQybBB2azBqVjtpYpjt
	/ZyRYM1AQgOEMwRY0u8m7B9dHPFaPNbPOhxDgLCk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7XdyodtNMREmnoODMk5PuQQl75VG4PRteywb8M9BbVE=;
	b=amsRm9serND2IeqEN3W5awsV0/JmJWurnCtMWGUA61SO9NQUWD/h9FMe7FoHFPxo
	Lq89V3yvSDwHumy+CjRSnz4ybrzXDyTl1xmd5daAKXnfH+kvK9qDZqEpPmFh2ipoD+w
	j2rJXJKyx/bwNe9+mK0AyQrZotvcU7w4MKAJF5T4=
Content-Type: multipart/mixed; boundary="===============3957585802685702781=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.3 FAILED
Message-ID: <01010188215a4cac-aa3eb459-7612-4a6c-9a19-379c924a011a-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181282

--===============3957585802685702781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe btrfs-tools failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:36:32.436367)
Loading cache...done.
Loaded 1804 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:6e15ce7a672d11345bb66545edbd218527b3812a"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto fba31d634e3bc658e7d42a6c00f31ebb60adf901
WARNING: Command 'git rebase fba31d634e3bc658e7d42a6c00f31ebb60adf901' failed:
Auto-merging image/main.c
Auto-merging kernel-shared/zoned.c
Auto-merging mkfs/main.c
Auto-merging tests/fsstress.c
CONFLICT (content): Merge conflict in tests/fsstress.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/btrfs-tools
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/btrfs-tools/btrfs-tools_6.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3957585802685702781==--

