Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1A7C3527C
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.11824.1650052686605217809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=L+DeCNyJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101802ecddeb3-da9d92f3-8ec2-415f-b82f-996b3b6c82a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2YPpmKf2N8+/Edy5G2afYl1xKysWqS3svyQFQGhlM8I=;
	b=L+DeCNyJmRgm4rsyj7j3SZvMkWRoQq9VRCMA/Z05c5EcnVO+scbtPaWOlJRg+Mwm
	0kodXhMR3aKKhLqugDyottoIHVv/Ielu5a3qfoqt231+xm57zyknyY2sgUFB7f0/V/e
	bRsizLMpHrXzVgg7jcLNeN6ItHNsZGJWRmqcQiSg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2YPpmKf2N8+/Edy5G2afYl1xKysWqS3svyQFQGhlM8I=;
	b=JwlcUJbkhvzIjvOQD6I9RzOyWAwl5TqcFvhMvPpHs7qmBO8rk5a4mCIMFhBifo/6
	g+GRxcl4ygQQBJIVDm/ZfnEdQAnYWm27SQ2EUkDq9Z3L8zHEDRya+5eu53j1VU9+Hpb
	Cer85dQbn9wMhRj5/Azbj806QjIBagrrTRAo3agA=
Content-Type: multipart/mixed; boundary="===============1101912699574165361=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.72.1 FAILED
Message-ID: 
 <010101802ecddeb3-da9d92f3-8ec2-415f-b82f-996b3b6c82a7-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:05 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164437

--===============1101912699574165361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.72.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glib-2.0 failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1640 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6232071cac17290a2d59b42efe412f12e423183f"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (881 cached, 2 parsed). 1641 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6232071cac17290a2d59b42efe412f12e423183f"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//glib/2.72/glib-2.72.1.tar.xz...
INFO: Rebasing devtool onto b9a8400c8e90452e45d0262ac37646a91f7237fc
WARNING: Command 'git rebase b9a8400c8e90452e45d0262ac37646a91f7237fc' failed:
Auto-merging gio/tests/meson.build
CONFLICT (content): Merge conflict in gio/tests/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto b9a8400c8e90452e45d0262ac37646a91f7237fc
WARNING: Command 'git rebase b9a8400c8e90452e45d0262ac37646a91f7237fc' failed:
Auto-merging gio/tests/meson.build
CONFLICT (content): Merge conflict in gio/tests/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/glib-2.0
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/glib-2.0/glib-2.0_2.72.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1101912699574165361==--

