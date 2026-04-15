Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6F1F42111
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:37 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19729.1776261867843336968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mnWkQJIL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EyFPrcrj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d917525f2-056477bc-12ae-441e-a78a-f4c29c09698a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dpFndSqCD1pWiaj8XEmNI8c6dXGvBX187XPXV8JuwPg=;
	b=mnWkQJILUmmRrZGMV/9sIXaxDnf/mFBFU5lHpT/xPNVIMUPkuVZkPXX+iTsD9XiT
	HTlEIrKVYaPSsygBPd+pvVT3nYEoc+Zc6Z6jEZqm4N0JqNtuIWcApgceV3/wbh2EDgu
	wh+xUZ4u92U0PZYbscnUgXG5YcrKlGoOuHGkBa+U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261867;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dpFndSqCD1pWiaj8XEmNI8c6dXGvBX187XPXV8JuwPg=;
	b=EyFPrcrjMP0t5+9Fbd5ZRqy8dUokhWnoNM6g4jtOPYh87o4b+TPf8+6vTCkfbiQS
	VaqRgsgAnHaNBG6Z5DF38DpoIRs2ygIgMersnEUeOH9CMY1631++K6ugtL7VLFUneZ8
	c55omHcbr88nv4xK5yanQV20Zq+GbA2A2sJ2e0uA=
Content-Type: multipart/mixed; boundary="===============1371373697401178536=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>, 
	Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>, 
	Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 systemd-boot-native,systemd-boot,systemd-systemctl-native,systemd: upgrading
 to 260.1,260.1,260.1,260.1 FAILED
Message-ID: <0101019d917525f2-056477bc-12ae-441e-a78a-f4c29c09698a-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235201

--===============1371373697401178536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-boot-native,systemd-boot,systemd-systemctl-native,systemd* to *260.1,260.1,260.1,260.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-boot-native failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1973 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-274ce0c0d73fd82b63c522580aed9dbac51ba09c"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:274ce0c0d73fd82b63c522580aed9dbac51ba09c"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c0a5a2516d28601fb3afc1a77d7b42fcfe38fced
WARNING: Command 'git rebase c0a5a2516d28601fb3afc1a77d7b42fcfe38fced' failed:
Auto-merging .semaphore/semaphore-runner.sh
CONFLICT (content): Merge conflict in .semaphore/semaphore-runner.sh

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-boot-native
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-boot-native/systemd-boot-native_260.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1371373697401178536==--

