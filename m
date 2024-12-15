Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CF3E7718C
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.33382.1734254982170296990
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JgHY3Fsb;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=i6aV9unr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010193c9a6f15a-694d6f77-47e1-4481-8d5e-4f6ebfa8024f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wtXmL9qHZhGNfqs+fN0yhav4e0+RoSRCYNbOsr1Dgq4=;
	b=JgHY3FsbMTIMn3/dW05AuOD4bFBQmFYPijoGLrCAU+zRWg/2JuNbmk55fAw1Xbus
	wBwM+FwkD0rsed5/Bm9l0nJRYie6yH5VooAo9AP8xsr+aV0nEA45TU5vIy+k4de0ivU
	C/5rEjIJ3TENA33h+U5xBC7JuhCN2qFsmHdejLp0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wtXmL9qHZhGNfqs+fN0yhav4e0+RoSRCYNbOsr1Dgq4=;
	b=i6aV9unr4fk8vAb+OYZfRwgCgQwoxpcHPwaPiFCnfu7hHt0Dq/edkUz8bxHw0+S0
	VUp6mJ57NTmso6aUOdtU3PzpIwMaDunG12m39vctfQUMdwS9i7lKYETn9zUcurWSH+i
	CslpCYrFxNbnWd1XS9BmSQ5mQut3kq6Jt8gdiSK8=
Content-Type: multipart/mixed; boundary="===============9096884950373999062=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.12.0 FAILED
Message-ID: <01010193c9a6f15a-694d6f77-47e1-4481-8d5e-4f6ebfa8024f-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208713

--===============9096884950373999062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *iproute2* to *6.12.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe iproute2 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:14fc9db82e114f13e154641616fbca9c5dc3766e"

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
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:14fc9db82e114f13e154641616fbca9c5dc3766e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-g73v7am5: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-kno0l6da/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-kno0l6da/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.12.0.tar.xz...
INFO: Rebasing devtool onto a17a9d66e334b85f1d0c690390e3faf6976e5b28
INFO: Rebasing devtool-override-libc-musl onto a17a9d66e334b85f1d0c690390e3faf6976e5b28
WARNING: Command 'git rebase a17a9d66e334b85f1d0c690390e3faf6976e5b28' failed:
Auto-merging bridge/mst.c
CONFLICT (content): Merge conflict in bridge/mst.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/iproute2
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/iproute2/iproute2_6.12.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9096884950373999062==--

