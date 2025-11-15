Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2112CEE324
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:19 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12141.1763224747841460356
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YDZzG8AM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CiV2q6KH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a88627d50-b46740ea-f15f-44ed-8f0c-e5be5c8d92df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8Zyk/ZAGJhM6YxEtFVQFQQ9u11LfdMa+cel55RrdeBs=;
	b=YDZzG8AMPgDiwXKrZJxCBlGTf3JrH1/izHPlsTXbZZO+ZhokJAvYmzxahoVdFrOG
	tmGxi/KQCO082HCk8lO/M++cUxy4fL1LEax1uuc1sZl2AwwQ3TqyWBlLYVsi4egtKqT
	MQvYuXoRfNiaw2xC0WPQ0HoRBm3npZAap5H61knA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8Zyk/ZAGJhM6YxEtFVQFQQ9u11LfdMa+cel55RrdeBs=;
	b=CiV2q6KHXejYa456UZVxbzJwZGZyOIJT/rWCer1lRAnKOquk0C4hCnHC+uSrjcfQ
	PdC2rDM1LZYWNlsCfI0yNauJ84B2QSujBHkECOfRDyy9VCcvxaOEk0W9yLA9A28wHje
	4U/uVuUblfniDUbv6G3jZ4fOyukTKXRCEMwYtvTg=
Content-Type: multipart/mixed; boundary="===============4485529230125131868=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 b279952b36959d8a4a7292b90e952d1b2083b4f5 FAILED
Message-ID: <0101019a88627d50-b46740ea-f15f-44ed-8f0c-e5be5c8d92df-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226423

--===============4485529230125131868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-samples* to *b279952b36959d8a4a7292b90e952d1b2083b4f5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S b279952b36959d8a4a7292b90e952d1b2083b4f5
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1944 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-f01b2fa4a2a7e5a7b607c9809762853e3774c08d"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:f01b2fa4a2a7e5a7b607c9809762853e3774c08d"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto b279952b36959d8a4a7292b90e952d1b2083b4f5
WARNING: Command 'git rebase b279952b36959d8a4a7292b90e952d1b2083b4f5' failed:
CONFLICT (modify/delete): third_party/glslang deleted in HEAD and modified in e22f721c (Add changes from do_patch).  Version e22f721c (Add changes from do_patch) of third_party/glslang left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
third_party/glslang: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4485529230125131868==--

