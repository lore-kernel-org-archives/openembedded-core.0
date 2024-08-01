Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D728CC54E62
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.75497.1722536828104115023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YNObzqJ/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=eBBDZCpZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101910f322dea-d7a1abf4-6f99-4b5e-bf6b-51829865dd79-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=11csuWm9Gqi5lIBqdXu3/2qb7e0obBwTiPjc2ftir8E=;
	b=YNObzqJ/U3gTf3smma+NUHsotyDo75zjU1lq6rODl1qULfD40gi0wK1yxaR2uDIv
	M1DJ/9rtKEVQWleM6RMPkAB5w8BWTj5XPL9lWNIt90mwPkfVOFIpalavQ1sP9T2QhTA
	BuNH3gMoKKwax1H7Ak/621OO05dabSm0dHkyHrJc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=11csuWm9Gqi5lIBqdXu3/2qb7e0obBwTiPjc2ftir8E=;
	b=eBBDZCpZp89WymEI550wkf1dEjO/QVEkbTT9WHTfUgPZImBSU4Bxq8SH7Wb1r9cp
	VeyPjGTIZkfBVmo7yJSsbXhdbOvRCUDoSDQS1aRGp/NeKUGjkc0U8sGOSd0zs5dOEDc
	2Ll9PL3+0MXGTHehzHoj0zZ9oPhASYdngiEu2OfA=
Content-Type: multipart/mixed; boundary="===============6447002498105579801=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-utils: upgrading to 2.22.0 FAILED
Message-ID: <010101910f322dea-d7a1abf4-6f99-4b5e-bf6b-51829865dd79-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202844

--===============6447002498105579801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libva-utils* to *2.22.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libva-utils failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-c7938ecd8eab46e126c71b7f1916f0228e949fa7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c7938ecd8eab46e126c71b7f1916f0228e949fa7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 1a13ae13382b7b548f3a7e8035e1d7df66662c0a
WARNING: Command 'git rebase 1a13ae13382b7b548f3a7e8035e1d7df66662c0a' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libva-utils
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libva-utils/libva-utils_2.22.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6447002498105579801==--

