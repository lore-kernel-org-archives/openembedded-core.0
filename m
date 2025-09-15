Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7AFCAC5B8
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:48 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.30923.1757937279478689109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SR/LHamr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qhLLK/ox;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101994d3a1f50-51098f39-da76-4d85-bc40-7695334c1daa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937278;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=anUqb6n9vvN/nwLmKYGnbIrM+FmcLt+NGJa4TuqGRMs=;
	b=SR/LHamrQ58H7IHHMGPISp8vO+bjRIXMxUKXpvffaQls7IpLK1UQzhdRaFW0gNFZ
	2gR21jXHpGQk2OQ/hFP4ezafCnKSMtLPCPVynqgyLuYLPBcrnR4fZooii6FNNP7+GVf
	1Yj9vs2RoF38lezZ+rmTrdFXiS7K3fdqFCFSCFBU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937278;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=anUqb6n9vvN/nwLmKYGnbIrM+FmcLt+NGJa4TuqGRMs=;
	b=qhLLK/ox0bWuvBnqRSLfDu5mlrrTmfnqancelXm5obl2hQ5aD2UQRMTj+kL88wdy
	kjECeLu3PaP8u8LDA2sOaajeTF78mQu1S9h6wMB/7iH99fcW4J8sTbGgeniZRSlvzX5
	1fGsf3Z1AEU2mpZmGfefgP2txS0bixWXKscXvgkM=
Content-Type: multipart/mixed; boundary="===============5924347075642467867=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.20.0 FAILED
Message-ID: <010101994d3a1f50-51098f39-da76-4d85-bc40-7695334c1daa-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223419

--===============5924347075642467867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librepo* to *1.20.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe librepo failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1939 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-d0eb9f754818547469e77cf5ee893671969ecfd5"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d0eb9f754818547469e77cf5ee893671969ecfd5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 363cb70c6548be900832bc9b18ced3e7569da15a
WARNING: Command 'git rebase 363cb70c6548be900832bc9b18ced3e7569da15a' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/librepo
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/librepo/librepo_1.20.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5924347075642467867==--

