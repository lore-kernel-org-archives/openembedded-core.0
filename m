Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6041C25B5F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.1127.1714579217499344452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QThjcuxR;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VHZpAUTD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018f34e2981c-93ace068-5060-454c-b339-3dc483a38a06-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DXmRKJanZ7WnbClhaZyqct99NGx10fZuflg2CvSMFVU=;
	b=QThjcuxR6NrR4RdqdL8mwNI0L1gqHtuPalBrk1Fa4otomVSte7pobmKKhnHuPb4o
	uX/7FGNNIOu0pknBaWutOKUanJjuxWztdMqkx+CpNvtbdXIqJjDqr+P968D374qEVWF
	cAnRuPl6esMAJVarxacdJ0SFi9F31uCNhRdzI2/Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DXmRKJanZ7WnbClhaZyqct99NGx10fZuflg2CvSMFVU=;
	b=VHZpAUTD05wuGpZ/f2UZ+pYo4bRu55sfDY0c+4Hqc4kaMCzwXgR4/FpZhP8OOCSJ
	uWHgOgsbThnuJG9miZp06yjpA4eWQ+7QqMe7vIu0VagmUWYA/lbFeLPnKXWWultEe8C
	QJG8PauQdf1h7w39IXYOGFn/lFKEZSI79mry0jV0=
Content-Type: multipart/mixed; boundary="===============8464210923017368181=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0: upgrading to 1.24.3 FAILED
Message-ID: <0101018f34e2981c-93ace068-5060-454c-b339-3dc483a38a06-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198883

--===============8464210923017368181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0* to *1.24.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gstreamer1.0 failed.
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
DISTRO_VERSION       = "5.0+snapshot-33bba4d4e73b99c563de01012d31943e435309a8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:33bba4d4e73b99c563de01012d31943e435309a8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
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
DISTRO_VERSION       = "5.0+snapshot-33bba4d4e73b99c563de01012d31943e435309a8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:33bba4d4e73b99c563de01012d31943e435309a8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  45% |################                    | ETA:  0:00:00
Adding changed files:  91% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.24.3.tar.xz...
INFO: Rebasing devtool onto c3074a764ac4256ae3f785a87f2069dfcf162977
WARNING: Command 'git rebase c3074a764ac4256ae3f785a87f2069dfcf162977' failed:
Auto-merging meson.build
Auto-merging meson_options.txt
Auto-merging tests/check/meson.build
CONFLICT (content): Merge conflict in tests/check/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/gstreamer1.0
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gstreamer1.0/gstreamer1.0_1.24.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8464210923017368181==--

