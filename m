Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFDECD37AE
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11342.1725172853009782029
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IL3uRpXw;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=X0N7LWa5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010191ac50a48d-723b4bc7-da20-4ac0-9241-cba63fa8318d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZWNeiBHMS0mNo9LI/HsR5S2TJ7UdMF579ZDVLYoUZIM=;
	b=IL3uRpXwzqj7YVbPygRBsKe2qA75+wsRYwsa/AlNEEoC/uz2ENn/lywmg1e8kul+
	PIYCCKjwnz2chz/c5Av1scAMbdG2h4VwehrtocRfyr3mFGdhNBsjxyziAr05yLfis6F
	+sJ7kZdL6FQxvfb5aRkybB6z/5xoCIWp+Rd3K/d0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZWNeiBHMS0mNo9LI/HsR5S2TJ7UdMF579ZDVLYoUZIM=;
	b=X0N7LWa5smidBHNQrf9SOQPwG5hAWxQxCLJAo65FiAQS8EDEQNb+oE4dzR784T3Z
	RBhSTOL/5yNCJIJzxCRXTorst/kNap4Dq5jpLQkp3b2WndOROYgnLLKTn2TxEj02QmI
	+LBTwu6spRuJ1zA0whX0iNPhgZyoRZEq+9WK0f6I=
Content-Type: multipart/mixed; boundary="===============8451213342358718777=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0,glib-2.0-initial: upgrading to 2.82.0,2.82.0 FAILED
Message-ID: <01010191ac50a48d-723b4bc7-da20-4ac0-9241-cba63fa8318d-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203999

--===============8451213342358718777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0,glib-2.0-initial* to *2.82.0,2.82.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glib-2.0 failed.
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-5f380586305a74b8e2f5cecb57ae252e38b84bdc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5f380586305a74b8e2f5cecb57ae252e38b84bdc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1868 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-5f380586305a74b8e2f5cecb57ae252e38b84bdc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5f380586305a74b8e2f5cecb57ae252e38b84bdc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-jdz5obnh: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-_8p2apoa/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-_8p2apoa/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  26% |#########                           | ETA:  0:00:00
Adding changed files:  52% |##################                  | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /home/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//glib/2.82/glib-2.82.0.tar.xz...
INFO: Rebasing devtool onto 1d99ab189baaf8f50b688a46c9864cd9cc1a41d5
WARNING: Command 'git rebase 1d99ab189baaf8f50b688a46c9864cd9cc1a41d5' failed:
Auto-merging gio/gdbus-2.0/codegen/gdbus-codegen.in
CONFLICT (content): Merge conflict in gio/gdbus-2.0/codegen/gdbus-codegen.in
Auto-merging gobject/glib-genmarshal.in
CONFLICT (content): Merge conflict in gobject/glib-genmarshal.in
Auto-merging gobject/glib-mkenums.in
CONFLICT (content): Merge conflict in gobject/glib-mkenums.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 1d99ab189baaf8f50b688a46c9864cd9cc1a41d5
WARNING: Command 'git rebase 1d99ab189baaf8f50b688a46c9864cd9cc1a41d5' failed:
Auto-merging gio/gdbus-2.0/codegen/gdbus-codegen.in
CONFLICT (content): Merge conflict in gio/gdbus-2.0/codegen/gdbus-codegen.in
Auto-merging gobject/glib-genmarshal.in
CONFLICT (content): Merge conflict in gobject/glib-genmarshal.in
Auto-merging gobject/glib-mkenums.in
CONFLICT (content): Merge conflict in gobject/glib-mkenums.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/glib-2.0
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/glib-2.0/glib-2.0_2.82.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8451213342358718777==--

