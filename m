Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D48C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:15 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.13597.1713248039189377481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=S5qVtac/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qufOkSNj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018ee58a9e8b-3e87a87a-d887-4fa2-9275-13206c269f9d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GS8d7clyp7KEvOnwZtDepSprchhXrUuNZ7zL7GfRTQ4=;
	b=S5qVtac/IlBf6VT+bibqARl5dnO823uGDPN9en3UsEAePJqsyETiVq9wn03k/mVy
	2c1d66ygTli4fKhtOhrMTuM9O+JLaNHjemXsiYLl2zjABWOBrm0TiOxelPRBA9bKWby
	Leh8qYTgi+9ck5/60Yr51QhntBxnWMXpsd4QhghA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GS8d7clyp7KEvOnwZtDepSprchhXrUuNZ7zL7GfRTQ4=;
	b=qufOkSNjTTXPolNFGGW1Ef9pQuqmw05UdTDX6jv6huuZv1Ou7OahO1XClVWA4euB
	itfxc07/aaou9qqRbOe3hMdQ/bnwmJyGvC4g5PjDbD33DgT7BJE0Df23HduVbVQE+Zf
	wuqgzPHfhsPR0iVYNhZfhd99Crn8WB/CIvKQkcZ0=
Content-Type: multipart/mixed; boundary="===============1289508747226389330=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-good: upgrading to 1.24.2 FAILED
Message-ID: <0101018ee58a9e8b-3e87a87a-d887-4fa2-9275-13206c269f9d-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198394

--===============1289508747226389330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-good* to *1.24.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gstreamer1.0-plugins-good -V 1.24.2
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-46de850091a20ffe95e5da18847f80231c85a983"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:46de850091a20ffe95e5da18847f80231c85a983"

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
DISTRO_VERSION       = "4.3+snapshot-46de850091a20ffe95e5da18847f80231c85a983"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:46de850091a20ffe95e5da18847f80231c85a983"

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
Adding changed files:  27% |#########                           | ETA:  0:00:00
Adding changed files:  54% |###################                 | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.2.tar.xz...
INFO: Rebasing devtool onto e6a860a4b46fa427cd23236327618680d588bef3
WARNING: Command 'git rebase e6a860a4b46fa427cd23236327618680d588bef3' failed:
CONFLICT (modify/delete): ext/qt/gstqsgtexture.cc deleted in HEAD and modified in ad45c91 (qt: include ext/qt/gstqtgl.h instead of gst/gl/gstglfuncs.h).  Version ad45c91 (qt: include ext/qt/gstqtgl.h instead of gst/gl/gstglfuncs.h) of ext/qt/gstqsgtexture.cc left in tree.
Auto-merging ext/qt/qtwindow.cc

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
ext/qt/gstqsgtexture.cc: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1289508747226389330==--

