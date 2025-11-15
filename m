Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A870DCEB2E8
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12108.1763224711004487772
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NqX90gaT;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Up+uH1WU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a8861ec64-a056f4f6-1d39-479d-8687-6d39868f29f8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224710;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=i/Lhd59WUtFabmN9g1x2vgU4EddbCUjAG3Y08yocnCM=;
	b=NqX90gaTPJMF4pqGpCor5M6k66LXs9YsDZbvTgnGCnh1u+a3u2COsg3CsgiF34U4
	/H3agd6BPIEQ8pInQwOd9QA0lwM4LBZHlMVrYfhYfNgD8novMtYzDYYoHHGzP6rfLw/
	F2mIaVgsk4VLhLhtKaQCROycGcq7U7XnojrO0aac=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224710;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=i/Lhd59WUtFabmN9g1x2vgU4EddbCUjAG3Y08yocnCM=;
	b=Up+uH1WU382TPXRIrKnabS6OQi1ahCYH4+52/VG1PjWF43jZyenJG4OaE2UDmQEt
	tgUZ58oSjK1DcNkgGmwe8ex4YbTJ9MBOiYcoS4ox/UHE8lQ5jZ0R3gK6Jy4W8whlSB7
	k4hoZNleGVtsvG/XVeS/AWsHrRpbDxeoV3ruz29k=
Content-Type: multipart/mixed; boundary="===============8252169877464551540=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 binutils-cross-canadian-x86-64,binutils-crosssdk-x86_64-pokysdk-linux,binutils-cross-x86_64,binutils-testsuite,binutils:
 upgrading to 2.45.1,2.45.1,2.45.1,2.45.1,2.45.1 FAILED
Message-ID: <0101019a8861ec64-a056f4f6-1d39-479d-8687-6d39868f29f8-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226308

--===============8252169877464551540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *binutils-cross-canadian-x86-64,binutils-crosssdk-x86_64-pokysdk-linux,binutils-cross-x86_64,binutils-testsuite,binutils* to *2.45.1,2.45.1,2.45.1,2.45.1,2.45.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe binutils-cross-canadian-x86-64 failed.
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
DISTRO_VERSION       = "5.2.99+snapshot-9e94d2fd8ca152596febf8637797608fa44a7634"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:9e94d2fd8ca152596febf8637797608fa44a7634"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 48324fde1e284293dd3d570dba597cb644921c92
WARNING: Command 'git rebase 48324fde1e284293dd3d570dba597cb644921c92' failed:
Auto-merging ld/config.in
Auto-merging ld/configure
CONFLICT (content): Merge conflict in ld/configure
Auto-merging ld/configure.ac
Auto-merging ld/ld.texi
Auto-merging ld/ldlex.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/binutils-cross-canadian-x86-64
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/binutils-cross-canadian-x86-64/binutils-cross-canadian-x86-64_2.45.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8252169877464551540==--

