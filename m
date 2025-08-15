Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7842FCA0EF6
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:25 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.11335.1755263226705909782
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mwv9acB6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=iiooJ0GG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010198add79295-659e7f3b-e9a3-4a35-afcc-97a0cc65cb84-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263243;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mNz03XzNvbBr0hS6UX6U1jdeX49z2OTqAgMndGQ96B8=;
	b=mwv9acB6AU6PtJcoQcD+qJ1Ct4dyNjbjqS636bOV1RvV6Q6ZbFs6n1S3ypnOnWBt
	KXcCzL/mAInOoAZHYDY4SUOjO50UQXNo5rmH6BhbmbNUXcQ/89e585MRwSvswsABCGd
	9gpuUEclUxAKzzDaNTXnIeu4qhDrwEPw8LGrJZb8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263243;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mNz03XzNvbBr0hS6UX6U1jdeX49z2OTqAgMndGQ96B8=;
	b=iiooJ0GGMwgnsFikqh4e0cG3DYdu+v3cuDU3FyspcyK1f9cp78/6m6xcWU9B8dzq
	wYhZ+bgzV3I1ngg8T5xMgo1G7Jqa0ZeBSOCfWJmnOkUtZgZsXsqsAuT+sRB6xDolMjp
	BZesyr5jf/mP8WXi9TXDkVk6edwdTm7MGz3seRfg=
Content-Type: multipart/mixed; boundary="===============5866540642403256758=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgcrypt: upgrading to 1.11.2 FAILED
Message-ID: <01010198add79295-659e7f3b-e9a3-4a35-afcc-97a0cc65cb84-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221968

--===============5866540642403256758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgcrypt* to *1.11.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libgcrypt failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-fa0eb4e1c299b52c4618a67fc16420fde303a234"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fa0eb4e1c299b52c4618a67fc16420fde303a234"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1942 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-fa0eb4e1c299b52c4618a67fc16420fde303a234"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fa0eb4e1c299b52c4618a67fc16420fde303a234"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.11.2.tar.bz2...
INFO: Rebasing devtool onto c807473863d5458e91e3f9e85991d8e5c3bb5561
WARNING: Command 'git rebase c807473863d5458e91e3f9e85991d8e5c3bb5561' failed:
Auto-merging tests/Makefile.am
CONFLICT (content): Merge conflict in tests/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libgcrypt
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libgcrypt/libgcrypt_1.11.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5866540642403256758==--

