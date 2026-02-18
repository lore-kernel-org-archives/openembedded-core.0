Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C49C531D2
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1421.1771440099547804679
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HrqlUW7F;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=OvPOqAuJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c720ece81-b7ab8eac-2702-4d06-8f69-00cdbe191d9b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440099;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z/dueBt8eREVcgRCV9sJ7t/VP4ReOrGChwdiujMET58=;
	b=HrqlUW7FK4mmbrOM5WqNYgFApwzyxsfOinMZ66WuV8TVkwOtPSLswq8aC5eEq1zv
	Wz6jTAshYzUuTvraTf753xBV3t82fXCY6S0fE4fgvGSaGyYLNPdzu89YNOOXhCZbVuC
	dBpGDX4uJ8v5ws0UvJF6q7DPI9NxK3fnH8vILpbo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440099;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z/dueBt8eREVcgRCV9sJ7t/VP4ReOrGChwdiujMET58=;
	b=OvPOqAuJZ9JQZbj+I6f4MO7hILO4HabEibDkVDo2W6Bmmf7meC/s5VybqI+X+yau
	YBOI+TRp7HPfz+kekB1v30zSkbi1V0xFj937/yq4xntK8KsVq6PXaYs0CvT1Hh0eqBm
	GvrE5APyzEpgXjTOZp13JkK4+3qQC6rJT7nKHi6I=
Content-Type: multipart/mixed; boundary="===============8156884600871922899=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] socat: upgrading to 1.8.1.1 FAILED
Message-ID: <0101019c720ece81-b7ab8eac-2702-4d06-8f69-00cdbe191d9b-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231339

--===============8156884600871922899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *socat* to *1.8.1.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe socat failed.
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
DISTRO_VERSION       = "5.3.99+snapshot-142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff"
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
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1953 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://www.dest-unreach.org/socat/download/socat-1.8.1.1.tar.bz2...
INFO: Rebasing devtool onto 4a341d382601b8a880a0950671382f45493ef604
WARNING: Command 'git rebase 4a341d382601b8a880a0950671382f45493ef604' failed:
Auto-merging xio-netlink.c
CONFLICT (content): Merge conflict in xio-netlink.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/socat
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/socat/socat_1.8.1.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8156884600871922899==--

