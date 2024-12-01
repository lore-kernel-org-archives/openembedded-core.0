Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4F1D10DCE
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:09 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.149808.1733047563526840963
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iK+/k/ol;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Z4rdZUf5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019381af3e73-0c65827e-7508-4360-b847-dee14bd37aaf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/vcPqfzJD8W0NQDUu9c6rIjiD6GqJXmLMvu+Nls4PSM=;
	b=iK+/k/olCUligf48jmQJXhkrJ/qvQyqaOwRP2MX5nbnLn0LsC4qATFneLG3mq4E/
	B/Kv2PoXuG9XJzNXJMXTzoY/uhRMmCtH49zEhCNa3gE7vpf7iL+cNfJMJ1LDn2reXhH
	kXfa2Dm9Haf0O0f1umR8ehfA3AM3H2sKL1hYB+xU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/vcPqfzJD8W0NQDUu9c6rIjiD6GqJXmLMvu+Nls4PSM=;
	b=Z4rdZUf5F3nhV2wCxfYnmjOrcNJD1re/x26RvdslvTnqgInGlRJjOC/OfXH6+v4R
	i27HAY849Uxoz2AAo1XmDuHkR9SAB2ou3903yDceGqyDs5gHc4zETuSnCtGyytBbbcB
	A0N1S3tDsW3ohjGKmicVnyS+noGSDtMtgHrhHkyU=
Content-Type: multipart/mixed; boundary="===============0823054435670374771=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pixman: upgrading to 0.44.0 FAILED
Message-ID: <0101019381af3e73-0c65827e-7508-4360-b847-dee14bd37aaf-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208093

--===============0823054435670374771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pixman* to *0.44.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe pixman failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:061f5e8b505398e7114f383330f654a3bb4d000a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1878 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:061f5e8b505398e7114f383330f654a3bb4d000a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-y2z4ec0t: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-vemlizz6/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-vemlizz6/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  54% |###################                 | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.cairographics.org/releases/pixman-0.44.0.tar.gz...
INFO: Rebasing devtool onto 0675221ebc5c8ec58c738d0e920d737c2650a101
WARNING: Command 'git rebase 0675221ebc5c8ec58c738d0e920d737c2650a101' failed:
Auto-merging pixman/pixman-arm.c
CONFLICT (content): Merge conflict in pixman/pixman-arm.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/pixman
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/pixman/pixman_0.44.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0823054435670374771==--

