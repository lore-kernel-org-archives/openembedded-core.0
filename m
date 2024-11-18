Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95ADD6204F
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4679.1731964633083259581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZXdYC5Ja;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=OyJi6e2k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101934123bfbd-f1aeb56d-56b1-446a-bef0-955c01911d4b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964682;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rufGfpc3wPcotGeqYi7zuQKAl9mXSXXje9FSo2Q9Uy8=;
	b=ZXdYC5JaimzEwE/NxYQzoe6R4YnuPWcFHlFXtY75uD1OuFWi+JnrDKZdw7SNx1wr
	rx9RL3tXxOiljaE5bZfW4VRpNFOTO1B/VlvgOOKJtelkST9oNiaoN0Y+1Mpcu40CLxy
	gKJ8SNnThNlL++pYhIVbcCV6J32ZYsnRVt/o5AwM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964682;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rufGfpc3wPcotGeqYi7zuQKAl9mXSXXje9FSo2Q9Uy8=;
	b=OyJi6e2kxaqHTdkF8a0699NInPWBFrIsqiiucXfBZVbx/4v9cMzgltUX/wS3UO66
	Tw4YWUL+ExsD6cfPLzgE6UkGC0VdcU8Skrpzg9EzBePaZh1cfKj6dQYr1yIVhKu9Alk
	7AmOlIiSc/c0N1lzTJtfMKWh5KmZeBnbuB5UWsPs=
Content-Type: multipart/mixed; boundary="===============3444061809142248946=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tiff: upgrading to 4.7.0 FAILED
Message-ID: <010101934123bfbd-f1aeb56d-56b1-446a-bef0-955c01911d4b-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:18:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207352

--===============3444061809142248946==
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
Loaded 1880 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:493b8cf8c2b7b96b74ca2cefc3e21e813ad2878e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1881 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:493b8cf8c2b7b96b74ca2cefc3e21e813ad2878e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-7prjsax8: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-2dlpor2z/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-2dlpor2z/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  18% |######                              | ETA:  0:00:04
Adding changed files:  37% |#############                       | ETA:  0:00:02
Adding changed files:  56% |####################                | ETA:  0:00:01
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:03
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://download.osgeo.org/libtiff/tiff-4.7.0.tar.gz...
INFO: Rebasing devtool onto bedbabd05aae9c39bd6b94bf0bc8dbde7966cd30
WARNING: Command 'git rebase bedbabd05aae9c39bd6b94bf0bc8dbde7966cd30' failed:
Auto-merging libtiff/tif_dirread.c
CONFLICT (content): Merge conflict in libtiff/tif_dirread.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/tiff
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/tiff/tiff_4.7.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3444061809142248946==--

