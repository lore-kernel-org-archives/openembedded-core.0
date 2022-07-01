Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90FAC43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:08 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.39375.1656687061672378302
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RfudX61k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010181ba3e66ee-93a604f8-659e-4893-b0e3-6a54eee3e590-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687061;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=64LRbZOIE6kZpJiOufuK68r4Hl42kZStbVNbOpltKYs=;
	b=RfudX61k3LkMhKYnfAaw08jLTbUZl1bgwxdMzZMT7IkAUzCZIJCzm2NS2St9769G
	o6gY8h7g0laNcvenUs/Vx00iIkiwb0T4gyKKPYWRNwjDd9G80lorHM1pElonB8twdvb
	tq9qpVijr9+n3Bge0vMziCldrhUM8S34BMACvLh8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687061;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=64LRbZOIE6kZpJiOufuK68r4Hl42kZStbVNbOpltKYs=;
	b=Di2bM/uL3Tz4hp53WQUOsjQpZkN2RKum6QquRXtFIlOpHhO6cyxptQSsPegrEqtY
	c/Qs1aUwtjem0GKv/y2sxTCEFN4d1iCUJaHUW1jlkbEfJ0RO1CoRvLcBIKZ0JIFf4np
	dRQCOTuIGp2n/bFXefuYX5TutliBZg0koe20wzRg=
Content-Type: multipart/mixed; boundary="===============1230608082971831005=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] openssl: upgrading to 3.0.4 FAILED
Message-ID: 
 <01010181ba3e66ee-93a604f8-659e-4893-b0e3-6a54eee3e590-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:00 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167477

--===============1230608082971831005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openssl* to *3.0.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe openssl failed.
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-6958024ed2aa199e56851bf960c06dec1a3d81a1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6958024ed2aa199e56851bf960c06dec1a3d81a1"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1654 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (885 cached, 2 parsed). 1655 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-6958024ed2aa199e56851bf960c06dec1a3d81a1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6958024ed2aa199e56851bf960c06dec1a3d81a1"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  42% |###############                     | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Creating workspace layer in /home/pokybuild/yocto-worker/auh/build/build/build/workspace
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching http://www.openssl.org/source/openssl-3.0.4.tar.gz...
INFO: Rebasing devtool onto f1fe158dc8dc91a47c3b0f30b329ec0a6401910f
WARNING: Command 'git rebase f1fe158dc8dc91a47c3b0f30b329ec0a6401910f' failed:
Auto-merging test/certs/embeddedSCTs1_issuer.pem
CONFLICT (content): Merge conflict in test/certs/embeddedSCTs1_issuer.pem

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-nativesdk onto f1fe158dc8dc91a47c3b0f30b329ec0a6401910f
WARNING: Command 'git rebase f1fe158dc8dc91a47c3b0f30b329ec0a6401910f' failed:
Auto-merging test/certs/embeddedSCTs1_issuer.pem
CONFLICT (content): Merge conflict in test/certs/embeddedSCTs1_issuer.pem

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/openssl
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/openssl/openssl_3.0.4.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1230608082971831005==--

