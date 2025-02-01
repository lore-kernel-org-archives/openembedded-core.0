Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AD4C021A0
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:20:50 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.42712.1738416044742695977
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VDFZlBl1;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=N0/wolAP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194c1abb7f2-77f52ed2-c256-4aa7-92c8-32a5e5ab2c0a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=F7OshpGIDdtX+ziZmDYqwmj7PgGoelEy47TMoNOTIbU=;
	b=VDFZlBl1O8y11m38p85wntSguR7C/4oARVXwdq1oz1WqhJjUd/LiTHwggHgIrG5q
	cpl95aMwCjCmt3FlvOrC8LnFS+2wk87UgutdlIBVMP+/zUQlEbWhNovZmH6CXjS3PNP
	MBKWZIZ6xgiVLdRMWSRPVbhk3pUOqS4vryGR2xDU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=F7OshpGIDdtX+ziZmDYqwmj7PgGoelEy47TMoNOTIbU=;
	b=N0/wolAP1YhPlKiBCfU8NkfrW59QnW7Wu2YAx0RAbyHj2S2w6B9k92iWTbHGDLqX
	ptLxAlTNlpRvGW5mG0KwrX74Fw+NBNNoLQKZJ2avv5nu+i7oR1HcvL41aUD59JcRyCr
	pn1TqX1KW5pqF0Nu7ZWlxAN7Xfyi1AyvU9EN0OYU=
Content-Type: multipart/mixed; boundary="===============3151292167158411471=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 go-cross-core2-64,go,go-runtime,go-crosssdk-x86_64-pokysdk-linux,go-cross-canadian-x86-64:
 upgrading to 1.23.5,1.23.5,1.23.5,1.23.5,1.23.5 FAILED
Message-ID: <01010194c1abb7f2-77f52ed2-c256-4aa7-92c8-32a5e5ab2c0a-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210511

--===============3151292167158411471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-cross-core2-64,go,go-runtime,go-crosssdk-x86_64-pokysdk-linux,go-cross-canadian-x86-64* to *1.23.5,1.23.5,1.23.5,1.23.5,1.23.5* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe go-cross-core2-64 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:950bebb4f31de4cec8364e81925eb9dd8794860f"

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
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:950bebb4f31de4cec8364e81925eb9dd8794860f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-n2ea1y38: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-w5wmjs3d/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-w5wmjs3d/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   3% |#                                   | ETA:  0:00:03
Adding changed files:   7% |##                                  | ETA:  0:00:02
Adding changed files:  10% |###                                 | ETA:  0:00:02
Adding changed files:  14% |#####                               | ETA:  0:00:02
Adding changed files:  17% |######                              | ETA:  0:00:01
Adding changed files:  21% |#######                             | ETA:  0:00:01
Adding changed files:  24% |########                            | ETA:  0:00:01
Adding changed files:  28% |##########                          | ETA:  0:00:01
Adding changed files:  31% |###########                         | ETA:  0:00:01
Adding changed files:  35% |############                        | ETA:  0:00:01
Adding changed files:  38% |##############                      | ETA:  0:00:01
Adding changed files:  42% |###############                     | ETA:  0:00:01
Adding changed files:  46% |################                    | ETA:  0:00:01
Adding changed files:  49% |#################                   | ETA:  0:00:01
Adding changed files:  53% |###################                 | ETA:  0:00:01
Adding changed files:  56% |####################                | ETA:  0:00:01
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  63% |######################              | ETA:  0:00:00
Adding changed files:  67% |########################            | ETA:  0:00:00
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  77% |############################        | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:02
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://golang.org/dl/go1.23.5.src.tar.gz;name=main...
INFO: Rebasing devtool onto 92439b7b7ab6e7baff11aa05d7178b08ebc3f07a
WARNING: Command 'git rebase 92439b7b7ab6e7baff11aa05d7178b08ebc3f07a' failed:
Auto-merging src/make.bash
CONFLICT (content): Merge conflict in src/make.bash

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/go-cross-core2-64
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/go-cross-core2-64/go-cross-core2-64_1.23.5.bb
WARNING: Version is pinned to 1.22% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3151292167158411471==--

