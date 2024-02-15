Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3983FC54E42
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:32 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.20186.1708018347263603724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fQlOWjTO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=W81E0uDl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018dadd3aaaf-409e5c4d-3e9d-48c4-82fa-40155751a549-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Sf1N2c4ydaWR4tpljzhfgWLa1IUmhpheBU36b3dlo70=;
	b=fQlOWjTOCyBVHutgsYKDDlRvIcuKnFSzjo15avZaaVU0gS2FqJc3AD50S8ZYos4D
	mdxjP7T2Utz2OZUUIZegXmdFzXff+ZTNv+Cu5ywbcRq7ZIGALBRK8tcRoFeM7D9fHr8
	WVWkJwHXF5tImAxqGTsA6i11MQV+sFOzi3lTA8Ck=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Sf1N2c4ydaWR4tpljzhfgWLa1IUmhpheBU36b3dlo70=;
	b=W81E0uDlzdu6ZYHWxM7IW6YpgxfO0zID7+MvPzMrJQ1JQrE8yd9G9RQnxJjCgpW2
	qlhRm+9KVoS4QFAbpaSlMBq2E2oXz6auCc/ZAu4IvnDw2GszaTp+1wgD4DIUHTkxaP0
	5a9GCPvphWWeVWodVqNExlNImkPWDGK1V4tFQkl8=
Content-Type: multipart/mixed; boundary="===============2578403490673535599=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-ust: upgrading to 2.13.7 FAILED
Message-ID: <0101018dadd3aaaf-409e5c4d-3e9d-48c4-82fa-40155751a549-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195657

--===============2578403490673535599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-ust* to *2.13.7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lttng-ust failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1857 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-4d8fea01d12c7b8d5b653330b8273e56db3fb5bb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4d8fea01d12c7b8d5b653330b8273e56db3fb5bb"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1857 entries from dependency cache.
Parsing recipes...done.
Parsing of 915 .bb files complete (913 cached, 2 parsed). 1858 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-4d8fea01d12c7b8d5b653330b8273e56db3fb5bb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4d8fea01d12c7b8d5b653330b8273e56db3fb5bb"

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
INFO: Fetching https://lttng.org/files/lttng-ust/lttng-ust-2.13.7.tar.bz2...
INFO: Rebasing devtool onto af3d29e61aff2b6c74dfdb753e41feef4a74fdbf
WARNING: Command 'git rebase af3d29e61aff2b6c74dfdb753e41feef4a74fdbf' failed:
Auto-merging src/python-lttngust/Makefile.am
CONFLICT (content): Merge conflict in src/python-lttngust/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/lttng-ust
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/lttng-ust/lttng-ust_2.13.7.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2578403490673535599==--

