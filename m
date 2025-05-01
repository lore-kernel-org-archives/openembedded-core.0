Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37964C3ABCA
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:45 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1801.1746113610926977850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FVgn5z1M;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FMnGSD1+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101968c7b6a40-6ff0ad8a-8d97-4978-b13f-cab436b9ee87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113620;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c4K7qUNWhx7R1udk8O7qobrdKMN7ZCFxQg3aW5rxgpE=;
	b=FVgn5z1MduEUK+6c5srxEsQ4/0o8iKGZad7FaY7U9wvsJyT51EJZDCIvrBoHq6pG
	l0wiVgM2pRlMaKKRfQ/Z4oGDQ3oS0J5o4wpchonnJ6KajRsAp68gPppBg5C/6yjAvzX
	1bR6VHo6VdIrzdITBIQWe7efHHOgvKUqJVgTnmMg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113620;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c4K7qUNWhx7R1udk8O7qobrdKMN7ZCFxQg3aW5rxgpE=;
	b=FMnGSD1+IR5/23grs/67rQuuzoUFtti9G9KXEzq0schhv48ufD4WhDVEQ+UGg2un
	TxhT8n+An6ANZNwE1rTe22GqWd8j5NusYE4RQ7rew1QP3ZzlRq65PhuhcTkT2tYnoWL
	xyhZEMuB38mbOh12QHJWSKx++hqigHJn1f97Ayfk=
Content-Type: multipart/mixed; boundary="===============5538768563647593224=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 6.1.1 FAILED
Message-ID: <010101968c7b6a40-6ff0ad8a-8d97-4978-b13f-cab436b9ee87-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215820

--===============5538768563647593224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pbr* to *6.1.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-pbr failed.
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
workspace            = "tmp-auh-upgrades:ecc4fd5e2d83f01ad1ac9c68eb66829bd68cb238"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 929 .bb files complete (0 cached, 929 parsed). 1898 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:ecc4fd5e2d83f01ad1ac9c68eb66829bd68cb238"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-nblqwgok: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-pppbb_5o/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-pppbb_5o/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/p/pbr/pbr-6.1.1.tar.gz;downloadfilename=pbr-6.1.1.tar.gz...
INFO: Rebasing devtool onto d5d590ecad7048624e6fef6033a3d1862a4aabed
WARNING: Command 'git rebase d5d590ecad7048624e6fef6033a3d1862a4aabed' failed:
Auto-merging pbr/tests/test_integration.py
Auto-merging pbr/tests/test_packaging.py
CONFLICT (content): Merge conflict in pbr/tests/test_packaging.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-pbr
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-pbr/python3-pbr_6.1.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5538768563647593224==--

