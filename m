Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B98C35FF5
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:07 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.115635.1726410840517423897
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cYuwQRET;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Y6K6ZzDz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191f61ad690-e2ac4433-62d0-4e70-b37a-583bee50b5fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+G3rWdyoz9yWI2qbVg7fzRNUp4j1uwirlIDpVqx1exQ=;
	b=cYuwQRETEKl5r2bFxc6VbnrYFbwre06/mwF1degthxL8q3/G7f6JaTzk+lEpTPGV
	AMEYEBdIeXM+iWD3RXDHcMUrI+xhd1PAFxRdyjKPgX4UlaxS5dR9cjglXOsHcEGn6EK
	zLR4sYvo0OcMS/cJ/rEObJaXK7bRM0ODWCajEteI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+G3rWdyoz9yWI2qbVg7fzRNUp4j1uwirlIDpVqx1exQ=;
	b=Y6K6ZzDz57exYLYkRzpWtW/mhN0Zcv+iCvIQCSQMMOBPF72eR1ePU2DeEYTBl8nh
	wT4XNpqDzaM9Gsaa/H8lo4CTmavJagezZJcz0ql2UpydylwhIw4yCW1PHqdSnygcLuU
	r8uI8xaManwroExqzwoAC6cw+o4x5iCkCU9ZfNV0=
Content-Type: multipart/mixed; boundary="===============8251648184497868546=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202408 FAILED
Message-ID: <01010191f61ad690-e2ac4433-62d0-4e70-b37a-583bee50b5fa-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:33:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204517

--===============8251648184497868546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202408* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade ovmf -V edk2-stable202408 -S b158dad150bf02879668f72ce306445250838201
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-5219c7bd0e96a530d3bfcd727603018b12b105c8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:5219c7bd0e96a530d3bfcd727603018b12b105c8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto b158dad150bf02879668f72ce306445250838201
ERROR: Execution of 'git rev-list devtool-base..b64af41c3276f97f0e181920400ee056b9c88037' failed with exit code 128:
fatal: Invalid revision range devtool-base..b64af41c3276f97f0e181920400ee056b9c88037



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8251648184497868546==--

