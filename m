Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343E9C48BEF
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:54 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.63134.1702649863102937805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Pnt0nr+m;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JFauvNNp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018c6dd71833-ce1e7c3a-702a-4bc8-8a61-a7d3186af487-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=X/LyU0woaxF6hAV6Aaa2jLiIlLOMCJ99nmpIq29hDOM=;
	b=Pnt0nr+mDr03cc9cnGRZdRs+Uvy7GRMksob5Qv8IP6bIQlhlcNtJdGtKm0mFvDqG
	XktV9JAU1Mouos2sOszxvISTFCm2KgVWrLV9MicyXUYVCuoMPHPvLLZW3PsvRpvWzK/
	99p/wAf0gryYLDG6eRjbX4ezOvSn68MBNB4Fkg2U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=X/LyU0woaxF6hAV6Aaa2jLiIlLOMCJ99nmpIq29hDOM=;
	b=JFauvNNp9vjlkQM2Mq6vJortrmm1AwtU4axZWXacDDhvNAsRj6tLtIJ3RgpL/hSc
	FoJ1TJAhcgABpCEsnO9UXRM8sdmyqvENto8jIIqTttpYfzNo6xerb6EshohHL+C6Q2w
	xyARo0oOEN/TiVLAVM2epd0ecEVF49fZofMkVsyg=
Content-Type: multipart/mixed; boundary="===============2227827290212813290=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 255 FAILED
Message-ID: <0101018c6dd71833-ce1e7c3a-702a-4bc8-8a61-a7d3186af487-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:42 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192442

--===============2227827290212813290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *255* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-boot failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1842 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-63d160d3d0ef4c8e0f59a7b0265d2c77a4a022df"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:63d160d3d0ef4c8e0f59a7b0265d2c77a4a022df"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto db11bab38ccf1ed257f310d29070843d4c58ea01
WARNING: Command 'git rebase db11bab38ccf1ed257f310d29070843d4c58ea01' failed:
Auto-merging src/hibernate-resume/hibernate-resume-generator.c
CONFLICT (content): Merge conflict in src/hibernate-resume/hibernate-resume-generator.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-boot
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-boot/systemd-boot_255.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2227827290212813290==--

