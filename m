Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7A6C19F4F
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:07 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.10495.1688227322864681781
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KQE4aJwH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010189123098d6-2ecad3e6-c66c-4c5d-ad83-f594939c517f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2A117LiofxihRRbUzkk+gHlg9BJf0ueTHSpH6zu0U40=;
	b=KQE4aJwHdIxuU0NgMY4fmXIUD7wu8Zs6VHv2mAj+hTkfuo9sxVoHXqGSyYS9i7kH
	EA0z4Ksaj3FpCgBse9kkTrMo4abUoy9POLZuWNKKhslkeFWMpEQwGMq9veWAlPS27jG
	XbnoVm3Jjq6fJtVTVC+Ywy/XPZ9nTHYB1JHBKJKA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2A117LiofxihRRbUzkk+gHlg9BJf0ueTHSpH6zu0U40=;
	b=rdYoOYfP//ttPSt0Vodhfpsxn+ZywADMc8LIUftoEqFn2dcUYASKe50Bw9Zc+Z8Q
	nl+0EjKhAnGKWBXSPFMNRYnf/xkTSAVbwCVkFME5U9QMAhvN2fU/4ln/I47lvG8byO2
	0oNFstMQqJ9AdlHiH2llOWqCihi+T1ABSbEZ/XRI=
Content-Type: multipart/mixed; boundary="===============3817471897757555020=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.2.0 FAILED
Message-ID: <01010189123098d6-2ecad3e6-c66c-4c5d-ad83-f594939c517f-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183716

--===============3817471897757555020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *1.2.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade meson -V 1.2.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (08:39:35.707309)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1799 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:451e61319c73897ba8744cbef0ebeaa4f1aa446a"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 3 Local 3 Mirrors 0 Missed 0 Current 17 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (895 cached, 2 parsed). 1800 targets, 34 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
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
meta-yocto-bsp       = "tmp-auh-upgrades:451e61319c73897ba8744cbef0ebeaa4f1aa446a"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://github.com/mesonbuild/meson/releases//download/1.2.0/meson-1.2.0.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/mesonbuild/meson/releases//download/1.2.0/meson-1.2.0.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-gn29xj3z/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-gn29xj3z/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-gn29xj3z/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-gn29xj3z/work/recipe-sysroot-native/usr/bin:/home/
 pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-gn29xj3z/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-gn29xj3z/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /home/pokybuild/yocto-worker/auh/build/build/build/downloads/meson-1.2.0.tar.gz.tmp -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://github.com/mesonbuild/meson/releases//download/1.2.0/meson-1.2.0.tar.gz' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/mesonbuild/meson/releases//download/1.2.0/meson-1.2.0.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-gn29xj3z/work/temp/log.do_fetch.1450913
ERROR: Failed to fetch URL https://github.com/mesonbuild/meson/releases//download/1.2.0/meson-1.2.0.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3817471897757555020==--

