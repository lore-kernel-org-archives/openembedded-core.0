Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F93C64EDA
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.24220.1665871392797875675
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Zr1Dz5DM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010183ddac2c48-a904b6e0-3dfe-48f8-83a3-940e11f8e1d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=frelvExU/BoB5K83iH/jDTJm/2+fI5HG7eOeuNEBDCk=;
	b=Zr1Dz5DMsIzlpI5AXqgoMI8YI3lHUj7sIb+8oi3GC2m9s4IfHJJP2s28zo4tB1IB
	lWFfm2y0mq8tpbSFxqFFG2upVOVYLMKJuwjqAEit+1lBMq1+mjko+kHjnU2xsT+Af0+
	RZyuBvIEf2cZlboWAjQ1EkahgDYz3oAh968PA5g0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=frelvExU/BoB5K83iH/jDTJm/2+fI5HG7eOeuNEBDCk=;
	b=NZIfTh3GxEGL0u2CzZXUU23uJLwLeC59O9PFNpxEFUhZZhVvxvOFX4z1P3REnPk0
	lkwFhzdPcp7zUZjtHZoCa+ZQ7jD0YhCPI7M/ubv4Ft3WsTuq3reG9/048qB9mbTTAUF
	Rb0lFplTf0rQepZJ/N6Ar3lOxqy3w2OSW9WYE2WU=
Content-Type: multipart/mixed; boundary="===============4594392780472820644=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gettext: upgrading to 0.21.1 FAILED
Message-ID: <01010183ddac2c48-a904b6e0-3dfe-48f8-83a3-940e11f8e1d0-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171748

--===============4594392780472820644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gettext* to *0.21.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gettext failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2abb405b31635744891bfcebebba76633795e642"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (884 cached, 2 parsed). 1662 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2abb405b31635744891bfcebebba76633795e642"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |                                    | ETA:  0:00:05
Adding changed files:   4% |#                                   | ETA:  0:00:04
Adding changed files:   7% |##                                  | ETA:  0:00:03
Adding changed files:   9% |###                                 | ETA:  0:00:03
Adding changed files:  12% |####                                | ETA:  0:00:03
Adding changed files:  14% |#####                               | ETA:  0:00:03
Adding changed files:  16% |######                              | ETA:  0:00:02
Adding changed files:  19% |######                              | ETA:  0:00:03
Adding changed files:  21% |#######                             | ETA:  0:00:02
Adding changed files:  24% |########                            | ETA:  0:00:02
Adding changed files:  26% |#########                           | ETA:  0:00:02
Adding changed files:  28% |##########                          | ETA:  0:00:02
Adding changed files:  31% |###########                         | ETA:  0:00:02
Adding changed files:  33% |############                        | ETA:  0:00:02
Adding changed files:  36% |############                        | ETA:  0:00:02
Adding changed files:  38% |#############                       | ETA:  0:00:01
Adding changed files:  40% |##############                      | ETA:  0:00:01
Adding changed files:  43% |###############                     | ETA:  0:00:01
Adding changed files:  45% |################                    | ETA:  0:00:01
Adding changed files:  48% |#################                   | ETA:  0:00:01
Adding changed files:  50% |##################                  | ETA:  0:00:01
Adding changed files:  52% |###################                 | ETA:  0:00:01
Adding changed files:  55% |###################                 | ETA:  0:00:01
Adding changed files:  57% |####################                | ETA:  0:00:01
Adding changed files:  60% |#####################               | ETA:  0:00:01
Adding changed files:  62% |######################              | ETA:  0:00:01
Adding changed files:  64% |#######################             | ETA:  0:00:01
Adding changed files:  67% |########################            | ETA:  0:00:00
Adding changed files:  69% |#########################           | ETA:  0:00:00
Adding changed files:  72% |#########################           | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files:  79% |############################        | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  88% |################################    | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:03
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/gettext/gettext-0.21.1.tar.gz...
INFO: Rebasing devtool onto 82e7fade338e4deabfa228490c9501c2f04041b5
WARNING: Command 'git rebase 82e7fade338e4deabfa228490c9501c2f04041b5' failed:
Auto-merging libtextstyle/gnulib-m4/libglib.m4
CONFLICT (content): Merge conflict in libtextstyle/gnulib-m4/libglib.m4
Auto-merging libtextstyle/gnulib-m4/libcroco.m4
CONFLICT (content): Merge conflict in libtextstyle/gnulib-m4/libcroco.m4
Auto-merging libtextstyle/gnulib-local/m4/libglib.m4
CONFLICT (content): Merge conflict in libtextstyle/gnulib-local/m4/libglib.m4
Auto-merging libtextstyle/gnulib-local/m4/libcroco.m4
CONFLICT (content): Merge conflict in libtextstyle/gnulib-local/m4/libcroco.m4
Auto-merging gettext-tools/gnulib-m4/libxml.m4
CONFLICT (content): Merge conflict in gettext-tools/gnulib-m4/libxml.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/gettext
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/gettext/gettext_0.21.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4594392780472820644==--

