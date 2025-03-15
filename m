Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20232C35FFA
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:31 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.10351.1742048287062527983
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fqMoEu3y;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Y9vocQWR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101959a2bad6f-128a26cd-57e9-4987-951b-ca9a0cf80e9d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rvTQhpl1KD+xhR3DFAMrM/hyJGo1b/lOGA3p35/gX3M=;
	b=fqMoEu3yhv9GzUCkwU7AidAzdJffFqBSihcYnQPt/DZ4quwLfDyO4G+g6EKMNNaw
	QzJRyCx6iR3OQo0lw8di1Y+O+POc6Gl38B4O8eEmY2FtYgQbcknbwIZfkPb4S09JwjG
	v3mojHCAQw723Hj7JbSuF/EHy7Mnmzq0hfhuu4mE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rvTQhpl1KD+xhR3DFAMrM/hyJGo1b/lOGA3p35/gX3M=;
	b=Y9vocQWRFH4g8mo3Du4L8k/fqLV5bkZoQlFe440mx0IjXAZ+Z2LXBbirM2j2MUJc
	DGFYr2alM9x2h/5ksPLDo+hdwO2PPHVQJsDtLXSbbC7oYu/5Z37hUdOlyoGtqqlyogH
	NGMs0bb1UtHgJZB9wU3BRLUpTAeEUAkRrnMPIx3c=
Content-Type: multipart/mixed; boundary="===============4138351973465771781=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] igt-gpu-tools: upgrading to 2.0 FAILED
Message-ID: <010101959a2bad6f-128a26cd-57e9-4987-951b-ca9a0cf80e9d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212944

--===============4138351973465771781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *igt-gpu-tools* to *2.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe igt-gpu-tools failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:69dad9250bd6c32fc8e0a5159d269cbaad8753a5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto e582faa38f9466303b4634a60053c3201dae9539
WARNING: Command 'git rebase e582faa38f9466303b4634a60053c3201dae9539' failed:
Auto-merging lib/igt_aux.c
CONFLICT (content): Merge conflict in lib/igt_aux.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/igt-gpu-tools
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/igt-gpu-tools/igt-gpu-tools_2.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4138351973465771781==--

