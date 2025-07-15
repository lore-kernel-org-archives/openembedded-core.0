Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3308CC87FC3
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.12485.1752594936204897824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HTaG02hM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CwoaHD9N;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101980ecc6e79-efcc4ef6-4c88-4682-86c4-432d7547435d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594935;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ODiSo/b86KOe2rKPJQpk66gb2q5rzD7uT79YZBSta90=;
	b=HTaG02hM9jkguT+tkCLwYRGcmB9ayluK2th9ZL++jdnWEQp/xTqtWHPCuZ9YeUOH
	KOgB2kgGBWuvtGtRcJyHL3owWfBS0Hb6yOECxqRocG+MLEgUiSlFlSOo2zPHkb77DZ6
	mY6Jp0iCa2yw8dz+r1w0+Xnitpc6pvlUVduHM7AQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594935;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ODiSo/b86KOe2rKPJQpk66gb2q5rzD7uT79YZBSta90=;
	b=CwoaHD9NCczNnqsxST6M3a4qvC7BBm/JzCTD7fOoFRKxCXmufwmpNq+tVQYxE+//
	UrD/4EcRdanpx1lN2Gnkv4xYQUdjbphIQP26H+NoOsoQN+uG07I/RasgrJ7Wp9Xy5eU
	VfdgxDtJ59UkE3IHgnwnl+l6bBRnneJq33taRFA8=
Content-Type: multipart/mixed; boundary="===============4973747180702299663=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202505 FAILED
Message-ID: <010101980ecc6e79-efcc4ef6-4c88-4682-86c4-432d7547435d-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220326

--===============4973747180702299663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202505* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade ovmf -V edk2-stable202505 -S 6951dfe7d59d144a3a980bd7eda699db2d8554ac
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1928 entries from dependency cache.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-bbed8ac47a8f23c26cecbec9c6732652782166a1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bbed8ac47a8f23c26cecbec9c6732652782166a1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 6951dfe7d59d144a3a980bd7eda699db2d8554ac
WARNING: Command 'git rebase 6951dfe7d59d144a3a980bd7eda699db2d8554ac' failed:
Auto-merging BaseTools/Conf/tools_def.template
CONFLICT (content): Merge conflict in BaseTools/Conf/tools_def.template

You will need to resolve conflicts in order to complete the upgrade.
ERROR: Execution of 'git rev-list devtool-base..f4153a09f87cbb9c826d8fc12c74642bb2d879ea' failed with exit code 128:
fatal: Invalid revision range devtool-base..f4153a09f87cbb9c826d8fc12c74642bb2d879ea



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4973747180702299663==--

