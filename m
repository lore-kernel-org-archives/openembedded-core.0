Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B2AC47DB4
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.63599.1702649862998530236
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PUH/pgAr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TEa5xqg+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018c6dd72b24-0d562632-0a15-419f-8951-4b82a58be550-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lCqALlqc1Lh44ed7U2BOa4PgqJ13aPML3MGRBWIU82s=;
	b=PUH/pgArl6oU88eoqSrrdE+OY9i1YkOPqOQ0rOFSG4Sh4idJLw4CveMtQBpFVTUn
	W4jgoFzW9O9eUZUJDCSMab2elNH+svkp9uBfyCIe0M3eYpQ5++Bk1/rF5+SkkRAiU7X
	c2O5mrHoJ8u85dHuHOrc1VJ2g42G8g+fnx2aSl4g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lCqALlqc1Lh44ed7U2BOa4PgqJ13aPML3MGRBWIU82s=;
	b=TEa5xqg+0Pl574d9JZK/uwm7XKRSAhdNXlhLEVglC8UmJDVWlvGSdmxgQN+q08dl
	y7P3jWIrVv6V6PTA8ARQk8e6lyfCCjzwR1M1RbVVK9Y/HXTYL2vPswP3GGIYzQk9uNm
	CJGo9ziD/u5Bo8Z0qZw+YXZOXfa/EakZkX014pZs=
Content-Type: multipart/mixed; boundary="===============2099673223309801671=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.14.2 FAILED
Message-ID: <0101018c6dd72b24-0d562632-0a15-419f-8951-4b82a58be550-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192488

--===============2099673223309801671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shadow* to *4.14.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe shadow failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1842 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-cba4f033a2e6938cb7535b739557f4d49c342ff4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cba4f033a2e6938cb7535b739557f4d49c342ff4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1842 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (910 cached, 2 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-cba4f033a2e6938cb7535b739557f4d49c342ff4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cba4f033a2e6938cb7535b739557f4d49c342ff4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  13% |####                                | ETA:  0:00:00
Adding changed files:  26% |#########                           | ETA:  0:00:00
Adding changed files:  39% |##############                      | ETA:  0:00:00
Adding changed files:  52% |##################                  | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/shadow-maint/shadow/releases/download/4.14.2/shadow-4.14.2.tar.gz...
INFO: Rebasing devtool onto 0722440aab5508c1acf0e027b22d97d4468708bd
WARNING: Command 'git rebase 0722440aab5508c1acf0e027b22d97d4468708bd' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 0722440aab5508c1acf0e027b22d97d4468708bd
WARNING: Command 'git rebase 0722440aab5508c1acf0e027b22d97d4468708bd' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 0722440aab5508c1acf0e027b22d97d4468708bd
WARNING: Command 'git rebase 0722440aab5508c1acf0e027b22d97d4468708bd' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 0722440aab5508c1acf0e027b22d97d4468708bd
WARNING: Command 'git rebase 0722440aab5508c1acf0e027b22d97d4468708bd' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/shadow
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/shadow/shadow_4.14.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2099673223309801671==--

