Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91EDC04AA9
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:22 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.102697.1697399113073199657
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fxPU1oHP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NoVREEbD;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.23, mailfrom: 0101018b34df0be5-3d5a2b04-ccd0-414a-90a4-039ba718a26b-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SiuNqZhCcj2YlG1r4ZTMAv9UL2dvVc+w2bDZXOjG48g=;
	b=fxPU1oHPYBCjiBYJo8COGLiVaGxcR/Be8Xdv1T4IpMMd5O/NdFaX8dygtT0TnDKl
	o0ScWo94GbFitKVVkGRue24ZUqUcxsJhIHihODDEKpR4icM37aeCLwbXlKUcnjc20Fw
	pOBk3g75e4fAhNgCxFFI2JSQH0VVnBJPrDABTzQA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SiuNqZhCcj2YlG1r4ZTMAv9UL2dvVc+w2bDZXOjG48g=;
	b=NoVREEbDb/csnb9zlFTtzK2QSAGg31ssVyARXQv/yYJJxye4SG8Lh/nlXb25HXrl
	xi1zc93GMtd5l0FArxKO0u9ptwEetEkkHk4U6oY226pPbVGXjf4RgYnuQZbCzksfKX4
	/ETPtE+wcaqBrMRX95YZbQxtmW/ZcTQO84KE5pdg=
Content-Type: multipart/mixed; boundary="===============9136717431184887920=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iptables: upgrading to 1.8.10 FAILED
Message-ID: <0101018b34df0be5-3d5a2b04-ccd0-414a-90a4-039ba718a26b-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189204

--===============9136717431184887920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iptables* to *1.8.10* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe iptables failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (14:12:38.495042)
Loading cache...done.
Loaded 1845 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-72d1f325a6a13747aa1ff638e8585de97ae718d2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:72d1f325a6a13747aa1ff638e8585de97ae718d2"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 31 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (911 cached, 2 parsed). 1846 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-72d1f325a6a13747aa1ff638e8585de97ae718d2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:72d1f325a6a13747aa1ff638e8585de97ae718d2"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 3 Local 2 Mirrors 0 Missed 1 Current 25 (66% match, 96% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching http://netfilter.org/projects/iptables/files/iptables-1.8.10.tar.xz...
INFO: Rebasing devtool onto e53f2fedf34a1c79b8c392631a0f0b412fedeab7
WARNING: Command 'git rebase e53f2fedf34a1c79b8c392631a0f0b412fedeab7' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/iptables
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/iptables/iptables_1.8.10.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9136717431184887920==--

