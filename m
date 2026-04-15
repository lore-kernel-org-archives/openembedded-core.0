Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55782F43841
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:57 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19748.1776261891962317150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bu6uRUh1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fGtWw2zw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019d9175854e-46afb919-90a8-497f-b39f-f7678f6447ce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261891;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=45vQNH/OgR4WnxzTzBfovzH93u7Des7f157tD9eQE5c=;
	b=bu6uRUh1gmnQPjfv11EGFiREZ6/dqGswU6tjL+5sjkRtbWwBBhalhuaSHgYL/Om0
	sLKOHMf6qrVfpXrzk9Ox3eDXCUqcc4qBKK1oklcQtk65kla7sqxqIM+/Wie2CMjzw1p
	NqPAAbrJPUgCUStpJbjdtoprQrllFYohQxoJ99yM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261891;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=45vQNH/OgR4WnxzTzBfovzH93u7Des7f157tD9eQE5c=;
	b=fGtWw2zwBYYZa1IesMS9FAfvex552mJi7KcvRdCkJk54iL44gg6XDBHZpyjx4k3A
	optlvbAjbLkp9AQXVke0BG7D/532teqrNo0uYovZIZdD6BzNdQP7XXEcVny3qKwLldR
	OoNcvcjl3VXqdhQ5Fh8QioR7IEev257HLK1W5HZs=
Content-Type: multipart/mixed; boundary="===============5314355412791591130=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 7fe9e40749b0a322cd00e007366386f5f7221390
 FAILED
Message-ID: <0101019d9175854e-46afb919-90a8-497f-b39f-f7678f6447ce-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235286

--===============5314355412791591130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *7fe9e40749b0a322cd00e007366386f5f7221390* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe piglit failed.
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
DISTRO_VERSION       = "5.3.99+snapshot-94c55d64120d481cdde7cc9a2742b7f6d8c9338f"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:94c55d64120d481cdde7cc9a2742b7f6d8c9338f"
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
INFO: Rebasing devtool onto 7fe9e40749b0a322cd00e007366386f5f7221390
WARNING: Command 'git rebase 7fe9e40749b0a322cd00e007366386f5f7221390' failed:
Auto-merging tests/util/piglit-test-pattern.cpp
CONFLICT (content): Merge conflict in tests/util/piglit-test-pattern.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/piglit
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/piglit/piglit_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5314355412791591130==--

