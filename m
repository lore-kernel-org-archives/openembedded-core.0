Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20E2C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:59 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.88642.1754057277577006932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZA1hjm4e;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Gu8KFVa0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019865f6066d-63149a6b-268a-4216-890a-235a0d8d376b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057279;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RKFJ3OO3DFgzeGzFKHXvSQ5i7f7fVdTzdetwCj/M5m4=;
	b=ZA1hjm4eQq8EjNKMzE/10SMYs1i7Dx6s5dloDPWtlJdyWJl9U2XzHsO42q3sme5G
	zYTFqxgfnK3KH5EiVy4nmWO+2S5wiz79oXxgSP1MZN5vN7rb2qgYun6uXvGYuDwxwsL
	3v1ptdU9D3qgQ7s7774ipKkrkFDjJ+6nfqvq5K00=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057279;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RKFJ3OO3DFgzeGzFKHXvSQ5i7f7fVdTzdetwCj/M5m4=;
	b=Gu8KFVa01xrC3j17K/k0X8a8OiWQx6FOJ2N52fK/hS1Zs6jnauTZAp1RpBLcvrS5
	tvWXmuYExMpHxa+829oj/SgF5LtmYRa7uzTurHUqNOwdwCSd/ZRJuxE9//kvxupFntn
	ZmCt3ySyNdwIk23EJpx0TbXKY7xzqBEQfo9FWuks=
Content-Type: multipart/mixed; boundary="===============1136228605299648723=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpcbind: upgrading to 1.2.8 FAILED
Message-ID: <0101019865f6066d-63149a6b-268a-4216-890a-235a0d8d376b-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221299

--===============1136228605299648723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpcbind* to *1.2.8* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpcbind failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1933 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-211c4510bd11f07424e8374b28b17c119f46ffff"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:211c4510bd11f07424e8374b28b17c119f46ffff"

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
Parsing of 943 .bb files complete (0 cached, 943 parsed). 1934 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-211c4510bd11f07424e8374b28b17c119f46ffff"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:211c4510bd11f07424e8374b28b17c119f46ffff"

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
INFO: Fetching https://downloads.sourceforge.net/rpcbind/rpcbind-1.2.8.tar.bz2...
INFO: Rebasing devtool onto 6cbe321e2d2d741e97ec1ffee9a7c31bbec2ffb0
WARNING: Command 'git rebase 6cbe321e2d2d741e97ec1ffee9a7c31bbec2ffb0' failed:
Auto-merging man/rpcbind.8
CONFLICT (content): Merge conflict in man/rpcbind.8
Auto-merging src/rpcbind.c
CONFLICT (content): Merge conflict in src/rpcbind.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/rpcbind
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rpcbind/rpcbind_1.2.8.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1136228605299648723==--

