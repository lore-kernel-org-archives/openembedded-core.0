Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4522C54740
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.131424.1723748334192821858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cYA7PQi2;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=E2k2JCJ+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019157683792-117b60a6-c2f6-4811-b97c-228668d5d41c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RPlGVwQ9rC0QxT2C8aKU7AlBV0mlxmUAf6ZDOHbFsdA=;
	b=cYA7PQi2eSkCIfKkSQbAXeQbELwfyCC2nn7amuZZemM+oecbohGi3/nW4pF+/2Zq
	Jmwco/oBd6eOvjeFxS8emrIe8YkPpI+SeG+KcMe0Cb128A/Grho023HlnQDX9pImoJJ
	R4E7Axkftm/OyDH5I9kTnihZlyYDc0AgDaJkLhXc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RPlGVwQ9rC0QxT2C8aKU7AlBV0mlxmUAf6ZDOHbFsdA=;
	b=E2k2JCJ+67NHh66aGCMuFEliAmvJ04pZYUKRPi/YYLX/o81SY8rXril1Rs5bQ5JT
	cK98bPl5R6qleosNqYftEM0LIuuHS5Vvf3MHmSvLXl1p84GFJvF+hX3ZQpokiZmcMoC
	+qjQxYrtUsI+NHrJOnNdR4C8ly/Xfq5tvSp/6WGA=
Content-Type: multipart/mixed; boundary="===============4144581531706606395=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fmt: upgrading to 11.0.2 FAILED
Message-ID: <0101019157683792-117b60a6-c2f6-4811-b97c-228668d5d41c-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203363

--===============4144581531706606395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fmt* to *11.0.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe fmt failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-87eefc81a82bbb3edf89e9e3051f136372062e00"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:87eefc81a82bbb3edf89e9e3051f136372062e00"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 0c9fce2ffefecfdce794e1859584e25877b7b592
WARNING: Command 'git rebase 0c9fce2ffefecfdce794e1859584e25877b7b592' failed:
Auto-merging ChangeLog.md
CONFLICT (content): Merge conflict in ChangeLog.md
Auto-merging include/fmt/core.h
CONFLICT (content): Merge conflict in include/fmt/core.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/fmt
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/fmt/fmt_11.0.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4144581531706606395==--

