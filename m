Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2677EC73C66
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.145431.1671136350730726651
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VRLVBSom;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010185177d0e1d-cfb35619-123b-4fd0-aa0d-0e529c44b2ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=j/8U6LPK70ly/F9xqdkASZdtIPT6rwS9RZSXpZEkqCc=;
	b=VRLVBSom3C/L1oTn45p70wF98B+3EmZb9wmYO90bVxHnqdq+N4Q59gkrpQaxqs9v
	8crsxpPuoU9eeXhtHn1Cetab7tQ7Mt3dUsNYljk1kB723zjs9gc0pbwHC+RetOQjcHg
	cytoBoWrUVfkSVWfdcMPhcQm5aWP3Psms0ncbVK8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=j/8U6LPK70ly/F9xqdkASZdtIPT6rwS9RZSXpZEkqCc=;
	b=QX+E5xXkftTQ4BdI3mWs5PQEvzFSwvVSt+lTLL+2mn6u2e+8TH+5xDlCJSFy0310
	S2y/s0fXnfg+aH4SjeNs/c4XHmm7OxOOXz1KmljL2GlDQVRDnl10Of3v3dCEyO8jqR4
	e73sSgi/PFE3t5YZW5T/WJSXN3CkNQJBPBH76SlU=
Content-Type: multipart/mixed; boundary="===============7121717176117099171=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd: upgrading to 252.3 FAILED
Message-ID: <01010185177d0e1d-cfb35619-123b-4fd0-aa0d-0e529c44b2ba-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:29 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174628

--===============7121717176117099171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd* to *252.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (08:42:16.659401)
NOTE: Directory listing: ['buildhistory', 'sstate-cache', 'downloads', 'workspace', 'bitbake-cookerdaemon.log', 'upgrade-helper', 'cache', 'conf', 'tmp']
NOTE: Retrying server connection (#1)... (08:42:16.838180)
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 36 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:29810d8bf57691b1665f98dc52f4dadc8fc9ff8b"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

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
INFO: Rebasing devtool onto 13de548fca2d18d1f900d82201301a109accef25
WARNING: Command 'git rebase 13de548fca2d18d1f900d82201301a109accef25' failed:
Auto-merging src/boot/bootctl.c
CONFLICT (content): Merge conflict in src/boot/bootctl.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 13de548fca2d18d1f900d82201301a109accef25
WARNING: Command 'git rebase 13de548fca2d18d1f900d82201301a109accef25' failed:
Auto-merging src/boot/bootctl.c
CONFLICT (content): Merge conflict in src/boot/bootctl.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/systemd
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/systemd/systemd_252.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7121717176117099171==--

