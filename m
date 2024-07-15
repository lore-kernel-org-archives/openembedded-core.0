Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5E9C53211
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:16 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1359.1721071146239194684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ei78ld72;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=i8euPHNr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010190b7d59b12-018f6cf0-0a1a-4cfd-9d17-b5d1928202b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Q7vNpiSoBOFzXhLnXoXkfc4tDN9utLcGrlxtdVYjI6g=;
	b=ei78ld72QtBAXAohRXNwrVp638rSgki0sbxtrpj4d1PifM6YGg175mu51BMqmAW7
	mzxmDNYOm/H28eq4A0Emfb1Yv1KkGzH07VTj/BLG6BpN3SuJeEglv+HhbYlhasgA/rJ
	la/PUt1iIscwhPKQijIXrlq4h5kPYaWcH7i1q/3A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Q7vNpiSoBOFzXhLnXoXkfc4tDN9utLcGrlxtdVYjI6g=;
	b=i8euPHNrWNdBuAmWvmLjHf8n4uVWnG5oOhb+ATUpQjAAHMA2vj+nYnLDtWHuViNH
	+gL4JYcNScBqvLFXkHYFnd9Ta2DWS+FQfqWTDW7QkoidymHvAlL65mT1eHgNSldJBj+
	PlnIH4SRy3qK5sPjX2p/5OD3ElvgSoi8uhSY5KTQ=
Content-Type: multipart/mixed; boundary="===============8644214315351096398=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-utils: upgrading to 2.22.0 FAILED
Message-ID: <01010190b7d59b12-018f6cf0-0a1a-4cfd-9d17-b5d1928202b3-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202014

--===============8644214315351096398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-utils* to *2.22.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libva-utils failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-0b6851c492383688710a99f67a40a44b043c2f55"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0b6851c492383688710a99f67a40a44b043c2f55"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 1a13ae13382b7b548f3a7e8035e1d7df66662c0a
WARNING: Command 'git rebase 1a13ae13382b7b548f3a7e8035e1d7df66662c0a' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libva-utils
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libva-utils/libva-utils_2.22.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8644214315351096398==--

