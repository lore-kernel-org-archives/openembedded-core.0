Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6169F013EC
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:11 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28979.1773582123230324020
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JR9LUNyX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=G0KekinW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019cf1bb7eb4-2f94a106-182a-4383-a36f-7382c78fae67-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582122;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xvso0pk6fhm1jtRFeJ6BYeo9Gv319uKlmfiYj4YIi9s=;
	b=JR9LUNyXmwagDDUU/uRJox868Qg+fWyr+aweSKQh+5xhmmznmnF27z77FYK3lKFu
	YeD2Is3bRq9StWpCKnYeAMRqO57Pm3UGg4V7V6YG/+jGQA60nQfJTgEDLsTqtN9UGsv
	wiyoh0lBXsJ/2fBr64i69QbbbBiFU3weXpYiPLRM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582122;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xvso0pk6fhm1jtRFeJ6BYeo9Gv319uKlmfiYj4YIi9s=;
	b=G0KekinWvmDjP3OcAz7dyZHMj0kbJib7DWbv2mVtYjYPku71pEPKC8YbfEP3tgnm
	YL045A+Ysfzf81bILgc9JQDHf5V4gYnWGD+buE8ZedlUpfBf/IcFmJECt/d3Fx5C8u4
	0A2LqaPZk1sVIXuMlnXhchV4ITo7xfdkXUILPj0I=
Content-Type: multipart/mixed; boundary="===============7782079792256545334=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] librsvg: upgrading to 2.62.0 FAILED
Message-ID: <0101019cf1bb7eb4-2f94a106-182a-4383-a36f-7382c78fae67-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233168

--===============7782079792256545334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librsvg* to *2.62.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe librsvg failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-93bc97a95125202444bb933812279b1bbc042d7e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:93bc97a95125202444bb933812279b1bbc042d7e"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1972 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-93bc97a95125202444bb933812279b1bbc042d7e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:93bc97a95125202444bb933812279b1bbc042d7e"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  69% |#########################           | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-93bc97a95125202444bb933812279b1bbc042d7e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:93bc97a95125202444bb933812279b1bbc042d7e"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 25 Local 25 Mirrors 0 Missed 0 Current 62 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 292 tasks of which 291 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//librsvg/2.62/librsvg-2.62.0.tar.xz;name=archive...
INFO: Rebasing devtool onto 4b7e5b69b79f3985c77a967ec854a8dc00ab3b91
WARNING: Command 'git rebase 4b7e5b69b79f3985c77a967ec854a8dc00ab3b91' failed:
Auto-merging gdk-pixbuf-loader/meson.build
CONFLICT (content): Merge conflict in gdk-pixbuf-loader/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Running extra recipe upgrade task: do_update_crates
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/librsvg
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/librsvg/librsvg_2.62.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7782079792256545334==--

