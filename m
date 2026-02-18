Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5ECC531FB
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:01 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1419.1771440097995604526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VxDAqXN1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CesO5G+t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c720f06be-88e0663d-5c3d-410d-bd7d-492cda1ef979-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bDzaqKfYaKNYbyeZDF21pPMwHC+Tw3pCwLPx75l2qJ0=;
	b=VxDAqXN1/qVDKHlvc6HrOh2gwzEoGu1ADu/uX9OksRLqoFcoIvwvtBIKMCyiGDhQ
	GxD+oW1oJdZQXjQV4waYgQCu0k3XKY4sn8JOAJPp+OZ3pHc2VLQq7HLX6N7W0FHRK17
	/17HMiSa0ZQbuOPQPAYgvDtKCVTGdyzkbmXx/2bs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bDzaqKfYaKNYbyeZDF21pPMwHC+Tw3pCwLPx75l2qJ0=;
	b=CesO5G+t5c7/xqQWH4mVA8UqDL5zpAPQTqEvlY7bwjHck/gYJaHOC3za0dbEdx3p
	fWGE0RP3EWsEK1wecgprmpTxPSgNPVz1MZQq5V40uMpZ0iZQaG583Xzi54P9YdbUSg1
	A6oAQaoWGRoSuBRyxgB2KB7xHua7VJtfxlx7R7IY=
Content-Type: multipart/mixed; boundary="===============5856736028408113092=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.1.2 FAILED
Message-ID: <0101019c720f06be-88e0663d-5c3d-410d-bd7d-492cda1ef979-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231399

--===============5856736028408113092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *appstream* to *1.1.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe appstream failed.
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
DISTRO_VERSION       = "5.3.99+snapshot-cfa0e973f9a60ba19cfdc2b0a197c6743c7179be"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:cfa0e973f9a60ba19cfdc2b0a197c6743c7179be"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
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
DISTRO_VERSION       = "5.3.99+snapshot-cfa0e973f9a60ba19cfdc2b0a197c6743c7179be"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:cfa0e973f9a60ba19cfdc2b0a197c6743c7179be"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  49% |#################                   | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.freedesktop.org/software/appstream/releases/AppStream-1.1.2.tar.xz...
INFO: Rebasing devtool onto ef0433afe0fe1c15706a4d02fef2a8ff8cd1a8c9
WARNING: Command 'git rebase ef0433afe0fe1c15706a4d02fef2a8ff8cd1a8c9' failed:
Auto-merging qt/meson.build
CONFLICT (content): Merge conflict in qt/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/appstream
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/appstream/appstream_1.1.2.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5856736028408113092==--

