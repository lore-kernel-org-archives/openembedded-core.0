Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B165FC531CA
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:47 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1420.1771440098325640533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uOmzaCWI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IicgtzI/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019c720ece86-cec2a769-7497-4e82-b040-a91b28d7a5f8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440099;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MFgFK7fA6Zfeu31y4h5u9lSHqOwSSxjM5mnHz5HQIBk=;
	b=uOmzaCWIq9f/JTcvG5MZ/y6qFGozSas3pvYN7CRsur8USS71bD61/a0sipBfqGAR
	vKA2dilDnd6ej8TRnxYvPZqSqays15Bv9RD2b9zQgDYEvI/V7xJCnfWQqawWi+7jDTV
	DHrYwX8GPP5JpVAuoTM7+7A61ZSgH2BoOKF70fqs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440099;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MFgFK7fA6Zfeu31y4h5u9lSHqOwSSxjM5mnHz5HQIBk=;
	b=IicgtzI/GudFMyzk4nT5CEcj1Votf0arxrPMjQLsIUSCeQP6PwPy3Mv6TR4CrTM/
	kjD9IvFBkcxvqzRecK4ae0BeK41TQ36Wn0ff2G+zNTKMNdiJlMKmkETvigfVqVK0QPN
	AZSgzAVP/LiXCpdIVto25TLkCjsj+kYduZN21q0Q=
Content-Type: multipart/mixed; boundary="===============2050088196780131932=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] coreutils: upgrading to 9.10 FAILED
Message-ID: <0101019c720ece86-cec2a769-7497-4e82-b040-a91b28d7a5f8-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231338

--===============2050088196780131932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *coreutils* to *9.10* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe coreutils failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1952 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

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
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1953 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   3% |#                                   | ETA:  0:00:06
Adding changed files:   6% |##                                  | ETA:  0:00:04
Adding changed files:   9% |###                                 | ETA:  0:00:03
Adding changed files:  12% |####                                | ETA:  0:00:02
Adding changed files:  15% |#####                               | ETA:  0:00:02
Adding changed files:  18% |######                              | ETA:  0:00:02
Adding changed files:  21% |#######                             | ETA:  0:00:01
Adding changed files:  25% |#########                           | ETA:  0:00:01
Adding changed files:  28% |##########                          | ETA:  0:00:01
Adding changed files:  31% |###########                         | ETA:  0:00:01
Adding changed files:  34% |############                        | ETA:  0:00:01
Adding changed files:  37% |#############                       | ETA:  0:00:01
Adding changed files:  40% |##############                      | ETA:  0:00:01
Adding changed files:  43% |###############                     | ETA:  0:00:01
Adding changed files:  46% |################                    | ETA:  0:00:01
Adding changed files:  50% |##################                  | ETA:  0:00:01
Adding changed files:  53% |###################                 | ETA:  0:00:00
Adding changed files:  56% |####################                | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  71% |#########################           | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:02
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/coreutils/coreutils-9.10.tar.xz...
INFO: Rebasing devtool onto 56cf3ae286a311b967d7a82245c55d445222618e
WARNING: Command 'git rebase 56cf3ae286a311b967d7a82245c55d445222618e' failed:
Auto-merging src/copy-file-data.c
CONFLICT (content): Merge conflict in src/copy-file-data.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/coreutils
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/coreutils/coreutils_9.10.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2050088196780131932==--

