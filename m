Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DE6E7716A
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.33342.1734254979034905323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hxW95FS1;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=RFXn0Nt7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010193c9a6e482-946e6f88-cc0c-406d-89ea-099f6f377821-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254978;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xuWYIkYik6G0Eb3VxixdJuCPrp4f8NSleIofGLQ9GbI=;
	b=hxW95FS1LYG8g+diyIjvlqcxa+4tLd6EAe0xRtyvOgkYnzS/9JuekYRuvUsBTCQV
	ffvz5IgxrtSZKBZofrvZlJeZWleE57YUZ4UHF8OSdkqWtiq+dhHi0i8M2N/t5JGTZdc
	DjvJZ+m07miqoSWgietmBma6byDXvtsa0vPeOfAY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254978;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xuWYIkYik6G0Eb3VxixdJuCPrp4f8NSleIofGLQ9GbI=;
	b=RFXn0Nt7WS5GO6X4RzvLok5S3prnarrtFdVffFHfb3u4WwxQ0Mq/TBMW8OWYOujS
	nWu69f1Sghf818oSMKqfcJLIJZDgGo8vOXqC93AQptOz8Xe869Gc31EA+oAw3erovMb
	bfhe6T4qM018qm4p1XiwoOOChqGsVy2GBZcq6qCg=
Content-Type: multipart/mixed; boundary="===============2720127043853927969=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>, 
	Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd,systemd-boot,systemd-boot-native: upgrading to
 257,257,257 FAILED
Message-ID: <01010193c9a6e482-946e6f88-cc0c-406d-89ea-099f6f377821-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208705

--===============2720127043853927969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd,systemd-boot,systemd-boot-native* to *257,257,257* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade systemd -V 257 -S 70bae7648f2c18010187c9cf20093155eaa26029
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cc5e3503e4437358efa8c5675e02f5e19430c58f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 70bae7648f2c18010187c9cf20093155eaa26029
WARNING: Command 'git rebase 70bae7648f2c18010187c9cf20093155eaa26029' failed:
CONFLICT (modify/delete): mkosi.images/system/mkosi.sync deleted in HEAD and modified in 8abb2e0f55 (mkosi: Don't touch the packaging checkout if work is being done).  Version 8abb2e0f55 (mkosi: Don't touch the packaging checkout if work is being done) of mkosi.images/system/mkosi.sync left in tree.

INFO: Rebasing devtool-override-libc-musl onto 70bae7648f2c18010187c9cf20093155eaa26029
ERROR: Execution of 'git checkout devtool-override-libc-musl' failed with exit code 1:
error: you need to resolve your current index first
mkosi.images/system/mkosi.sync: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2720127043853927969==--

