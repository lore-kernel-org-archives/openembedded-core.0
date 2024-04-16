Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4E8C3065D
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.13420.1713248036838917521
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KK4fmwRF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=aA55a7cK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018ee58a6719-75a7a083-7042-447a-afb0-ad652c7ddc29-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DRbz66kPrfL5Ly0d9/1BbmnVt2tua6+jIje5kqVIcOo=;
	b=KK4fmwRFYv08LymOCnTA3lKFXN++ejc7BfkzA6j3xAo1cVl5IPSeYmXfaNjqMgza
	QKe7bxEtoXnjWqaJSwcnQzjiYzOWkdry2Lyp9ZEqauiuDd1t+Sh2zemr7XdU6MvBRXP
	N4WpK8yLZdkmrQHNMqTPzQb4WN+F1D6+pLQqn/Jc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248036;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DRbz66kPrfL5Ly0d9/1BbmnVt2tua6+jIje5kqVIcOo=;
	b=aA55a7cKRVbGY/LmO4RdC7LTsZ/H5z/zyZrsdcNK61WeNvrC0nHPltiAXs7Klhm0
	rRIQ2ppS+aDjCV/9tQ3PYgMPBFPGRswpx/bGhugaGosSmyjF4lNUu4vUS3nHU7n4wPI
	+pK1MpbdkAVoiWinVXZwKXwamEod5LKqRfBCYXg4=
Content-Type: multipart/mixed; boundary="===============7503907674920969759=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.80.0 FAILED
Message-ID: <0101018ee58a6719-75a7a083-7042-447a-afb0-ad652c7ddc29-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198253

--===============7503907674920969759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.80.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glib-2.0 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-ca50bfd0124bee497d188d96a3fbfb0c2c4574d3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ca50bfd0124bee497d188d96a3fbfb0c2c4574d3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1878 entries from dependency cache.
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
DISTRO_VERSION       = "4.3+snapshot-ca50bfd0124bee497d188d96a3fbfb0c2c4574d3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ca50bfd0124bee497d188d96a3fbfb0c2c4574d3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  10% |###                                 | ETA:  0:00:01
Adding changed files:  21% |#######                             | ETA:  0:00:00
Adding changed files:  32% |###########                         | ETA:  0:00:00
Adding changed files:  42% |###############                     | ETA:  0:00:00
Adding changed files:  53% |###################                 | ETA:  0:00:00
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//glib/2.80/glib-2.80.0.tar.xz...
INFO: Rebasing devtool onto 72f8ac6c90ba42aa52eb9287e9acb1dfdc605b73
WARNING: Command 'git rebase 72f8ac6c90ba42aa52eb9287e9acb1dfdc605b73' failed:
Auto-merging gio/meson.build
Auto-merging glib/meson.build
CONFLICT (content): Merge conflict in glib/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 72f8ac6c90ba42aa52eb9287e9acb1dfdc605b73
WARNING: Command 'git rebase 72f8ac6c90ba42aa52eb9287e9acb1dfdc605b73' failed:
Auto-merging gio/meson.build
Auto-merging glib/meson.build
CONFLICT (content): Merge conflict in glib/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/glib-2.0
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/glib-2.0/glib-2.0_2.80.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7503907674920969759==--

