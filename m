Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6789BD79779
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29050.1769951564229594144
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CEYcPTlg;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UVxxqTv8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c19558e55-6a4ec676-52ee-4419-9d2e-c7ca0aa961ac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2VyA0ScIiR1Rt4m2nQHnDYWuILVOOsP9GjbZX2xxVJw=;
	b=CEYcPTlg1SOvFnegUaDtwu0GIYd1SpK55CTbHSxX5XfptqfBuGs95qc/EfRxMY1z
	uO3iP/mZAWuzs1iPfEZMgCWSmwHt6nUq4ochooLORXyt4laPfRgGz5iYWzgu0z5GNk5
	nV0InROMqcc7b2EVLt5EFm67q6K+2hAXSXz/Kje4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2VyA0ScIiR1Rt4m2nQHnDYWuILVOOsP9GjbZX2xxVJw=;
	b=UVxxqTv8e2bDRIPHI1p8SdqMDi+xlVo/ZW2EafJ0R7EdAm23S3rIYAcoJuBCu7jm
	c39R7u0iHNVMVtd4o6MeHav2GLG/jbPr/uNhXEK/CRx2T4NPoLmgrjCOFPaJdzF4NRM
	hCzGEH9R+iKTgHcNr7LqmbNz0MvPRERVGv3wkAAE=
Content-Type: multipart/mixed; boundary="===============8769651598820185518=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>, 
	Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>, 
	Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 systemd-boot-native,systemd-boot,systemd,systemd-systemctl-native: upgrading
 to 259,259,259,259 FAILED
Message-ID: <0101019c19558e55-6a4ec676-52ee-4419-9d2e-c7ca0aa961ac-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230263

--===============8769651598820185518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-boot-native,systemd-boot,systemd,systemd-systemctl-native* to *259,259,259,259* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-boot-native failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1957 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-58b9f90779d1227e30a7de4948b10e49fb5b5ac1"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:58b9f90779d1227e30a7de4948b10e49fb5b5ac1"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
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
INFO: Rebasing devtool onto 9ca433482f2281d71718718705ca8cd3bf562ad6
WARNING: Command 'git rebase 9ca433482f2281d71718718705ca8cd3bf562ad6' failed:
Auto-merging mkosi/mkosi.pkgenv/mkosi.conf.d/debian-ubuntu.conf
CONFLICT (content): Merge conflict in mkosi/mkosi.pkgenv/mkosi.conf.d/debian-ubuntu.conf

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-boot-native
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-boot-native/systemd-boot-native_259.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8769651598820185518==--

