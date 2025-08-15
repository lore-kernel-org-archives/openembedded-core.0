Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE2ECA0EF1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.11420.1755263228070634958
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bjeo9+JD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NSj3mphO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010198add770fb-9bb8eb1c-4d97-4a75-b942-132a7f45592b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263234;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9uioz/sA6j/dr2M98uQ+dViprT7ynBQPjelChzgW/X4=;
	b=bjeo9+JDTxJM1S5jCPHudHL9/LOTg/DxSr8XEnhUTGxzfCFZogN6zuugjnAROecX
	J1A86cm+Tj8PNpfps4ynV1p644XMnXVl3voeNUddUu82DwdWjTVtDJCwSqAXxEN5D+R
	f17xNeQBMsJ74SijHGvRoYadWaOUvUV0xaIgOgKs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263234;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9uioz/sA6j/dr2M98uQ+dViprT7ynBQPjelChzgW/X4=;
	b=NSj3mphO3+izeSViSdpv87aF1PTUuAx5r5qq8zcJjtiAKQaAbnvA9Vd7uPY8lU5C
	RsfThMDU7SXXfc44a97xP0MOF3X3E7GJvgQKUGxOKX8lOw8MwToP/QtI2UKj+zCtx/6
	zEXAC7rhm6SSOluU5OtoNMqsOSpgT99lkvq0DTgE=
Content-Type: multipart/mixed; boundary="===============5513163681600795476=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] igt-gpu-tools: upgrading to 2.1 FAILED
Message-ID: <01010198add770fb-9bb8eb1c-4d97-4a75-b942-132a7f45592b-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221937

--===============5513163681600795476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *igt-gpu-tools* to *2.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe igt-gpu-tools failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-e06d97f69c754ca39ad0ba9417fb858eb4cab510"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e06d97f69c754ca39ad0ba9417fb858eb4cab510"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 4871829d8b7117553eb2dc1bdb9a0d18de428a98
WARNING: Command 'git rebase 4871829d8b7117553eb2dc1bdb9a0d18de428a98' failed:
Auto-merging lib/igt_aux.c
CONFLICT (content): Merge conflict in lib/igt_aux.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/igt-gpu-tools
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/igt-gpu-tools/igt-gpu-tools_2.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5513163681600795476==--

