Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE195C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:23 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.30019.1675272858440097731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Z7kEeJrq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101860e0b323e-d48b0d42-5ed5-4d95-9b72-3fb598f67830-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272860;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U02c4xYjr4Xj5NjW7djY541ceOWHodhX0eUVO6wYysU=;
	b=Z7kEeJrqwQwlvbbgL6G5pmBz0oru/vzZPrfovqaQOBD1+soy0Ytvx1ajp2B4JOyY
	fR3Eto0Y4pp0p5oR5rondj62Ju0YIh5AzwAStIK1dndb2ThlZbjRyfjY3+t7l9fta5r
	E/lM/nyrkeFwzJxCuIxa9H/+eBjzk/futnUw6tSY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272860;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U02c4xYjr4Xj5NjW7djY541ceOWHodhX0eUVO6wYysU=;
	b=Qy2pWXkVjGpObIk0WXZjqgLWv+qsFqWTDxcnQglc9q8RwVPBIF8B9yTsUk+QOKIa
	dTXbNli983qA6lUJGIoajShPx4+3sdIRrJ0umjEmkpbpdRViBvWBlEKPy5FvNk44Wjj
	tmW0lxlRD5aX526uNi5+eIwq9pbxHIAQ3qn8PuV8=
Content-Type: multipart/mixed; boundary="===============3345204146282470269=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apr-util: upgrading to 1.6.2 FAILED
Message-ID: <010101860e0b323e-d48b0d42-5ed5-4d95-9b72-3fb598f67830-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176646

--===============3345204146282470269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *apr-util* to *1.6.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe apr-util failed.
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f56f4c6741438b2c2b7041ffed69c07d5ca1192e"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1698 targets, 40 skipped, 0 masked, 0 errors.

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
meta-yocto-bsp       = "tmp-auh-upgrades:f56f4c6741438b2c2b7041ffed69c07d5ca1192e"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

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
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://archive.apache.org/dist/apr/apr-util-1.6.2.tar.gz...
INFO: Rebasing devtool onto a448f2f7b3d1bfac7c727d81df4a51d1b84086d5
WARNING: Command 'git rebase a448f2f7b3d1bfac7c727d81df4a51d1b84086d5' failed:
Auto-merging dbm/apr_dbm_gdbm.c
CONFLICT (content): Merge conflict in dbm/apr_dbm_gdbm.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Source subdirectory has changed, updating S value
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/apr-util
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/apr-util/apr-util_1.6.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3345204146282470269==--

