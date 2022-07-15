Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BE8CCA494
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.942.1657900668961191336
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=H/TLMTWv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101820294991e-9d18c9e2-cb26-4702-982b-f8edc8046c1c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900669;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=s+MIiLaZ+G4E536KET5z07uafXFGpjBZQUnVl26af7g=;
	b=H/TLMTWv+cEoA72tXlGtMUMkXYxKcYqRhmlZz3w5FvcFR7ZUBE9gyJ2+C1PiuhIU
	uaqfHIQDqh3WfJgVHKM9Fi7zPL5Wr4dZiBmRIsRdOFvh1k3le7ahRlQd+/I7YsU1LFa
	1vV1S4UpnbmsBoc+bIxphmdkc73sI6sFt9X1Syro=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900669;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=s+MIiLaZ+G4E536KET5z07uafXFGpjBZQUnVl26af7g=;
	b=Bue+4qwLFDcEevFcfhzmb+zuW0ChqE4bGFm6CrPybgddIuXx+pyhxmA1FIufW4ZU
	5EHmFiAzE6Vl8fy3TWo1dA3hYWUBqFyIfAW6NcVdSKtUoSTiaj6eYsQDZeS0S5E2quk
	d3YzTTyNeeJE7Nubq3SH9NZmI0mrb9LkZVFFQtOs=
Content-Type: multipart/mixed; boundary="===============1930330365080269520=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.5.0 FAILED
Message-ID: 
 <010101820294991e-9d18c9e2-cb26-4702-982b-f8edc8046c1c-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168102

--===============1930330365080269520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgit2* to *1.5.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libgit2 failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1660 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-dcf3e2ff4f4f021b025619451dee8a57ef946447"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dcf3e2ff4f4f021b025619451dee8a57ef946447"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto fbea439d4b6fc91c6b619d01b85ab3b7746e4c19
WARNING: Command 'git rebase fbea439d4b6fc91c6b619d01b85ab3b7746e4c19' failed:
Auto-merging include/git2/version.h
CONFLICT (content): Merge conflict in include/git2/version.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libgit2
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libgit2/libgit2_1.5.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1930330365080269520==--

