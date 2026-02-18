Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C19AC531D1
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:48 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1408.1771440093928930767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=q/aQI3+d;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=l5iv9bQe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019c720ed253-1c2a0b93-d257-4695-b9f9-bd7fbaef2fa0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440100;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GZuDhxA7RTyBXe6hxl+cISrrkfa4dI6X4iHnhf0HklY=;
	b=q/aQI3+dqJJgoeDPB79vkIvvje3hCQcHIdy9cjFredx4lHyg2vrx+Hb7pdIIQiYb
	/0DzN5lOEzLkqV72bRsRdu2ASjC3OSam4i2hnZVja903kqs6wgm+SpTZh25VX16hU13
	Q6zyhVtP6pZTvcWFw8Si+DOg6y3HMgc0Kam+lodo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440100;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GZuDhxA7RTyBXe6hxl+cISrrkfa4dI6X4iHnhf0HklY=;
	b=l5iv9bQe56RwlDDHBdMQITdxyXAnjGonRsLipgv4GuSpYUh+vx17Ike/v0VHWPf+
	yG5cN+ouAX2C4JdNPnc0DQxkGizaWM2/+1nkp3A0v8mdp6QzT211GhdMAE3AhV2a0wY
	tPa1PrtyYLAyyDe/0+5ysk1FbB6DBEWxhIe4LWW8=
Content-Type: multipart/mixed; boundary="===============8141287709186357625=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dpkg: upgrading to 1.23.5 FAILED
Message-ID: <0101019c720ed253-1c2a0b93-d257-4695-b9f9-bd7fbaef2fa0-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231343

--===============8141287709186357625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dpkg* to *1.23.5* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe dpkg failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-a7cdccc477fc9a856f0bf28e739fd13181790203"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:a7cdccc477fc9a856f0bf28e739fd13181790203"
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
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 89f266325cc8b5b7fd1ee417b78d498ee189565b
WARNING: Command 'git rebase 89f266325cc8b5b7fd1ee417b78d498ee189565b' failed:
Auto-merging debian/changelog
CONFLICT (content): Merge conflict in debian/changelog

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-native onto 89f266325cc8b5b7fd1ee417b78d498ee189565b
WARNING: Command 'git rebase 89f266325cc8b5b7fd1ee417b78d498ee189565b' failed:
Auto-merging debian/changelog
CONFLICT (content): Merge conflict in debian/changelog

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/dpkg
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/dpkg/dpkg_1.23.5.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8141287709186357625==--

