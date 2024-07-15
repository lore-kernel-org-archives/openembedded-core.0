Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B91C531DE
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:15 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1356.1721071145260986075
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=D5TpiC7C;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=gOG+VihI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010190b7d58e3b-7e698678-dcec-45f7-aaed-8013896c8fc0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071144;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=i/7+f9YTYNeGnKnvBWxBP2QVE9vq2J2ooEmeoPv3HgU=;
	b=D5TpiC7CUjidPcDn2n0+Be66u4gN+B3IPlvqV9pxcjghKl3xExEDBfwfFUW72/kx
	DRPglRZNiVE2504QDEpad6YF3dT8qE4+iib/v5UHEm5IiK8u9tRqWd21eBbA+bPpkvG
	BX8Pd42oeoSAOP6kKSxgSeV8XtsQajdPsCy5ktbg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071144;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=i/7+f9YTYNeGnKnvBWxBP2QVE9vq2J2ooEmeoPv3HgU=;
	b=gOG+VihIyoiK20uv+F0W+HQuoVqRqje7+BVXy2+0lPFKMtbGvEd/zpohMtQpFoR6
	7M8v0eNx4lWxPZCTm0hTSU4wCfkyb3VsNCR8osZv5teDiK4lj2VeLEd13TnsRBljtlg
	Mhkrqkr1K72ajZol0w5ed0rNdFo6CfJCkrw28vzk=
Content-Type: multipart/mixed; boundary="===============1779635801096979478=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] openssh: upgrading to 9.8p1 FAILED
Message-ID: <01010190b7d58e3b-7e698678-dcec-45f7-aaed-8013896c8fc0-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201946

--===============1779635801096979478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openssh* to *9.8p1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe openssh failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ca595e6d25cf55d12cfaf701716169284e857387"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ca595e6d25cf55d12cfaf701716169284e857387"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1878 entries from dependency cache.
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
DISTRO_VERSION       = "5.0+snapshot-ca595e6d25cf55d12cfaf701716169284e857387"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ca595e6d25cf55d12cfaf701716169284e857387"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-mlm9a9oi: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-lwidtx6r/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-lwidtx6r/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.8p1.tar.gz...
INFO: Rebasing devtool onto 38c75a57b77c8c9f42da12d6fa6802c24b87e41e
WARNING: Command 'git rebase 38c75a57b77c8c9f42da12d6fa6802c24b87e41e' failed:
Auto-merging log.c
CONFLICT (content): Merge conflict in log.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/openssh
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/openssh/openssh_9.8p1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1779635801096979478==--

