Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F2DC27C53
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:01 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.173796.1692224339564616974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=S9Mrd2b5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ng3U/3Ae;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a006e3a1b-0c9a9ce9-6875-4946-8945-7ef2389d4652-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zAsWtgX3FCVr1l38NJoA8iWFD3SX/caCcGNY05WIzlg=;
	b=S9Mrd2b5pg7/6iCurdWD9ngi+GLnnyKXZDXrDKANTPHnf2UP40/DiVfQcFNWW62R
	aYL6hRWlAx0WJ/ScAOZUFJSrBAKXns1efKtHTHuQfA1PjurZEqM+Nh/14OfRAtDbls2
	hlF7GWE/K980Wosa+4zV8mvQqyCquZnuBe4KfrXM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zAsWtgX3FCVr1l38NJoA8iWFD3SX/caCcGNY05WIzlg=;
	b=Ng3U/3AeeSb5esi8kRM6l9mCgSyfP9g1qtI26Zs0bRaloXy75g3pxFg5Pm2ZFbF1
	tj1ydH/XM7t13LJsUmSHcXoQ1N0aa9DUZT9XTqMe6QwqT+7jqP8Cx2lN6ACuNElia0e
	hJph8b+6bcb0x3wIx7Q1IFSnTgZ2RxWMRJOpGt7U=
Content-Type: multipart/mixed; boundary="===============3375918934516630869=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] connman: upgrading to 1.42 FAILED
Message-ID: <0101018a006e3a1b-0c9a9ce9-6875-4946-8945-7ef2389d4652-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:18:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186152

--===============3375918934516630869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *connman* to *1.42* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe connman failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (21:30:43.467059)
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (21:30:43.467059)
NOTE: Retrying server connection (#1)... (21:30:43.467059)
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (21:30:44.328111)
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 33 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 27 (0% match, 96% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /home/pokybuild/yocto-worker/auh/build/build/build/workspace
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/network/connman/connman-1.42.tar.xz...
INFO: Rebasing devtool onto b64c005f9c868c0283ff58b6a813aa344f6b1dc0
WARNING: Command 'git rebase b64c005f9c868c0283ff58b6a813aa344f6b1dc0' failed:
Auto-merging src/wispr.c
CONFLICT (content): Merge conflict in src/wispr.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto b64c005f9c868c0283ff58b6a813aa344f6b1dc0
WARNING: Command 'git rebase b64c005f9c868c0283ff58b6a813aa344f6b1dc0' failed:
Auto-merging src/wispr.c
CONFLICT (content): Merge conflict in src/wispr.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/connman
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/connman/connman_1.42.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3375918934516630869==--

