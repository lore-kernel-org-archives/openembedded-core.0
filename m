Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BC7C63704
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.46833.1669908628508602230
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HdCkScuR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010184ce4f8124-37e609a8-736b-4bb9-96e1-dc179ad17f52-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908628;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=KfG2czR1vzCLWzr0XJ6W78N/53+5PT9YjZDQROanrRc=;
	b=HdCkScuRMAyUS6HyqeBHdBz9wLAnYhQ82AqvrfaQye9nLW4pEn9n5/MQXXcsSveG
	3DHco/1hvzDoXQKcIOKxN2rClsiHDLA9VnmxAzjoDgBZKO/HTobwcUGlPo7oCx44AsL
	gwreZIy0DYMABai9MX4WfQduk32mwY1tV8IuSeBs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908628;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=KfG2czR1vzCLWzr0XJ6W78N/53+5PT9YjZDQROanrRc=;
	b=NEdUdUe+RziLNvgIs81wS+PBmSLUARCqEGZY7bMxfYhWHrEU1GZ7J/Em8rQ20heu
	8SzeAfFJA0w1DZG82dMgYAtWKoTEIrlEX2V9vI3bDKb4duWwF2YMDn0xmR57s4QJrvF
	HpHwhQOvYc2wgLzVc0/Gl23v3fU8wksFY1eF5Hy4=
Content-Type: multipart/mixed; boundary="===============0177784471060785581=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxpm: upgrading to 3.5.14 FAILED
Message-ID: <01010184ce4f8124-37e609a8-736b-4bb9-96e1-dc179ad17f52-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174183

--===============0177784471060785581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxpm* to *3.5.14* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libxpm -V 3.5.14
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1668 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
meta-yocto-bsp       = "tmp-auh-upgrades:9c1bc84b3b90d5991a72459e7facb5cbe51421e8"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 19 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1668 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (887 cached, 2 parsed). 1669 targets, 36 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
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
meta-yocto-bsp       = "tmp-auh-upgrades:9c1bc84b3b90d5991a72459e7facb5cbe51421e8"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://www.x.org/releases//individual/lib/libXpm-3.5.14.tar.bz2, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.x.org/releases//individual/lib/libXpm-3.5.14.tar.bz2...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-36w5tkux/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-36w5tkux/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-36w5tkux/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-36w5tkux/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-36w5tkux/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-36w5
 tkux/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libXpm-3.5.14.tar.bz2.tmp -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://www.x.org/releases//individual/lib/libXpm-3.5.14.tar.bz2' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://www.x.org/releases//individual/lib/libXpm-3.5.14.tar.bz2')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-36w5tkux/work/temp/log.do_fetch.679341
ERROR: Failed to fetch URL https://www.x.org/releases//individual/lib/libXpm-3.5.14.tar.bz2


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0177784471060785581==--

