Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0497AE7717F
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.33376.1734254975806365801
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IYqglcxA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fotx5OQ+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010193c9a6d79c-24f968ea-0acc-4b91-856c-2a3ddc4fc30a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JEAXNaiPoCxKwAxo78smM+dpYwj6eCqcpSceN3KLRKI=;
	b=IYqglcxAuUXAEHkrpZXoAfhxb3e4gp+22V8h+EZ7yfD4NpoZXjyVFVZAEZbePCMN
	b/GKUlwDTwkCgogcsQ8SkuMQIOuWYh3a3kshHvmkrSl0yYcE3l/IsLLG25TL3qPFkeo
	Xf5Cseh1eGC/GMg6KaK61CE9HvUSa3E61Sas+KwU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JEAXNaiPoCxKwAxo78smM+dpYwj6eCqcpSceN3KLRKI=;
	b=fotx5OQ+091YzVvMp8zc1jCUOktY9Pbzvt8qfD8rXlOzceqbFnz3Fq1mt6PL4LJY
	UQihm+5IKXVN0YBNBNjzfdXpucebMB+nQDHaHm8qdWtWNXXd/dWbV1/EBlUdWwHFPsm
	akM/GTnmy/94PZFHUriQOKDhzrb3U9hfsNxLaZuw=
Content-Type: multipart/mixed; boundary="===============3899096408531670250=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0,glib-2.0-initial: upgrading to 2.82.4,2.82.4 FAILED
Message-ID: <01010193c9a6d79c-24f968ea-0acc-4b91-856c-2a3ddc4fc30a-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208700

--===============3899096408531670250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0,glib-2.0-initial* to *2.82.4,2.82.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glib-2.0 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:cc5e3503e4437358efa8c5675e02f5e19430c58f"

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
workspace            = "tmp-auh-upgrades:cc5e3503e4437358efa8c5675e02f5e19430c58f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-rrovbv9y: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-57q6196u/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-57q6196u/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
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
INFO: Fetching https://download.gnome.org/sources//glib/2.82/glib-2.82.4.tar.xz...
INFO: Rebasing devtool onto 61abd0d370fa97e2a3abbd1d21441743b2808581
WARNING: Command 'git rebase 61abd0d370fa97e2a3abbd1d21441743b2808581' failed:
Auto-merging glib/tests/gdatetime.c
CONFLICT (content): Merge conflict in glib/tests/gdatetime.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 61abd0d370fa97e2a3abbd1d21441743b2808581
WARNING: Command 'git rebase 61abd0d370fa97e2a3abbd1d21441743b2808581' failed:
Auto-merging glib/tests/gdatetime.c
CONFLICT (content): Merge conflict in glib/tests/gdatetime.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/glib-2.0
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/glib-2.0/glib-2.0_2.82.4.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3899096408531670250==--

