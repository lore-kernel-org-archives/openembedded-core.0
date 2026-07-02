Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E869CC43602
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 05:32:51 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62831.1782970367480017071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 22:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OBITefvi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bFOE0Sxb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f2150ba87-be44f766-7c7d-4545-9a9a-34ba535e96a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782970366;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=JLAKPTsiL2V/4phAknTVoi0hc66XM0MMGGnP6e+GI98=;
	b=OBITefvic0iRsS/AzLOiKaIaryFTauAnMytVplnJegiDuuoDCJhZBXe/8q2EukdF
	OekIMiIwtptA+8Hl6MSYNHA9PkJBU0RLsna9IT8n71a6Y1e5kNRxswmzcSbPWpwQB8X
	xUS7kgxygQg9Ku7tw69p0j8VUPtEZYSHi64ujhCM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782970366;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=JLAKPTsiL2V/4phAknTVoi0hc66XM0MMGGnP6e+GI98=;
	b=bFOE0SxbdlciC7WMXhwpeLgzSuXIvXCsE7Zis4oZdzoX7iourvAREFuwMa89taLs
	JM4BAm8O3TjgJuKr8wth9uIUl15pMi0t0gV1uyel7MBiw1Z4Oe00Y/HMYD5umJhgRcs
	/LjvMk114FiJCFzEUXF+muhkvrbYoXVCisol4Rls=
Content-Type: multipart/mixed; boundary="===============8703689043131277370=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] pinentry: upgrading to 1.3.3 FAILED
Message-ID: <0101019f2150ba87-be44f766-7c7d-4545-9a9a-34ba535e96a1-000000@us-west-2.amazonses.com>
Date: Thu, 2 Jul 2026 05:32:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 05:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240017

--===============8703689043131277370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pinentry* to *1.3.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe pinentry failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-2996f260dc463398105123334c1ff69063c80a5b"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:2996f260dc463398105123334c1ff69063c80a5b"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-2996f260dc463398105123334c1ff69063c80a5b"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:2996f260dc463398105123334c1ff69063c80a5b"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/pinentry/pinentry-1.3.3.tar.bz2...
INFO: Rebasing devtool onto 5831509388970642f0ce1f8bace3e8e0c581823b
WARNING: Command 'git rebase 5831509388970642f0ce1f8bace3e8e0c581823b' failed:
Auto-merging configure.ac
Auto-merging m4/libassuan.m4
CONFLICT (content): Merge conflict in m4/libassuan.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/pinentry
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/pinentry/pinentry_1.3.3.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/pinentry.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8703689043131277370==--

