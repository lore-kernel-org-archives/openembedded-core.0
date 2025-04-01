Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A787AC369D3
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.18075.1743511396844481230
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TzMJsnRS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jUGmwAt5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010195f160cc46-aa6c820e-2181-4982-98d3-2f18a0453e8f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/rAcH3AE1sKoSgiiGzAT6QtWPDZ0UXzUNQxkmLo11qU=;
	b=TzMJsnRS+E6LR3B0rGW82XGr0X6D0MddnV6HSsbG/vsqFR8yTsatiswhmUY9OHiB
	uDBxs2G93KXidaKqjobmBvAWCFhLmoe7DFjk/9nQ0+DPEBlckXSU14vt2nxKxjwQpWV
	vTbJSdBm5iH4V/u6HNl++IkaZQMVL4y/J/Cvb3YU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/rAcH3AE1sKoSgiiGzAT6QtWPDZ0UXzUNQxkmLo11qU=;
	b=jUGmwAt54kS13qLDdoggQ/XvkL3kNrmqQaDwQMCY4Z4rSMP9MYp+yypxozyH0y3i
	OcbhovD3/33jwW/hdaj3UtIUBl6QpbKPEWK56dloOzpu7olamPEk2CrgE32ASSt1ql9
	cjNHMC0ErQ2Z56oIURE6lhp2YXwqkleKBGyXJrk4=
Content-Type: multipart/mixed; boundary="===============8780534976385503776=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 25.0.2 FAILED
Message-ID: <01010195f160cc46-aa6c820e-2181-4982-98d3-2f18a0453e8f-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214099

--===============8780534976385503776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa* to *25.0.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe mesa failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:b8e1b31ef6752a25b8f2dcafd3635585c2d4d813"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 925 .bb files complete (0 cached, 925 parsed). 1887 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:b8e1b31ef6752a25b8f2dcafd3635585c2d4d813"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-qpvhqycu: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-q2vsydqh/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-q2vsydqh/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:11
Adding changed files:   2% |                                    | ETA:  0:00:09
Adding changed files:   3% |#                                   | ETA:  0:00:07
Adding changed files:   4% |#                                   | ETA:  0:00:07
Adding changed files:   6% |##                                  | ETA:  0:00:07
Adding changed files:   7% |##                                  | ETA:  0:00:06
Adding changed files:   8% |###                                 | ETA:  0:00:10
Adding changed files:   9% |###                                 | ETA:  0:00:11
Adding changed files:  10% |###                                 | ETA:  0:00:12
Adding changed files:  12% |####                                | ETA:  0:00:13
Adding changed files:  13% |####                                | ETA:  0:00:12
Adding changed files:  14% |#####                               | ETA:  0:00:11
Adding changed files:  15% |#####                               | ETA:  0:00:10
Adding changed files:  17% |######                              | ETA:  0:00:10
Adding changed files:  18% |######                              | ETA:  0:00:09
Adding changed files:  19% |#######                             | ETA:  0:00:09
Adding changed files:  20% |#######                             | ETA:  0:00:08
Adding changed files:  21% |#######                             | ETA:  0:00:08
Adding changed files:  23% |########                            | ETA:  0:00:07
Adding changed files:  24% |########                            | ETA:  0:00:07
Adding changed files:  25% |#########                           | ETA:  0:00:07
Adding changed files:  26% |#########                           | ETA:  0:00:07
Adding changed files:  28% |##########                          | ETA:  0:00:06
Adding changed files:  29% |##########                          | ETA:  0:00:06
Adding changed files:  30% |##########                          | ETA:  0:00:06
Adding changed files:  31% |###########                         | ETA:  0:00:06
Adding changed files:  32% |###########                         | ETA:  0:00:06
Adding changed files:  34% |############                        | ETA:  0:00:05
Adding changed files:  35% |############                        | ETA:  0:00:05
Adding changed files:  36% |#############                       | ETA:  0:00:05
Adding changed files:  37% |#############                       | ETA:  0:00:05
Adding changed files:  39% |##############                      | ETA:  0:00:05
Adding changed files:  40% |##############                      | ETA:  0:00:05
Adding changed files:  41% |##############                      | ETA:  0:00:05
Adding changed files:  42% |###############                     | ETA:  0:00:04
Adding changed files:  43% |###############                     | ETA:  0:00:04
Adding changed files:  45% |################                    | ETA:  0:00:04
Adding changed files:  46% |################                    | ETA:  0:00:04
Adding changed files:  47% |#################                   | ETA:  0:00:04
Adding changed files:  48% |#################                   | ETA:  0:00:04
Adding changed files:  50% |##################                  | ETA:  0:00:04
Adding changed files:  51% |##################                  | ETA:  0:00:04
Adding changed files:  52% |##################                  | ETA:  0:00:04
Adding changed files:  53% |###################                 | ETA:  0:00:03
Adding changed files:  54% |###################                 | ETA:  0:00:03
Adding changed files:  56% |####################                | ETA:  0:00:03
Adding changed files:  57% |####################                | ETA:  0:00:03
Adding changed files:  58% |#####################               | ETA:  0:00:03
Adding changed files:  59% |#####################               | ETA:  0:00:03
Adding changed files:  60% |#####################               | ETA:  0:00:03
Adding changed files:  62% |######################              | ETA:  0:00:03
Adding changed files:  63% |######################              | ETA:  0:00:03
Adding changed files:  64% |#######################             | ETA:  0:00:02
Adding changed files:  65% |#######################             | ETA:  0:00:02
Adding changed files:  67% |########################            | ETA:  0:00:02
Adding changed files:  68% |########################            | ETA:  0:00:02
Adding changed files:  69% |#########################           | ETA:  0:00:02
Adding changed files:  70% |#########################           | ETA:  0:00:02
Adding changed files:  71% |#########################           | ETA:  0:00:02
Adding changed files:  73% |##########################          | ETA:  0:00:02
Adding changed files:  74% |##########################          | ETA:  0:00:02
Adding changed files:  75% |###########################         | ETA:  0:00:01
Adding changed files:  76% |###########################         | ETA:  0:00:01
Adding changed files:  78% |############################        | ETA:  0:00:01
Adding changed files:  79% |############################        | ETA:  0:00:01
Adding changed files:  80% |############################        | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  82% |#############################       | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:07
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://archive.mesa3d.org/mesa-25.0.2.tar.xz...
INFO: Rebasing devtool onto e49738a4e3e0019508c94c17480c519523cf4df4
WARNING: Command 'git rebase e49738a4e3e0019508c94c17480c519523cf4df4' failed:
Auto-merging src/glx/drisw_glx.c
CONFLICT (content): Merge conflict in src/glx/drisw_glx.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/mesa
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/mesa/mesa.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8780534976385503776==--

