Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AE1D5E369
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17389.1765872134497055278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JeAd/nnW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IFgNi5Id;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262ee154-1c7a4164-787f-4fad-bb05-000548213edc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kp5+p0UFrqU8VTp+UGUoRl3CkyxZV8dtlfNtKKZ9rcg=;
	b=JeAd/nnWmD/JZcu7BvyFyazKoKRal6PHk/c0Raq/Bh92gg6MaAr3SOrXaMgLyRoR
	9qPU9pGapRL2qkTCksSyYKcsuRneuMy3WjQOwBuwcJWi2wWgRaOwgOabM7UW7LMHLlL
	x1jlvTIuf+/nnR0rqirtnl3vwYHg/cCqgIRWpF74=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kp5+p0UFrqU8VTp+UGUoRl3CkyxZV8dtlfNtKKZ9rcg=;
	b=IFgNi5IdnpLSAb0SMChHud5jhvBrZ4f94Bo1DirHI8g9qltTtvJvPl507DYdc2t/
	//jEKZdQADZsGsfxv4gOkURedseNKjof9nXxDRyP/iYYEr6JtoQ6th3jLEVeXTuGI08
	MpbfNOHrIdRlb58ibb8qVAfAM54rWRM+vhjrCHrg=
Content-Type: multipart/mixed; boundary="===============6634031258904346235=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gst-examples: upgrading to 1.26.9 FAILED
Message-ID: <0101019b262ee154-1c7a4164-787f-4fad-bb05-000548213edc-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227894

--===============6634031258904346235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-examples* to *1.26.9* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gst-examples failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-6bcbf1cfebc7b93e15bf3cbdb55c05352d6d307f"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:6bcbf1cfebc7b93e15bf3cbdb55c05352d6d307f"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
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
INFO: Rebasing devtool onto f313fae193089408e278c0dd3450145e5a12307b
WARNING: Command 'git rebase f313fae193089408e278c0dd3450145e5a12307b' failed:
Auto-merging subprojects/gst-examples/playback/player/gtk/meson.build
CONFLICT (content): Merge conflict in subprojects/gst-examples/playback/player/gtk/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gst-examples
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gst-examples/gst-examples_1.26.9.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6634031258904346235==--

