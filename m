Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03705CD4F47
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:23 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34810.1778851219949335673
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NDUw+/p8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=v+n4bppq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e2bcb8648-8a37c846-8669-46bd-83fa-dd499d65541a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VhXftaVXP8HdMA5r14EVWY/H6h5C6f09W6nM+dTu408=;
	b=NDUw+/p84rbhdn902ddYtlp+LBTVUZz/IYtEOSdDOGDWkwvov/uKs41EEHryzzMx
	jNmR/ELnQcAOZzLytY/cXBvxMdGpDz6NoyxFhxhmFAaDHi4q60yJxxmTAEnUoKZdNIv
	5RHVzdnBFs34b7NA3lZi14DJaqt1gKmyXAvcAiUA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VhXftaVXP8HdMA5r14EVWY/H6h5C6f09W6nM+dTu408=;
	b=v+n4bppq+JFrGdNgmvxU0r9ujD84iw8E5ZXDwyhTpKFalTzWoRRwnCDdsLxR+LeD
	LFpc/uIZ0anH3VrJvAU2/0fOt4BtanjVvT0lndCa+nm//BhdWUmvQbZHyAYibmcled8
	OEtg+ge29TW0tHPhffcnf3hatMGdVa0Qe7Q7AfTY=
Content-Type: multipart/mixed; boundary="===============3890896157410524262=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid,util-linux: upgrading to 2.42,2.42 FAILED
Message-ID: <0101019e2bcb8648-8a37c846-8669-46bd-83fa-dd499d65541a-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237081

--===============3890896157410524262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *util-linux-libuuid,util-linux* to *2.42,2.42* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe util-linux-libuuid failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1974 entries from dependency cache.
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
DISTRO_VERSION       = "6.0.99+snapshot-11c852ece75605328103b77451ef56df6a123065"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:11c852ece75605328103b77451ef56df6a123065"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
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
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-11c852ece75605328103b77451ef56df6a123065"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:11c852ece75605328103b77451ef56df6a123065"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
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
Adding changed files:   6% |##                                  | ETA:  0:00:02
Adding changed files:  13% |####                                | ETA:  0:00:01
Adding changed files:  20% |#######                             | ETA:  0:00:01
Adding changed files:  27% |#########                           | ETA:  0:00:00
Adding changed files:  34% |############                        | ETA:  0:00:00
Adding changed files:  41% |##############                      | ETA:  0:00:00
Adding changed files:  48% |#################                   | ETA:  0:00:00
Adding changed files:  55% |###################                 | ETA:  0:00:00
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files:  69% |########################            | ETA:  0:00:00
Adding changed files:  76% |###########################         | ETA:  0:00:00
Adding changed files:  83% |#############################       | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  97% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.42/util-linux-2.42.tar.xz...
INFO: Rebasing devtool onto a251e124e083d6d0e5a4bdff293876a6183a4e84
WARNING: Command 'git rebase a251e124e083d6d0e5a4bdff293876a6183a4e84' failed:
Auto-merging tests/ts/script/options
CONFLICT (content): Merge conflict in tests/ts/script/options

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/util-linux-libuuid
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/util-linux-libuuid/util-linux-libuuid_2.42.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3890896157410524262==--

