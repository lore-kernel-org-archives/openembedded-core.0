Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58887C54E6E
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:18 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.36622.1709330716397324066
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QtiWi7CB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ALDV48Sc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018dfc0cd322-089440bb-0db8-48a0-ab5f-3375c6ef132b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330715;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=nJw6MzjBhlVQv3peneDwG0J4ePgwWyhYD3dvO0VwRlM=;
	b=QtiWi7CBkIGXBIeDKe+fhMq/6U1N2tHNzWR/rMt1Mj9Y0Hw6SbX6s7SYjq3cUulH
	7SJyn9mTCQlKAhGe65UeCW3Zd5DnhJZ3P3j+Oy7z982x0ONZ7cDiGVSmPZJJ/j9363p
	9AWYY/M6DGKaZcshmZ3yCK7LdjuBFPFTCFb3B394=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330715;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=nJw6MzjBhlVQv3peneDwG0J4ePgwWyhYD3dvO0VwRlM=;
	b=ALDV48Sc4+Ah2OSBcXYRzQ5bf8GT+VeCFAcDjPekWLibv2WoCzol3OeA8eV6N25V
	cfedVK3hoXc4xJiv5MCt+3JCMpT3LMyr30IOmGxr3RAIbmnmN5c/FWcWrxZdV94F3rr
	Ufg3XkgoeIV1XdVLygXtIjcRbHZ6/O79yhhe5ptY=
Content-Type: multipart/mixed; boundary="===============4355030896733045218=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202402 FAILED
Message-ID: <0101018dfc0cd322-089440bb-0db8-48a0-ab5f-3375c6ef132b-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196472

--===============4355030896733045218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ovmf* to *edk2-stable202402* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade ovmf -V edk2-stable202402 -S edc6681206c1a8791981a2f911d2fb8b3d2f5768
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1863 entries from dependency cache.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-354afc9130b798462a3b4c65f67041e4f9ed521c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:354afc9130b798462a3b4c65f67041e4f9ed521c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto edc6681206c1a8791981a2f911d2fb8b3d2f5768
ERROR: Execution of 'git rev-list devtool-base..b64af41c3276f97f0e181920400ee056b9c88037' failed with exit code 128:
fatal: Invalid revision range devtool-base..b64af41c3276f97f0e181920400ee056b9c88037



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4355030896733045218==--

