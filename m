Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790BAC54755
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:13 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.75735.1722536822483793946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UVJqri3C;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kRD6mlBc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101910f322769-99f1eb1e-b888-4cda-869e-c04973e9e0d1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536830;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+x2H0qZnBXgemvdq3/aSpaqxl09EPiM2rte0yi94nHk=;
	b=UVJqri3Cxsls6SVMK5p84iQ9e1gtn641MZNPxRS3OiZBv9V7oIv0ieG58lVi08gd
	+dK2RadE6uNhZxH4vkbGM4xl4Ufv/mVJgQLpugraaHOy10G9j065lfan2vRSQfNVnIA
	AmtFrVlVDlR4sGJNJEbD/E2UkYpBB0ZVv11pnfGM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536830;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+x2H0qZnBXgemvdq3/aSpaqxl09EPiM2rte0yi94nHk=;
	b=kRD6mlBcOwpSUP0hj3UJXCOOdQmqFd+9HF6TWJribX7Tgbghxx3xw3vBx6tma2kr
	RCnn9mnXGWqDnd8q+pZohs53MU2vPYAojDEU3LH+SCJ+hh2V1IGVkNzZt14qoXb18M9
	RiBQdkvnu+31hYgd0RUn7br37NQy9Knv/3nMvV8w=
Content-Type: multipart/mixed; boundary="===============0194531928875596695=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpcbind: upgrading to 1.2.7 FAILED
Message-ID: <010101910f322769-99f1eb1e-b888-4cda-869e-c04973e9e0d1-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202828

--===============0194531928875596695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpcbind* to *1.2.7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpcbind failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-081643a8f7601d8a99e3cd0e2a7f1bc25d498ee1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:081643a8f7601d8a99e3cd0e2a7f1bc25d498ee1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1884 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-081643a8f7601d8a99e3cd0e2a7f1bc25d498ee1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:081643a8f7601d8a99e3cd0e2a7f1bc25d498ee1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-0vxeaefb: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-eug5crt8/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-eug5crt8/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/rpcbind/rpcbind-1.2.7.tar.bz2...
INFO: Rebasing devtool onto 196dd8d065cdcf386ff7eada7c2933ccd770cdb1
WARNING: Command 'git rebase 196dd8d065cdcf386ff7eada7c2933ccd770cdb1' failed:
Auto-merging configure.ac
Auto-merging systemd/rpcbind.service.in
CONFLICT (content): Merge conflict in systemd/rpcbind.service.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/rpcbind
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rpcbind/rpcbind_1.2.7.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0194531928875596695==--

