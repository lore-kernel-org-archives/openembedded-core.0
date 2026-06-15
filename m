Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8650CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 05:18:50 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123080.1781500727142109209
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 22:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hKc1z6Dy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iTNjdkW1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019ec9b7cc85-429a30a3-166f-4dc8-a9e8-579dee9ff4d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781500726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4G/g5RlX+wZxsoAV27Lru/UVfoFiH3Np6F1SAHh/SyE=;
	b=hKc1z6DyAF1JB/77yVFiwZgVsdisumNLkqY1//DVtY3L3fBhTXMsI/1+/lXCA4YU
	V0Qx/8ih01v2kcv3Zt6iQrg7eY88S8rqMHdLUU0SN9LZsOWcmXWALC1UGGSjvZ9UIF+
	/cY50XQg/9pyfBVLOoDsEXIA835lq6KHtVbgXxFc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781500726;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4G/g5RlX+wZxsoAV27Lru/UVfoFiH3Np6F1SAHh/SyE=;
	b=iTNjdkW1eZ1LuX/fGolXhXxNjLdztoSvxEaTUZ+88d8jdTSdudh6eFXfbEq+sbKm
	FEkqhM1oDeWWyIFr2O0XocfonNeObziOusnIF+vDiNVNeg7m8tgcSi1cYGN5qUZktFh
	L8qW2PxRwMbsqSOi0KhmWi11uiLi8vbvRuEydv+8=
Content-Type: multipart/mixed; boundary="===============6875188955428746255=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libical: upgrading to 4.0.3 FAILED
Message-ID: <0101019ec9b7cc85-429a30a3-166f-4dc8-a9e8-579dee9ff4d0-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jun 2026 05:18:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 05:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238808

--===============6875188955428746255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libical* to *4.0.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libical failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1980 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-a1213a50cc43f9e8470bf85708deaf9fc564183e"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:a1213a50cc43f9e8470bf85708deaf9fc564183e"
meta-yocto-bsp       
meta-poky            = "master:f49de2f33e37ca971d64215cc1a3669312e1e7c3"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1981 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-a1213a50cc43f9e8470bf85708deaf9fc564183e"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:a1213a50cc43f9e8470bf85708deaf9fc564183e"
meta-yocto-bsp       
meta-poky            = "master:f49de2f33e37ca971d64215cc1a3669312e1e7c3"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
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
Adding changed files:  52% |##################                  | ETA:  0:00:00
Adding changed files:  56% |####################                | ETA:  0:00:00
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  72% |##########################          | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/libical/libical/releases//download/v4.0.3/libical-4.0.3.tar.gz...
INFO: Rebasing devtool onto dcf41e88c0625345bcac0a9069c087133d8b3b5e
WARNING: Command 'git rebase dcf41e88c0625345bcac0a9069c087133d8b3b5e' failed:
Auto-merging cmake/modules/GObjectIntrospectionMacros.cmake
CONFLICT (content): Merge conflict in cmake/modules/GObjectIntrospectionMacros.cmake

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libical
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libical/libical_4.0.3.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libical.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6875188955428746255==--

