Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEACEC10F16
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:07 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.13436.1713248038939432961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CGswt8Sc;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lRl3sRmd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018ee58a7744-99faf22e-e228-4afe-bdbf-44a246e07162-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qzHxkMwT5ZFCFA9z0bCvVqW+2X+Rz8AC8Zdl30Osrus=;
	b=CGswt8Sc4lAv2wjDSr0iXv9AxKSC7X8cP8tZ6pHvaikZ9OWbJu6pFVe4j6483mGU
	M/238Y32oSezDMrKILwVZ/VXgzCbmGWbhrjmW+ZHSDF7G7AchWG6pccWWdkWrSuZ48U
	8MAU/ld/hyGqw/Bh3Xfnwgufjv52OJm43mhAGXaU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qzHxkMwT5ZFCFA9z0bCvVqW+2X+Rz8AC8Zdl30Osrus=;
	b=lRl3sRmdIwY4NGO8jX5nlHBClRvyOsx1Pu/itLp87TxOl03yzdIGj/ke3cq9Ptp0
	+FU1ylwhhspk+Q+IdgPgbv6/EKOtO+x78BylU6VLPJTw4b0yNeQo9ucMVECjdHeSwUb
	y8WMqQ7KryI8KvuCP1+Zf+wHaVLcNratTMV2Bh6U=
Content-Type: multipart/mixed; boundary="===============0398341661181151116=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpam: upgrading to 1.6.1 FAILED
Message-ID: <0101018ee58a7744-99faf22e-e228-4afe-bdbf-44a246e07162-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198333

--===============0398341661181151116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpam* to *1.6.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libpam failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-9fe34b1c2a1fe9f76b26f9b9e0b32227629aead7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9fe34b1c2a1fe9f76b26f9b9e0b32227629aead7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1880 entries from dependency cache.
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
DISTRO_VERSION       = "4.3+snapshot-9fe34b1c2a1fe9f76b26f9b9e0b32227629aead7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9fe34b1c2a1fe9f76b26f9b9e0b32227629aead7"

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
Adding changed files:  20% |#######                             | ETA:  0:00:00
Adding changed files:  40% |##############                      | ETA:  0:00:00
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/linux-pam/linux-pam/releases/download/v1.6.1/Linux-PAM-1.6.1.tar.xz...
INFO: Rebasing devtool onto 50d99e3b45434799241a60e876a9a17104c48959
WARNING: Command 'git rebase 50d99e3b45434799241a60e876a9a17104c48959' failed:
Auto-merging examples/tty_conv.c
CONFLICT (content): Merge conflict in examples/tty_conv.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libpam
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libpam/libpam_1.6.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0398341661181151116==--

