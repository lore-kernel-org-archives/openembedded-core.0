Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DCBD216A5
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:25 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.11872.1728994560433135215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=A/bEgHdQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ANdMaczu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010192901b84b3-2c72cace-ec85-4bef-a133-ffe5fdebe571-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oVKf7Bao2ib6vNtOWOkfSJni7btgwGpiR47+4jxCm6Q=;
	b=A/bEgHdQuqEu4J8+9pxAgF2t7VWDH4wLsvDNWt3L/ee88kqdSyEJJEt4Xc0NNYy7
	XtOEhIYjqmWxGNeN8Ubg081yc1y0G1v/hGT1K1luZPzAsBmcLy86cm20808TBEatqmi
	H2cppFfMkX8OHlPIZJbowPUWnm7yshJmhkk6kVZo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oVKf7Bao2ib6vNtOWOkfSJni7btgwGpiR47+4jxCm6Q=;
	b=ANdMaczug0j7638GvBEftGeGoCYIZc8tUUrcHnkRngXcSOdC83A1rmYoXORzrCAE
	xuju2Q1X7L1KePuAV1Zap8pBKM4/8rYBnhUmryeiTY0yE/LsUea9wJ9zmxbyY6+ipXG
	S9JIWREkKGy1yquwIWiHCNWQ/pdsjbliJ/By4q10=
Content-Type: multipart/mixed; boundary="===============1341540209352859155=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tiff: upgrading to 4.7.0 FAILED
Message-ID: <01010192901b84b3-2c72cace-ec85-4bef-a133-ffe5fdebe571-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205901

--===============1341540209352859155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tiff* to *4.7.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe tiff failed.
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
workspace            = "tmp-auh-upgrades:54a9a2d2889c08a8fd9bd5c2f10257324b46e5e9"

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
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:54a9a2d2889c08a8fd9bd5c2f10257324b46e5e9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-dmvz59l2: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-1txahf6y/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-1txahf6y/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  18% |######                              | ETA:  0:00:00
Adding changed files:  37% |#############                       | ETA:  0:00:00
Adding changed files:  56% |####################                | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://download.osgeo.org/libtiff/tiff-4.7.0.tar.gz...
INFO: Rebasing devtool onto f001b904febadc7c74ae3632328bb107cc7f6f31
WARNING: Command 'git rebase f001b904febadc7c74ae3632328bb107cc7f6f31' failed:
Auto-merging libtiff/tif_dirread.c
CONFLICT (content): Merge conflict in libtiff/tif_dirread.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/tiff
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/tiff/tiff_4.7.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1341540209352859155==--

