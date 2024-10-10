Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D581BCFC60C
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:42 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.53348.1728588939720987541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MFbyolb7;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=jRM7x0F8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019277edfe2c-ac1418a2-9ff6-4830-9c1b-3b41f0b453b2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qEk9UF8+OQMijswztJ8ow0wkNgG/VvfHRdhC/5WEzsk=;
	b=MFbyolb7JtnhVBTUfG7k873qaVUJjI6r1KM7WuUyKWCsDdY7P2YEcemkGcOKpuMg
	kEtSWshFl6gA69C85FJk6y5fkG27r26SaNRFvId9CpuBTKs6PwUG7Xk7dPk2Td8Haki
	mOkBdR843fJOlJ/S2NKA2lyrLXu5wUIHTOXaM7Eg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588938;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qEk9UF8+OQMijswztJ8ow0wkNgG/VvfHRdhC/5WEzsk=;
	b=jRM7x0F8Gy98m1ERJjKLPy2vIpDoc5Ea016eqsXdxgmhNWddXCsfM8VQWaeDE+N6
	IwOyrZn7mC6RS8XzFRGI57c9kXzy8HRKnNyo8gFI7qrc56m+P11RVKfCqMjeI3KKLph
	OlzAcYE/53sAOEov6WafWV1T1Kz/usdTDFSggnOs=
Content-Type: multipart/mixed; boundary="===============6446899889363399441=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysvinit: upgrading to 3.10 FAILED
Message-ID: <0101019277edfe2c-ac1418a2-9ff6-4830-9c1b-3b41f0b453b2-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205433

--===============6446899889363399441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysvinit* to *3.10* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe sysvinit failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:348cb15e5a2b9b3bb9bd99fe671aa0c60c00ef86"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1872 targets, 40 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:348cb15e5a2b9b3bb9bd99fe671aa0c60c00ef86"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-kqmx6m4j: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-c2pmy10_/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-c2pmy10_/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/slicer69/sysvinit/releases//download/3.10/sysvinit-3.10.tar.xz...
INFO: Rebasing devtool onto 376c1cbb6a5ddda609bc46db08d8418d11a27ce2
WARNING: Command 'git rebase 376c1cbb6a5ddda609bc46db08d8418d11a27ce2' failed:
Auto-merging src/Makefile
CONFLICT (content): Merge conflict in src/Makefile

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/sysvinit
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/sysvinit/sysvinit_3.10.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6446899889363399441==--

