Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FD8E7719C
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:35 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.11345.1735723952545545818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XWggKrq1;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1+K/+F+A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101942135a66b-83ef67a9-53e8-4a48-8a00-7492f0579eb3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723951;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AL/U+C8Q9FALFocC8uEBL8JJO9zYk/S/kDgg1oeNc9M=;
	b=XWggKrq1/KbfaiWJVf2MGnENpmeINw4kzoa058hqt2AJE4Z/Q31dsmFergfeJLdz
	o43s+CANgSoyLEjjrzBg1bQfvsiLJE3/g1PzwC4ayiIgFABMYLElphMlhMWgvCBU6oF
	YAexj9kgLg8zcpiMVqOdG+gWhgMr787B7khVSjYI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723951;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AL/U+C8Q9FALFocC8uEBL8JJO9zYk/S/kDgg1oeNc9M=;
	b=1+K/+F+AwVc7HxodeIRgE6SXW5CJsTE45WMldYpOTqqHG7EhPpVTYjQR3757WtzB
	f9Isfqf61DNIqDRixkywniPKhGjw2YgaZyBl9lbTQJR0f0VgdYVuiKmSMUNuZGEtrDP
	vgf917H2SKcmkp0t3wgRP+gbf0Y3Ta86sxTiYDUk=
Content-Type: multipart/mixed; boundary="===============2634837749833309436=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 24.3.2 FAILED
Message-ID: <010101942135a66b-83ef67a9-53e8-4a48-8a00-7492f0579eb3-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209231

--===============2634837749833309436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa* to *24.3.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe mesa failed.
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
workspace            = "tmp-auh-upgrades:68ccf2aacd0db7e6e9fb3e3307d52814284ef8d6"

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
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:68ccf2aacd0db7e6e9fb3e3307d52814284ef8d6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-cva6qflj: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-g9m7rqaq/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-g9m7rqaq/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:09
Adding changed files:   2% |                                    | ETA:  0:00:07
Adding changed files:   4% |#                                   | ETA:  0:00:06
Adding changed files:   5% |#                                   | ETA:  0:00:06
Adding changed files:   6% |##                                  | ETA:  0:00:06
Adding changed files:   8% |##                                  | ETA:  0:00:07
Adding changed files:   9% |###                                 | ETA:  0:00:09
Adding changed files:  10% |###                                 | ETA:  0:00:08
Adding changed files:  12% |####                                | ETA:  0:00:07
Adding changed files:  13% |####                                | ETA:  0:00:07
Adding changed files:  14% |#####                               | ETA:  0:00:07
Adding changed files:  16% |#####                               | ETA:  0:00:06
Adding changed files:  17% |######                              | ETA:  0:00:06
Adding changed files:  18% |######                              | ETA:  0:00:05
Adding changed files:  20% |#######                             | ETA:  0:00:05
Adding changed files:  21% |#######                             | ETA:  0:00:05
Adding changed files:  23% |########                            | ETA:  0:00:05
Adding changed files:  24% |########                            | ETA:  0:00:05
Adding changed files:  25% |#########                           | ETA:  0:00:05
Adding changed files:  27% |#########                           | ETA:  0:00:04
Adding changed files:  28% |##########                          | ETA:  0:00:04
Adding changed files:  29% |##########                          | ETA:  0:00:04
Adding changed files:  31% |###########                         | ETA:  0:00:04
Adding changed files:  32% |###########                         | ETA:  0:00:04
Adding changed files:  33% |############                        | ETA:  0:00:04
Adding changed files:  35% |############                        | ETA:  0:00:04
Adding changed files:  36% |#############                       | ETA:  0:00:04
Adding changed files:  37% |#############                       | ETA:  0:00:04
Adding changed files:  39% |##############                      | ETA:  0:00:04
Adding changed files:  40% |##############                      | ETA:  0:00:03
Adding changed files:  42% |###############                     | ETA:  0:00:03
Adding changed files:  43% |###############                     | ETA:  0:00:03
Adding changed files:  44% |################                    | ETA:  0:00:03
Adding changed files:  46% |################                    | ETA:  0:00:03
Adding changed files:  47% |#################                   | ETA:  0:00:03
Adding changed files:  48% |#################                   | ETA:  0:00:03
Adding changed files:  50% |##################                  | ETA:  0:00:03
Adding changed files:  51% |##################                  | ETA:  0:00:03
Adding changed files:  52% |###################                 | ETA:  0:00:03
Adding changed files:  54% |###################                 | ETA:  0:00:03
Adding changed files:  55% |####################                | ETA:  0:00:02
Adding changed files:  56% |####################                | ETA:  0:00:02
Adding changed files:  58% |#####################               | ETA:  0:00:02
Adding changed files:  59% |#####################               | ETA:  0:00:02
Adding changed files:  61% |#####################               | ETA:  0:00:02
Adding changed files:  62% |######################              | ETA:  0:00:02
Adding changed files:  63% |######################              | ETA:  0:00:02
Adding changed files:  65% |#######################             | ETA:  0:00:02
Adding changed files:  66% |#######################             | ETA:  0:00:02
Adding changed files:  67% |########################            | ETA:  0:00:02
Adding changed files:  69% |########################            | ETA:  0:00:02
Adding changed files:  70% |#########################           | ETA:  0:00:01
Adding changed files:  71% |#########################           | ETA:  0:00:01
Adding changed files:  73% |##########################          | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  75% |###########################         | ETA:  0:00:01
Adding changed files:  77% |###########################         | ETA:  0:00:01
Adding changed files:  78% |############################        | ETA:  0:00:01
Adding changed files:  80% |############################        | ETA:  0:00:01
Adding changed files:  81% |#############################       | ETA:  0:00:01
Adding changed files:  82% |#############################       | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:06
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://mesa.freedesktop.org/archive/mesa-24.3.2.tar.xz...
INFO: Rebasing devtool onto a30fbf87679db3474f8b824e74abb2a6f156ecf1
WARNING: Command 'git rebase a30fbf87679db3474f8b824e74abb2a6f156ecf1' failed:
Auto-merging src/glx/drisw_glx.c
CONFLICT (content): Merge conflict in src/glx/drisw_glx.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/mesa
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/mesa/mesa.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2634837749833309436==--

