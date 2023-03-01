Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCBDC87FE7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.24027.1677681915237805525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=h2INQLLF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101869da272ce-15ef53fc-aee7-4e1d-9e5a-ce3c9be22bbc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Mbgsryl2DGSUdXpzEAlL0ASOj2VqdkL8u1HjcRP01eg=;
	b=h2INQLLF8O6RKCSsq0on22xOcf2mWQaCta+w9bSYUDdG7kee/xlQFRWZgd4QBpBI
	WQ0sQBAkIkE8XSXZXo+qj/MAwBojVlUDwAirAQP59onNrhNTjmJbj6ZMdvrc9Qp/INq
	xTEf51l88GjbM6tMncqrvF3IrOkNIKK2Pa2EnI3I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Mbgsryl2DGSUdXpzEAlL0ASOj2VqdkL8u1HjcRP01eg=;
	b=kGbeO8oAkY90f1B1kK2Cn1M2Yno3N/EQTkQX9jdMpRAQejltK1Yg1riJYi8sem/N
	xJbb9Ce0HQhhnUqMC5ey9fWe4Ax8jJz2C119kZHKs8FJIJgVTddaa3TxeSHSHuGmWj6
	Px8QBu2EN+KXLeba+rUegyEAeQRTzb6BnNQ3Ee/c=
Content-Type: multipart/mixed; boundary="===============0019812008669206005=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 23.0.0 FAILED
Message-ID: <010101869da272ce-15ef53fc-aee7-4e1d-9e5a-ce3c9be22bbc-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177912

--===============0019812008669206005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *23.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe mesa failed.
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1697 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-530977bdb4c7d16e29e7956ccb4d5632a8222c6f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:530977bdb4c7d16e29e7956ccb4d5632a8222c6f"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (894 cached, 2 parsed). 1698 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-530977bdb4c7d16e29e7956ccb4d5632a8222c6f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:530977bdb4c7d16e29e7956ccb4d5632a8222c6f"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   3% |#                                   | ETA:  0:00:25
Adding changed files:   7% |##                                  | ETA:  0:00:14
Adding changed files:  11% |####                                | ETA:  0:00:11
Adding changed files:  15% |#####                               | ETA:  0:00:09
Adding changed files:  19% |######                              | ETA:  0:00:08
Adding changed files:  22% |########                            | ETA:  0:00:08
Adding changed files:  26% |#########                           | ETA:  0:00:07
Adding changed files:  30% |###########                         | ETA:  0:00:06
Adding changed files:  34% |############                        | ETA:  0:00:06
Adding changed files:  38% |#############                       | ETA:  0:00:05
Adding changed files:  42% |###############                     | ETA:  0:00:05
Adding changed files:  45% |################                    | ETA:  0:00:04
Adding changed files:  49% |#################                   | ETA:  0:00:04
Adding changed files:  53% |###################                 | ETA:  0:00:04
Adding changed files:  57% |####################                | ETA:  0:00:03
Adding changed files:  61% |######################              | ETA:  0:00:03
Adding changed files:  65% |#######################             | ETA:  0:00:02
Adding changed files:  68% |########################            | ETA:  0:00:02
Adding changed files:  72% |##########################          | ETA:  0:00:02
Adding changed files:  76% |###########################         | ETA:  0:00:01
Adding changed files:  80% |############################        | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  91% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:07
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://mesa.freedesktop.org/archive/mesa-23.0.0.tar.xz...
INFO: Rebasing devtool onto 418e2f711207419914b0cd4d2958fa0c5a77b0b2
WARNING: Command 'git rebase 418e2f711207419914b0cd4d2958fa0c5a77b0b2' failed:
Auto-merging src/util/format/u_format.c
CONFLICT (content): Merge conflict in src/util/format/u_format.c
Auto-merging src/util/format/u_format_unpack_neon.c
CONFLICT (content): Merge conflict in src/util/format/u_format_unpack_neon.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/mesa
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/mesa/mesa_23.0.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0019812008669206005==--

