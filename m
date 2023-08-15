Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EDDC2FC19
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.129644.1692086042508054497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gTL7DLzG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aO+9d5J3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010189f82ffc37-263279a1-d82e-4ce1-9b58-53eded8a47b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086041;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aiT2u54cc0O7AlF9zZlksaTzgm9NCha88fOO8PvfiC4=;
	b=gTL7DLzGPkvAHKAAY8Jy2aC53onW8Q8GRL7rWlXMs1hiRSL1wOlF4hyZ3T026i6b
	xQ30k2qZ0wraQK5sH9U/IRopwmv93VSwKa+l548/5bY5K1uX9hwqRLYXpqySYGqlx+p
	U34NRY1QFi8I4NyIPWHwug5zgd/Y8iVu4gwC+UP8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086041;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aiT2u54cc0O7AlF9zZlksaTzgm9NCha88fOO8PvfiC4=;
	b=aO+9d5J3nkepXSutHoNEiOnVuDLRP7Bxo8MKCiOCZHj50bwPiq3SNW3Y9dV+qTCT
	LDaXJL6VmB1TWLKgMHUDKznkDyrGhU9XjKijsyQOxfWrogBctKR5R6AmR+67cm7QYvo
	KCSQtF6d1umcHxPT0mFgFkz8WmQgtyTY15I4RE5s=
Content-Type: multipart/mixed; boundary="===============1509159647183713449=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.21.0 FAILED
Message-ID: <01010189f82ffc37-263279a1-d82e-4ce1-9b58-53eded8a47b4-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185970

--===============1509159647183713449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.21.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe go failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (06:03:53.586519)
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
meta-yocto-bsp       = "tmp-auh-upgrades:d151ba95f69d7224241fb8c76c90bbe4b2fd9563"
workspace            = "master:d151ba95f69d7224241fb8c76c90bbe4b2fd9563"

Initialising tasks...done.
Sstate summary: Wanted 3 Local 3 Mirrors 0 Missed 0 Current 27 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1806 targets, 42 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d151ba95f69d7224241fb8c76c90bbe4b2fd9563"
workspace            = "master:d151ba95f69d7224241fb8c76c90bbe4b2fd9563"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |                                    | ETA:  0:00:05
Adding changed files:   5% |#                                   | ETA:  0:00:03
Adding changed files:   7% |##                                  | ETA:  0:00:03
Adding changed files:  10% |###                                 | ETA:  0:00:03
Adding changed files:  12% |####                                | ETA:  0:00:02
Adding changed files:  15% |#####                               | ETA:  0:00:02
Adding changed files:  17% |######                              | ETA:  0:00:02
Adding changed files:  20% |#######                             | ETA:  0:00:02
Adding changed files:  22% |########                            | ETA:  0:00:02
Adding changed files:  25% |#########                           | ETA:  0:00:02
Adding changed files:  27% |#########                           | ETA:  0:00:02
Adding changed files:  30% |##########                          | ETA:  0:00:02
Adding changed files:  32% |###########                         | ETA:  0:00:02
Adding changed files:  35% |############                        | ETA:  0:00:02
Adding changed files:  37% |#############                       | ETA:  0:00:02
Adding changed files:  40% |##############                      | ETA:  0:00:02
Adding changed files:  42% |###############                     | ETA:  0:00:01
Adding changed files:  45% |################                    | ETA:  0:00:01
Adding changed files:  47% |#################                   | ETA:  0:00:01
Adding changed files:  50% |##################                  | ETA:  0:00:01
Adding changed files:  52% |##################                  | ETA:  0:00:01
Adding changed files:  55% |###################                 | ETA:  0:00:01
Adding changed files:  57% |####################                | ETA:  0:00:01
Adding changed files:  60% |#####################               | ETA:  0:00:01
Adding changed files:  62% |######################              | ETA:  0:00:01
Adding changed files:  65% |#######################             | ETA:  0:00:01
Adding changed files:  67% |########################            | ETA:  0:00:01
Adding changed files:  70% |#########################           | ETA:  0:00:01
Adding changed files:  72% |##########################          | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:03
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://golang.org/dl/go1.21.0.src.tar.gz;name=main...
INFO: Rebasing devtool onto d012f053316e11f6184d570d02ff4bbdae2ff65d
WARNING: Command 'git rebase d012f053316e11f6184d570d02ff4bbdae2ff65d' failed:
Auto-merging src/cmd/go/internal/envcmd/env.go
Auto-merging src/cmd/go/internal/work/exec.go
CONFLICT (content): Merge conflict in src/cmd/go/internal/work/exec.go

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/go
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/go/go_1.21.0.bb
WARNING: Version is pinned to 1.20% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1509159647183713449==--

