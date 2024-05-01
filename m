Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33840C3DA44
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:25 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1097.1714579215467404073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UC06f62Q;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qBOLGn0o;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018f34e29187-0d9d7abd-ce8a-48d5-87ef-901d35768307-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NHNBgG3b2YwqnnX7y4VG8fmwkmVbs4Fpd6H+2809kxo=;
	b=UC06f62Q0eYf9UxXNJppHAXBBIsSAsn8FaNiQqYxAiZqNmc7NN1MoGrqgXeY0Yhu
	x9gnMgbuZxZoE2uQmyXyHOubXWVRhRoC1tOHvXJuh7z9GW+hWUVbxa08/RFK3bE/0zY
	Q8jg4KCn6A6nUfQep56knkEqZhuVmvtkgZCt6sCw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NHNBgG3b2YwqnnX7y4VG8fmwkmVbs4Fpd6H+2809kxo=;
	b=qBOLGn0oOpgBED/Lh1C4MZZVc7Kt4iTVGsl3Zh1Eis7GRpjq1yP8iMSsjWHqRsIC
	BQw5lPPetb69/1mIjJ1pbjy12cfJ7OJUjh/tyPkJwRjBYI4WnhB+IiR0/cOIBjoliqw
	sPbepZpB6xwSig9sTcSBMdefvcIQLZCu1NU8USdU=
Content-Type: multipart/mixed; boundary="===============9219184306039851252=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.45.0 FAILED
Message-ID: <0101018f34e29187-0d9d7abd-ce8a-48d5-87ef-901d35768307-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198799

--===============9219184306039851252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.45.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe git failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ec2ca28c033076e62034606c520a8ec14d78e65e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ec2ca28c033076e62034606c520a8ec14d78e65e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1877 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ec2ca28c033076e62034606c520a8ec14d78e65e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ec2ca28c033076e62034606c520a8ec14d78e65e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  19% |#######                             | ETA:  0:00:00
Adding changed files:  39% |##############                      | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  79% |############################        | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/software/scm/git/git-2.45.0.tar.gz;name=tarball...
INFO: Rebasing devtool onto 94ddd0039d4637bb5b221392713f69b36fcddd37
WARNING: Command 'git rebase 94ddd0039d4637bb5b221392713f69b36fcddd37' failed:
Auto-merging config.mak.uname
CONFLICT (content): Merge conflict in config.mak.uname

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/git
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/git/git_2.45.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9219184306039851252==--

