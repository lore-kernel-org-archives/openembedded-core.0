Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5C2C27C5A
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:15:01 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.22318.1701436491395937555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eGBKT9H3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TE9bOvlZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018c2584837c-4f4f39ca-e171-4897-8138-445071f02622-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PrUrtSXUtezSLIAXQJGXW+CPx5ib62IO57YR/+v0m/g=;
	b=eGBKT9H3/JoekdzNzi14iXOuvZ9wHlwA/bZ/Yakh9S9eNkcTtX6RSWwtsg4lkbWh
	mn96N01Qi6tYX6OSGDDG7eabLPZavENafAHij6Athjs0lqx1mUAsOMd5vT+GTgS7nc5
	Cdf4qaaVsQU+7kxBpyv9TwQaa5eEqXBP8Ww4K55o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PrUrtSXUtezSLIAXQJGXW+CPx5ib62IO57YR/+v0m/g=;
	b=TE9bOvlZKADC4q27+vG6sRFuG6oqYuQXcOpU3p/xiMvCGRgkLmBDOIgOzXtmoasU
	FMxXpbmT6cDXFpxSduWBy+bFKLtbhB/AoWF+/SwNlrVrrx7oFgfKPMKvI+f6sYudy3a
	CpY6+ODo0UdjLMEIRQUulnxDZY19CTExRd0DMswk=
Content-Type: multipart/mixed; boundary="===============3736888802670325642=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] autoconf: upgrading to 2.72d FAILED
Message-ID: <0101018c2584837c-4f4f39ca-e171-4897-8138-445071f02622-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191590

