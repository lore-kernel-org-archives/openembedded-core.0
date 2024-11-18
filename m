Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC327D60CE5
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:14 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4897.1731964685176656762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YwZLH2XK;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=hn6BC6hd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101934123d430-96f9a6f0-6818-4e89-bc45-69f448a02025-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vuy1RJmPOgwChakEb72835be0YShIVTqzD1+dq1Chew=;
	b=YwZLH2XKmE23x5KN94h0gAvCNHUNOl65srd5RKYZO/jml5LFQKImq2fRJe7kGKx/
	IqRJL8GvX9iitmPpQlors3NrfZMIiDPAnBXT97Qk5wg8iw3CNLTTSIECT8yMa5mEUA1
	mTBdnGdnrDKfAx7TkYMJqwBAQNXHO5fOW2C8kGZw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vuy1RJmPOgwChakEb72835be0YShIVTqzD1+dq1Chew=;
	b=hn6BC6hdqIacviwqBBqQe36kjXa3czj1zjADPLJSTiNd4MAQ+v/Q0Xq+Bcd14qu8
	K8W1c2uwOSuvNxN6lny17y8PneiTmCwiv52cgaMkM9lfNb4Sw687ByHTSdKijN2wUt1
	GTuMLqqJ9NL2fuQqnvwgveYWMfLVug7i5viQN1RQ=
Content-Type: multipart/mixed; boundary="===============5444438502249267992=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Enet=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnutls: upgrading to 3.8.8 FAILED
Message-ID: <010101934123d430-96f9a6f0-6818-4e89-bc45-69f448a02025-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:18:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207360

--===============5444438502249267992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnutls* to *3.8.8* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gnutls failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:86ac1ed33b4932b090285f725d45b4b2eac8259f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
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
workspace            = "tmp-auh-upgrades:86ac1ed33b4932b090285f725d45b4b2eac8259f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-kayst9lv: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-7cy5frka/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-7cy5frka/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   7% |##                                  | ETA:  0:00:27
Adding changed files:  14% |#####                               | ETA:  0:00:15
Adding changed files:  21% |#######                             | ETA:  0:00:11
Adding changed files:  29% |##########                          | ETA:  0:00:08
Adding changed files:  36% |#############                       | ETA:  0:00:07
Adding changed files:  43% |###############                     | ETA:  0:00:05
Adding changed files:  51% |##################                  | ETA:  0:00:04
Adding changed files:  58% |#####################               | ETA:  0:00:03
Adding changed files:  65% |#######################             | ETA:  0:00:03
Adding changed files:  73% |##########################          | ETA:  0:00:02
Adding changed files:  80% |#############################       | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:08
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.8.tar.xz...
INFO: Rebasing devtool onto 8247736afd693040af3d6b86ffeb4eee57a239dd
WARNING: Command 'git rebase 8247736afd693040af3d6b86ffeb4eee57a239dd' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Source subdirectory has changed, dropping S value since it now matches the default ("${WORKDIR}/${BP}")
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/gnutls
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gnutls/gnutls_3.8.8.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5444438502249267992==--

