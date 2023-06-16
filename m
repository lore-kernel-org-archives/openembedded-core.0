Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECC9C10F00
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.816.1686887484269312761
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=O4GSbHMy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010188c254488e-d704b8ad-a331-46b5-9dc1-b820f3cccaed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6RZaz+/mCWosW4WHMDwVBdWI3YpSt2OUmf/AjNOA1KQ=;
	b=O4GSbHMyg0Bnm1m6S0C8osA9e1TUHdh9p1o6ZEK8x8hoRwmvSuF/99rYvwPh24+e
	iKbyDjzOQBUhAmQ9BqnR8YxMEluv94LM5HG56n4slL8QRViWFbyDMkob9edOSqtW1YE
	yUY1LBp/z2exzmZEcBHvo7K4fC4SWEdxV3fgO7Pg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6RZaz+/mCWosW4WHMDwVBdWI3YpSt2OUmf/AjNOA1KQ=;
	b=M9UgzR3YVsOzTVgWNoyyIkoQf2UUQFmuaak4qjtdtnxo5ACXGaCD/FpSFXWZ2kQh
	7RjJeWSDBHFK5X6aCcaHol8Ckg3A64oVPIn5V+lF+3TpJ6AsxX2cHqkS74RZ8OAXLiG
	zWfyW/CJR2d7k88qYROhJ813ac/eNjW0NGBA5cmQ=
Content-Type: multipart/mixed; boundary="===============8293866334485167176=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpam: upgrading to 1.5.3 FAILED
Message-ID: <01010188c254488e-d704b8ad-a331-46b5-9dc1-b820f3cccaed-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182951

--===============8293866334485167176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpam* to *1.5.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libpam failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (16:44:56.816224)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7f9c4f72e2a2791257c50d937bb8707a6d5caf53"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1803 targets, 36 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7f9c4f72e2a2791257c50d937bb8707a6d5caf53"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  14% |#####                               | ETA:  0:00:00
Adding changed files:  28% |##########                          | ETA:  0:00:00
Adding changed files:  42% |###############                     | ETA:  0:00:00
Adding changed files:  57% |####################                | ETA:  0:00:00
Adding changed files:  71% |#########################           | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/linux-pam/linux-pam/releases/download/v1.5.3/Linux-PAM-1.5.3.tar.xz...
INFO: Rebasing devtool onto 555ebec24dfbb0a9189970769916fdcba1711d79
WARNING: Command 'git rebase 555ebec24dfbb0a9189970769916fdcba1711d79' failed:
Auto-merging xtests/run-xtests.sh
CONFLICT (content): Merge conflict in xtests/run-xtests.sh

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libpam
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libpam/libpam_1.5.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8293866334485167176==--

