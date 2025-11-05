Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F90CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2339.1762384568903480648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uMVtATSt;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=reqKcwDK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019a564e5e25-92659a5e-87df-4c91-988e-a396e3534cc4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384568;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=S4atUbgO5FXh3u++g4YUhCFbKpKSJP9f38zMk4Y0yHU=;
	b=uMVtATStOzpEP2Hbt18coS61psbnfFlcMnYYhCXazSrhtLW92dc4PiGwtpnmlOn9
	QJw2trJzjQIsOb/xCIMPrGdbY8LmPq1q+t7U/uLXE9GmX/89CD6V/RPJJoKP7gTHRpu
	gR+n0zJ8EaLiaMV4y9bmcWOYE8LEkuFeRVAVIUpM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384568;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=S4atUbgO5FXh3u++g4YUhCFbKpKSJP9f38zMk4Y0yHU=;
	b=reqKcwDKJ7kDY9/u3J4zzoTq4ab3Fu5y8EXn6xiG3dNM6S847YiIAXuyC06YEvCV
	bIqd7LYWCKlz5BWCbtFhUrbs/Vtf68RvtlPlvmqecaWYZb5EG6NS57li/NuIf3a444y
	4If3LEGDIbdeGofRal1AR6bWvLRphPLjVabEWG1Q=
Content-Type: multipart/mixed; boundary="===============9211631020362328604=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>, 
	Chen Qi <Qi.Chen@windriver.com>, 
	Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 systemd-boot,systemd,systemd-systemctl-native,systemd-boot-native: upgrading
 to 258.1,258.1,258.1,258.1 FAILED
Message-ID: <0101019a564e5e25-92659a5e-87df-4c91-988e-a396e3534cc4-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225780

--===============9211631020362328604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-boot,systemd,systemd-systemctl-native,systemd-boot-native* to *258.1,258.1,258.1,258.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-boot failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1945 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-7ede5bbb578f09917153e488e93bf3a3d766d7c4"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:7ede5bbb578f09917153e488e93bf3a3d766d7c4"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 67a1069b7269cc23c3d04a2fb0cf110abe7abf31
WARNING: Command 'git rebase 67a1069b7269cc23c3d04a2fb0cf110abe7abf31' failed:
Auto-merging mkosi/mkosi.conf.d/arch/mkosi.conf
Auto-merging mkosi/mkosi.conf.d/centos-fedora/mkosi.conf
Auto-merging mkosi/mkosi.conf.d/debian-ubuntu/mkosi.conf
Auto-merging mkosi/mkosi.conf.d/opensuse/mkosi.conf
CONFLICT (content): Merge conflict in mkosi/mkosi.conf.d/opensuse/mkosi.conf

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-boot
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-boot/systemd-boot_258.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9211631020362328604==--

