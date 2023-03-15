Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25D7C87FF1
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.12140.1678895725213396804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mijIXIgH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010186e5fbb6ff-a4ec9344-988b-44b9-beff-221fc4a042fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895724;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q94YfHq5kEmr59cJedT81JaUxqz0RJHRZwlZnPN8mO4=;
	b=mijIXIgHRUrin/HvvG/VPcMYUsuhJ97ZbBvLGiLjYmTxOqwIjqhzRYtY+9nIRBjr
	8enFQb4gFBz8JiteuwAnHjV+/07kRtpZo7dbTMjkXzIqism9Hkz891/Bg0PjCkfLa/a
	dJ1Kp52AutJ4Uu1VyTnooO1OdvOPXE9yBqDK4ZGM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895724;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q94YfHq5kEmr59cJedT81JaUxqz0RJHRZwlZnPN8mO4=;
	b=Z1jq4d2zA4mqLNiW+MKUD3sm7SlJM2pIvB6l8KYK+Lc+nXquRygshYXMuy7a7iUq
	n5EdX0cw+mRLJ0mpcjjvm52f1pcd59ZuCw/MsdMpMBptYuA8eMaHEX1b9Ya/1sqNwxz
	fNAveeTyyxRfUfAnsuKtbiwHA0nrMLXCSlNKG9yA=
Content-Type: multipart/mixed; boundary="===============7954908528863814385=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: =?utf-8?b?QW7DrWJhbCBMaW3Ds24gPGxpbW9uLmFuaWJhbEBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apt: upgrading to 2.6.0 FAILED
Message-ID: <01010186e5fbb6ff-a4ec9344-988b-44b9-beff-221fc4a042fa-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178586

--===============7954908528863814385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *apt* to *2.6.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe apt failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (07:02:15.947101)
Loading cache...done.
Loaded 1791 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7cf47c1a2e349c273ae2b9412195770dbe961d93"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7cf47c1a2e349c273ae2b9412195770dbe961d93"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1791 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (895 cached, 2 parsed). 1792 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7cf47c1a2e349c273ae2b9412195770dbe961d93"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7cf47c1a2e349c273ae2b9412195770dbe961d93"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  45% |################                    | ETA:  0:00:00
Adding changed files:  91% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching http://ftp.debian.org/debian/pool/main/a/apt/apt_2.6.0.tar.xz...
INFO: Rebasing devtool onto 8910e89e683ebff0da2fd04e25c5b255c3a9dab2
WARNING: Command 'git rebase 8910e89e683ebff0da2fd04e25c5b255c3a9dab2' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 8910e89e683ebff0da2fd04e25c5b255c3a9dab2
WARNING: Command 'git rebase 8910e89e683ebff0da2fd04e25c5b255c3a9dab2' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 8910e89e683ebff0da2fd04e25c5b255c3a9dab2
WARNING: Command 'git rebase 8910e89e683ebff0da2fd04e25c5b255c3a9dab2' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/apt
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/apt/apt_2.6.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7954908528863814385==--

