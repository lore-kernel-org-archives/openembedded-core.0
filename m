Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D32CAC5BD
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:48 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.30902.1757937287580118815
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=m1vAiGs2;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jQovZTxI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101994d3a3f14-0b2a2c0a-ac9d-4a63-88ed-ba9df6250073-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937287;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PaOtRymbQ5OdkhDIIoaJ5cF778xhoq31c53Y/oj4Wmg=;
	b=m1vAiGs2vYhwc7qlCXHuuPQe8PyfYNbZcBJ8zCsQ5wUD1TRRn13xBGIyYXB/NqR6
	8f+TqgdUQFTGJrXPIQXslDLpFKuR0LuEeOoatSYvLtXV9mD/sSd1MiBJ5wG+leLwIaN
	IyPFeJRk0ApeMSTfJp/P35ubzethsWKzHI1WhMBI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937287;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PaOtRymbQ5OdkhDIIoaJ5cF778xhoq31c53Y/oj4Wmg=;
	b=jQovZTxIN80nq3HWmKI/7nW8a4iQGs9RasIwuaPmmxGbwL08Plak9P0ds167QyaC
	/dr88+cijwoovmSM1dCYwkQNr09nt3o/fPO6U+uS1Ww4TY0B2RhE62tl06ALa05B/Xh
	qPqxN5kgijPY61xl2VOMxrqI3PBKPgsWkxiBcZPY=
Content-Type: multipart/mixed; boundary="===============3770861576928051320=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdk-pixbuf: upgrading to 2.44.1 FAILED
Message-ID: <010101994d3a3f14-0b2a2c0a-ac9d-4a63-88ed-ba9df6250073-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223444

--===============3770861576928051320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gdk-pixbuf* to *2.44.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gdk-pixbuf failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1939 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-8916a3c7c45899fcbb44a75c7072fb8391678c3b"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8916a3c7c45899fcbb44a75c7072fb8391678c3b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1940 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-8916a3c7c45899fcbb44a75c7072fb8391678c3b"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8916a3c7c45899fcbb44a75c7072fb8391678c3b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//gdk-pixbuf/2.44/gdk-pixbuf-2.44.1.tar.xz...
INFO: Rebasing devtool onto c9746547d7e795475dfc744f9483d98a66ecb916
WARNING: Command 'git rebase c9746547d7e795475dfc744f9483d98a66ecb916' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gdk-pixbuf
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gdk-pixbuf/gdk-pixbuf_2.44.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3770861576928051320==--

