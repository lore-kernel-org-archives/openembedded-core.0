Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AC2C0218C
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:36 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.11493.1735723943981176494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NxkG9h42;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=V8JIk9X0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019421359fa6-d2afb767-444f-4896-8132-9cc28429339d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723950;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M+jsgXo8oN8Y1OXwVbEzlbqxlTVw8Afcz9qdyHFsrb8=;
	b=NxkG9h42JvfC/leUjzZz1i0/WrsOPo0Zo4e127ml99x1syVbpJzgVUXWxyr452i6
	zxM2Qojl33DDEfGp1bMxD0i3I69bZ004AnY1nc1L3Fl76bnpEhFzTk4oAoLPGY1hTrJ
	d1rwpBueQzIxDkG4mJTMStay2r1GbLF9c0vG6C9Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723950;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M+jsgXo8oN8Y1OXwVbEzlbqxlTVw8Afcz9qdyHFsrb8=;
	b=V8JIk9X0DApXibOd9opqrmt+rtXrx54D/eWMo04CA/r0ps1YOdE0JX1eFuYGG3YA
	klw0hE/YcRCmORkpUpYygCuKj/ctB9003P0qmU5fwyFlR/2Hcd4qExcp8bwcqTi7lGh
	AvIjo/4KOoW03yobw7aA7yY8KiVf/OYIaUxn/ki8=
Content-Type: multipart/mixed; boundary="===============0973824328693214573=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bc: upgrading to 1.08.0 FAILED
Message-ID: <0101019421359fa6-d2afb767-444f-4896-8132-9cc28429339d-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209226

--===============0973824328693214573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bc* to *1.08.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe bc failed.
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
workspace            = "tmp-auh-upgrades:934d021b8a654a550f27d1ffb35aed14373d41c4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
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
workspace            = "tmp-auh-upgrades:934d021b8a654a550f27d1ffb35aed14373d41c4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-3y313fjh: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-tnplfnnf/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-tnplfnnf/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnu.org/gnu/bc/bc-1.08.0.tar.gz...
INFO: Rebasing devtool onto 16cd7ddd0933c137d927eb728dd5407aaf4bd80e
WARNING: Command 'git rebase 16cd7ddd0933c137d927eb728dd5407aaf4bd80e' failed:
Auto-merging bc/Makefile.am
CONFLICT (content): Merge conflict in bc/Makefile.am

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/bc
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/bc/bc_1.08.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0973824328693214573==--

