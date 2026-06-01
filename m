Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0326CD98C4
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:50 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1561.1780328133528185887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NexR1KU4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=f8fDmYsk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019e83d3aacb-871e48ce-c5d9-4abf-a771-458673257bed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AheIXLQaQ5DQ/HgPXS8rZA5CPhzaciCHgiEgmmSXF0M=;
	b=NexR1KU4rYWitlKtFjUNOklfHcPVE0YkMZL/UglWvz9Ip6j11IwJ755ce+ZElNzq
	ASX7S7z3oW9vGr6IxMnKn9FP2c7/EM7MfzcJ3oEJPwnC/An8MELOjCAcAYJ8DEAhcXZ
	4meKLS3rdlh7H3TqYOG0NrSeNBgJh22oVM3ZOXJM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AheIXLQaQ5DQ/HgPXS8rZA5CPhzaciCHgiEgmmSXF0M=;
	b=f8fDmYskuodvV2weESsy4ldjib+opzQaRy/t6ZZB6scRE7O55Z9Lzuv6AlzFuVc4
	FRSmNg+5Xj5PVxauoeroTaOOFpKUd2abErKcHmA5r/qOfZsMntgzepw+XkKcbb4BViG
	6rftspaWgbmRw1DBMZ4/QejPuAtO2nzaVOAXytIw=
Content-Type: multipart/mixed; boundary="===============2958346575979190217=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gtk-doc: upgrading to 1.36.1 FAILED
Message-ID: <0101019e83d3aacb-871e48ce-c5d9-4abf-a771-458673257bed-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237916

--===============2958346575979190217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk-doc* to *1.36.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gtk-doc -V 1.36.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-d5a9dfc9489ddd518e058428a0dd8bfadcfd258d"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d5a9dfc9489ddd518e058428a0dd8bfadcfd258d"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 5 Local 5 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
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
DISTRO_VERSION       = "6.0.99+snapshot-d5a9dfc9489ddd518e058428a0dd8bfadcfd258d"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d5a9dfc9489ddd518e058428a0dd8bfadcfd258d"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 6 Local 5 Mirrors 0 Missed 1 Current 22 (83% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//gtk-doc/1.36/gtk-doc-1.36.1.tar.xz;name=archive...
INFO: Rebasing devtool onto 324518896d8a1a591d3de7f22f34356f1ec8cfc3
WARNING: Command 'git rebase 324518896d8a1a591d3de7f22f34356f1ec8cfc3' failed:
CONFLICT (modify/delete): configure.ac deleted in HEAD and modified in 7fa2b9a (Do not error out if xsltproc is not found.).  Version 7fa2b9a (Do not error out if xsltproc is not found.) of configure.ac left in tree.

INFO: Rebasing devtool-override-class-native onto 324518896d8a1a591d3de7f22f34356f1ec8cfc3
ERROR: Execution of 'git checkout devtool-override-class-native' failed with exit code 1:
error: you need to resolve your current index first
configure.ac: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2958346575979190217==--

