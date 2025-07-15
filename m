Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829CFC87FD3
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:50 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.12482.1752594935884226447
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lrJo6LHT;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ccgWZ3ms;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101980ecc8629-4bc3c21a-0671-40c6-b2cf-26041170dec7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594942;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3Nql/BwYVCa4iWy+AlVpl/zjTV0mwpS5KGW1Tgpikvc=;
	b=lrJo6LHTqeaGDVC7MjidyCapOExMlXjCEjZ5j98nuy8fPRfLZhX3mBuzr4O4VSvU
	H7U1BF2GQHJP/agocpYwTVhZBvk3njL0SJnhMyB9fnslfDW7OYU0dvD7572bUNEiCYk
	KBgvxrlBgYkVdO8RbBjlj/O8fMIqlk/8JQVO0S+8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594942;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3Nql/BwYVCa4iWy+AlVpl/zjTV0mwpS5KGW1Tgpikvc=;
	b=ccgWZ3msS04oli5KPTfcrD/wAzAwrkOExJylCpplRLXYJOWUs93CjsSFDdmpI0wx
	/KOmHleFa4v10JGffQzjIS7dL8pzGIxFkVtO7g9NnRmrwK/D11Pb6aKOd2Mk69Hlf5O
	f+c4IUJI16ePsXBh86lI4NGY0wyx3fuhyFR6FA38=
Content-Type: multipart/mixed; boundary="===============4634102464596237528=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 6.1.1 FAILED
Message-ID: <010101980ecc8629-4bc3c21a-0671-40c6-b2cf-26041170dec7-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220348

--===============4634102464596237528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pbr* to *6.1.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-pbr failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1928 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-6a36256f2f3224163000f081e71c727591c2c19b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6a36256f2f3224163000f081e71c727591c2c19b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (0 cached, 942 parsed). 1929 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-6a36256f2f3224163000f081e71c727591c2c19b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6a36256f2f3224163000f081e71c727591c2c19b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/p/pbr/pbr-6.1.1.tar.gz;downloadfilename=pbr-6.1.1.tar.gz...
INFO: Rebasing devtool onto a7d34a7786f3fb8f7218db4eaf3fb09c9f168c61
WARNING: Command 'git rebase a7d34a7786f3fb8f7218db4eaf3fb09c9f168c61' failed:
Auto-merging pbr/tests/test_integration.py
Auto-merging pbr/tests/test_packaging.py
CONFLICT (content): Merge conflict in pbr/tests/test_packaging.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-pbr
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/python3-pbr/python3-pbr_6.1.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4634102464596237528==--

