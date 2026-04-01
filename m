Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE5510F6FCD
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14638.1775054152474618053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1Qc7or70;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oyCNnmBo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d497938a8-270e7d7c-b9ba-416e-a32e-360a4ddf32aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054174;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qknusEWJ1uWPM92GHS/EmPnBGeHOBSDQt/DMaQ7dMuA=;
	b=1Qc7or70+wjC9KY1UxmodYxzVHolbSsI7SOSBUr2nAmTdNqUCHtETP584/ZytgIo
	txPyTBdcNFT7J3Ym6fx3NuigWa9JDR/NHPDpWUNwhfAKMSz9kSOmih2jptf7KVpVBKs
	l3YnetuUqBfpbHimuqp/DqGN1DTFsfs57D7BYZu0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054174;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qknusEWJ1uWPM92GHS/EmPnBGeHOBSDQt/DMaQ7dMuA=;
	b=oyCNnmBoYucHZEX1830IvLjk0Sm7ziZuq7WKfA7EudV5Ln/8bxinnaxhoGMkvpZQ
	tc2f5iAATKFNujk++QH0nYtcblOvsKqf5i7b+/qnZ3zfeVSBb3NxnXk7Vw+AZQANjjp
	HJpyfrjkCbrsXt1wIj6lI0DxIOKwLLtJu9p7hTsc=
Content-Type: multipart/mixed; boundary="===============1845763350067534228=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ffmpeg: upgrading to 8.1 FAILED
Message-ID: <0101019d497938a8-270e7d7c-b9ba-416e-a32e-360a4ddf32aa-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234424

--===============1845763350067534228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ffmpeg* to *8.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ffmpeg failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1970 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-1d47465dbdd565b15bfd7a410eeb9b505fbbf68b"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:1d47465dbdd565b15bfd7a410eeb9b505fbbf68b"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1971 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-1d47465dbdd565b15bfd7a410eeb9b505fbbf68b"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:1d47465dbdd565b15bfd7a410eeb9b505fbbf68b"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 8 Local 7 Mirrors 0 Missed 1 Current 20 (87% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   5% |#                                   | ETA:  0:00:02
Adding changed files:  10% |###                                 | ETA:  0:00:01
Adding changed files:  15% |#####                               | ETA:  0:00:01
Adding changed files:  20% |#######                             | ETA:  0:00:01
Adding changed files:  25% |#########                           | ETA:  0:00:01
Adding changed files:  30% |##########                          | ETA:  0:00:01
Adding changed files:  35% |############                        | ETA:  0:00:01
Adding changed files:  40% |##############                      | ETA:  0:00:01
Adding changed files:  45% |################                    | ETA:  0:00:00
Adding changed files:  50% |##################                  | ETA:  0:00:00
Adding changed files:  55% |###################                 | ETA:  0:00:00
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.ffmpeg.org/releases/ffmpeg-8.1.tar.xz...
INFO: Rebasing devtool onto 908dba4bd92234650a7aef22402b9b7b6eb0c1b8
WARNING: Command 'git rebase 908dba4bd92234650a7aef22402b9b7b6eb0c1b8' failed:
Auto-merging ffbuild/common.mak
CONFLICT (content): Merge conflict in ffbuild/common.mak
Auto-merging fftools/Makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/ffmpeg
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/ffmpeg/ffmpeg_8.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1845763350067534228==--

