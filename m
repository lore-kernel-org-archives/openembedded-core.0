Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECA1D1D89F
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:02 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.11796.1728994553523488010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GfieUwxm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pBEuLPHk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010192901b2b94-5799b1ba-9bd1-4050-9fe5-2a940e75c3a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CKTncIwyzzPHIthTOFRzfud3sIM8PtxrRWtWwG/i+uA=;
	b=GfieUwxmEu4bGSlbs1K5d5LGJVdRJ3ipISmndO0Mcs6xPBGfOSXKJCtGR8G7o29f
	wc1OlEmbvDRqQVtQLszFeqPwAvdchdb9z3QgpG64Kc4HQA8OW7dJRehYxmLowVtsM/j
	pVmoDxt6UyNq+uzNYTtk/6DAE054SPiNiLOxGCIg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CKTncIwyzzPHIthTOFRzfud3sIM8PtxrRWtWwG/i+uA=;
	b=pBEuLPHkLjizeETtL2/LI5jijT4h/rtVhefjoOnqlpusH4OB2AiFbEsnmXLxK08z
	aZ7iUAQGmi7nP4f8AwJJsm3RwaTHD8oFO4751fUwIbEsMgsx8cM9yW5C7diOkYBYi/K
	FgcrvWacgNkpws7o/yRy1Pj+LEsDubFZBFMlqb+Q=
Content-Type: multipart/mixed; boundary="===============1656151635955742672=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysvinit: upgrading to 3.10 FAILED
Message-ID: <01010192901b2b94-5799b1ba-9bd1-4050-9fe5-2a940e75c3a1-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205831

--===============1656151635955742672==
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
Loaded 1875 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:30e42bca8bdfa220676ee5d04e5fbe9b249c303a"

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
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:30e42bca8bdfa220676ee5d04e5fbe9b249c303a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-4zye6qgh: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-jub0lwqz/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-jub0lwqz/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/slicer69/sysvinit/releases//download/3.10/sysvinit-3.10.tar.xz...
INFO: Rebasing devtool onto e6365018c64673055a2311d4b2a51ac1b182b963
WARNING: Command 'git rebase e6365018c64673055a2311d4b2a51ac1b182b963' failed:
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
--===============1656151635955742672==--

