Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530B2C07D5A
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:13 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8669.1698848705754239125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XlOZKlcr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=e7Ue8Zaj;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b8b4609e8-885cc15d-72ef-4a3a-84ec-4d8a944d5092-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WsXC5mZAvZvgcLlx3ed2neC6u70s8mM/eM62hJ8lTEA=;
	b=XlOZKlcrLxWuSrvDT6t24HtX6kWqofmBYSglW/6NS1Hgrh0fy6l/TSYRXsn11Qc0
	ltvh7eMn/IjlVYBEDz4KweaW03pcnTA5/H63ORI+Iamu3xxKPVrtHRRhNaFT5kkFLtd
	Y+gICN6OACgVSlIa0cuQMs/n6hAjfjRSQOUxygZw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WsXC5mZAvZvgcLlx3ed2neC6u70s8mM/eM62hJ8lTEA=;
	b=e7Ue8ZajtZltgfKrJIQ0cFtWDjlbvghhv17CQzn/nkxo0bhmJ56nBPrQ2wMFL+2s
	Sz4C2s52rl9HjTXBYZNG70kAweNHcM7uGQWxE7sYMeOgQx7cQZInP/hUBrz3PZ44K7l
	cchsdaKzvCxVeLvhqKJQQWmCTsDalnSLFgMl+Vqw=
Content-Type: multipart/mixed; boundary="===============1084266793261394177=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-db: upgrading to 2.12.0 FAILED
Message-ID: <0101018b8b4609e8-885cc15d-72ef-4a3a-84ec-4d8a944d5092-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189998

--===============1084266793261394177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-db* to *2.12.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe man-db failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (11:30:39.546937)
Loading cache...done.
Loaded 1842 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-03d8ce2b33e2ed1a3e231c6ef2234ca75537ab95"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:03d8ce2b33e2ed1a3e231c6ef2234ca75537ab95"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 31 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1842 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (910 cached, 2 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-03d8ce2b33e2ed1a3e231c6ef2234ca75537ab95"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:03d8ce2b33e2ed1a3e231c6ef2234ca75537ab95"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 3 Local 2 Mirrors 0 Missed 1 Current 25 (66% match, 96% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  12% |####                                | ETA:  0:00:01
Adding changed files:  25% |#########                           | ETA:  0:00:00
Adding changed files:  38% |#############                       | ETA:  0:00:00
Adding changed files:  50% |##################                  | ETA:  0:00:00
Adding changed files:  63% |######################              | ETA:  0:00:00
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files:  88% |################################    | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.savannah.nongnu.org/releases/man-db/man-db-2.12.0.tar.xz...
INFO: Rebasing devtool onto 9fbadeba3f8eef67aef70a8195419a3d79ec5559
WARNING: Command 'git rebase 9fbadeba3f8eef67aef70a8195419a3d79ec5559' failed:
Auto-merging gl/m4/largefile.m4
CONFLICT (content): Merge conflict in gl/m4/largefile.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/man-db
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/man-db/man-db_2.12.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1084266793261394177==--

