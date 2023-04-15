Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A55AC7EE45
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:29 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.13800.1681581684687937873
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TRSjKnTV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018786143977-16114c64-01ad-4b8f-b6a2-eb8778ae225b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581685;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=2EBkNXYGK3/LqY3lgpfi538xMgd9jMziaQztgn3ExWA=;
	b=TRSjKnTV0vbr4yhfkcVfWiBJii6x6R0hWyXa73upeRHhpqT5PV2raBc6+jO69+uM
	m1lyZBRD5oTocClM7R0qwrYT/rHPt62+4qHHCxzxOIs+H5u0cTJSA/UXQbrj0dpvLDf
	u/644puaV9vIcSQNPXioWe+/IPCsBKOmeqKpCVZs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581685;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=2EBkNXYGK3/LqY3lgpfi538xMgd9jMziaQztgn3ExWA=;
	b=ofgBedcJuFPtGgmcx2UmaCVSE3gkPirSCF5tHHaAq96jV6Ugi23OXEY4c1lUWoKC
	X4mUjc6Z4fkH8+YUkMFrm2UF5PwpqEY12bJeOtuhFFaquEUnq1PaeTtMVFSYkr2/6d3
	Efmt6khBWi+KIUH4nn1DSMHPK7mpyPmNRYA4IQ7o=
Content-Type: multipart/mixed; boundary="===============4260616128177449290=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.18.1 FAILED
Message-ID: <0101018786143977-16114c64-01ad-4b8f-b6a2-eb8778ae225b-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180047

--===============4260616128177449290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpm* to *4.18.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (11:15:23.943406)
Loading cache...done.
Loaded 1799 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:90cfde5fa1d01bf2849c5c57e01d10585aee851c"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 4588bc3f994338502d2770ad24cbfcdaa6c335ec
WARNING: Command 'git rebase 4588bc3f994338502d2770ad24cbfcdaa6c335ec' failed:
Auto-merging build/rpmfc.c
CONFLICT (content): Merge conflict in build/rpmfc.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/rpm
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/rpm/rpm_4.18.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4260616128177449290==--

