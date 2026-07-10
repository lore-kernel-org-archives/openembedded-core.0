Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66365C44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:49:33 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8004.1783669769994044114
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=idyGdFwC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vgFoKuj6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f4b00c440-036b85ac-17b8-4b90-8357-98447d985b2d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783669769;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ME2/6cRdrKhKSnLAxJb3ceUdRIRKmCW9vb+uoLuzXM0=;
	b=idyGdFwCIG0x9A0QhoRJ978nq1dNDonmGOi2ybkTQgBvXlZII3kY0n0wASmMSLG4
	dymsvjbJUIjzbNPp4El6YLxVD2cIj9hoJUkrEP7m815aETxmULmXr6u0J1eqfdhEy7m
	0yy/uuRb0cy6OM/819nn6ce/Oh1lKUjA0shvOp+s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783669769;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ME2/6cRdrKhKSnLAxJb3ceUdRIRKmCW9vb+uoLuzXM0=;
	b=vgFoKuj6wg/xry+NNMGP6EphQHqHbTuh+tntn+1hTlbXme7yEXonNGvbw3oUu7OJ
	r5nC1mHGFhfi7kGUu1oRWtZZcfG6+CdYFKgw6aJPSzbcTgWaUiQT4kgTsIvxngz/OkW
	Hy46SiblzqniYs66fWKE5cDWram68xtNW6JLcMFo=
Content-Type: multipart/mixed; boundary="===============2630317184889120805=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-utils: upgrading to 2.24.0 FAILED
Message-ID: <0101019f4b00c440-036b85ac-17b8-4b90-8357-98447d985b2d-000000@us-west-2.amazonses.com>
Date: Fri, 10 Jul 2026 07:49:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240607

--===============2630317184889120805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libva-utils* to *2.24.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libva-utils failed.
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
DISTRO_VERSION       = "6.0.99+snapshot-6c077d133983e1322efc57e9cc386375ba3f500c"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:6c077d133983e1322efc57e9cc386375ba3f500c"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c3ba9e07e61841f1bc2c9932d957b44e5827a852
WARNING: Command 'git rebase c3ba9e07e61841f1bc2c9932d957b44e5827a852' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libva-utils
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libva-utils/libva-utils_2.24.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libva-utils.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2630317184889120805==--

