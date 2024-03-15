Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEB3C54F2C
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:16 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.1274.1710522012282469801
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DNC/Ng+3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qTH5AkEa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e430e9fba-30731ff0-ae69-4657-b1c7-aa527075f9e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522015;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8Nho5qcgJszfEYyH6i/GrfjJyGV0N5gQe9Wopv3C0NI=;
	b=DNC/Ng+3BqGt0qa9TyIKJCaXAEewYNuoSppl8YWUAzIiOp53vE9ab4e4+TqWNGlY
	ecHqWFryzXoBe+5TkRKxVmSsDPqf0xJeMuWRGgvsewo2G+RJqaSDmt7PiiSC/TSe0HE
	0aSmbNW8W80buoXVXSF4xs13WHrYNjF+Ilm3ckTo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522015;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8Nho5qcgJszfEYyH6i/GrfjJyGV0N5gQe9Wopv3C0NI=;
	b=qTH5AkEaeC/2ibVL0WGSIZZ9Sr9MzyxDLHa16TGVQATZpDwuiB/kTbauj9Kt2nZ3
	VFbm6sBPuZnwZBpRjPKJp/iFY5gt14qvLRGuyM4Cf0FFRSpAcrZp2cHHKPymCQ28J3M
	q2sP7sTZ5Z2wI6qZl46bsZ/KgvF9h3v7brap8SsQ=
Content-Type: multipart/mixed; boundary="===============1402792077687223687=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-bad: upgrading to 1.24.0 FAILED
Message-ID: <0101018e430e9fba-30731ff0-ae69-4657-b1c7-aa527075f9e3-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197224

--===============1402792077687223687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-bad* to *1.24.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gstreamer1.0-plugins-bad failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-f14792a0fde9632a5a78343fef3a502e46379826"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f14792a0fde9632a5a78343fef3a502e46379826"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (921 cached, 2 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-f14792a0fde9632a5a78343fef3a502e46379826"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f14792a0fde9632a5a78343fef3a502e46379826"

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
Adding changed files:   8% |##                                  | ETA:  0:00:02
Adding changed files:  16% |#####                               | ETA:  0:00:01
Adding changed files:  24% |########                            | ETA:  0:00:01
Adding changed files:  32% |###########                         | ETA:  0:00:01
Adding changed files:  40% |##############                      | ETA:  0:00:01
Adding changed files:  48% |#################                   | ETA:  0:00:01
Adding changed files:  56% |####################                | ETA:  0:00:01
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files:  72% |##########################          | ETA:  0:00:00
Adding changed files:  80% |#############################       | ETA:  0:00:00
Adding changed files:  88% |################################    | ETA:  0:00:00
Adding changed files:  97% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:02
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.24.0.tar.xz...
INFO: Rebasing devtool onto e250e6e3a6e1bd71700cd5a8312d97da1969fbcd
WARNING: Command 'git rebase e250e6e3a6e1bd71700cd5a8312d97da1969fbcd' failed:
Auto-merging ext/opencv/meson.build
CONFLICT (content): Merge conflict in ext/opencv/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/gstreamer1.0-plugins-bad
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad_1.24.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1402792077687223687==--

