Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C0ACCA461
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.3757.1684186747226145534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dkdv3UlQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010188215a4e9b-152fbc33-b114-4f01-b573-ee7b33241bc0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qf5ikWDVR23nmWY7MwREL/kNtM7viVZ4xMN3ZACsEqI=;
	b=dkdv3UlQw4rtG1krQmqQGTq+XSQ1glcBlIlZ3QOHwPC0sr7j6VZdbQDmpGIKiFjb
	Yx0E6vx1mNeLjEvgFHf7U30R7MsVKB7Oi00B+PokzFaGZzVCNqlZRoeWVWMNdh5+uvW
	AnVwH+VHzlwswNwThryRy9+IhPtZuwFQAv5brJek=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qf5ikWDVR23nmWY7MwREL/kNtM7viVZ4xMN3ZACsEqI=;
	b=mnuGKuT4sqkjicLmxINht64edbzeBc0b+DE13D+6t2RwLJwHXcbwk7jMkT7dZOc1
	vLma/Ke1gqPgw1aHhfNnzoBh5dxrwXl16N/BrcROnsCBLwGtUKQZ6/E6w4msBf98PNu
	TVWlcoQWKoOo3AzE9SoMV5rmhiVzLBa3jutZE9Zk=
Content-Type: multipart/mixed; boundary="===============3150719969447307245=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lua: upgrading to 5.4.6 FAILED
Message-ID: <01010188215a4e9b-152fbc33-b114-4f01-b573-ee7b33241bc0-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181287

--===============3150719969447307245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lua* to *5.4.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lua failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (09:37:55.185757)
Loading cache...done.
Loaded 1804 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:8150ae1beb5f79ae853af8d0710d9bc1102dd637"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 901 .bb files complete (899 cached, 2 parsed). 1805 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:8150ae1beb5f79ae853af8d0710d9bc1102dd637"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

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
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching http://www.lua.org/ftp/lua-5.4.6.tar.gz;name=tarballsrc...
INFO: Rebasing devtool onto 598f73ab29dd89f4929bc625ceb3067026215877
WARNING: Command 'git rebase 598f73ab29dd89f4929bc625ceb3067026215877' failed:
Auto-merging src/ldebug.c
CONFLICT (content): Merge conflict in src/ldebug.c
Auto-merging src/lvm.c
CONFLICT (content): Merge conflict in src/lvm.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/lua
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/lua/lua_5.4.6.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3150719969447307245==--

