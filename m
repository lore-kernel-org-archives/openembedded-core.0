Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58707C48287
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.88852.1705340029679871130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ADhcopJh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lkx96CMV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018d0e2fcf12-da0416e2-d28c-4af6-9595-b5109fb3608f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5U00me7Mygyi3fezbO8vsX7GbEZTZmunSxHkswi7vT4=;
	b=ADhcopJhHM7WCvvV1YdNqvSPEkKuKcyuNSS8Pt9oaCiMqqg18UhGs5soGUDLkZW2
	WZhX7JgGiUmCGtpygUd4o4GhpFYnQGkteigy8155Oc34CKSxoC5Je0/CPqBQrUKkNUi
	zjd/Mh2RS2TjdF9IosNFqcSwfBuH/L7IqCsJZvuk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5U00me7Mygyi3fezbO8vsX7GbEZTZmunSxHkswi7vT4=;
	b=lkx96CMVvPuo7cy8p2DNqckqqmc4AjwFTHjyMTuvITL54I6GTeQSmDBRDLrvcS6M
	AmDxwJJv0qfgLTf8vkY8JMm8Xuen5d0JOYeD75KRAgQfph92ZfMgDBj7Wo5nRVObsqw
	Ew+fqwtA+G4e1BZWr+N6xkctEaA4nf0iRZEskIuM=
Content-Type: multipart/mixed; boundary="===============1164269533677830978=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] waffle: upgrading to 1.8.0 FAILED
Message-ID: <0101018d0e2fcf12-da0416e2-d28c-4af6-9595-b5109fb3608f-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193763

--===============1164269533677830978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *waffle* to *1.8.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe waffle failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1850 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-fc3e14ac6765e671f7ba65634cf52807f64d254a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fc3e14ac6765e671f7ba65634cf52807f64d254a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 580b912a30085528886603942c100c7b309b3bdb
WARNING: Command 'git rebase 580b912a30085528886603942c100c7b309b3bdb' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build
Auto-merging src/waffle/meson.build
CONFLICT (content): Merge conflict in src/waffle/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/waffle
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/waffle/waffle_1.8.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1164269533677830978==--

