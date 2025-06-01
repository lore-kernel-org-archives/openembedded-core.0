Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D610C677C4
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:33 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.27764.1748786123259385242
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=g6busFlZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=srKGLR58;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101972bc6abb1-c8b16b7b-6bd3-4031-9a6f-6044190ad971-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786129;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3Pb+8pPYJQpoF4WVuG2U/SNyUIL1vbUPOdjU2FWUIX4=;
	b=g6busFlZyoEDS0vlPpPM3S8UtSYzHXG2whHJThw8iCZWEBawtjGeBuNud8axTMUG
	vT61P7tY1BwTR5NQAs/LyiVokdPHcgyvH8GQa36XafftTZOCpGCDb+yhiUx/UTKgJp6
	D6LceqXv1vetNhILIBmviY5nVnmkx+qeg1rg9pVk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786129;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3Pb+8pPYJQpoF4WVuG2U/SNyUIL1vbUPOdjU2FWUIX4=;
	b=srKGLR58qOk31OtFdh2IQ0OQxFIuVM14jpK1AnI2lQIgvV0OfbbVKnNJd8DjqN/O
	wuBzSJjIUdKflJQ4/FnSzfj889jpngZ+xBLy472qONiWIVRbAs7W9LttOSRNpqPIOVa
	KlwSZttJ8R20X7YSTDRmMi3l9D3wvfJnqcy9Rrrk=
Content-Type: multipart/mixed; boundary="===============3968242441007218287=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202505 FAILED
Message-ID: <010101972bc6abb1-c8b16b7b-6bd3-4031-9a6f-6044190ad971-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217583

--===============3968242441007218287==
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
Loaded 1915 entries from dependency cache.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:067dc02f6aa975ba0a08704672f102dd12c590d3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

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
--===============3968242441007218287==--

