Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44334D591CF
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:49 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.4643.1731964601777918275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MutvfA3k;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qNOIfgsE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010193412297a0-bd85f366-2a59-4c5c-ac4c-dd1f7a414812-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964606;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MAjC9o24XpcQlg3c/fesBNyzue3WRvB8/RY2zdTss+8=;
	b=MutvfA3kFuZ8yr7Uzx0b7FCRqrghFqB6VscmvDxTXS1UnN/eEgOqz4cQ+ApCLZeV
	SOw22D5bGX1A6v3BBqQYUgdUUJdx4tTrb0wdqYc1HGQd5AK1ndM/PHJjZZb4Mi0UN3J
	S1cVjn6QTXTf+yTMlGCJkRqI9+oNDz5CJfwmJ88I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964606;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MAjC9o24XpcQlg3c/fesBNyzue3WRvB8/RY2zdTss+8=;
	b=qNOIfgsE8QL5x9oN9isgdBEAhWG+p6HkYj/iTwa+8urkwFlib0boRiJV5BadOyiI
	H00I9rYMz9upWLdXRslkbwUVJopMJ3bNm8edKqoP64rcJXoChifCirHHElsnMZsMP6b
	9QBe7a5/2d1zigDhBbMs9ftcKuB2GT/x8h/nOAHw=
Content-Type: multipart/mixed; boundary="===============2754539334456236124=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] openssl: upgrading to 3.4.0 FAILED
Message-ID: <01010193412297a0-bd85f366-2a59-4c5c-ac4c-dd1f7a414812-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207243

--===============2754539334456236124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssl* to *3.4.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe openssl failed.
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
workspace            = "tmp-auh-upgrades:009761af5440249db725a0e6593a7731a845460f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds
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
workspace            = "tmp-auh-upgrades:009761af5440249db725a0e6593a7731a845460f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-dg42qzdg: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-xmxz8o36/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-xmxz8o36/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   9% |###                                 | ETA:  0:00:11
Adding changed files:  19% |#######                             | ETA:  0:00:08
Adding changed files:  29% |##########                          | ETA:  0:00:06
Adding changed files:  39% |##############                      | ETA:  0:00:05
Adding changed files:  49% |#################                   | ETA:  0:00:04
Adding changed files:  59% |#####################               | ETA:  0:00:03
Adding changed files:  69% |########################            | ETA:  0:00:02
Adding changed files:  79% |############################        | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:08
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching http://www.openssl.org/source/openssl-3.4.0.tar.gz...
INFO: Rebasing devtool onto 181d242169d462e51651cad5092d990d488d3fe0
WARNING: Command 'git rebase 181d242169d462e51651cad5092d990d488d3fe0' failed:
Auto-merging test/helpers/handshake.c
CONFLICT (content): Merge conflict in test/helpers/handshake.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto 181d242169d462e51651cad5092d990d488d3fe0
WARNING: Command 'git rebase 181d242169d462e51651cad5092d990d488d3fe0' failed:
Auto-merging test/helpers/handshake.c
CONFLICT (content): Merge conflict in test/helpers/handshake.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/openssl
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/openssl/openssl_3.4.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2754539334456236124==--

