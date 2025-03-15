Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65ACC36016
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:20 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.10337.1742048299938570352
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dZ96PT4U;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Q7t0SUqd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101959a2b88c6-2601e4ac-33c5-404b-a4ea-ff6665fd8d4f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9ajLzaxO5P6qoR9DKc33o3wIjjl4GtcOAaEqUinLXGo=;
	b=dZ96PT4UWrA07XHSmbWyOv4/SNzB9dEeQXQkXEJJmq7g0QGJP5kD+YaahlR74M1k
	lxNLO6r+QF/Qm+i5xjsORInzIykBOg4JYGzoA9E4dg+C+pVzb6rBxYRWtof0UANUr3Q
	I7ksdyMsfgMiqHhc1AfvlROcK2Wdcwce/NoNqoPA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9ajLzaxO5P6qoR9DKc33o3wIjjl4GtcOAaEqUinLXGo=;
	b=Q7t0SUqdYjA6t6lh/ZjXk/L50/0EYQ7cMUgnRKXITJp9+puTjJmQxOf2xG1Y7cZD
	qTUsOGN+jZqK4ya6rL8EJLNbyZZ3ITg9nWTrNLJ+nVAXyLRpmjvMTD4VciqLn/KPk6K
	tHLxApYx6lMxR/F5r+5A9dP4FtHz7aKYoEf0+K+4=
Content-Type: multipart/mixed; boundary="===============3780327947327265353=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 6.1.1 FAILED
Message-ID: <010101959a2b88c6-2601e4ac-33c5-404b-a4ea-ff6665fd8d4f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212912

--===============3780327947327265353==
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
Loaded 1884 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f767a040a9079ae3cdc9670ee4e4808839321267"

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
Parsing of 924 .bb files complete (0 cached, 924 parsed). 1885 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f767a040a9079ae3cdc9670ee4e4808839321267"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-mg2ov8fn: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-2mw5fad7/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-2mw5fad7/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
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
INFO: Rebasing devtool onto 156f7142ef6e24a6ae56bee219b20ad294f34301
WARNING: Command 'git rebase 156f7142ef6e24a6ae56bee219b20ad294f34301' failed:
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
--===============3780327947327265353==--

