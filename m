Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FB3C678DB
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.145841.1673805745049169111
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BLFlseh6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010185b698c944-da0d42c3-204d-4f3f-895c-53eae5b36f17-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lasMo6F+XGZ8Dk9xAx0/pgnKLJAERpcGs/yY/NWuZ34=;
	b=BLFlseh6tAlhmwyLvQ9xzDey4xxlpTOWGJ40t1mTAphxE7DuXQSsqOTSqJgIFqDI
	wzN4rK9Yj+6Ud12d5jTGqvydyVK3TC7iAQ+tmPUqzVpSxTZHAwpIJu68iPV71wt7wOF
	HnuiyFbwKAnAEXkqbGFaetewTMkFMxzS0rTidHsw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lasMo6F+XGZ8Dk9xAx0/pgnKLJAERpcGs/yY/NWuZ34=;
	b=BV5cg8yWSna49Wp/preVrEc51NwS4Npp+Fw9xgFXwe/c5T/IwbpqKWjBWbpObjBc
	Nb6tPXkQR64Tq75aPxi5n6yooWGrTjtpvqtgSAn3TxAiVeNxcnQNaUyiCHFhXgsD3yF
	4p/t0Y/uvW8jX2NDN9208gbj7FSpJKCbnmu2tXrw=
Content-Type: multipart/mixed; boundary="===============0136669491907230366=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-tools: upgrading to 2.13.9 FAILED
Message-ID: <01010185b698c944-da0d42c3-204d-4f3f-895c-53eae5b36f17-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175939

--===============0136669491907230366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-tools* to *2.13.9* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lttng-tools failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (16:22:51.973413)
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1696 entries from dependency cache.

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
meta-yocto-bsp       = "tmp-auh-upgrades:e5fd3670893cda41b3d0b99705cc0c389b7de50f"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1696 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1697 targets, 40 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
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
meta-yocto-bsp       = "tmp-auh-upgrades:e5fd3670893cda41b3d0b99705cc0c389b7de50f"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

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
INFO: Fetching https://lttng.org/files/lttng-tools/lttng-tools-2.13.9.tar.bz2...
INFO: Rebasing devtool onto f5cd6c4c7114aaaf4724668df9de9035aa4f1dd0
WARNING: Command 'git rebase f5cd6c4c7114aaaf4724668df9de9035aa4f1dd0' failed:
Auto-merging tests/regression/ust/ust-dl/Makefile.am
CONFLICT (content): Merge conflict in tests/regression/ust/ust-dl/Makefile.am
Auto-merging tests/utils/testapp/userspace-probe-elf-binary/Makefile.am
CONFLICT (content): Merge conflict in tests/utils/testapp/userspace-probe-elf-binary/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/lttng-tools
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/lttng-tools/lttng-tools_2.13.9.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0136669491907230366==--

