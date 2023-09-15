Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCDEEEE275
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.29664.1694804392835748236
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SPE82rah;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=C0t1azuD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a9a36c150-799ec88f-5fb9-44e5-bb57-9a48b9c7f72f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TqxX65qeujUKWt2LEzYohFEkhvJymEGTCC7Du7UuTXA=;
	b=SPE82rah+6BUgmCbyqO3P9MWo29RBA2h9GusT09HMJvcpSRlpO4Csq1EjiBN60mW
	IF5XyJhCFSYM8gp3DE9yI+0Ce0oQu7Wr8AQE41oFyJUel4myc6FI1iQsFio74FKMS4j
	4ikIjMXZuMxt/a4HVhEz3MbleAhoJe/GmFRttdPY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TqxX65qeujUKWt2LEzYohFEkhvJymEGTCC7Du7UuTXA=;
	b=C0t1azuDdmllLnnCsxzNWz/o7fcL7Ctv7YOyglkhb2gVDHN2X5UWQ9stEr5I9IZl
	1x8zVKGci1zGvjOTIQrDuhsfuPM3KloLTC4wqEZAYe0QnVqAhWA48CMpav8UxfnpVVp
	xY2dAbop4P75+GExCDbeLaoD/4H9ujFHAZp1amDw=
Content-Type: multipart/mixed; boundary="===============0644480194527500612=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.14.0 FAILED
Message-ID: <0101018a9a36c150-799ec88f-5fb9-44e5-bb57-9a48b9c7f72f-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187727

--===============0644480194527500612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shadow* to *4.14.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe shadow failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (13:18:48.134785)
Loading cache...done.
Loaded 1808 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-5d63870a425474dcac75040ba8062c279f31bcb8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5d63870a425474dcac75040ba8062c279f31bcb8"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1808 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1808 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-5d63870a425474dcac75040ba8062c279f31bcb8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5d63870a425474dcac75040ba8062c279f31bcb8"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  14% |#####                               | ETA:  0:00:00
Adding changed files:  29% |##########                          | ETA:  0:00:00
Adding changed files:  44% |################                    | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/shadow-maint/shadow/releases/download/4.14.0/shadow-4.14.0.tar.gz...
INFO: Rebasing devtool onto 7281f332a645c24235a1a88fe82d359eeb786ca4
WARNING: Command 'git rebase 7281f332a645c24235a1a88fe82d359eeb786ca4' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 7281f332a645c24235a1a88fe82d359eeb786ca4
WARNING: Command 'git rebase 7281f332a645c24235a1a88fe82d359eeb786ca4' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 7281f332a645c24235a1a88fe82d359eeb786ca4
WARNING: Command 'git rebase 7281f332a645c24235a1a88fe82d359eeb786ca4' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 7281f332a645c24235a1a88fe82d359eeb786ca4
WARNING: Command 'git rebase 7281f332a645c24235a1a88fe82d359eeb786ca4' failed:
Auto-merging src/login.c
CONFLICT (content): Merge conflict in src/login.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/shadow
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/shadow/shadow_4.14.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0644480194527500612==--

