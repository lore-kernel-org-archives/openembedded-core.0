Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38777C54F32
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:22 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1295.1721071145672230312
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZKDVPLoM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=N0/EMyf6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010190b7d5902c-54fee28d-43e6-479c-af18-a73b3f1388ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ssVJH7sf8G2YO/1bGRK4C7MK5QPHcdar0uBtOxy4Bsc=;
	b=ZKDVPLoMRVXtjkWFssWe9uMP4nDR3wi4HUBwYFIkNW/lOdYhHaqOCNU6VoP65gsn
	XR8rvoPPrnt/II4cVV0/5HYSXx40AZEik1KnPJW287Ha/A3UWEVPF3AwaliCibl4b1n
	YimESVR1zpHTFnz6RLa4mW65CmG6TBF0OLmPjrpM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ssVJH7sf8G2YO/1bGRK4C7MK5QPHcdar0uBtOxy4Bsc=;
	b=N0/EMyf6xEOo2bNzVEx0tLC3mywb13dU6GI9juPI/9+pi6opr33F+OAFmfoNbt0u
	p+Fv8X21KayeleMfEwYR7dSTuSFJxf1e0mj3TYNFuNZ63Ytew5vrbLZJ7xwAw/tKr0N
	TcRkMwp6tbux1qBovhxDbEZhNW5QSWumm7lKCSzU=
Content-Type: multipart/mixed; boundary="===============6229103777972962605=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.80.4 FAILED
Message-ID: <01010190b7d5902c-54fee28d-43e6-479c-af18-a73b3f1388ae-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201948

--===============6229103777972962605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.80.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glib-2.0 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-8fa8ab0546b306f64b951a87474817aab7b8bcd0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8fa8ab0546b306f64b951a87474817aab7b8bcd0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (917 cached, 2 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-8fa8ab0546b306f64b951a87474817aab7b8bcd0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8fa8ab0546b306f64b951a87474817aab7b8bcd0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-xq0sqgrk: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-672otr_p/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-672otr_p/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//glib/2.80/glib-2.80.4.tar.xz...
INFO: Rebasing devtool onto 4ed9f3b5af32f74b6f87902c00b2115052ad273d
WARNING: Command 'git rebase 4ed9f3b5af32f74b6f87902c00b2115052ad273d' failed:
Auto-merging girepository/introspection/meson.build
CONFLICT (content): Merge conflict in girepository/introspection/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 4ed9f3b5af32f74b6f87902c00b2115052ad273d
WARNING: Command 'git rebase 4ed9f3b5af32f74b6f87902c00b2115052ad273d' failed:
Auto-merging girepository/introspection/meson.build
CONFLICT (content): Merge conflict in girepository/introspection/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/glib-2.0
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/glib-2.0/glib-2.0_2.80.4.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6229103777972962605==--

