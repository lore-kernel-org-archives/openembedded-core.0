Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5053FC83026
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.8885.1749993276379478281
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=glpIemAB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Xcp2on+G;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019773ba5a1b-4f9da182-4652-4b4f-b764-4d1fab97a412-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993282;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hHCijJkV0kFJaF2k44HJ6pg1XVLMWE37Z+zilPp8tg0=;
	b=glpIemAB/5DCwz+wdtqn3yBJeFj7ONLzUqACUATJvTy4wlL/tOHnUcfgFIzmZsCD
	HDpje5Mn4KDJIxndLTHFGIZN+x3uG9ZuCnD7DmNEDXa6u/ZAquKwC9vSVpY33ikmKn8
	H7hf/Pme19Lv6K8vPR5EDIQBI1RI8vNFyjtv5CGU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993282;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hHCijJkV0kFJaF2k44HJ6pg1XVLMWE37Z+zilPp8tg0=;
	b=Xcp2on+GONiDEEzMv/MRafUCD40nWZZMVZTDxJG+9YABa+gQslq3lpROYkQfjZPU
	OzguCmOugETCNOQXpXF8gy2igiC2iQfvbvkBspdrAQC8p4PTtP+oXjL+4pEhJizwQKn
	kIic3beBWdkbtfI033kuqh4J4V1OuX97w2qaoQF8=
Content-Type: multipart/mixed; boundary="===============5863225419747016017=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] automake: upgrading to 1.18 FAILED
Message-ID: <0101019773ba5a1b-4f9da182-4652-4b4f-b764-4d1fab97a412-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218665

--===============5863225419747016017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *automake* to *1.18* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade automake -V 1.18
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1910 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d8864ad51c3a413af84b775b11df2ca5a9ebf35c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 9 Mirrors 0 Missed 5 Current 15 (64% match, 82% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 80 tasks of which 66 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615073005.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615073005.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: Command '['rm', '-rf', '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/automake/1.17/devtooltmp-mias5ycp/workdir/sources-unpack']' returned non-zero exit status 1.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/automake/1.17/devtooltmp-mias5ycp/temp/log.do_unpack.627560
ERROR: Extracting source for automake failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5863225419747016017==--

