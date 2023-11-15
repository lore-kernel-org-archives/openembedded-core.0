Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435CCC54F74
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.14621.1700059030066102586
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bfU27VhL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BD2TaXvP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018bd36a1f4e-78952754-7279-47c3-8ba5-e7a07f7811eb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Mpfr/z28ca0j+ZYqAdUrakef/8iiaFBIWHGCpsxd+6I=;
	b=bfU27VhL5Ej9nl9WJ1dpwPDLINuaiimih250xisIuKO6PO9c5XJsp2MTeuVGFRTe
	1b5TL+uboXVZcrAwuFvNW/E18hOzc4jc23gLPJw6IrThsrqtu1CMaHkfCjwKrG3s+/Y
	ZyiMr9N/amnxgcQ5I6CHqgyO5uPUcwrciT1UnbSw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Mpfr/z28ca0j+ZYqAdUrakef/8iiaFBIWHGCpsxd+6I=;
	b=BD2TaXvPDXvZJIJLiedpiZZoHPhKp9tk7mjrAYv5SQ1hpgQ52/N3ZbufkaInhUyn
	BF7WD/U7mH7zklDIoSEFvI5cUACzzOaje3yv980TPDMSNWfuE77/NHPRkmcz2NJN1wS
	JnJ1/ascm8HXjlwuvJXhtaMIdIOlmFeMimR1hlvw=
Content-Type: multipart/mixed; boundary="===============6958579829467004492=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.17.0 FAILED
Message-ID: <0101018bd36a1f4e-78952754-7279-47c3-8ba5-e7a07f7811eb-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190624

--===============6958579829467004492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *librepo* to *1.17.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe librepo failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-f9d2065a94ad9b0939acb3a9c97ead331256c018"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f9d2065a94ad9b0939acb3a9c97ead331256c018"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 6 Local 6 Mirrors 0 Missed 0 Current 24 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto ae727d99086f70f39fba5695af5460e1da908c1b
WARNING: Command 'git rebase ae727d99086f70f39fba5695af5460e1da908c1b' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/librepo
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/librepo/librepo_1.17.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6958579829467004492==--

