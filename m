Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68347C282D9
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.7061.1740828330988654898
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hviXqT8y;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QBnqH4xr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010195517470cb-33487dc7-d337-40d8-a299-446bf5f4ca88-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828340;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cQlBgieWxVrfEjD16x0z3/zht/uPKahawwo8KHiWWNc=;
	b=hviXqT8yfnrsKZeOlMEJAqNrOYxaTXfzjxIE1tybrgB415m8aFqeu3+nKaloW8DA
	ZbqzncfMRtaKJguWZMDmNWAnsZlOQXoIVyjTJMVK1y0KMUqDJx1kGZz5WKy5UYeMVL1
	jzTu72MjkXfJo8gNCUS71dCvTup9sDzdV0Vs5HEs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828340;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cQlBgieWxVrfEjD16x0z3/zht/uPKahawwo8KHiWWNc=;
	b=QBnqH4xrkxilFTBGao6FGrQBacuFDbVXJMsV+HgYRjFZld4AkEOiDX3up1ZFhiRe
	WmpsD2KhrCibBre9497qlfH8M8hMQfkH2CLZbiM9wT59aG2XVng+JPllbLi5OFB50+T
	NoHBZQNB5kkTXdCCWACk7ijhLrjMzlz31FdZGigM=
Content-Type: multipart/mixed; boundary="===============0059926151803372403=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburcu: upgrading to 0.15.1 FAILED
Message-ID: <01010195517470cb-33487dc7-d337-40d8-a299-446bf5f4ca88-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212175

--===============0059926151803372403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *liburcu* to *0.15.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe liburcu failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:3ff3d80b7bfda04c126718402a62b006a780c92b"

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
Parsing of 923 .bb files complete (0 cached, 923 parsed). 1882 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:3ff3d80b7bfda04c126718402a62b006a780c92b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-x0jriwq0: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-zdq5pfkg/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-zdq5pfkg/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://lttng.org/files/urcu/userspace-rcu-0.15.1.tar.bz2...
INFO: Rebasing devtool onto 067a621f31dc96f166503e23accb03285727295f
WARNING: Command 'git rebase 067a621f31dc96f166503e23accb03285727295f' failed:
Auto-merging include/urcu/uatomic/generic.h
CONFLICT (content): Merge conflict in include/urcu/uatomic/generic.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/liburcu
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/liburcu/liburcu_0.15.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0059926151803372403==--

