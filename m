Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CD3C4828F
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:07 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.4597.1704114720160832855
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CL5gbAFU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=czWlW5FQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018cc5270b2d-4ac18431-3cdb-4d3d-b216-5209ea199d6c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114719;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=pbkJ32NsUNBE8t69DBpfyKwGMsTHEnssD1TV+62VsMg=;
	b=CL5gbAFUNZ8vcU5i7a31XiZAZKk+YyIFP/j/jvlttcc/WclVp5vUP9DJwMEAHnvK
	KKEHLXKfoOxTQvVdMp8gFHgWy4TczPA30siLOt3faHWUzFEhwWaOg4homFb5SMrDova
	Ou5w44W8fG1sTv/xKyPGm042a0l/tb3SOikL6p4w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114719;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=pbkJ32NsUNBE8t69DBpfyKwGMsTHEnssD1TV+62VsMg=;
	b=czWlW5FQZ8IsjAhc31PUtiuDRx45w3lXLMIdses7QMzEN5ZlVqt+bsVGqiyMarKC
	qWahLFDTIj7Rp1jcXnjBIwQOtXC1anQQBUHOlolKySo9Eboi5GukEI518qFLKBL3chr
	u2gP8Vs42dTN9o1fV6EQKr4yvFk+D04BVS6R6BwQ=
Content-Type: multipart/mixed; boundary="===============5581722321826350341=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.19.1 FAILED
Message-ID: <0101018cc5270b2d-4ac18431-3cdb-4d3d-b216-5209ea199d6c-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193142

--===============5581722321826350341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpm* to *4.19.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1849 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7ee6010c5a22b3655b92b44db69253892aedb131"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7ee6010c5a22b3655b92b44db69253892aedb131"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 6 Local 6 Mirrors 0 Missed 0 Current 24 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 98b301ebb44fb5cabb56fc24bc3aaa437c47c038
WARNING: Command 'git rebase 98b301ebb44fb5cabb56fc24bc3aaa437c47c038' failed:
Auto-merging python/header-py.c
CONFLICT (content): Merge conflict in python/header-py.c
Auto-merging python/rpmds-py.c
CONFLICT (content): Merge conflict in python/rpmds-py.c
CONFLICT (modify/delete): python/rpmfi-py.c deleted in HEAD and modified in 84cda9af2 (Add bunch of deprecation/obsoletion warnings to python bindings).  Version 84cda9af2 (Add bunch of deprecation/obsoletion warnings to python bindings) of python/rpmfi-py.c left in tree.
Auto-merging python/rpmmodule.c
CONFLICT (content): Merge conflict in python/rpmmodule.c
Auto-merging python/rpmts-py.c
CONFLICT (content): Merge conflict in python/rpmts-py.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/rpm
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rpm/rpm_4.19.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5581722321826350341==--

