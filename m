Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E49C5479D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:17 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.20187.1672605968412187663
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=egRRG535;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101856f15a838-916808c3-b248-4144-8255-3113cbe560f3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eC6JThgxaZ9uqwC7htqbJhTn7q7GEoX30XLpUJgNNu0=;
	b=egRRG535DRNcf9Y6o4j7weEUu1HMHpT+kiYfrU/OplPVQRBagrgBVDmhY8J7F43X
	vP3YpCJXlLjR21O4ZhZf59+SfPCqSSJF7c89/1d+GKUEAawkbrKqAeglVkxkBul70JL
	FWJcHOTFHBz5KdXqwnTCdbAHTnmPlC+pKwAoi6SA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eC6JThgxaZ9uqwC7htqbJhTn7q7GEoX30XLpUJgNNu0=;
	b=I1pyLo2LzXDIZm8hkYcDMF26UQ23ka5dREg28925kQ0iD8xDRy0KBRS0wiZaKVWB
	Q/VEU6gGef1rIncQuT2pjWozY5aJtFJkhGRDtpWhUG11xfV1wm6HIMCgVHptwgEJsYH
	1fB1Y0q/NxEtwt+Fc9oQJsLGR70s4owdEj3N91hA=
Content-Type: multipart/mixed; boundary="===============3756540787998286675=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.4.0 FAILED
Message-ID: <010101856f15a838-916808c3-b248-4144-8255-3113cbe560f3-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175310

--===============3756540787998286675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnupg* to *2.4.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gnupg failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (19:53:17.396682)
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 36 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
meta-yocto-bsp       = "tmp-auh-upgrades:249ef6aa5afa36b8ed4c2ab0a9cf9604e7645790"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1690 entries from dependency cache.
Parsing recipes...done.
Parsing of 894 .bb files complete (892 cached, 2 parsed). 1691 targets, 36 skipped, 0 masked, 0 errors.

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
meta-yocto-bsp       = "tmp-auh-upgrades:249ef6aa5afa36b8ed4c2ab0a9cf9604e7645790"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  44% |###############                     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.0.tar.bz2...
INFO: Rebasing devtool onto 58502992ec5f2a13284ad3dca8fc2179bebad910
WARNING: Command 'git rebase 58502992ec5f2a13284ad3dca8fc2179bebad910' failed:
Auto-merging m4/npth.m4
CONFLICT (content): Merge conflict in m4/npth.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 58502992ec5f2a13284ad3dca8fc2179bebad910
WARNING: Command 'git rebase 58502992ec5f2a13284ad3dca8fc2179bebad910' failed:
Auto-merging m4/npth.m4
CONFLICT (content): Merge conflict in m4/npth.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 58502992ec5f2a13284ad3dca8fc2179bebad910
WARNING: Command 'git rebase 58502992ec5f2a13284ad3dca8fc2179bebad910' failed:
Auto-merging m4/npth.m4
CONFLICT (content): Merge conflict in m4/npth.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/gnupg
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/gnupg/gnupg_2.4.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3756540787998286675==--