--===============3736888802670325642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *autoconf* to *2.72d* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade autoconf -V 2.72d
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d335608dc2ef180440d4059636ee60f18a01d4d0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d335608dc2ef180440d4059636ee60f18a01d4d0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 4 Mirrors 0 Missed 6 Current 19 (40% match, 79% complete)
Removing 4 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| NOTE: Unpacking /srv/autobuilder/autobuilder.yocto.io/current_sources/autoconf-2.72c.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for program_prefix.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch for program_prefix.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for autoreconf-exclude.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch for autoreconf-exclude.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for remove-usr-local-lib-from-m4.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch for remove-usr-local-lib-from-m4.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for preferbash.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/preferbash.patch for preferbash.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/preferbash.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for autotest-automake-result-format.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch for autotest-automake-result-format.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for man-host-perl.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch for man-host-perl.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0001-mention-prototypes-more-prominently-in-NEWS.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0001-mention-prototypes-more-prominently-in-NEWS.patch for backports/0001-mention-prototypes-more-prominently-in-NEWS.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0001-mention-prototypes-more-prominently-in-NEWS.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0002-build-run-make-fetch-which-updated-these.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0002-build-run-make-fetch-which-updated-these.patch for backports/0002-build-run-make-fetch-which-updated-these.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0002-build-run-make-fetch-which-updated-these.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0003-NEWS-Tighten-up-wording.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0003-NEWS-Tighten-up-wording.patch for backports/0003-NEWS-Tighten-up-wording.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0003-NEWS-Tighten-up-wording.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch for backports/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0006-Fix-timing-bug-on-high-speed-builds.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0006-Fix-timing-bug-on-high-speed-builds.patch for backports/0006-Fix-timing-bug-on-high-speed-builds.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0006-Fix-timing-bug-on-high-speed-builds.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0007-Support-underquoted-callers-better.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0007-Support-underquoted-callers-better.patch for backports/0007-Support-underquoted-callers-better.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0007-Support-underquoted-callers-better.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0008-New-script-for-building-inside-Guix-containers.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0008-New-script-for-building-inside-Guix-containers.patch for backports/0008-New-script-for-building-inside-Guix-containers.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0008-New-script-for-building-inside-Guix-containers.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0009-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0009-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch for backports/0009-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0009-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0010-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0010-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch for backports/0010-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0010-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0011-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0011-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch for backports/0011-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0011-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0012-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0012-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch for backports/0012-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0012-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0013-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0013-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch for backports/0013-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0013-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0014-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0014-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch for backports/0014-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0014-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0015-Support-circa-early-2022-Gnulib.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0015-Support-circa-early-2022-Gnulib.patch for backports/0015-Support-circa-early-2022-Gnulib.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0015-Support-circa-early-2022-Gnulib.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0016-Improve-year2038-largefile-option-processing.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0016-Improve-year2038-largefile-option-processing.patch for backports/0016-Improve-year2038-largefile-option-processing.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0016-Improve-year2038-largefile-option-processing.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0017-AC_SYS_YEAR2038-Fix-configure-failure-on-32-bit-ming.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0017-AC_SYS_YEAR2038-Fix-configure-failure-on-32-bit-ming.patch for backports/0017-AC_SYS_YEAR2038-Fix-configure-failure-on-32-bit-ming.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0017-AC_SYS_YEAR2038-Fix-configure-failure-on-32-bit-ming.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0018-Document-limitation-of-BusyBox-tr.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0018-Document-limitation-of-BusyBox-tr.patch for backports/0018-Document-limitation-of-BusyBox-tr.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0018-Document-limitation-of-BusyBox-tr.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0019-AC_SYS_YEAR2038_REQUIRED-Fix-configure-failure-with-.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0019-AC_SYS_YEAR2038_REQUIRED-Fix-configure-failure-with-.patch for backports/0019-AC_SYS_YEAR2038_REQUIRED-Fix-configure-failure-with-.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0019-AC_SYS_YEAR2038_REQUIRED-Fix-configure-failure-with-.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0020-Tone-down-year-2038-changes.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0020-Tone-down-year-2038-changes.patch for backports/0020-Tone-down-year-2038-changes.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0020-Tone-down-year-2038-changes.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0021-Port-AC_FUNC_MMAP-to-more-modern-systems.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0021-Port-AC_FUNC_MMAP-to-more-modern-systems.patch for backports/0021-Port-AC_FUNC_MMAP-to-more-modern-systems.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0021-Port-AC_FUNC_MMAP-to-more-modern-systems.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0022-Fix-port-of-AC_FUNC_MMAP.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0022-Fix-port-of-AC_FUNC_MMAP.patch for backports/0022-Fix-port-of-AC_FUNC_MMAP.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0022-Fix-port-of-AC_FUNC_MMAP.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0023-Improve-AC_SYS_YEAR2038_RECOMMENDED-diagnostic.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0023-Improve-AC_SYS_YEAR2038_RECOMMENDED-diagnostic.patch for backports/0023-Improve-AC_SYS_YEAR2038_RECOMMENDED-diagnostic.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0023-Improve-AC_SYS_YEAR2038_RECOMMENDED-diagnostic.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0024-Improve-AC_FUNC_MMAP-comments.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0024-Improve-AC_FUNC_MMAP-comments.patch for backports/0024-Improve-AC_FUNC_MMAP-comments.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0024-Improve-AC_FUNC_MMAP-comments.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0025-Fix-AC_SYS_LARGEFILE-on-GNU-Linux-alpha-s390x.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0025-Fix-AC_SYS_LARGEFILE-on-GNU-Linux-alpha-s390x.patch for backports/0025-Fix-AC_SYS_LARGEFILE-on-GNU-Linux-alpha-s390x.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0025-Fix-AC_SYS_LARGEFILE-on-GNU-Linux-alpha-s390x.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0026-Modernize-INSTALL.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0026-Modernize-INSTALL.patch for backports/0026-Modernize-INSTALL.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0026-Modernize-INSTALL.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0027-doc-fix-broken-cross-refs.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0027-doc-fix-broken-cross-refs.patch for backports/0027-doc-fix-broken-cross-refs.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0027-doc-fix-broken-cross-refs.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0028-INSTALL-Clarify-build-host-target-and-the-system-typ.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0028-INSTALL-Clarify-build-host-target-and-the-system-typ.patch for backports/0028-INSTALL-Clarify-build-host-target-and-the-system-typ.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0028-INSTALL-Clarify-build-host-target-and-the-system-typ.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0029-Shorten-and-improve-INSTALL.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0029-Shorten-and-improve-INSTALL.patch for backports/0029-Shorten-and-improve-INSTALL.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0029-Shorten-and-improve-INSTALL.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for no-man.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/no-man.patch for no-man.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/no-man.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| DEBUG: Executing python function create_source_date_epoch_stamp
| DEBUG: Newest file found: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/autoconf-2.72c/ChangeLog
| DEBUG: SOURCE_DATE_EPOCH: 1679929224
| DEBUG: Python function create_source_date_epoch_stamp finished
| DEBUG: Executing python function do_qa_unpack
| DEBUG: Python function do_qa_unpack finished
| DEBUG: Executing python function devtool_post_unpack
| DEBUG: Python function devtool_post_unpack finished
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| NOTE: Unpacking /srv/autobuilder/autobuilder.yocto.io/current_sources/autoconf-2.72c.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for program_prefix.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch for program_prefix.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for autoreconf-exclude.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch for autoreconf-exclude.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for remove-usr-local-lib-from-m4.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch for remove-usr-local-lib-from-m4.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for preferbash.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/preferbash.patch for preferbash.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/preferbash.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for autotest-automake-result-format.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch for autotest-automake-result-format.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for man-host-perl.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch for man-host-perl.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/man-host-perl.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0001-mention-prototypes-more-prominently-in-NEWS.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0001-mention-prototypes-more-prominently-in-NEWS.patch for backports/0001-mention-prototypes-more-prominently-in-NEWS.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0001-mention-prototypes-more-prominently-in-NEWS.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0002-build-run-make-fetch-which-updated-these.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0002-build-run-make-fetch-which-updated-these.patch for backports/0002-build-run-make-fetch-which-updated-these.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0002-build-run-make-fetch-which-updated-these.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0003-NEWS-Tighten-up-wording.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0003-NEWS-Tighten-up-wording.patch for backports/0003-NEWS-Tighten-up-wording.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0003-NEWS-Tighten-up-wording.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch for backports/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0006-Fix-timing-bug-on-high-speed-builds.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0006-Fix-timing-bug-on-high-speed-builds.patch for backports/0006-Fix-timing-bug-on-high-speed-builds.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0006-Fix-timing-bug-on-high-speed-builds.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0007-Support-underquoted-callers-better.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0007-Support-underquoted-callers-better.patch for backports/0007-Support-underquoted-callers-better.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0007-Support-underquoted-callers-better.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0008-New-script-for-building-inside-Guix-containers.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0008-New-script-for-building-inside-Guix-containers.patch for backports/0008-New-script-for-building-inside-Guix-containers.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0008-New-script-for-building-inside-Guix-containers.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0009-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0009-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch for backports/0009-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0009-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0010-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0010-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch for backports/0010-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0010-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0011-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0011-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch for backports/0011-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0011-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0012-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0012-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch for backports/0012-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0012-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0013-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0013-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch for backports/0013-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0013-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0014-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0014-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch for backports/0014-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0014-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0015-Support-circa-early-2022-Gnulib.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0015-Support-circa-early-2022-Gnulib.patch for backports/0015-Support-circa-early-2022-Gnulib.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0015-Support-circa-early-2022-Gnulib.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0016-Improve-year2038-largefile-option-processing.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0016-Improve-year2038-largefile-option-processing.patch for backports/0016-Improve-year2038-largefile-option-processing.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0016-Improve-year2038-largefile-option-processing.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0017-AC_SYS_YEAR2038-Fix-configure-failure-on-32-bit-ming.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0017-AC_SYS_YEAR2038-Fix-configure-failure-on-32-bit-ming.patch for backports/0017-AC_SYS_YEAR2038-Fix-configure-failure-on-32-bit-ming.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0017-AC_SYS_YEAR2038-Fix-configure-failure-on-32-bit-ming.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0018-Document-limitation-of-BusyBox-tr.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0018-Document-limitation-of-BusyBox-tr.patch for backports/0018-Document-limitation-of-BusyBox-tr.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0018-Document-limitation-of-BusyBox-tr.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0019-AC_SYS_YEAR2038_REQUIRED-Fix-configure-failure-with-.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0019-AC_SYS_YEAR2038_REQUIRED-Fix-configure-failure-with-.patch for backports/0019-AC_SYS_YEAR2038_REQUIRED-Fix-configure-failure-with-.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0019-AC_SYS_YEAR2038_REQUIRED-Fix-configure-failure-with-.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0020-Tone-down-year-2038-changes.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0020-Tone-down-year-2038-changes.patch for backports/0020-Tone-down-year-2038-changes.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0020-Tone-down-year-2038-changes.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0021-Port-AC_FUNC_MMAP-to-more-modern-systems.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0021-Port-AC_FUNC_MMAP-to-more-modern-systems.patch for backports/0021-Port-AC_FUNC_MMAP-to-more-modern-systems.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0021-Port-AC_FUNC_MMAP-to-more-modern-systems.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0022-Fix-port-of-AC_FUNC_MMAP.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0022-Fix-port-of-AC_FUNC_MMAP.patch for backports/0022-Fix-port-of-AC_FUNC_MMAP.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0022-Fix-port-of-AC_FUNC_MMAP.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0023-Improve-AC_SYS_YEAR2038_RECOMMENDED-diagnostic.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0023-Improve-AC_SYS_YEAR2038_RECOMMENDED-diagnostic.patch for backports/0023-Improve-AC_SYS_YEAR2038_RECOMMENDED-diagnostic.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0023-Improve-AC_SYS_YEAR2038_RECOMMENDED-diagnostic.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0024-Improve-AC_FUNC_MMAP-comments.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0024-Improve-AC_FUNC_MMAP-comments.patch for backports/0024-Improve-AC_FUNC_MMAP-comments.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0024-Improve-AC_FUNC_MMAP-comments.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0025-Fix-AC_SYS_LARGEFILE-on-GNU-Linux-alpha-s390x.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0025-Fix-AC_SYS_LARGEFILE-on-GNU-Linux-alpha-s390x.patch for backports/0025-Fix-AC_SYS_LARGEFILE-on-GNU-Linux-alpha-s390x.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0025-Fix-AC_SYS_LARGEFILE-on-GNU-Linux-alpha-s390x.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0026-Modernize-INSTALL.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0026-Modernize-INSTALL.patch for backports/0026-Modernize-INSTALL.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0026-Modernize-INSTALL.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0027-doc-fix-broken-cross-refs.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0027-doc-fix-broken-cross-refs.patch for backports/0027-doc-fix-broken-cross-refs.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0027-doc-fix-broken-cross-refs.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0028-INSTALL-Clarify-build-host-target-and-the-system-typ.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0028-INSTALL-Clarify-build-host-target-and-the-system-typ.patch for backports/0028-INSTALL-Clarify-build-host-target-and-the-system-typ.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0028-INSTALL-Clarify-build-host-target-and-the-system-typ.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Searching for backports/0029-Shorten-and-improve-INSTALL.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf-2.72c/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0029-Shorten-and-improve-INSTALL.patch for backports/0029-Shorten-and-improve-INSTALL.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf/backports/0029-Shorten-and-improve-INSTALL.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| DEBUG: Executing python function create_source_date_epoch_stamp
| DEBUG: Newest file found: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/workdir/autoconf-2.72c/ChangeLog
| DEBUG: SOURCE_DATE_EPOCH: 1679929224
| DEBUG: Python function create_source_date_epoch_stamp finished
| DEBUG: Executing python function do_qa_unpack
| DEBUG: Python function do_qa_unpack finished
| DEBUG: Executing python function devtool_post_unpack
| DEBUG: Python function devtool_post_unpack finished
NOTE: Tasks Summary: Attempted 75 tasks of which 70 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201063517.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201063517.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
ERROR: ExecutionError('git tag -f devtool-base', 128, '', "fatal: Failed to resolve 'HEAD' as a valid ref.\n")
ERROR: ExecutionError('git checkout -b devtool-orig', 128, '', "fatal: a branch named 'devtool-orig' already exists\n")
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/temp/log.do_unpack.3990271
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/autoconf/2.72c/devtooltmp-5rqv51od/temp/log.do_unpack.3990277
ERROR: Extracting source for autoconf failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3736888802670325642==--

