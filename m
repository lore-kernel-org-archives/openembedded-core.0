Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4321C4450B
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:12:00 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2989.1783577514235436641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Bsyb6AZx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CD6gypTo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f45810d48-5cb7322d-a2cd-4b04-8d27-02dd6e685a26-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783577513;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=lI1uJTFGnW0OBeLTy6nFgUSDs3XzHRRp342FkdbE3jw=;
	b=Bsyb6AZxJnZWAYJg8ujBnl1C+XeWQx7LGUvmR8M/vsyV7+anahy/qwNWde2QdL6g
	+Ch01EEmvpOTzPy2OZ5O4XNuMiPbK12dFi3rTL5uQdoJ0SGT5wRk7GIqhYtK6zROvgG
	LjRU6Hl22FpyBY6vBaKEeZcLzGvr9EF+kJNOvH9g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783577513;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=lI1uJTFGnW0OBeLTy6nFgUSDs3XzHRRp342FkdbE3jw=;
	b=CD6gypToDlMJHPCNCaZIgJkFtMBaD4rFKaOzdY8tLzGUYebXY9tQzjdwWSqK8EQu
	/p0SioYQBxCiJDerr4wCGB2olA6gCdplqNxNWRg/6jd6fJXfPVyViUdI5l66QBBhT4F
	qLGVNZg0nVytnOl6zic51k8jlD4SgNXRG5UqR9uE=
Content-Type: multipart/mixed; boundary="===============5207538396397137142=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libva,libva-initial: upgrading to 2.24.1,2.24.1 FAILED
Message-ID: <0101019f45810d48-5cb7322d-a2cd-4b04-8d27-02dd6e685a26-000000@us-west-2.amazonses.com>
Date: Thu, 9 Jul 2026 06:11:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.09-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 06:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240526

--===============5207538396397137142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libva,libva-initial* to *2.24.1,2.24.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libva failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1979 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-50576a1411da4f55b1707e126c404235a72fad78"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:50576a1411da4f55b1707e126c404235a72fad78"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 14 Mirrors 0 Missed 0 Current 16 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 710eb465c6277ee2cac3e6948767b01eebe7e77a
WARNING: Command 'git rebase 710eb465c6277ee2cac3e6948767b01eebe7e77a' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libva
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libva/libva_2.24.1.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libva.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5207538396397137142==--

