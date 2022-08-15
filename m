Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0ECC3276F
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.6458.1660589820502485010
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZP4qsAsc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010182a2ddc493-3e5f3d7b-172f-458c-8080-cb1c232db5d9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YnSovvM+xYRVRgn0dBPAZ2jEc0hNrB2FoyLEeKksn5I=;
	b=ZP4qsAscpRh2+HqMhPOy9mgEoaEpYmD1WI+V/SFLZR/wgOYYUGBpbNCfbA/HJJFA
	Anf46a2AYh67PrJEg+OKHjNkPos3nF20eTcqgwSVNXPxlVFH/vTxgrPrkWA67hID2bU
	GRQDtfWC/nNH7UHZQ0b0/t/vkeKVi1G94LAVLLl0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YnSovvM+xYRVRgn0dBPAZ2jEc0hNrB2FoyLEeKksn5I=;
	b=Uhiitlp1DVxfGuudurOv/O5ABkylEdG9w1oCXun/pvSfI2IV8TiuCb1mE0S8jrny
	YMQS3x3hAi/bCFanhdSoNiT+EEug1BUnnr3N2HTSCIOLnev/vSRA1++Q2eN/SNsz412
	hiEbdiaMrxttP3ZeJwh5TPTyP/bi6gVCY+EyIncU=
Content-Type: multipart/mixed; boundary="===============0594249480128032560=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcgroup: upgrading to 3.0.0 FAILED
Message-ID: 
 <01010182a2ddc493-3e5f3d7b-172f-458c-8080-cb1c232db5d9-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:56:59 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169367

--===============0594249480128032560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcgroup* to *3.0.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libcgroup -V 3.0.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-832312428027d455c3bd01737de97b2a2e617e94"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:832312428027d455c3bd01737de97b2a2e617e94"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (883 cached, 2 parsed). 1659 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-832312428027d455c3bd01737de97b2a2e617e94"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:832312428027d455c3bd01737de97b2a2e617e94"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://github.com/libcgroup/libcgroup/releases/download/v3.0.0/libcgroup-3.0.0.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/libcgroup/libcgroup/releases/download/v3.0.0/libcgroup-3.0.0.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-svzr47cd/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-svzr47cd/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-svzr47cd/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-svzr47cd/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-svzr47cd/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-svzr
 47cd/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libcgroup-3.0.0.tar.gz.tmp -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://github.com/libcgroup/libcgroup/releases/download/v3.0.0/libcgroup-3.0.0.tar.gz' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/libcgroup/libcgroup/releases/download/v3.0.0/libcgroup-3.0.0.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-svzr47cd/work/temp/log.do_fetch.544797
ERROR: Failed to fetch URL https://github.com/libcgroup/libcgroup/releases/download/v3.0.0/libcgroup-3.0.0.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0594249480128032560==--

