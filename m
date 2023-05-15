Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE0ACA9EAF
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.3717.1684186748830754043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UGDb3D8W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010188215a5560-c4952352-db7a-44a4-b1f8-4715c99bb07e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KbVRQrwQQ1ZO4JYQ5gnHZvdbuyw3/7jgnIWniRlXRR0=;
	b=UGDb3D8Wzaf0q0hDBJOT2AISpvOKMWZr+TtoymyfqezlM+wfZ5jrBelPDM8WJOCG
	zY4RI1/JUs6/CLPSyTWxJnfJltbg8NPsrfkpSQHK7az/rxK4lqzrKZtL/GKwc6mw2hr
	0La2RxldPzfUMhX5Qco3IUiXhbg3l/WAc9wE0uAs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KbVRQrwQQ1ZO4JYQ5gnHZvdbuyw3/7jgnIWniRlXRR0=;
	b=j8X4XLnIn8RFJch9O+bXzKZ9BG9lTZUAxn1ivufX98pvYDxFlE3yTK8XMhg3rHi7
	Hppnlo3UKhFMgrTQF6CjCnPiU/6B8sulCtl+NKgaKIqNjFtui8FAADIsZwaFoGAtujl
	DpAqPxmTfpRTwhsMl+p6sYnaBFYc+XnazV6TnhKM=
Content-Type: multipart/mixed; boundary="===============4597774531619261635=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] valgrind: upgrading to 3.21.0 FAILED
Message-ID: <01010188215a5560-c4952352-db7a-44a4-b1f8-4715c99bb07e-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181324

--===============4597774531619261635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *valgrind* to *3.21.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe valgrind failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (14:02:43.424145)
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:649603949a0d5a32fd4357d2e333f7fa29f6d84e"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 901 .bb files complete (899 cached, 2 parsed). 1805 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:649603949a0d5a32fd4357d2e333f7fa29f6d84e"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  16% |#####                               | ETA:  0:00:00
Adding changed files:  32% |###########                         | ETA:  0:00:00
Adding changed files:  49% |#################                   | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://sourceware.org/pub/valgrind/valgrind-3.21.0.tar.bz2...
INFO: Rebasing devtool onto 8205d3ba0101dffd1790d7202194c15c72ea687a
WARNING: Command 'git rebase 8205d3ba0101dffd1790d7202194c15c72ea687a' failed:
Auto-merging cachegrind/cg_annotate.in
CONFLICT (content): Merge conflict in cachegrind/cg_annotate.in
Auto-merging cachegrind/cg_diff.in
CONFLICT (content): Merge conflict in cachegrind/cg_diff.in
Auto-merging tests/vg_regtest.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/valgrind
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/valgrind/valgrind_3.21.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4597774531619261635==--

