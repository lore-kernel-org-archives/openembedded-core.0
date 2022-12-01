Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEF0C63708
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.46764.1669908625680059198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TmOK6kqj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010184ce4f80e7-614d857b-7907-4dca-8ebb-caa9f717cb05-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908627;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=N+L9Hko51ir9h8GPFehpN82YMe35F2/S1c6RwxyLTtA=;
	b=TmOK6kqj63zJLUP2rgn+NLfEl0OadM1VPqYhH1A1e0iNC6gq+RhlypSKq1bMA+jP
	vnoE5js8b0Ag388DPAbWk38rr+GJ22i4WErhJAV2c3mhlHehleJDNOm2nbDwNUN1FNw
	BMmp8GHTVjq8UFfnY6POFXOnPf4mwzIfeRdXtH38=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908627;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=N+L9Hko51ir9h8GPFehpN82YMe35F2/S1c6RwxyLTtA=;
	b=WLSc/7p/bAzL8Uev9Pz5YRFTf256mo0bLzu4nKfDlj5GkiMSHB6gJDArW+D+Jr1T
	HThw800Jp+IRK73LZitwVSRVhmGAPcX02fEb9T0hHTPrAgZ3Ip0qAGnAswgliWPBXB1
	VSybiah2M27Axu4wYGIwRaFBabZyM6lzzkOgk4FA=
Content-Type: multipart/mixed; boundary="===============0912084208667847498=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxdmcp: upgrading to 1.1.4 FAILED
Message-ID: <01010184ce4f80e7-614d857b-7907-4dca-8ebb-caa9f717cb05-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174177

--===============0912084208667847498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxdmcp* to *1.1.4* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libxdmcp -V 1.1.4
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
meta-yocto-bsp       = "tmp-auh-upgrades:cca26c582e463411689b947d1294c277b6741c6b"
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
meta-yocto-bsp       = "tmp-auh-upgrades:cca26c582e463411689b947d1294c277b6741c6b"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://www.x.org/releases//individual/lib/libXdmcp-1.1.4.tar.bz2, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.x.org/releases//individual/lib/libXdmcp-1.1.4.tar.bz2...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-atlla8kq/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-atlla8kq/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-atlla8kq/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-atlla8kq/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-atlla8kq/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-atll
 a8kq/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libXdmcp-1.1.4.tar.bz2.tmp -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://www.x.org/releases//individual/lib/libXdmcp-1.1.4.tar.bz2' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://www.x.org/releases//individual/lib/libXdmcp-1.1.4.tar.bz2')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-atlla8kq/work/temp/log.do_fetch.622697
ERROR: Failed to fetch URL https://www.x.org/releases//individual/lib/libXdmcp-1.1.4.tar.bz2


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0912084208667847498==--

