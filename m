Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3DCCD4848
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15625.1777645545984148990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JGrsjvws;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=sf9As+HS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019de3ee916b-85c032d9-3a54-4f27-b246-973718a66a13-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ulDBz34tzEBDrGykhFyVY/VHw7TVIBkCMpPk8jd9ni4=;
	b=JGrsjvwsTaNnwF1nQxVOXE9LNi6x+oY4Wevjx25fij5S0Ja3kI78wZFq9zBAIA8A
	PZqUHcWG/SDbBSaQd15KpEDu4nZlEeMjnG+xNZ/fYK0THHTivlaEpObNMK8UlwP4QCh
	g9i6Gc6nMAE9887AD82nSq4LzOQjW1oN+gIYSo2k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ulDBz34tzEBDrGykhFyVY/VHw7TVIBkCMpPk8jd9ni4=;
	b=sf9As+HS7hW/4FSjn2L/pwO+XfOcqaF3fCNGmIEhB6Tl6ulynNhr9bvDQ+qJad9d
	n8p2IKwTpIhO2ecEiDRMtzWkCxeFAC784/sz9DVyvRmRVuJSewyNymkj/ZR0bOUsLbu
	RXY3eTdNTgubbF0gqJ/+qu3qY/VyzWyz16I1wB9Q=
Content-Type: multipart/mixed; boundary="===============4784999124261581117=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libical: upgrading to 4.0.0 FAILED
Message-ID: <0101019de3ee916b-85c032d9-3a54-4f27-b246-973718a66a13-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236296

--===============4784999124261581117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libical* to *4.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libical failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-12f026eed6e6fa928f54be1c31ed79eff2d90746"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:12f026eed6e6fa928f54be1c31ed79eff2d90746"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1977 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-12f026eed6e6fa928f54be1c31ed79eff2d90746"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:12f026eed6e6fa928f54be1c31ed79eff2d90746"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   4% |#                                   | ETA:  0:00:02
Adding changed files:   8% |##                                  | ETA:  0:00:02
Adding changed files:  12% |####                                | ETA:  0:00:01
Adding changed files:  16% |#####                               | ETA:  0:00:01
Adding changed files:  20% |#######                             | ETA:  0:00:01
Adding changed files:  24% |########                            | ETA:  0:00:01
Adding changed files:  28% |##########                          | ETA:  0:00:01
Adding changed files:  32% |###########                         | ETA:  0:00:00
Adding changed files:  36% |#############                       | ETA:  0:00:00
Adding changed files:  40% |##############                      | ETA:  0:00:00
Adding changed files:  44% |################                    | ETA:  0:00:00
Adding changed files:  48% |#################                   | ETA:  0:00:00
Adding changed files:  52% |###################                 | ETA:  0:00:00
Adding changed files:  56% |####################                | ETA:  0:00:00
Adding changed files:  61% |#####################               | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  69% |########################            | ETA:  0:00:00
Adding changed files:  73% |##########################          | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/libical/libical/releases//download/v4.0.0/libical-4.0.0.tar.gz...
INFO: Rebasing devtool onto 00e4c34bff0500960acbfb8d6f6546deced41ecd
WARNING: Command 'git rebase 00e4c34bff0500960acbfb8d6f6546deced41ecd' failed:
Auto-merging cmake/modules/GObjectIntrospectionMacros.cmake
CONFLICT (content): Merge conflict in cmake/modules/GObjectIntrospectionMacros.cmake

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libical
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libical/libical_4.0.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4784999124261581117==--

