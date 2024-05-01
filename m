Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774BBC25B78
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.1091.1714579214708476541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gfCsMtLP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ce8sAFkn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018f34e2992e-62cce169-d600-4fc9-80a5-0c72d20fbc00-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579216;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=/DGsN1hgml5HscygjjamTfA93GdiuEI4RotquXl43sw=;
	b=gfCsMtLPmGCJAEpuRfxij6abr/OgBBweTII5Y7w5Vm74n9Tel0Zje3QSmELrKjYn
	wyj5ysml68XI5jOriH1aJepOcVrIIOpR+6LZJA2EnEHivAGw1TMtPubB0oQ3H6WcHiq
	Y5eZKWXxM+4Lf9sXaUt9eNWFSUkEaDcgyGhaapVw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579216;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=/DGsN1hgml5HscygjjamTfA93GdiuEI4RotquXl43sw=;
	b=ce8sAFknfr0CQm5od7OIMUFKmNkCLL4lkjy2p0hoBpoRoSLiCRwQkTmq3ygaEhH7
	ftvLIc75Plv7YRqTxnqqExfQjbilaZjGUBugbCnFtsEGgwGAp3kcS0aXEvhigFRM1/f
	Oku6X5B+Lmq9GlIgXvE84VzB5sgqXYpwT9n3Z4wE=
Content-Type: multipart/mixed; boundary="===============8906538040724498512=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] pinentry: upgrading to 1.3.0 FAILED
Message-ID: <0101018f34e2992e-62cce169-d600-4fc9-80a5-0c72d20fbc00-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198871

--===============8906538040724498512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pinentry* to *1.3.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe pinentry failed.
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
DISTRO_VERSION       = "5.0+snapshot-9cb87939b233edcee835bd20059e19a699607f0d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9cb87939b233edcee835bd20059e19a699607f0d"

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
DISTRO_VERSION       = "5.0+snapshot-9cb87939b233edcee835bd20059e19a699607f0d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9cb87939b233edcee835bd20059e19a699607f0d"

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
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/pinentry/pinentry-1.3.0.tar.bz2...
INFO: Rebasing devtool onto 56e91752a8929c3842d73301279522bf2092019b
WARNING: Command 'git rebase 56e91752a8929c3842d73301279522bf2092019b' failed:
Auto-merging configure.ac
Auto-merging m4/libassuan.m4
CONFLICT (content): Merge conflict in m4/libassuan.m4

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/pinentry
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/pinentry/pinentry_1.3.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8906538040724498512==--

