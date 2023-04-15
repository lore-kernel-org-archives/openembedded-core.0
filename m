Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE1DC88CBF
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.13808.1681581685707827992
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CvIuTF7K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018786143caa-123780da-89bd-4bae-bdc3-64ae57437963-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rnMqGwj83FkYAVw9D4t6tE9szKyhGeqESjKA+5gTzcQ=;
	b=CvIuTF7K0TH/G9CstPkfM8fPOhzG/f6jKPjgxyBtRKXqjG1eWgVzphjjrpKMFott
	V3YIZKz2kgsxVddEppMSrroYfxDuZbYKgWFIHDfueaUT2s/boBVoNcDtZqQzmbFDHMx
	Z9qqX3GVqPrJxcit6Fz2lL+PZa9RJ3/pUyc79VAM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rnMqGwj83FkYAVw9D4t6tE9szKyhGeqESjKA+5gTzcQ=;
	b=aIr2xOnJ36AATFB+OUSeKYs3ikv+ojpMjyaKiaAch5gWZPLb936gmXD6rXkr3XvH
	h0KLb0cC3T6jeg8FTUQT6rL9ArH77fUar1Zv9JN93LQoLyNBWj6oCQuP6k50EEeKEhk
	NFDhbcmIh8LrGSQX8Bm8FHwJWPkl0HI4ozO6wCi4=
Content-Type: multipart/mixed; boundary="===============2538329472267932535=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-utils: upgrading to 2.18.1 FAILED
Message-ID: <0101018786143caa-123780da-89bd-4bae-bdc3-64ae57437963-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180062

--===============2538329472267932535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-utils* to *2.18.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libva-utils failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (13:56:05.380135)
Loading cache...done.
Loaded 1799 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:682de0c80a67c83039875e05a6578c9dda618882"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 8e48d95cc12a7d8ee0dfc937e1da3a0caa943d22
WARNING: Command 'git rebase 8e48d95cc12a7d8ee0dfc937e1da3a0caa943d22' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libva-utils
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libva-utils/libva-utils_2.18.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2538329472267932535==--

