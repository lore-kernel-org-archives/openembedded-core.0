Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE6EC54EFE
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:55 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web09.11576.1650052689769055663
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=zT4h6MfU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 010101802ecdece8-9f07ad32-441a-4d5d-99c7-55d947961e31-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HnjQrNIGByXlbddhe4CPtd+lgZPXZOr6haRVCJcNQiQ=;
	b=zT4h6MfUN/rXS3tzNK5s5r7uhXkeajz/vWv/PzFpV4aseAdn2vIBSSZh66xycHxn
	2myUa5rJBYZRP55rlgdPJFf5usTjUNRfBzKC+GQPlGoKZW+TYshn6qvAAaOixSvdaWD
	gk1vQcxil7ZEs0yBoKXEhAqPFsnCwwVjziuEt574=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HnjQrNIGByXlbddhe4CPtd+lgZPXZOr6haRVCJcNQiQ=;
	b=Wu0q5oow/ngU+0fXbVpzhw1o7EEK4I1/wwWimGyrdf1MGHOkUYJesUH5elEA5SkT
	dijoyApYdg+rrg4nRsT5x5gJnhsZ1ubqTXIunb+JDnwUz62mT1Ex/s6Py3c7s4+2Ozg
	EuHji+xtSchfqtYHBsXCI3GxIOdUdp+ndBVhQkio=
Content-Type: multipart/mixed; boundary="===============8280556638379833890=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.44.0 FAILED
Message-ID: 
 <010101802ecdece8-9f07ad32-441a-4d5d-99c7-55d947961e31-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:09 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164513

--===============8280556638379833890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *at-spi2-core* to *2.44.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe at-spi2-core failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1640 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:47da4a658ac7ba3bd231d2ba6af5638b2c1eed64"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 21 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (881 cached, 2 parsed). 1641 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:47da4a658ac7ba3bd231d2ba6af5638b2c1eed64"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 17 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//at-spi2-core/2.44/at-spi2-core-2.44.0.tar.xz...
INFO: Rebasing devtool onto 5e0bc55ad9cc6e3979568c44ef8a9400555f34e8
WARNING: Command 'git rebase 5e0bc55ad9cc6e3979568c44ef8a9400555f34e8' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/at-spi2-core
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/at-spi2-core/at-spi2-core_2.44.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8280556638379833890==--

