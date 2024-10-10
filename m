Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB35CFC605
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.53353.1728588943025175668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ffpzhxN9;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cjq0G6UE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019277ee2d50-cd14f942-90d1-40e8-a965-68d9f127fd0a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588950;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aV69FqrGNkKfGHjwhAvLmmancYnMYn6JP+IrY9qcd/I=;
	b=ffpzhxN9w7eVdhw4JyT1s18Y3JvglTSyAlLLe/yufLXK6eORciz4yqdiNF3ocR62
	q9qe48j/Zw1Fj8H3k21zDhRfkeznoiEEsIyEzywYVS0Lnysekg+vzwAGkADssWsN1+k
	dtPajS8S98PTOsxVGgTcKl8fDIxc8jvWPbfWcMHw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588950;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aV69FqrGNkKfGHjwhAvLmmancYnMYn6JP+IrY9qcd/I=;
	b=cjq0G6UEvYkB6a9TcPLibr9Xg+yhMOVKV1q1LYOXjcakiYSC4r+04QVz8rd2xr2t
	JM5i/VW2R023xglythlG5eTtXaYWMRrLf0B+Rf/oTshrdMB5ULundM4RzguAqskjowY
	hPRMGeEYTDXm2KEIkOtRVxIHXCiXXEWGfvwT9mGk=
Content-Type: multipart/mixed; boundary="===============2250176620026123455=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-db: upgrading to 2.13.0 FAILED
Message-ID: <0101019277ee2d50-cd14f942-90d1-40e8-a965-68d9f127fd0a-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205467

--===============2250176620026123455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *man-db* to *2.13.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe man-db failed.
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
workspace            = "tmp-auh-upgrades:d812414395e119f64113e70ab0296910aec694ec"

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
workspace            = "tmp-auh-upgrades:d812414395e119f64113e70ab0296910aec694ec"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-tthd6ri8: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-onmgvq5l/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-onmgvq5l/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  17% |######                              | ETA:  0:00:00
Adding changed files:  34% |############                        | ETA:  0:00:00
Adding changed files:  51% |##################                  | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.savannah.nongnu.org/releases/man-db/man-db-2.13.0.tar.xz...
INFO: Rebasing devtool onto 9ea56c5c355b96e92f481a7a41b5968e5aabd955
WARNING: Command 'git rebase 9ea56c5c355b96e92f481a7a41b5968e5aabd955' failed:
Auto-merging src/man.c
CONFLICT (content): Merge conflict in src/man.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/man-db
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/man-db/man-db_2.13.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2250176620026123455==--

