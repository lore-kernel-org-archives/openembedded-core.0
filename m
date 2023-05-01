Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060C4CA9EC7
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:05 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.107422.1682976349634992511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fQaZkCUs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010187d93529fb-056fdf30-8783-4d22-bdf9-f15fe4ddf667-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976352;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=INK9V3+k0syXB5e/Bmtk5HJ2f4y17Tl9pr1dpnSlJPk=;
	b=fQaZkCUsAxMGNXxxQAIYYLybUFGOda2GXEZou6CZ5B1KAssmyimkA1YzvcJPiMxr
	0xMdGCLPTagBsWwyWylcedHHOb/zCSPBAUPQT+am82VhUM/qTOqsQqpp3B3eSeso+JU
	x0ZRVrTPOr756htJeVggGYLwM9+Fov280xLc1Lx8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976352;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=INK9V3+k0syXB5e/Bmtk5HJ2f4y17Tl9pr1dpnSlJPk=;
	b=jH3RjIYvaUwpg1xDBBq+LUG6/fVWD3QNm+eRVzrnJ1CHokNGK3gUctZLjjrXRNU1
	yUealAdb0JuJQZ11+IOvVZuUATo/gH/d8ym+KUrjwZ21T5xzOJe0OSruR9aBDmds/Rx
	G2G4XoS5WnRoBrPiSg199zKzAipY7yiBecx4Dr9w=
Content-Type: multipart/mixed; boundary="===============7465241934662331448=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xinput: upgrading to 1.6.4 FAILED
Message-ID: <01010187d93529fb-056fdf30-8783-4d22-bdf9-f15fe4ddf667-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180665

--===============7465241934662331448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xinput* to *1.6.4* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade xinput -V 1.6.4
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (18:42:51.189722)
Loading cache...done.
Loaded 1799 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c0741e620d652b998337a0f32e39ab4e2d6e7769"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1800 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c0741e620d652b998337a0f32e39ab4e2d6e7769"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://www.x.org/releases//individual/app/xinput-1.6.4.tar.bz2, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.x.org/releases//individual/app/xinput-1.6.4.tar.bz2...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-ossbyxm0/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-ossbyxm0/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-ossbyxm0/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-ossbyxm0/work/recipe-sysroot-native/usr/bin:/home/
 pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-ossbyxm0/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-ossbyxm0/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /home/pokybuild/yocto-worker/auh/build/build/build/downloads/xinput-1.6.4.tar.bz2.tmp -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://www.x.org/releases//individual/app/xinput-1.6.4.tar.bz2' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://www.x.org/releases//individual/app/xinput-1.6.4.tar.bz2')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-ossbyxm0/work/temp/log.do_fetch.2310244
ERROR: Failed to fetch URL https://www.x.org/releases//individual/app/xinput-1.6.4.tar.bz2


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7465241934662331448==--

