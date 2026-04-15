Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D491FF4384D
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:57 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19734.1776261873543329735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=I7sWmb1A;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BUUWCTrU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019d91758476-12c02f0a-abe3-48ca-95e6-89856429f329-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261891;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/7oLGCxtyk1cJ2GBa3thHaXlRALxzif49aCdPId68V0=;
	b=I7sWmb1AH42Qcm2r3Krg1rukOXE+tnTOBtuDxVMntyMzPrdTZ/q+o/VOMKEwFA5s
	GwvYTVJpdnxHH1l0XWGibrdZ9gIZ893xY7pazqXGifoK3Mja07/MJX5PJa701lLBGuD
	XmHxJ/EG3DquEC3yLsz7fgY2NxqYti8e8c4X6An4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261891;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/7oLGCxtyk1cJ2GBa3thHaXlRALxzif49aCdPId68V0=;
	b=BUUWCTrUMqozx1SBsWnCEDUQGAM0BK6RnRofvKlQMotP2+M5alVZx6S3SdHoBoIt
	iD5H9YdrjfpS4D/jyzp0PAfOqlKj2Ik4wMhxFxtAuwIvkyzJK9xdkULgTal8/3K7roJ
	bxCipIsU/sk4gG5xP93zhyUavC4o7Aca5l5febmA=
Content-Type: multipart/mixed; boundary="===============8119034797381217854=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.31.1 FAILED
Message-ID: <0101019d91758476-12c02f0a-abe3-48ca-95e6-89856429f329-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235282

--===============8119034797381217854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.31.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libinput failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-1337e34f50d4a2391f6a671e78f5635b2374dd50"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:1337e34f50d4a2391f6a671e78f5635b2374dd50"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
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
INFO: Rebasing devtool onto 1920686963fe224f7d2f4fe195cbed651e11d455
WARNING: Command 'git rebase 1920686963fe224f7d2f4fe195cbed651e11d455' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libinput
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libinput/libinput_1.31.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8119034797381217854==--

