Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED164C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 05:34:55 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86177.1783056892689320839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 22:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZT70Mkos;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UNBjAEAG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f2678fed6-69e896a5-43c5-43e5-b3ae-7076db925b4e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783056891;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=CW79Z0C2EQF/IQo227DbYraXXHU+Rg5L1mkY4NKqpVk=;
	b=ZT70MkosMH7xR8xC7yKS4m9n0jSn5W/nXfwnQgO0DzREKa6mgAMymbLw7zOCGxQt
	kcA14M8wPHYsu1yOXGzyatqBc07x9iuVPY7uFQllkMBnxUpWerLP05kIEYF77LcLl7h
	cGTIOYWtgDmaO04rpiZeKOpc07K+xfNRT70n1Q/U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783056891;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=CW79Z0C2EQF/IQo227DbYraXXHU+Rg5L1mkY4NKqpVk=;
	b=UNBjAEAGEG9hXdVKikSyarOt/MkW6FeR3OEmx8l2Ldt/W6B1NXFAyGsdBeppPaO1
	iyUtMZQQ9RoGpSdHrac5jfATdm+3Ut27jpYcKY+rnLiFb7Q3ChqSr1my14NaE4c8tRq
	PRCkc2q0ln93Ospk/DXaXK/WojEBr0SVVz8YTqlw=
Content-Type: multipart/mixed; boundary="===============4152824485399363364=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libva,libva-initial: upgrading to 2.24.0,2.24.0 FAILED
Message-ID: <0101019f2678fed6-69e896a5-43c5-43e5-b3ae-7076db925b4e-000000@us-west-2.amazonses.com>
Date: Fri, 3 Jul 2026 05:34:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.03-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 05:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240072

--===============4152824485399363364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libva,libva-initial* to *2.24.0,2.24.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libva failed.
NOTE: Reconnecting to bitbake server...
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
DISTRO_VERSION       = "6.0.99+snapshot-0776ddc4508387f3c1a13f7a1b6e2a6119aea4b2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:0776ddc4508387f3c1a13f7a1b6e2a6119aea4b2"
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
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto add80723247b8031fb8de14d8f599923d3759242
WARNING: Command 'git rebase add80723247b8031fb8de14d8f599923d3759242' failed:
Auto-merging configure.ac
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libva
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libva/libva_2.24.0.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libva.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4152824485399363364==--

