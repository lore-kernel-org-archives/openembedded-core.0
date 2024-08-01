Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9476CC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:09 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.75476.1722536821526752777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bNrYcxMR;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Q0hSKQ4x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101910f31ff92-4549302c-5afb-45dc-b761-b939850f78ac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Jd5mQR4+PWkEH8uXXLJeDHwiDs7GHmAiO2SUrj68D8M=;
	b=bNrYcxMRSVepCsE9o7zuOaCGsG8XGYSusahHidEZywYeV6ccQEsHB+jOMiywohBU
	435Y9A4TkYBNdQSlNps7Xmt0F1iQFq+PnjZfRqYreYxQk+kXbsNKN4gWgCBH2HxHuZG
	JwQwxVL735Ja4moSFG6gYYgmv/wiCJGh13kFpY4w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Jd5mQR4+PWkEH8uXXLJeDHwiDs7GHmAiO2SUrj68D8M=;
	b=Q0hSKQ4xObC2Rkt8zORM/NEPUecOI9YcDZ1/VjsCWImcDdYYIWnMO0IOqE3uINtR
	+UPuCarx9FXjw3Rwu0NL6WB4+r8+yUiGUZpAWNjfikK0s2v/VYjP+1KTQ/RnKKaJ0HV
	Ct53c7jfwioXJcEh1Ap8GMyxR2mYdFQK/CfMXi90=
Content-Type: multipart/mixed; boundary="===============2951515615232666115=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0,glib-2.0-initial: upgrading to 2.80.4,2.80.4 FAILED
Message-ID: <010101910f31ff92-4549302c-5afb-45dc-b761-b939850f78ac-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202763

--===============2951515615232666115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0,glib-2.0-initial* to *2.80.4,2.80.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glib-2.0 failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1883 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-fd8dc3a2f320f5b8335202ba9f366ed93bf53dd5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fd8dc3a2f320f5b8335202ba9f366ed93bf53dd5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1883 entries from dependency cache.
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
DISTRO_VERSION       = "5.0+snapshot-fd8dc3a2f320f5b8335202ba9f366ed93bf53dd5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fd8dc3a2f320f5b8335202ba9f366ed93bf53dd5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-xax69rnw: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-__8m3zh6/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-__8m3zh6/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /home/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//glib/2.80/glib-2.80.4.tar.xz...
INFO: Rebasing devtool onto 92a713fd8c66a8faedd0eb3d7d529d7e5263bd38
WARNING: Command 'git rebase 92a713fd8c66a8faedd0eb3d7d529d7e5263bd38' failed:
Auto-merging girepository/introspection/meson.build
CONFLICT (content): Merge conflict in girepository/introspection/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 92a713fd8c66a8faedd0eb3d7d529d7e5263bd38
WARNING: Command 'git rebase 92a713fd8c66a8faedd0eb3d7d529d7e5263bd38' failed:
Auto-merging girepository/introspection/meson.build
CONFLICT (content): Merge conflict in girepository/introspection/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/glib-2.0
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/glib-2.0/glib-2.0_2.80.4.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2951515615232666115==--

