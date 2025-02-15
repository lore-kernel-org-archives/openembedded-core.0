Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB8FC021AA
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:10 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8090.1739623329780371044
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jDH6x/BO;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=hCMsEt1c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019509a16b06-e63fc6ae-38a0-4570-b27a-a69fb2d783d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7XFKwF01ibEWrSDKw4DD1xyaxwbYYxZcRzrNJR4WxLg=;
	b=jDH6x/BOcE32JX+SO/IUjz4dEInASXZr2P3PRLfhHe9wmonBRoXFfMYKNPAPqnpn
	jLPbGSz9aTpsz3O5R9n/FWtCayjkWqOKZp/mIlHrDckDYpyh4fNu/bJOqsrM7P93bEK
	M6g1EO9GwzFyQ8bBUluRoiBmINYT6Gc84hnvGhbo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7XFKwF01ibEWrSDKw4DD1xyaxwbYYxZcRzrNJR4WxLg=;
	b=hCMsEt1c6hvrRcaXNTWDEhTCFHO3dm5ylBOUHucgTtO9lARn4PSmdkhRs/J+GgKl
	CdA9eV7Lv1a1Xhb8816f//gZ8HpQaJRuCWzEvoK9UeNR4oUQuuU7crMowbnejhqZYih
	mxNmhF6njd+P02qXDm1E01lw69FsdYc+tQXrSsdA=
Content-Type: multipart/mixed; boundary="===============8298709459509839214=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 go-cross-core2-64,go-cross-canadian-x86-64,go-runtime,go,go-crosssdk-x86_64-pokysdk-linux:
 upgrading to 1.24.0,1.24.0,1.24.0,1.24.0,1.24.0 FAILED
Message-ID: <0101019509a16b06-e63fc6ae-38a0-4570-b27a-a69fb2d783d2-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211397

--===============8298709459509839214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-cross-core2-64,go-cross-canadian-x86-64,go-runtime,go,go-crosssdk-x86_64-pokysdk-linux* to *1.24.0,1.24.0,1.24.0,1.24.0,1.24.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe go-cross-core2-64 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:2b6bf98dfe7e91a116c84bb0450746f3e5ed6304"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1870 targets, 38 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:2b6bf98dfe7e91a116c84bb0450746f3e5ed6304"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-2xutf37b: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-cvun532r/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-cvun532r/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |                                    | ETA:  0:00:07
Adding changed files:   4% |#                                   | ETA:  0:00:05
Adding changed files:   6% |##                                  | ETA:  0:00:04
Adding changed files:   8% |##                                  | ETA:  0:00:04
Adding changed files:  10% |###                                 | ETA:  0:00:03
Adding changed files:  12% |####                                | ETA:  0:00:03
Adding changed files:  14% |#####                               | ETA:  0:00:03
Adding changed files:  16% |#####                               | ETA:  0:00:03
Adding changed files:  18% |######                              | ETA:  0:00:03
Adding changed files:  20% |#######                             | ETA:  0:00:02
Adding changed files:  22% |#######                             | ETA:  0:00:02
Adding changed files:  24% |########                            | ETA:  0:00:02
Adding changed files:  26% |#########                           | ETA:  0:00:02
Adding changed files:  28% |##########                          | ETA:  0:00:02
Adding changed files:  30% |##########                          | ETA:  0:00:02
Adding changed files:  32% |###########                         | ETA:  0:00:02
Adding changed files:  34% |############                        | ETA:  0:00:02
Adding changed files:  36% |#############                       | ETA:  0:00:02
Adding changed files:  38% |#############                       | ETA:  0:00:02
Adding changed files:  40% |##############                      | ETA:  0:00:02
Adding changed files:  42% |###############                     | ETA:  0:00:02
Adding changed files:  44% |###############                     | ETA:  0:00:02
Adding changed files:  46% |################                    | ETA:  0:00:01
Adding changed files:  48% |#################                   | ETA:  0:00:01
Adding changed files:  50% |##################                  | ETA:  0:00:01
Adding changed files:  52% |##################                  | ETA:  0:00:01
Adding changed files:  54% |###################                 | ETA:  0:00:01
Adding changed files:  56% |####################                | ETA:  0:00:01
Adding changed files:  58% |####################                | ETA:  0:00:01
Adding changed files:  60% |#####################               | ETA:  0:00:01
Adding changed files:  62% |######################              | ETA:  0:00:01
Adding changed files:  64% |#######################             | ETA:  0:00:01
Adding changed files:  66% |#######################             | ETA:  0:00:01
Adding changed files:  68% |########################            | ETA:  0:00:01
Adding changed files:  70% |#########################           | ETA:  0:00:01
Adding changed files:  72% |##########################          | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:03
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://golang.org/dl/go1.24.0.src.tar.gz;name=main...
INFO: Rebasing devtool onto 34648f78ba4eebf025698c8b09936636ca4ed0bd
WARNING: Command 'git rebase 34648f78ba4eebf025698c8b09936636ca4ed0bd' failed:
Auto-merging src/make.bash
CONFLICT (content): Merge conflict in src/make.bash

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/go-cross-core2-64
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/go-cross-core2-64/go-cross-core2-64_1.24.0.bb
WARNING: Version is pinned to 1.22% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8298709459509839214==--

