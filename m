Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6529C77B76
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.144521.1671136354062779874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AeDJ806V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010185177d1c8d-a64f12f6-a0dc-4f80-821c-ecfa0e1a4b1f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136353;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=hPhnUPdEatvJ7Er/TOsEmv9+dFFXPd22CyjGw0ARdkY=;
	b=AeDJ806V51eTgbjtnHUOv7z1S8zjugaGqP/Vqtr+5RG/kKSic28S+l3Js07NqhPA
	KFgv3+q7zk7AcW2gTHJpaNmmreFouOAiY8uaIGNrSSHi2XPREKwsQj+FPMNRY3r3YXb
	iSg6exNFHLOrxNhmWKsnNQLh8Jvohxgg2ZgMJnT0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136353;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=hPhnUPdEatvJ7Er/TOsEmv9+dFFXPd22CyjGw0ARdkY=;
	b=YXCXtp6asODaWO1O3FRhIOE9ZoRViZaEQhrVTAKXroCGuKYRc5Lmq6+jgVkLiiqw
	V25I0upNbMd7GK4V5gvWNFzNlJDsf4vfO2l41htKAJNboLC1D0RSacd3QhDnWYMchMr
	myKQ8sbJkt8x6eM6hJ8kRoqXWSm1/ksECSDcqIMk=
Content-Type: multipart/mixed; boundary="===============0353942098032387931=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxdmcp: upgrading to 1.1.4 FAILED
Message-ID: <01010185177d1c8d-a64f12f6-a0dc-4f80-821c-ecfa0e1a4b1f-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174708

--===============0353942098032387931==
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
NOTE: Previous bitbake instance shutting down?, waiting to retry... (16:39:10.870990)
NOTE: Directory listing: ['buildhistory', 'sstate-cache', 'downloads', 'workspace', 'bitbake-cookerdaemon.log', 'upgrade-helper', 'cache', 'conf', 'tmp']
NOTE: Retrying server connection (#1)... (16:39:11.039976)
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.

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
meta-yocto-bsp       = "tmp-auh-upgrades:b1b212858f5d389164531503ddcb3e87bb9a7ffa"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (887 cached, 2 parsed). 1673 targets, 36 skipped, 0 masked, 0 errors.

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
meta-yocto-bsp       = "tmp-auh-upgrades:b1b212858f5d389164531503ddcb3e87bb9a7ffa"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

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
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-0q9b565w/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-0q9b565w/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-0q9b565w/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/recipetool-0q9b565w/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-0q9b565w/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-0q9b565w/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libXdmcp-1.1.4.tar.bz2.tmp -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://www.x.org/releases//individual/lib/libXdmcp-1.1.4.tar.bz2' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://www.x.org/releases//individual/lib/libXdmcp-1.1.4.tar.bz2')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-0q9b565w/work/temp/log.do_fetch.3503368
ERROR: Failed to fetch URL https://www.x.org/releases//individual/lib/libXdmcp-1.1.4.tar.bz2


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0353942098032387931==--

