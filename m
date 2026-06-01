Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C72BCD6E74
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:41 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1567.1780328135324235940
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fZ6rJ42a;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jFEuiB8S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019e83d377e6-0e5ef586-25e2-4549-8d39-17801c09386e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yoeqV9G2zY4RXeJm0ViPTApbUdEC5s1+20m3vmYRPD8=;
	b=fZ6rJ42aIsBppZZk4UR3CNDQnwZtRVPFS0AXL+yKp5VbfF5TQVoRFXRXv7yGTmqT
	C9+Y8M7hFE1ZLBf0nreTPFK8RcygoI+VBLTMaTSJzp9Njb1h1qLhogmtc8+sJ/ag4Zv
	s9P5VWIqBW2LCzul7SbiKTFWpJh9irsfw3gwG+ms=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yoeqV9G2zY4RXeJm0ViPTApbUdEC5s1+20m3vmYRPD8=;
	b=jFEuiB8S2e8DzngK+CUYtVfJpUFosxuiN9F2hICofLgs6ewrScCsiN5CNxhVl+Re
	PIwMImV8bKQLqPbAPT58TdpAKePq0N85tDf3g0gg1s+6gGd4PHp3GVkBpUx7SbMf8mB
	MGt2o4A+eUQUPnDcj6nU3U98bZjz7cpaa3Kjd3HY=
Content-Type: multipart/mixed; boundary="===============5681725492806520207=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffstat: upgrading to 1.69 FAILED
Message-ID: <0101019e83d377e6-0e5ef586-25e2-4549-8d39-17801c09386e-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237867

--===============5681725492806520207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffstat* to *1.69* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe diffstat failed.
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
DISTRO_VERSION       = "6.0.99+snapshot-574899c18d003fc8706f4eec66b8230feaf6c550"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:574899c18d003fc8706f4eec66b8230feaf6c550"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-574899c18d003fc8706f4eec66b8230feaf6c550"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:574899c18d003fc8706f4eec66b8230feaf6c550"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://invisible-mirror.net/archives/diffstat/diffstat-1.69.tgz...
INFO: Rebasing devtool onto c5e860c4d11476a5aec16bed420965f9077ad357
WARNING: Command 'git rebase c5e860c4d11476a5aec16bed420965f9077ad357' failed:
Auto-merging configure.in
CONFLICT (content): Merge conflict in configure.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/diffstat
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/diffstat/diffstat_1.69.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5681725492806520207==--

