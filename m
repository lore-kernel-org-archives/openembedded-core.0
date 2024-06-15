Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50780C52CD8
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:31 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.18609.1718475799137046325
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gKvJ0sD/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CzfqJ7pw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101901d23b7bc-c0e6181e-ed6c-48c6-9f8a-dff6ec45f273-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9PfzEQEVgrTFifXTXj8Pwd+q2krZAyvOeQS6lXt2k7E=;
	b=gKvJ0sD/k6xT4gnQO6FbaSPm1c7wx64iHKiKaI0Oc8u398GWi2F0BKst32zqMVug
	f9Nk6ShOXNqnC+eblvvdoCGrwwunN+0v/AaPBRXJ02YlsGooGgXdaL2P9J2Oujfzwbm
	UZtJte7eClVsrmADt+l7hJIBvmY/vtg19AczC8z8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9PfzEQEVgrTFifXTXj8Pwd+q2krZAyvOeQS6lXt2k7E=;
	b=CzfqJ7pwjjSPcbiVT8UvL8dIK4GeIFf7/KHeSjJzA8AHoHN5Kev3JuaKOmNHYnqt
	ea+jYbzPOwr4W3/JWKDuqC5DhADyaHcmlBKrV9B0w0ZRihubAy2ucgX51/5q7v3PYY6
	iJR+UWpKa+jbDoxF7PRcSacaL+SXBzfxK7deXH94=
Content-Type: multipart/mixed; boundary="===============1906055504001704483=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd: upgrading to 256 FAILED
Message-ID: <010101901d23b7bc-c0e6181e-ed6c-48c6-9f8a-dff6ec45f273-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200683

--===============1906055504001704483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd* to *256* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-02ed16691eb2b434f9c18ee73d7eea240df0c126"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:02ed16691eb2b434f9c18ee73d7eea240df0c126"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 5c79cdec10a547a866764a66e1e14898112a00cd
WARNING: Command 'git rebase 5c79cdec10a547a866764a66e1e14898112a00cd' failed:
Auto-merging src/network/networkd-neighbor.c
CONFLICT (content): Merge conflict in src/network/networkd-neighbor.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto 5c79cdec10a547a866764a66e1e14898112a00cd
WARNING: Command 'git rebase 5c79cdec10a547a866764a66e1e14898112a00cd' failed:
Auto-merging src/network/networkd-neighbor.c
CONFLICT (content): Merge conflict in src/network/networkd-neighbor.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd/systemd_256.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1906055504001704483==--

