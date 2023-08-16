Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54C3C61CE5
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.174048.1692224351888398461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gqJEQqCX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=U9oGHefE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a006e6bc5-a7fde534-6317-4e86-8c06-cf0d36dcd1c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AD0Den/czZPzBnxZ0RvGkJ7+fgfiIgxWf20uo98ixvw=;
	b=gqJEQqCXIxEibYH2V/FfLevm9jQv7S6gCpZe9SGywP3PEc+66iwdMroEzDrUCCxi
	4iZ4oI2ldk3tBp0o1Mb7ECnsJhUZQw56DLOayUM8vYGAU/sLW1P42HhF05q8lr5W8B9
	HYxIcNjX3E0IOaHR0kHK1U99LQnZrF5RozmkFVgI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AD0Den/czZPzBnxZ0RvGkJ7+fgfiIgxWf20uo98ixvw=;
	b=U9oGHefEn1wtpCNOcE3EdRzgznSvjxt1Yys7o0G0zLdni2t/Rdg8A1Z3/FKNB9up
	4+fbHk5sJcb6WaWJp1KEkh4YFzN5rPZ/Qwim0vJvZ4cAYFdeneJ8yA+AWFhCt6WABnY
	tezkfwg+JG77u+Z1EMJOAYM+3DowzOwDZNhgmeiM=
Content-Type: multipart/mixed; boundary="===============7066608550412687326=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-tools: upgrading to 2.13.10 FAILED
Message-ID: <0101018a006e6bc5-a7fde534-6317-4e86-8c06-cf0d36dcd1c6-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186240

--===============7066608550412687326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-tools* to *2.13.10* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lttng-tools failed.
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1805 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:932a27414139c43d7d9ceee4ddab574087eb7a7e"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
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
meta-yocto-bsp       = "tmp-auh-upgrades:932a27414139c43d7d9ceee4ddab574087eb7a7e"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-tools/lttng-tools-2.13.10.tar.bz2...
INFO: Rebasing devtool onto 5c8232b9123c0a581cf3df23df02f9648f60fdf8
WARNING: Command 'git rebase 5c8232b9123c0a581cf3df23df02f9648f60fdf8' failed:
Auto-merging tests/utils/parse-callstack.py
CONFLICT (content): Merge conflict in tests/utils/parse-callstack.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/lttng-tools
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/lttng-tools/lttng-tools_2.13.10.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7066608550412687326==--

