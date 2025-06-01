Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A28FC61CE5
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:33 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.27792.1748786130376862971
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TgzVrHdp;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dxD0xVv7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101972bc6abc9-3e248058-ebf2-4c95-ae49-6347e2ba61d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786129;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Qjo12CK1uZ1bWHCm6XRE9YiQqAA98Bk4Ak5zYklms/o=;
	b=TgzVrHdpkwVvmILFg1F7I92bL1cHNU6vh6ZiuiqTAHG5Da3+MQn0HcqPMVnIJplS
	D3aRJo4FcV2jZLj6xeHSHUV9za4McR4O7lNUBnQHTi/wncbgTVHK1D4RZyvPlFnQ5Nv
	hOoExxYw9TkMg41f8RNkXc89B+YItwP/FNyaQMyc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786129;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Qjo12CK1uZ1bWHCm6XRE9YiQqAA98Bk4Ak5zYklms/o=;
	b=dxD0xVv7syTmLMZhgZP5igoP0GeCH5BUQCQxzGJV7NnQGU08XAu+SZUvKju6I5sU
	u5rQE9o70Mqf+k8KECtHfplTPbhEOqibFR2cBn90vfbyYybwdWo/yiex2JspXSqZOYp
	/IW7HFiA6ZF5utwK5RIuZpnu05PPNBfsGzhV5eyc=
Content-Type: multipart/mixed; boundary="===============1458300100305780655=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] automake: upgrading to 1.18 FAILED
Message-ID: <010101972bc6abc9-3e248058-ebf2-4c95-ae49-6347e2ba61d7-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217585

--===============1458300100305780655==
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
Loaded 1915 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:6303bc8f03de226bbdfcf1d0bfc3b63e4c038f98"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 9 Mirrors 0 Missed 5 Current 15 (64% match, 82% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 80 tasks of which 66 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601083249.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601083249.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: Command '['rm', '-rf', '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/automake/1.17/devtooltmp-8778opym/workdir/sources-unpack']' returned non-zero exit status 1.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/automake/1.17/devtooltmp-8778opym/temp/log.do_unpack.3554195
ERROR: Extracting source for automake failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1458300100305780655==--

