Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E897EEEC27
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:02 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.29480.1694804395857050695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=APnv58IZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qxPE0v41;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018a9a36c326-118182f7-62ec-4902-836d-ae76a3147801-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k3rbtHVfYxB6vObijxp68Uz7y68dRraWuas64mU9ZUo=;
	b=APnv58IZL/l6zTXkOCWFyig0c5lChZVbv4WrKg3TWUsKh91PwQ+N1EhoiEF75Sbg
	MhLo0/vlAlc45OOdsSxt18lof8DcyR3+rTxIoI5l1MPYEQME9puOqkVnsj73SKAYvAP
	pXyskDN9/JmqAkPoe/srVKbsm7kzrneNFTCB6Eo4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k3rbtHVfYxB6vObijxp68Uz7y68dRraWuas64mU9ZUo=;
	b=qxPE0v41hsu2456M2KGFeo9Y+PLo1ecEPJTE0PiK+c3v9RzrC5rWCKIl/fKbZSBc
	mgYyuLTHjc1lp2/hOiNP0+e66hQ0OsMdtfC/aQU9CqfjVgd81I9nj8y1G1PjvP6JfCZ
	PBiChP7Gd1kcq/2vjjj0flSegqyb3wN3CKNZXbjY=
Content-Type: multipart/mixed; boundary="===============5844789487593745619=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-utils: upgrading to 2.20.0 FAILED
Message-ID: <0101018a9a36c326-118182f7-62ec-4902-836d-ae76a3147801-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187748

--===============5844789487593745619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-utils* to *2.20.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libva-utils failed.
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1807 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-a2b9df3b85b8d6cafbdeb32e300daaa293f7874a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a2b9df3b85b8d6cafbdeb32e300daaa293f7874a"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 0c8373e62af3e4d9a3831334c5402ad255797e67
WARNING: Command 'git rebase 0c8373e62af3e4d9a3831334c5402ad255797e67' failed:
Auto-merging configure.ac
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libva-utils
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libva-utils/libva-utils_2.20.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5844789487593745619==--

