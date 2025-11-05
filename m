Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90ACCD4F26
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:49 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2364.1762384581511897820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Wtus2ESJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bu+g3KDB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019a564ede1a-98a2e3d6-a3ba-4b87-826b-c5a95fdb3f71-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YwvDUr7fPMkc1/LmfPNIgcSN6MmTlqQpTr7ToA74RfA=;
	b=Wtus2ESJtUZbUIudljdmEvV0fWJcBwfK9XhFRBJNPZ7IxgT2ICgivNivKgL8Oo/L
	MWJZ48qSPy2qUk3urzOF3fznQAnrYERnpnFdPuIK5yCH/TUUskDWdy6RrTyE8tMiYGF
	IX6DR+0DBLgMNdsV8PXGDh6dT65qmYjIM0JlD1NQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YwvDUr7fPMkc1/LmfPNIgcSN6MmTlqQpTr7ToA74RfA=;
	b=bu+g3KDBDyKst9i6tuk5L+AZd3eRT7y3Qa0SGp0HZ5KNHUYUu/UzjNxBkT14M0LC
	tXA1yPWieMhDDx+KDK9/uXSTTNNTT6rRAQ97kUU63PCSB9WKzbOItIf0X826JwMqF/Y
	4QqTUw6ELUi8LyrJSk8hDH8n1Y4RXUKijKXNR0Fo=
Content-Type: multipart/mixed; boundary="===============2894124054261407430=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.29.901 FAILED
Message-ID: <0101019a564ede1a-98a2e3d6-a3ba-4b87-826b-c5a95fdb3f71-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225891

--===============2894124054261407430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.29.901* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libinput failed.
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
DISTRO_VERSION       = "5.2.99+snapshot-21867a3c92f5d63de9649ff3a6aa71e76dd03812"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:21867a3c92f5d63de9649ff3a6aa71e76dd03812"
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
INFO: Rebasing devtool onto b870abd2f3c5e5175fccc08ec25b314d0d7af808
WARNING: Command 'git rebase b870abd2f3c5e5175fccc08ec25b314d0d7af808' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libinput
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libinput/libinput_1.29.901.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2894124054261407430==--

