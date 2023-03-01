Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C2CC88C85
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.24036.1677681916885920707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LeObZEPi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101869da27544-9580951b-d8dd-47bc-8ef1-67f104a64047-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681915;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=t+U+17aIoH/W49U99+Kzn78558TxLSswreQoAbi9SLU=;
	b=LeObZEPiUsDN3oXkeFiAQI7UsnRN73bPotQNWld5V3LB3M6nQq+/7JMJCsIQ9P7f
	do2VslD700Ydgl2LvoPKA9gkFh5AzFVzmbTIVPlY9GhKA3mbNZsnbR9Fo00biIsCZmw
	CuVx+ZFuR0RBQ3gUIwS9I1Poep17bl5Rzz7w1Km8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681915;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=t+U+17aIoH/W49U99+Kzn78558TxLSswreQoAbi9SLU=;
	b=JwcCrVH+HPQFonzDzFKByJl9gAsXqrUU/5IcuowgHpgAtRnnBmb3zJpShHYf5IU8
	S7E63PXqSyFfhk20xYllKsZHVSNt+0El38iXIYBxAZLzO09vB9DvAcYDK5Wcw8SZBoK
	2jCaqGLnJIZevE5z5bkprkOvaUf4G4AXVcT8LDuU=
Content-Type: multipart/mixed; boundary="===============5306605144978786835=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.6.2 FAILED
Message-ID: <010101869da27544-9580951b-d8dd-47bc-8ef1-67f104a64047-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177934

--===============5306605144978786835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgit2* to *1.6.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libgit2 failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (14:16:53.861565)
Loading cache...done.
Loaded 1697 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-ecf1f7d2af2d36f1390a94bb66b86394cdce79cc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ecf1f7d2af2d36f1390a94bb66b86394cdce79cc"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 25ec37379ed07b10c4ecc6143cf6018cabc8f857
WARNING: Command 'git rebase 25ec37379ed07b10c4ecc6143cf6018cabc8f857' failed:
Auto-merging tests/libgit2/CMakeLists.txt
CONFLICT (content): Merge conflict in tests/libgit2/CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libgit2
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libgit2/libgit2_1.6.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5306605144978786835==--

