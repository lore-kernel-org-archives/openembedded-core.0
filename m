Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A6FCFC616
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.53344.1728588936244469837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CGmugKuR;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=26tpEPEk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019277ee2ba8-7cf1854e-f7eb-46c4-b760-a4155ece45ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588950;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pdvsyucOKVZLqzDRj4eNneVDPEMh1fKuLw2aRWWk6pg=;
	b=CGmugKuRlNu6ffneZ6EfX0JgvXq5PCR9GMRWpF+HFmST33PdoYjbM3zquTnQ1csf
	RRySOsQYkizyvOzrKZVg+6G4H6KbSuhpuP8TZ3+mcSQS6s57QEcaCPMt4HnXAcpu8ii
	Ol20ZrC/DFCYhe5EyUxnSQF8bARhduJZ7cTbtueA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588950;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pdvsyucOKVZLqzDRj4eNneVDPEMh1fKuLw2aRWWk6pg=;
	b=26tpEPEkrkxChYz9nawtKniQSaVSFAkqzF90KPkW82xjtYkfc/oFNziY0AuJ/rEu
	zV8sJU3mEkrNnbcqnsYjC7uokkFrcGi7KhFAMKaVI/08O/9DIl1jBcXBx0SduFk42JL
	eEPxqCfrgNBvRDmPsSN9QQ6iYuRLzgLLwNnVOXf0=
Content-Type: multipart/mixed; boundary="===============7523727535365379623=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Andrej Valek <andrej.v@skyrain.eu>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] busybox: upgrading to 1.37.0 FAILED
Message-ID: <0101019277ee2ba8-7cf1854e-f7eb-46c4-b760-a4155ece45ad-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205464

--===============7523727535365379623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *busybox* to *1.37.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe busybox failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:7b892feaaeeadf5a0c6d5b3e62a5eb187651d6f3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1872 targets, 40 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:7b892feaaeeadf5a0c6d5b3e62a5eb187651d6f3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-8ikye883: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-pjk60__l/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-pjk60__l/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  21% |#######                             | ETA:  0:00:00
Adding changed files:  43% |###############                     | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://busybox.net/downloads/busybox-1.37.0.tar.bz2;name=tarball...
INFO: Rebasing devtool onto 8e0dcd6f78077e117269ecca23728ace21521181
WARNING: Command 'git rebase 8e0dcd6f78077e117269ecca23728ace21521181' failed:
Auto-merging editors/awk.c
CONFLICT (content): Merge conflict in editors/awk.c
Auto-merging testsuite/awk.tests

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 8e0dcd6f78077e117269ecca23728ace21521181
WARNING: Command 'git rebase 8e0dcd6f78077e117269ecca23728ace21521181' failed:
Auto-merging editors/awk.c
CONFLICT (content): Merge conflict in editors/awk.c
Auto-merging testsuite/awk.tests

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-x86 onto 8e0dcd6f78077e117269ecca23728ace21521181
WARNING: Command 'git rebase 8e0dcd6f78077e117269ecca23728ace21521181' failed:
Auto-merging editors/awk.c
CONFLICT (content): Merge conflict in editors/awk.c
Auto-merging testsuite/awk.tests

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/busybox
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/busybox/busybox_1.37.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7523727535365379623==--

