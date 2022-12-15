Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5B8C7618D
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.144492.1671136350616678441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hGkaHiAc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010185177d0ea5-49fdf40c-b5b1-46aa-8ff1-fada4ed5efea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4ph+tlT528HW5uILLLSi48F354K0WZmyn64FUCFY3Qk=;
	b=hGkaHiAcBAliCmnWaaPbR/1/V9Nu1MxYgpMCXytx/a6CbPz5XSaJYYVi5U3KYbxB
	f9sKVAmrI6yvkpevL1XuVKliYGIcqaFRSAS7tprLpzBrC+on9X1JOiwxMLaoz5Nb9tv
	V/EW3RhbK3P2EW+4HHau7JCmUK6YOgEdiGWdsZIU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4ph+tlT528HW5uILLLSi48F354K0WZmyn64FUCFY3Qk=;
	b=a2kdundKhkNVcG6jdtNrBo+pQrBoV3gSpMfXjPxntfZ6PLC0qQYxQFiLiHQ58ioP
	9f9DvOvnC7Gil7XYJGezyKDzp17RJoN/UovORJN2XjNnCjAYq+jrg8fmGpEbuMIDhh3
	RU6I0E59TMmdTatmlwa/25dTjsYziRgvcT5CIdZA=
Content-Type: multipart/mixed; boundary="===============4528288922899738992=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 252.3 FAILED
Message-ID: <01010185177d0ea5-49fdf40c-b5b1-46aa-8ff1-fada4ed5efea-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:29 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174624

--===============4528288922899738992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *252.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-boot failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (08:33:45.442862)
NOTE: Directory listing: ['buildhistory', 'sstate-cache', 'downloads', 'workspace', 'bitbake-cookerdaemon.log', 'upgrade-helper', 'cache', 'conf', 'tmp']
NOTE: Retrying server connection (#1)... (08:33:45.611672)
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.

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
meta-yocto-bsp       = "tmp-auh-upgrades:29810d8bf57691b1665f98dc52f4dadc8fc9ff8b"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 13de548fca2d18d1f900d82201301a109accef25
WARNING: Command 'git rebase 13de548fca2d18d1f900d82201301a109accef25' failed:
Auto-merging src/boot/bootctl.c
CONFLICT (content): Merge conflict in src/boot/bootctl.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/systemd-boot
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/systemd-boot/systemd-boot_252.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4528288922899738992==--

