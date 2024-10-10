Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8B8D1A45F
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.53372.1728588960823120631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NR99P05F;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=yyUDXD82;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019277eec951-5258f1df-6a18-40c4-8018-b09ce08d82e7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kYZEXVemiEDAoegaVtkZWEedCYw6LfAqpmuTCJvmofk=;
	b=NR99P05FQHtavOjUrXVWh4gbFbTRHxD0A1HcnE0qjNJQ/K2svTojkvI17b9LBLnU
	l6aVHmYC57HXn74TXskTl6p5pNqSc2tft0WNgDcfB1XDue9sGfBfME5mccVH6pBORRe
	1EIyzoeEwkpQaX37WQ6KlBwHSBHyJsrj2L4LNHgQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kYZEXVemiEDAoegaVtkZWEedCYw6LfAqpmuTCJvmofk=;
	b=yyUDXD82dyVXW980/Z2Q2nySVcog17csU3b9jXK7sB+mn3IFvNo9lrObVymZtLXM
	j9OgmwFzUac2fcUbn5MnV9irUebfgMmb0/E6CInMUWOKG245SGd0nl7jLqTp9gUaRxk
	waYRpO8RO+iK1iRFE8H+Bqulp6heLBemh8fgA2TQ=
Content-Type: multipart/mixed; boundary="===============9174609056987957604=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtc: upgrading to 1.7.1 FAILED
Message-ID: <0101019277eec951-5258f1df-6a18-40c4-8018-b09ce08d82e7-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205593

--===============9174609056987957604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dtc* to *1.7.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-dtc failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:56cfb6ddbc0b5bacaa165a3599068a423a1124ad"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 99031e3a4a6e479466ae795790b44727434ca27d
WARNING: Command 'git rebase 99031e3a4a6e479466ae795790b44727434ca27d' failed:
Auto-merging libfdt/fdt_overlay.c
Auto-merging libfdt/libfdt.h
Auto-merging libfdt/version.lds
CONFLICT (content): Merge conflict in libfdt/version.lds

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-dtc
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-dtc/python3-dtc_1.7.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9174609056987957604==--

