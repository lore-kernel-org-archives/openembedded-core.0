Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFB3C3ABDF
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1793.1746113618967861266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LRBC2lGO;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rVUw3iay;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101968c7b9801-f2434014-2163-4822-aac3-e640b2d12c7c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pXgjuLu16M7l2DXeuTP6qop42/PwwX96nN7Gbec6pW0=;
	b=LRBC2lGO8w+XsmhujZ+mT1CR4RX9XlGNuQQKYnFQ3LM2ac+KhP94l5oXW1RODx9+
	68X3QIYNMC0w4HWtwyBCI5T/QMksz2q8w40bBp4izrK/ElzqV2ZgPaj0az1OfwVKVKS
	2z8LXU6RrvcEJpPi9qt0ZbKjFXEuQ8hOVvodhepE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pXgjuLu16M7l2DXeuTP6qop42/PwwX96nN7Gbec6pW0=;
	b=rVUw3iayfAjoVJ+suxfWcnX/QC56NX/lQ7qB2VTzf9KtOf+TK35zBelgMxg7CB2n
	VVRwrmL1ARlBH9pFm2r5WLYqc9IDlNoM62SDqeZIDC7GsMJyxnGU9JpKwBKnoQcA63o
	hODqgl6a9+HolUJ2VZTxIrwmAX4LrzzGMdiOj4W0=
Content-Type: multipart/mixed; boundary="===============4371350949647354307=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] igt-gpu-tools: upgrading to 2.0 FAILED
Message-ID: <010101968c7b9801-f2434014-2163-4822-aac3-e640b2d12c7c-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215862

--===============4371350949647354307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *igt-gpu-tools* to *2.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe igt-gpu-tools failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a4606be1380a59c481b9eab2f164d8807c1d7d59"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto e582faa38f9466303b4634a60053c3201dae9539
WARNING: Command 'git rebase e582faa38f9466303b4634a60053c3201dae9539' failed:
Auto-merging lib/igt_aux.c
CONFLICT (content): Merge conflict in lib/igt_aux.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/igt-gpu-tools
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/igt-gpu-tools/igt-gpu-tools_2.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4371350949647354307==--

