Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48CEC677F1
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:30 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.145823.1673805742614116257
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gpPZDm9t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010185b698bd99-cadfd61a-643a-4f0a-9de9-104a40e41063-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pwpudC+LtX1mvprLlsYAEEP9S/ZJrkmPEVt98VrJU/s=;
	b=gpPZDm9t9eVczm6YaepXSZAemQR+3supF/9rt+Qg5dBGaJd324UKeaFpZi1LzW6t
	V7/XFMRuvdlePu81i6mdunJR+cUR6Bwhs1mVPBhZA2CPEoN9uKbIE+LJOAuMOP6OBP3
	XiOGfiPOglfVZk9vfUcksyXHzzOrr8cZrs2b1l4U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pwpudC+LtX1mvprLlsYAEEP9S/ZJrkmPEVt98VrJU/s=;
	b=hFeehZJlgnaCdNEuJD9rgDHcHYO+C+VPAbyKVDEKFvVg3wvEA2DQ+dGCGXqIIqGN
	kwyez7KpbFnL5JpRbw53rBcBq5vCf3BNE71CPTVwypwEcAy0fJnnQV16VNcrxLKpBHP
	o+JG/EFXPdb+quFb/+00PhQLOPM+xU335OlcNjYk=
Content-Type: multipart/mixed; boundary="===============7418327036966326536=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot: upgrading to 2023.01 FAILED
Message-ID: <01010185b698bd99-cadfd61a-643a-4f0a-9de9-104a40e41063-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175890

--===============7418327036966326536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *u-boot* to *2023.01* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe u-boot failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (05:57:52.577853)
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1696 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fffd8d4c28f1ac484cd9d0d5b9d7759ed8afb777"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 62e2ad1ceafbfdf2c44d3dc1b6efc81e768a96b9
WARNING: Command 'git rebase 62e2ad1ceafbfdf2c44d3dc1b6efc81e768a96b9' failed:
Auto-merging arch/riscv/Makefile
CONFLICT (content): Merge conflict in arch/riscv/Makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/u-boot
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/u-boot/u-boot_2023.01.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7418327036966326536==--

