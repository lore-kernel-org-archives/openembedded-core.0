Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5EDC64EC6
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.46813.1669908626075548703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LUHPAisj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010184ce4f77eb-80b08389-c225-4252-8844-c7baacf0b11b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WdZAIGxm4oXXemj+jqMlTuh8I29Pvgv8x85fzmEdcQE=;
	b=LUHPAisjgAwQ7BvPhcIXm5TkOrBSvVGEfpmAyorjzykQBBMmSNm3E0hKgh652eaK
	Z2JJBdxNUrAb3kKoaF9roHaSamG77hjBNqtoQpWnHbHxxGPjz2zkHCJRJNQXt/2x0ug
	MOXB5HTzyNWEeW+6Sd6kzZGd8ztasCMbcIr7PWl0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WdZAIGxm4oXXemj+jqMlTuh8I29Pvgv8x85fzmEdcQE=;
	b=KFVOWFs43c5cbrQL9Udkou0K2V2BH9mZrldWn53tgavyzo97i1WebN0RHT/C765Q
	mIYVbQgQevyfOPsYPFwiSMIz78fLJH0vwGegtWQF8X4CTepMPBU3cVeCOX+QiKxfnPs
	1TqvLYAb5SiQmFR5kNh6+dcqzK7bus8kBfVPnsOo=
Content-Type: multipart/mixed; boundary="===============4654931644849248813=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to
 f992bcc08219edb283d2ab31dd3871a4a0e8220e FAILED
Message-ID: <01010184ce4f77eb-80b08389-c225-4252-8844-c7baacf0b11b-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174128

--===============4654931644849248813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-config* to *f992bcc08219edb283d2ab31dd3871a4a0e8220e* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gnu-config -S f992bcc08219edb283d2ab31dd3871a4a0e8220e
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1668 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0aede34021ef146ea65b67018949f13edefd8fda"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 8 Local 0 Mirrors 0 Missed 8 Current 12 (0% match, 60% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
Log data follows:
| rm: cannot remove '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20220927+gitAUTOINC+20403c5701-r0/devtooltmp-okbqoy4d/workdir/git/.git': Directory not empty
NOTE: Tasks Summary: Attempted 56 tasks of which 51 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
ERROR: CalledProcessError(1, ['rm', '-rf', '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20220927+gitAUTOINC+20403c5701-r0/devtooltmp-okbqoy4d/workdir/git'])
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20220927+gitAUTOINC+20403c5701-r0/devtooltmp-okbqoy4d/temp/log.do_unpack.915166
ERROR: Extracting source for gnu-config failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4654931644849248813==--

