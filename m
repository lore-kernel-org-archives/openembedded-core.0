Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6EAC48BF7
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:09 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4582.1704114719294638660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SBO6ZApl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oQxFTqB0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018cc52707b4-ac8984a7-e7db-4bd1-a9d2-7425e9fc3026-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114718;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=RBIz8n8NN7euS/oxnfc/Puqdu1ouZslhT+iGwYpObsQ=;
	b=SBO6ZAplb82x0J6a5IAwF2+apVGYR6OCMNtvhQ0K1DRI/zVU+mE0dxk1qFWdd2Qr
	SEjNEWYBbch5y5qAq5YJsF8Le5YdLMbX5MDD9BxQDFej00WzBMOotKXvWGmTg7Bn0lg
	KYFN0YtmfjceZrFsMG9V6J1kqUytzTq5QF0HdKzE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114718;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=RBIz8n8NN7euS/oxnfc/Puqdu1ouZslhT+iGwYpObsQ=;
	b=oQxFTqB0ao2LdgPDvkgGFlCPUeqiZNjMVShnf6szT6rNw0ar2GbY10+hmddd5d1Q
	6KiTm1clT4F5exx1UJJ1Q8IDFZm6kKmPLCHh153XWW/FaMhCXupQskBBUUaH9p4QDj8
	2Abf9qCeCkSZlBsn9KmgDngilK3ZWFHuXDyyuzoM=
Content-Type: multipart/mixed; boundary="===============7104267995569334378=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dpkg: upgrading to 1.22.2 FAILED
Message-ID: <0101018cc52707b4-ac8984a7-e7db-4bd1-a9d2-7425e9fc3026-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193106

--===============7104267995569334378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dpkg* to *1.22.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe dpkg failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1847 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-4c5c355ce617022d3349b42766fbd879efcdfa97"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4c5c355ce617022d3349b42766fbd879efcdfa97"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 6 Local 6 Mirrors 0 Missed 0 Current 24 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto ff343eb85df0ea45edd6b7a6a9d52945f3d7e773
WARNING: Command 'git rebase ff343eb85df0ea45edd6b7a6a9d52945f3d7e773' failed:
Auto-merging data/ostable
Auto-merging data/tupletable
CONFLICT (content): Merge conflict in data/tupletable

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto ff343eb85df0ea45edd6b7a6a9d52945f3d7e773
WARNING: Command 'git rebase ff343eb85df0ea45edd6b7a6a9d52945f3d7e773' failed:
Auto-merging data/ostable
Auto-merging data/tupletable
CONFLICT (content): Merge conflict in data/tupletable

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/dpkg
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/dpkg/dpkg_1.22.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7104267995569334378==--

