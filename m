Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEFFCD5BA9
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:35 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34813.1778851223005675442
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HmoMkPBc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=10fpdH2C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e2bcb92b4-9969336e-e474-4b19-bf92-233d77a4a9b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1Q4QyASLenUuEP6S+vPDRFbRR+h4kMKoLFj+bhYaMzI=;
	b=HmoMkPBc3uqUo3YxyCguKZ/nTPXH1IztM+RdQqhHjk0xcNhpVBkUM9YEIqKLHg0D
	dK8tIiXmMR2ewaZwKz12ZjZgEZy+MCsHf43dsgVd9/AUSTiEy695LF1hz5rfi9aQHBg
	NHdsZa2J5GyQrBoeFsZfn9bpGVBLeSlQ2xXTGPaU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1Q4QyASLenUuEP6S+vPDRFbRR+h4kMKoLFj+bhYaMzI=;
	b=10fpdH2CToyLkEHJJnCLcA9JuCd8qEA4oOFbh02EwwQTfq0vmvbOtZ/2Jlvb5YQY
	14F1V7v/zcxqoOZvaX6jZFhGFRV4hKXrc3/PzStQXixaFxIq0JpMadX8Y998Zde9SB8
	Oszsk/gxOiJZ6DDcDhFjQKXwANXpUoy/8uSJPjpE=
Content-Type: multipart/mixed; boundary="===============1046453465528058417=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdb-cross-x86_64,gdb-cross-canadian-x86-64,gdb: upgrading to
 17.2,17.2,17.2 FAILED
Message-ID: <0101019e2bcb92b4-9969336e-e474-4b19-bf92-233d77a4a9b8-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237085

--===============1046453465528058417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gdb-cross-x86_64,gdb-cross-canadian-x86-64,gdb* to *17.2,17.2,17.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gdb-cross-x86_64 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1975 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-11c852ece75605328103b77451ef56df6a123065"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:11c852ece75605328103b77451ef56df6a123065"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 9 Local 9 Mirrors 0 Missed 0 Current 18 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-11c852ece75605328103b77451ef56df6a123065"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:11c852ece75605328103b77451ef56df6a123065"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/gdb/gdb-17.2.tar.xz...
INFO: Rebasing devtool onto f669d9b08cf979dba9c3f02446627c591e54389d
WARNING: Command 'git rebase f669d9b08cf979dba9c3f02446627c591e54389d' failed:
Auto-merging gdb/config.in
CONFLICT (content): Merge conflict in gdb/config.in
Auto-merging gdb/configure
CONFLICT (content): Merge conflict in gdb/configure
Auto-merging gdb/configure.ac
CONFLICT (content): Merge conflict in gdb/configure.ac
Auto-merging gdb/ser-unix.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gdb-cross-x86_64
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gdb-cross-x86_64/gdb-cross-x86_64_17.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1046453465528058417==--

