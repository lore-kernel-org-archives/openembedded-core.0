Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627F5C49EA1
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:31 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.18368.1718475799119107864
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cleQVATR;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kyQXRBEC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101901d23b739-2efc53f0-2fdc-46a0-a448-3bce3c390672-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ucJEZO77oUWTIH5HefuTK+4qfCt7RsZT7/bgN6hlg2A=;
	b=cleQVATRNp2e8386leDFo1cATW0oC8VD91jnFRGuKmdpwumCJMDKePfXs2P3etlO
	lNyRfdt9+a8WMuZtuTpNUm/PyL8eI8PL88Io9Y8LKwfDHigkL/beGkmF1MYOpkwtQ5l
	BFMrQ/vQnnecPdh9RhjNuQAuV5msbFcIxuM6I8BA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ucJEZO77oUWTIH5HefuTK+4qfCt7RsZT7/bgN6hlg2A=;
	b=kyQXRBECfueJOIH4yn834HH8PAWJZTFdz+kqHXsQ8Ak48Q6uAR3zAqxJuC4rDlYf
	RgGOXPtF7PNIYbfVbgb1ZY96TbReATdwv45oLrnMHgCjQruXULsmvRezvke9lF1/Um/
	mVEqaunLvzNaISLSjmHVf9QLyHT+jhQcbRadalpU=
Content-Type: multipart/mixed; boundary="===============5061162453895917125=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.40.1 FAILED
Message-ID: <010101901d23b739-2efc53f0-2fdc-46a0-a448-3bce3c390672-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200681

--===============5061162453895917125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux-libuuid* to *2.40.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe util-linux-libuuid failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-070e31c652424256a87ee2c5f7459042af92fb55"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:070e31c652424256a87ee2c5f7459042af92fb55"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1881 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1882 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-070e31c652424256a87ee2c5f7459042af92fb55"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:070e31c652424256a87ee2c5f7459042af92fb55"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-gvg6k94s: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-49v1ruyh/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-49v1ruyh/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   8% |##                                  | ETA:  0:00:01
Adding changed files:  16% |#####                               | ETA:  0:00:00
Adding changed files:  24% |########                            | ETA:  0:00:00
Adding changed files:  32% |###########                         | ETA:  0:00:00
Adding changed files:  40% |##############                      | ETA:  0:00:00
Adding changed files:  48% |#################                   | ETA:  0:00:00
Adding changed files:  57% |####################                | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  73% |##########################          | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.40/util-linux-2.40.1.tar.xz...
INFO: Rebasing devtool onto 80f62ec0ed4676404af21f9c50a8afad813d0f8b
WARNING: Command 'git rebase 80f62ec0ed4676404af21f9c50a8afad813d0f8b' failed:
Auto-merging login-utils/su-common.c
CONFLICT (content): Merge conflict in login-utils/su-common.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/util-linux-libuuid
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/util-linux-libuuid/util-linux-libuuid_2.40.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5061162453895917125==--

