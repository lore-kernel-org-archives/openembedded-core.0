Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883F5C3601B
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:50 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.7177.1740828333112516609
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Thtixu3j;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=k7+y/Mrb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010195517472ae-e84a89d2-316d-4b2d-ba3b-4f14a8d4d07d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828341;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HMRJOj+4Eye7t7Oo+O3X5UkGZkays+5pQmZhchUepIY=;
	b=Thtixu3j7ZZ+0KLVcfhytR9wdMV91u+uxo+aZ+AYj46vkABbP1hHOmqLp16xcTVw
	TzWw4izgce9Iob3tK18wnFZUZefBLEs2kBQzRlyQCHjB7rtU0b6gp5owo8IPenaccY+
	FC5mrXFx3iG7+4ZwfoJBFSow32Guduzj1MykWb+Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828341;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HMRJOj+4Eye7t7Oo+O3X5UkGZkays+5pQmZhchUepIY=;
	b=k7+y/MrbNMxTw0M7g4PAwR+cWpFAtWy1UPinL3lfJLkqAaanuuxGU4SYB+v856Pd
	oPBnkrVSC3N6XjNiOfzjDOiqFm2wsVlhN/3iOJk4YFQBVp23cT4EacovSrgCMmpDVri
	cfZewC1zusvt5WpWXeNGBRLw/e7OWFSlzNG3dRuA=
Content-Type: multipart/mixed; boundary="===============7550714684295884240=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.78.3 FAILED
Message-ID: <01010195517472ae-e84a89d2-316d-4b2d-ba3b-4f14a8d4d07d-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212178

--===============7550714684295884240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vte* to *0.78.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe vte failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:300e133dbee6eb9f10f177ea223d599017b55a11"

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
Parsing of 923 .bb files complete (0 cached, 923 parsed). 1882 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:300e133dbee6eb9f10f177ea223d599017b55a11"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-5rro83yp: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-5zargu05/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-5zargu05/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//vte/0.78/vte-0.78.3.tar.xz;name=archive...
INFO: Rebasing devtool onto 29df012b359cbc644eae4fcb5f62e2ec11f525cf
WARNING: Command 'git rebase 29df012b359cbc644eae4fcb5f62e2ec11f525cf' failed:
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/vte
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/vte/vte_0.78.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7550714684295884240==--

