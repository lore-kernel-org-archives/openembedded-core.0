Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249DAC531ED
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:50 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1426.1771440108777008579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=X4TiVUBw;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=R1VckOMP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019c720ef2a2-a558a157-790e-4fe3-bb99-99256b2f590a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440108;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hZTTbOnRrFcgdC6StOkgvbHiKWQzR7/CBXHq49sjVFI=;
	b=X4TiVUBwj6SIcOnvksLJzz1UaC6GpwMNVw9MDMqRcfNHFgOUTX6OorIlgnBEwyFh
	+GBMAZbl/5eJhKu0jSpMAdfc3ZoVlnnyBciHCGkKd98i7iOKRvPrmJQ2Tgb0bvqz4id
	DPXYPl+Y2amJzxkmEYx+tueZUzvGmD/k0u0cD+Ic=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440108;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hZTTbOnRrFcgdC6StOkgvbHiKWQzR7/CBXHq49sjVFI=;
	b=R1VckOMPq8awHkuFfxn4B9ICdEdG56bR5Hx7wCBmh7s9Ru09p9O9CGHYwYgJ4SpQ
	/O6ncLhTK4Lvh05uX/GmpQkCwnt/iWHn1AFX9ZCNSHSXyKLwCpAlVNmDKyh2SJxe8ro
	3t/NPM6YcQH/Cd+Dew+egaf0Cgp79xJPTR7btArc=
Content-Type: multipart/mixed; boundary="===============1506668263068446357=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] procps: upgrading to 4.0.6 FAILED
Message-ID: <0101019c720ef2a2-a558a157-790e-4fe3-bb99-99256b2f590a-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231376

--===============1506668263068446357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *procps* to *4.0.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe procps failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-cbe4cd727b4cadfe090ad83b8b12f51096c88e86"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:cbe4cd727b4cadfe090ad83b8b12f51096c88e86"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 4dafddf4c3f4646caa517f039a2307e92657ec93
WARNING: Command 'git rebase 4dafddf4c3f4646caa517f039a2307e92657ec93' failed:
Auto-merging library/readproc.c
CONFLICT (content): Merge conflict in library/readproc.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/procps
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/procps/procps_4.0.6.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1506668263068446357==--

