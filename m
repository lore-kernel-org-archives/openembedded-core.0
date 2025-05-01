Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E84C54753
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1780.1746113612927889784
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hTkkVkNg;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fJrZ6OmD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101968c7b92cb-644efdd9-000a-47b0-8048-e8aa5b85f342-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Oep18rVw0jIaSqtF0Po+N0B4a+SlkFro+Y70tQgMZ1U=;
	b=hTkkVkNgvXKTTBlsLLxtCdn//GKIO2GMF+ZbujyIVRsCM7Ei/3raUVK+f6NDm9cv
	w5Pnbrd6QDjglclBxBBlmXkmicejhiGJwC5usw9VqXD9lbbC2qqA2T3F+HUzIF42ekb
	0apE/nepdbl0BhkDaOclh1a786jimUI2X+H+6opo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Oep18rVw0jIaSqtF0Po+N0B4a+SlkFro+Y70tQgMZ1U=;
	b=fJrZ6OmDpc85Ykz5stpcaI3eIJqXNYHCWhMfYshwt55G1QAn6DMx47jteYPIb52i
	M1Z7kbDY6vbrgpnVTxlydzZhtkzWwaVix9Wk0rdpQ50dRK4nIHUdp8veDYiEAvmN7u+
	nxD0UIGXkh7GMxgjc0685GIPJf/qdFrpVG5YY6nI=
Content-Type: multipart/mixed; boundary="===============3694048169500718113=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librsvg: upgrading to 2.60.0 FAILED
Message-ID: <010101968c7b92cb-644efdd9-000a-47b0-8048-e8aa5b85f342-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215858

--===============3694048169500718113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librsvg* to *2.60.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe librsvg failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a36d5a7eba15499216857188ee50d4344bbbd38d"

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
Parsing of 929 .bb files complete (0 cached, 929 parsed). 1898 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a36d5a7eba15499216857188ee50d4344bbbd38d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-hk7iri2b: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-agh1jxj_/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-agh1jxj_/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
Removing 1 recipes from the core2-64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a36d5a7eba15499216857188ee50d4344bbbd38d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 31 Local 31 Mirrors 0 Missed 0 Current 62 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 312 tasks of which 311 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//librsvg/2.60/librsvg-2.60.0.tar.xz;name=archive...
INFO: Rebasing devtool onto 5db8c9fe119c1da2308c846d1fb0593184ac62d2
WARNING: Command 'git rebase 5db8c9fe119c1da2308c846d1fb0593184ac62d2' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Running extra recipe upgrade task: do_update_crates
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/librsvg
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/librsvg/librsvg_2.60.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3694048169500718113==--

