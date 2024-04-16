Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF00C07C79
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:07 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.13420.1713248036838917521
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=M+SyoMib;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=KIrXJ4XE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018ee58a63eb-7063ef3e-0304-46ab-b34e-35e6f4109c4b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=x10ogLNboAcDajdoVdvWBC7xrXmM3GFnXkdE7N/vJ5g=;
	b=M+SyoMibSDGOLn8M0CB0VnN+H4cQCV4t/uIonhHgMEUhyaZxVfgx+Xd5BH39EOcj
	h69wbGofpyesYRI0veldw62NpInmqNCBeyMwWDGw4SZ/NnXHRSkIJyfWLOKSX4Eixij
	XUld9Cszenp+V6Uj+Dc2h+MwB+tro/DwOfgP7xQ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=x10ogLNboAcDajdoVdvWBC7xrXmM3GFnXkdE7N/vJ5g=;
	b=KIrXJ4XEybipFkLwzb7rUevvgNdii5XRyTuERapjDRtP69UKHwJ6OFp9P4BCJzwA
	P0c0dI6imKOdLYbH8g+H0Lvr3oBrVy+7ROS+osI6det6A/3wAN2uVB0WPKUd0c1BLBB
	aqCJ8iATqvAihZzWvh1gBlWxKQRx5PZM7ioELTaA=
Content-Type: multipart/mixed; boundary="===============0458635062536583740=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pciutils: upgrading to 3.12.0 FAILED
Message-ID: <0101018ee58a63eb-7063ef3e-0304-46ab-b34e-35e6f4109c4b-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198248

--===============0458635062536583740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pciutils* to *3.12.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe pciutils failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6bd8367aa98e3108e9f1de9bdf809ded5dfc7413"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6bd8367aa98e3108e9f1de9bdf809ded5dfc7413"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 21 Local 21 Mirrors 0 Missed 0 Current 12 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (921 cached, 2 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6bd8367aa98e3108e9f1de9bdf809ded5dfc7413"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6bd8367aa98e3108e9f1de9bdf809ded5dfc7413"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 20 Local 19 Mirrors 0 Missed 1 Current 8 (95% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/software/utils/pciutils/pciutils-3.12.0.tar.xz...
INFO: Rebasing devtool onto a43c0489586ccb784e02fdbba9585373d3b49d68
WARNING: Command 'git rebase a43c0489586ccb784e02fdbba9585373d3b49d68' failed:
Auto-merging Makefile
CONFLICT (content): Merge conflict in Makefile
Auto-merging lib/configure

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/pciutils
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/pciutils/pciutils_3.12.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0458635062536583740==--

