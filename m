Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F9CD5E156
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:50 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17389.1765872134497055278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dNns+5hn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WmogEFx1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262ed4ff-5513a80b-ac11-499b-8a24-7b50325a3f41-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872162;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vLMHXxumB8ZtygBOLHRkVE0ybRnLW1GgR4pGTQ2qDOs=;
	b=dNns+5hnyA/Oum5/wHuJby6PbrUWaMnhPIlnJyekh0sgh3NSAaQwSY0erHDDcDK3
	fh+xzHoMx1Sv7m8p62OdmCslfse65fIx1o3EoXpJE7Zz26+EGB4GIW86XWgqx6idnAw
	2xlpeNI1rBoiwmrA93WZLPUZeH5ES5Pto26QBE7U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872162;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vLMHXxumB8ZtygBOLHRkVE0ybRnLW1GgR4pGTQ2qDOs=;
	b=WmogEFx1LfDXg8sovdmRf5258kuey3T4mk+8CrC896WEVUnKqNMnO835lo68v/Ox
	/3XADNiNmES5pY8twxgT1d2EuMXsY6dMD7f0WQkXxGi3VciINS1SsgK42a+99MS4hIw
	lrClHXMvxx+fHa59NGnos+7QfOuHNdjG3/tBGzyo=
Content-Type: multipart/mixed; boundary="===============4145830371458168099=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.30.1 FAILED
Message-ID: <0101019b262ed4ff-5513a80b-ac11-499b-8a24-7b50325a3f41-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227881

--===============4145830371458168099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.30.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libinput failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-e6d21004501eca14cc12ef8596f97ce89f7e45a7"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:e6d21004501eca14cc12ef8596f97ce89f7e45a7"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
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
INFO: Rebasing devtool onto baf1ceca88b3a668dd263f50bfaddfd205306028
WARNING: Command 'git rebase baf1ceca88b3a668dd263f50bfaddfd205306028' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libinput
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libinput/libinput_1.30.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4145830371458168099==--

