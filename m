Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D2EC531C6
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:01 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.88849.1705340029609555607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KHxALyri;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mcvKM9jK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018d0e2fc6ec-4f75c331-3a15-4b34-8667-cc090817562c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=e3/xHt/D25FKmzalL06O8NaaBDg2xq4rB6uoHid+fxQ=;
	b=KHxALyriMy5LTUWPpP6IflnfvOAWnd/qOWJVatyrDIXlyCs5eWD3iM3PCECI2Kyx
	Biqo0+PuuwmoDhR452aWJxFCwIBgMV2plLsUD0N5WXrDCBGafL7Skhi3dRaZ7RIz9V8
	GckSeZwe37n980QlIH1YjShmIRPnyJxzCX5tOFHo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=e3/xHt/D25FKmzalL06O8NaaBDg2xq4rB6uoHid+fxQ=;
	b=mcvKM9jKU3GAiMpPEng/+xnD15XTAfU3S/AGB7GFJa2dIFQdraycQotR6D3tqcnH
	rs87EjHue/TYQITlPeEzAGssThhMz6uf0bQjg2HMeb30g/SMqDMrusDwLbalGvmKe8M
	E2NCg6zwSVwQL2J47q5SJ1ZF9Tgqj8sZteGA3spk=
Content-Type: multipart/mixed; boundary="===============2292010455229256616=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 255.2 FAILED
Message-ID: <0101018d0e2fc6ec-4f75c331-3a15-4b34-8667-cc090817562c-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193712

--===============2292010455229256616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *255.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-boot failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1850 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-4ce0874089de9ae1273f987a837ec9ecfabb4e5f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4ce0874089de9ae1273f987a837ec9ecfabb4e5f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 2c9e1ae02a74bd5383065885941aa272bbe0d1f8
WARNING: Command 'git rebase 2c9e1ae02a74bd5383065885941aa272bbe0d1f8' failed:
Auto-merging src/hibernate-resume/hibernate-resume-generator.c
CONFLICT (content): Merge conflict in src/hibernate-resume/hibernate-resume-generator.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-boot
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-boot/systemd-boot_255.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2292010455229256616==--

