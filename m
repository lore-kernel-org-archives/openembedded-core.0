Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D38C63709
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.20190.1672605968664468850
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HUqfJlC2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101856f15a623-5ae1cc91-e486-4d9a-a018-f5d00718ba1e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RD1u1csnUiJ/4o3DtaiDTqouv86swsFG6HyietN3UzE=;
	b=HUqfJlC2u9woCaJOQYCtMROg9vZtdQsfxCHtcn79x/5L7GgxXCtvZIh1BEZ2cFSl
	JOZcsPUu4wy+92Z5WMrG2tSQP359lnZ+jCp7YB7w9aYY9yjZUCoYh3xGmGXCXCs8Ivm
	dEMj9pP3tLaPq5zKFdaj1E/q24Jk/4SsdvZP+KdE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RD1u1csnUiJ/4o3DtaiDTqouv86swsFG6HyietN3UzE=;
	b=V6gzQwNG9ohsEauB3FY82fMDq6DgnLpX2xcDpXclQJ+gM6OzMAM93uHr5MalpmKF
	dzUEvvd/RKVSs+KStHq6dd23O3JiN1+nX3r9B0s9zMdbXgi7vZoRkV/jsBO//Ay7s4V
	e+0ngZoXmtj7+IwVtDMQD0lTYvc+92tfgiynzg04=
Content-Type: multipart/mixed; boundary="===============4105414914807253679=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-utils: upgrading to 2.17.0 FAILED
Message-ID: <010101856f15a623-5ae1cc91-e486-4d9a-a018-f5d00718ba1e-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175297

--===============4105414914807253679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-utils* to *2.17.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libva-utils failed.
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 36 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a64756b2dbb8bc82022a7f27c7df9625ac816cd7"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 14 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 42c02a6a37b1bfce91a7f15c898750f2ee9e3d6a
WARNING: Command 'git rebase 42c02a6a37b1bfce91a7f15c898750f2ee9e3d6a' failed:
Auto-merging configure.ac
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libva-utils
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libva-utils/libva-utils_2.17.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4105414914807253679==--

