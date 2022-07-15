Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26601C04E88
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.964.1657900668744868692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DwWLlvhs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101820294934d-5bc7acab-5324-4114-a3b4-9fe9fcb52c8b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=F78hbI7etQzVZmh6cZ7IfKzXD4a8X0rmeZSWmDOc/5s=;
	b=DwWLlvhs1ESE6PI7a9P9XLp779XpDuDBvT0yU0KZ7WHJkxGaUuxlvOxg+ZyJAXul
	E4gSUe8RGc/AKl/cnasssJHmeXaHrxHUGksoFEMslTgCZucyYierny0MPNj3jSgJVXx
	mP2kBs14/Raxtygkovxd0hulMBjIINjvfFylwBPI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=F78hbI7etQzVZmh6cZ7IfKzXD4a8X0rmeZSWmDOc/5s=;
	b=Hc6xx+SmKcI52CbsUwZvSqCng3ipzVtZ/TFWkjJ02JsaHyvI5Kq0QckcEFxI8fF/
	J0akIhm3kbLM9wuPzsVUaxXz6AVv8fDttEZwWWgih/NrZH3c7yC2/EGaJLw3lm/lXOj
	UohHOCRJ5U8U3dAjQoOzqkJKfsDeGQsWTwoy4D+c=
Content-Type: multipart/mixed; boundary="===============5688752609471843279=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 4.17.1 FAILED
Message-ID: 
 <010101820294934d-5bc7acab-5324-4114-a3b4-9fe9fcb52c8b-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168087

--===============5688752609471843279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpm* to *4.17.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpm failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1660 entries from dependency cache.

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
DISTRO_VERSION       = "4.1+snapshot-5c567186d9017b2f6e3ed3d30b257ee8ff25239f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5c567186d9017b2f6e3ed3d30b257ee8ff25239f"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 5bef402da334595ed9302b8bca1acdf5e88bfe11
WARNING: Command 'git rebase 5bef402da334595ed9302b8bca1acdf5e88bfe11' failed:
Auto-merging rpmio/rpmpgp.c
CONFLICT (content): Merge conflict in rpmio/rpmpgp.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/rpm
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/rpm/rpm_4.17.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5688752609471843279==--

