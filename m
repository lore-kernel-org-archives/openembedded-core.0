Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CD5C7EE37
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.107887.1682976349953886504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SO6w/hWc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010187d9351b90-9c58ef02-87e4-40d9-be8b-601f69f0bd69-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9TuS4Mf4/csn3o162mOrYa2l1FT7LO+Xc04UO5NPi+M=;
	b=SO6w/hWcLGBX1e6Zjk81yBKoBkx4IeUuYcjQpC2zSnhcG7rN5s/8GMx9Hd6xHEqU
	e+mLa2pOEQJ299e6vr0W1xejdkt5S4NrIU6rQ0x0Bmpc2i5BO8mX9EmsLgW+SaEAp6g
	lZ9duwLz1Uv3SQWqTctKM+umfRuhB8O/+qwFL3f4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9TuS4Mf4/csn3o162mOrYa2l1FT7LO+Xc04UO5NPi+M=;
	b=mgX1E0OSKgLsw2rC5XoQxVmfSvOrF3Z3ln4x1BlzmvCQeH8x9PnU87TUf5F25mre
	g9HfAHBphPdvgc0smedga09idiLnqILo9Cnl4F20Bx0aToTPOr5MB4R+Tmp5GeipfFz
	EM8IUQmmpfB96EYx0XD/clKE02TfXogymfTM9A58=
Content-Type: multipart/mixed; boundary="===============3241256722584022638=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] elfutils: upgrading to 0.189 FAILED
Message-ID: <01010187d9351b90-9c58ef02-87e4-40d9-be8b-601f69f0bd69-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180607

--===============3241256722584022638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *elfutils* to *0.189* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe elfutils failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:52:06.304698)
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
meta-yocto-bsp       = "tmp-auh-upgrades:89edc3ea73026199cc4beb9e54aaab9b13233b46"
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
meta-yocto-bsp       = "tmp-auh-upgrades:89edc3ea73026199cc4beb9e54aaab9b13233b46"
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
Adding changed files:  52% |###################                 | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://sourceware.org/elfutils/ftp/0.189/elfutils-0.189.tar.bz2...
INFO: Rebasing devtool onto 23c90d5ba43c4719875e2adfa1c390d4e5f4d5d7
INFO: Rebasing devtool-override-libc-musl onto 23c90d5ba43c4719875e2adfa1c390d4e5f4d5d7
WARNING: Command 'git rebase 23c90d5ba43c4719875e2adfa1c390d4e5f4d5d7' failed:
Auto-merging config/eu.am
CONFLICT (content): Merge conflict in config/eu.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/elfutils
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/elfutils/elfutils_0.189.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3241256722584022638==--

