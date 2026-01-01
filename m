Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4654AEEE26E
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102962.1767267468928181330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3+jPTaYr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oZAL0xXv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b7959b92d-f9a59df5-961c-49b4-919c-e506d5dbe99b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YiBTJ+S0Cr1F19I+0Iy1oLXKKpCINwnlMQ4jfVSwr/I=;
	b=3+jPTaYrbpm3yNFGo8hKcHrcqO9m3ey3bqGfQNO4nefatnptJQOqy3hA/8y4hVfy
	xRhsJscj/Z4evcdI64dXkKLPiupOcDuFkhat1tbtQJ5ui+ShBcqibhkDn6fjWXcowOM
	yTHIm9Bd7xYPfLlZBHFo0CJVhR3r0+hJt6t8IbJc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YiBTJ+S0Cr1F19I+0Iy1oLXKKpCINwnlMQ4jfVSwr/I=;
	b=oZAL0xXv7P0v0Cr5jzG0wGj5PiZ0V81kMY9Av7ghYjEH54uTcyX/Vg2WK41l/BnD
	32hxcBVvZ63ESwi4bWYeN+ICspjZ/yfqamUe4+h12wwTfMj3EF/bVp/MvLb2hu8EhR5
	kS3LWN9vWY7UwEzIstZIOPizrMVkA9qXW0Cpx6P4=
Content-Type: multipart/mixed; boundary="===============4233741259987587727=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.1.1 FAILED
Message-ID: <0101019b7959b92d-f9a59df5-961c-49b4-919c-e506d5dbe99b-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:38:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228805

--===============4233741259987587727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *appstream* to *1.1.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe appstream failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1954 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-b0c9c42e02a610547ae7f6d8152513bda50fe3d4"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:b0c9c42e02a610547ae7f6d8152513bda50fe3d4"
meta-yocto-bsp       
meta-poky            = "master:853589ccc3445f5952efc02a7102587cb4d4f075"
workspace            = "<unknown>:<unknown>"

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
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1955 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-b0c9c42e02a610547ae7f6d8152513bda50fe3d4"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:b0c9c42e02a610547ae7f6d8152513bda50fe3d4"
meta-yocto-bsp       
meta-poky            = "master:853589ccc3445f5952efc02a7102587cb4d4f075"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.freedesktop.org/software/appstream/releases/AppStream-1.1.1.tar.xz...
INFO: Rebasing devtool onto 7bcb94ad591a79eab97898211f3713f05fa0ab53
WARNING: Command 'git rebase 7bcb94ad591a79eab97898211f3713f05fa0ab53' failed:
Auto-merging qt/meson.build
CONFLICT (content): Merge conflict in qt/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/appstream
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/appstream/appstream_1.1.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4233741259987587727==--

