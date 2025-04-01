Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC15BC369CE
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:24 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.18055.1743511397201627120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Mw3emzEd;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=h+WzOWex;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010195f160b77e-89688c26-9d50-4216-9488-c372b5c43ebe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l3P3sszB3ZH5xFAn+pSB5iIPgE+d5Phi1FTss97dyXc=;
	b=Mw3emzEdznqD4XOPVZDJtCXBCu2UsTTZWztjJLGRrJToehynXapaR1w7XR8T12iE
	W4XRJEC5hk8j/x7F4BebMS21kz7/MWGNYpolOcimyFHUltjiNtX/bCzn3Gwgqs9RC31
	Yqo8cvQSymSZGlY24rqoc0zfbIVC4RSf2wXs5JZs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l3P3sszB3ZH5xFAn+pSB5iIPgE+d5Phi1FTss97dyXc=;
	b=h+WzOWexyXx0DL/7Mu2wgQ+84qH6dK7nGd5NhUt1vbO934hmiWfybya4+7abLw8L
	ehEYfLBOllDqyc0WhjxDpisJ30Fwz1znBPqyFOStrYmYFyN0N84N/jhYbyGOuAqh+vK
	E3aBWaXSabsKDvEZY8u8ebWIfFGd7bZrDtzWMYVY=
Content-Type: multipart/mixed; boundary="===============2615362927831124873=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] unfs3: upgrading to 0.11.0 FAILED
Message-ID: <01010195f160b77e-89688c26-9d50-4216-9488-c372b5c43ebe-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214082

--===============2615362927831124873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *unfs3* to *0.11.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe unfs3 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f63b6fbfe1ba3df3eae9d012a208cd87547f577e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto ec1660ba33c80d5c67131e163e68834c1a10e243
WARNING: Command 'git rebase ec1660ba33c80d5c67131e163e68834c1a10e243' failed:
Auto-merging daemon.c
CONFLICT (content): Merge conflict in daemon.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/unfs3
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/unfs3/unfs3_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2615362927831124873==--

