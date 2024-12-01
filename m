Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF470D10DAF
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:05:58 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.148757.1733047552833607560
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DMjGPAV4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=m7zaBMH+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019381af12fe-dfcea328-ea56-438d-aea8-d0c81a6c03a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qrYo5zahR7BK6cO340iAMZrrFNNwozOmPHxul62ltjE=;
	b=DMjGPAV4WzVLJR+ELxLactcBypo230hVAm/ng1swmF/JOxpRNox6O4jlh6zoOc67
	c+o+UZ2UQbLvLEeHyNgrQwOw4c0GJD5WFMW8g83lyOUCYlcPM49D7Q3NsxmiET39+/6
	ju2eDR32/jA6qmq3QyvHdpIz5bSvanunc/BmHZ2c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qrYo5zahR7BK6cO340iAMZrrFNNwozOmPHxul62ltjE=;
	b=m7zaBMH+elbCOG55UWvb+mrYUsBo6wxMyyctWmns62XRgvLO9UpvXugkfj+fIKmn
	wYDIPMwCsr248LhykO1AHJMibORNVGX4YI4Kyh/ZAo3/vsox4CHXSst18Yp5LmQnLnP
	FpJlbrCXWpLmzHIPAwFQ1TJuVPyoaCbnsFEMl8sY=
Content-Type: multipart/mixed; boundary="===============2950047746528130869=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.12.0 FAILED
Message-ID: <0101019381af12fe-dfcea328-ea56-438d-aea8-d0c81a6c03a0-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208059

--===============2950047746528130869==
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
Loaded 1877 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:6925c68dd64f9b4d5d9722c10c2d59d55080e111"

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
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1878 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:6925c68dd64f9b4d5d9722c10c2d59d55080e111"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-8vlq20eq: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-t9u22cnv/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-t9u22cnv/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
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
INFO: Rebasing devtool onto fd3284580aff87f74a50c608d519f5e3c418c2b6
INFO: Rebasing devtool-override-libc-musl onto fd3284580aff87f74a50c608d519f5e3c418c2b6
WARNING: Command 'git rebase fd3284580aff87f74a50c608d519f5e3c418c2b6' failed:
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
--===============2950047746528130869==--

