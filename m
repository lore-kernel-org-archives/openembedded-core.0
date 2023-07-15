Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA9DC27C65
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5951.1689456455533757753
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eRWvdo+N;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101895b73ad09-2e0193e3-6cfa-4f8a-8fb6-9e128400b6d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DtUdRhRtI5DM8/Jc00TvrGN1KgpEhkC6OfqqXdhznUA=;
	b=eRWvdo+NDSbwtBkOn2a4Gw5wqNdu7ROsIWzU5XerKzsjtBISYjBpvj0xxtf7lnDx
	MpfrUqmTB7cZ6ZZRjiEnBrtYZnkY8LW/aPgtY15ivrRLU+HFkdwWwI5FpVBIFaYvGL/
	BCVfSGIHw1rP37vYPsokc9FCWhs92iNu0oz7HE4Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DtUdRhRtI5DM8/Jc00TvrGN1KgpEhkC6OfqqXdhznUA=;
	b=ltqD5pRLzbopfaaqQVQXlOb6MV3gz9BzgRw9ZB1ehyIVd9fZ6rdV4lcx1FJZGGvF
	c5NQYuuALNZ4ykEeIrGfJSfeI+qHiJFBYkDQndgqY3xFpZwxkyN+Vkg/xGXtT1sV3z2
	YwRBUsO0SlF053F89QzN8rBxvz+Qas4hIdbdcRoU=
Content-Type: multipart/mixed; boundary="===============8109598187350639645=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] groff: upgrading to 1.23.0 FAILED
Message-ID: <010101895b73ad09-2e0193e3-6cfa-4f8a-8fb6-9e128400b6d2-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184352

--===============8109598187350639645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *groff* to *1.23.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe groff failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (15:23:52.262268)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1804 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:37abe1fdf7d84b9f66652a5922babe7138446ad6"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.

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
meta-yocto-bsp       = "tmp-auh-upgrades:37abe1fdf7d84b9f66652a5922babe7138446ad6"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

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
Adding changed files:   7% |##                                  | ETA:  0:00:02
Adding changed files:  14% |#####                               | ETA:  0:00:01
Adding changed files:  22% |#######                             | ETA:  0:00:01
Adding changed files:  29% |##########                          | ETA:  0:00:01
Adding changed files:  36% |#############                       | ETA:  0:00:00
Adding changed files:  44% |###############                     | ETA:  0:00:00
Adding changed files:  51% |##################                  | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  66% |#######################             | ETA:  0:00:00
Adding changed files:  73% |##########################          | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/groff/groff-1.23.0.tar.gz...
INFO: Rebasing devtool onto 2bdc58a4ec988891240116e754c99fa009ee33a7
WARNING: Command 'git rebase 2bdc58a4ec988891240116e754c99fa009ee33a7' failed:
Auto-merging font/devpdf/util/BuildFoundries.pl
CONFLICT (content): Merge conflict in font/devpdf/util/BuildFoundries.pl
Auto-merging src/devices/gropdf/gropdf.pl
Auto-merging src/devices/gropdf/pdfmom.pl
Auto-merging src/utils/afmtodit/afmtodit.pl
CONFLICT (content): Merge conflict in src/utils/afmtodit/afmtodit.pl

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/groff
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/groff/groff_1.23.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8109598187350639645==--

