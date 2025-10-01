Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5D5CCD1B9
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:35 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.17935.1759325534934502456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cM8YsWHs;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cHKHTMfW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101999ff96ec8-cceb1904-62bd-4b17-9568-132ab3ed7f88-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325548;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cc75SAKwU8p5tIquCvnuWnpdZJUOLrL2aKqaiEprm5A=;
	b=cM8YsWHsoqS7U8P/+6g+jBdJD2zwe3eoa3QtoR03ED7ahvEG2UXeNwRcET6e13VJ
	vy9vwMAb0Lkhmlbg+ibh/jRBhQU7VoiE5YXGsEUSWS9obNAnsUVCih6GUF3ZQqB2KzR
	8nRApsOymeqOuJq2zKjrLAE7i9IZBssgTz8CTXaE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325548;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cc75SAKwU8p5tIquCvnuWnpdZJUOLrL2aKqaiEprm5A=;
	b=cHKHTMfWg9iLCJBAiihAHtbj6cH4KtBdcitpnM30Wj/EStv9GGgiLklerS3yu3bJ
	7W5muj/Uy7SobF/UIuxRb+zU9TBMfKCKsVoA8FK654k3Tcm839gpNbCUy0c3BYsz0dB
	gI/PSXeohzYb7dmKcDZB+uy8P/zrTCp0u+T3fbsw=
Content-Type: multipart/mixed; boundary="===============0333128845075648215=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdk-pixbuf: upgrading to 2.44.3 FAILED
Message-ID: <010101999ff96ec8-cceb1904-62bd-4b17-9568-132ab3ed7f88-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224265

--===============0333128845075648215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gdk-pixbuf* to *2.44.3* has Failed (devtool error).

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
DISTRO_VERSION       = "5.2.99+snapshot-d58ebd99996333b6f87df353ae61353f726c8798"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d58ebd99996333b6f87df353ae61353f726c8798"

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
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1940 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-d58ebd99996333b6f87df353ae61353f726c8798"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d58ebd99996333b6f87df353ae61353f726c8798"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//gdk-pixbuf/2.44/gdk-pixbuf-2.44.3.tar.xz...
INFO: Rebasing devtool onto d506adb68f51c2797b242b834b283f242ebc4c6e
WARNING: Command 'git rebase d506adb68f51c2797b242b834b283f242ebc4c6e' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gdk-pixbuf
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gdk-pixbuf/gdk-pixbuf_2.44.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0333128845075648215==--

