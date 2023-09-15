Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF075EED621
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 18:59:58 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.29460.1694804392195964121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AHruVvxM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qfy1el4s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a9a36b5de-34f9c5b5-dfda-4c5e-a8f9-a2976b659d27-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804391;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=7eFR99XDD1lhqsD1l09DciL0P0uCjklhzD9e14PjdQA=;
	b=AHruVvxMcjYdnQp0XrhWZW82ARv6E2NTLPdf+FWjA3Mrnt4znPBKf+OT17V/CmYH
	R7uWUiFG1pJT6IaqloRDeiCl6nHzQEsfggxqPqKSDyPLAqKTp3c27QY/z9kgj1xDPnh
	wtSrFY2DsBw0tKzFO+LQFZJ7ZsgB/i7QKGDHHAN0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804391;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=7eFR99XDD1lhqsD1l09DciL0P0uCjklhzD9e14PjdQA=;
	b=qfy1el4s6QZmXJCbYY4NJTJ8c7UHVC+oz/mV14c16lpmuJuzF4sujrW6MmRYWDpo
	Up19GiAla31VxnC8TezSjZTPovVU8Qg3Oh0VCvd8q8kNeSxsE1WbAowLWhSJ90sFGhm
	wNOL+R73AYsDBkPxq4+KLX+pxQ1S91kuQi6uWYz0=
Content-Type: multipart/mixed; boundary="===============6012755553129602871=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202308 FAILED
Message-ID: <0101018a9a36b5de-34f9c5b5-dfda-4c5e-a8f9-a2976b659d27-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 18:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187682

--===============6012755553129602871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ovmf* to *edk2-stable202308* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ovmf failed.
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1808 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-b84408b74e752a5325b553fdea7655e0a372af40"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b84408b74e752a5325b553fdea7655e0a372af40"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 30 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 819cfc6b42a68790a23509e4fcc58ceb70e1965e
WARNING: Command 'git rebase 819cfc6b42a68790a23509e4fcc58ceb70e1965e' failed:
Auto-merging BaseTools/Source/C/Makefiles/header.makefile
CONFLICT (content): Merge conflict in BaseTools/Source/C/Makefiles/header.makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/ovmf
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/ovmf/ovmf_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6012755553129602871==--

