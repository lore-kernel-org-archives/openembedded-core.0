Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FD9CD1293
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:35 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2358.1762384582025820205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=sWBvXqxd;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=GvwlVfY5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a564ec373-cb4c1c88-8347-4da9-ae0a-c03ca6556198-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384593;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7fd75aJ0P/3zHc/H1FP5wImuuc6E1xHsmOwMKeiIpUI=;
	b=sWBvXqxdMn+SoKePnL8ZZ6FbE+TbFT5UKkj1vkKRKjPhyYR00MhJA8Lw2RXhBsm/
	ZWK+B07fcNpTBiLvE6dWJrDrYCZYr1sG0GHDG2Osia9YAR7+0jUknO2ilMP4CHOgg2Z
	UcxiuQrAI3AOX2s2O+DMXjrJW0b/oys3HUNxs4JQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384593;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7fd75aJ0P/3zHc/H1FP5wImuuc6E1xHsmOwMKeiIpUI=;
	b=GvwlVfY5TwYvdPLwkDlkMoPjikC8ChLhx+jpjTTW7wuVmkymRko1Z++fkZxcxfOb
	BffCq+y9MYdGrv3f1THrPN7agIUFOyKC2uP+xrga4NjPgQL4b1AqST4afgHoXoKCbfx
	hIBGUah+G5UgwYu0ZR13hIBU3N8gaBb9G6egT7es=
Content-Type: multipart/mixed; boundary="===============2368908987642973906=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to
 7f05d217867b2af52b0a28c6d1c91df97e1b5b39 FAILED
Message-ID: <0101019a564ec373-cb4c1c88-8347-4da9-ae0a-c03ca6556198-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225859

--===============2368908987642973906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-helloworld* to *7f05d217867b2af52b0a28c6d1c91df97e1b5b39* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 7f05d217867b2af52b0a28c6d1c91df97e1b5b39
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
DISTRO_VERSION       = "5.2.99+snapshot-55dd7706b24a3b238cf7b96c29793a7933c057a0"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:55dd7706b24a3b238cf7b96c29793a7933c057a0"
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
ERROR: Execution of 'git checkout 7f05d217867b2af52b0a28c6d1c91df97e1b5b39' failed with exit code 128:
fatal: unable to read tree (7f05d217867b2af52b0a28c6d1c91df97e1b5b39)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2368908987642973906==--

