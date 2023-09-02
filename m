Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0055BCCF960
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:15 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5685.1693650553961543822
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gCP4lRmF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eh7Jvs5V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018a55708a42-95926ef5-0699-4847-a796-5b05c0517f7e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oUie+wMHGaC618mUShPDmHMY1dGyLg0F4qVMrrACwfI=;
	b=gCP4lRmFS9o42rOUjOIlEYtTWS9w8HDrdPz1C76hiTb2XMje2QzvBsMZ/dBv02nT
	JnAwkPxMMmKQsF5/C72TinZqh5oCrq2fOP5kFA5auY/rqQZJpB0gkzgkJMMJqokrbwo
	jaTuwTE/YM3a+QCZzqQ5PZS2nJtLkYRjLS7223vs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oUie+wMHGaC618mUShPDmHMY1dGyLg0F4qVMrrACwfI=;
	b=eh7Jvs5VdV+isM2NBz8M6wqDkeLBY+xQ4PmOfvSeEwLJvFCLOoU+9M67MJKAIA1u
	iEMHAdp0jCwmtO6aF81qyaTSFJodsL/iFcY6u5nZkMak1wQcjQ+6t4XuVU/enV6vKyh
	sLJkGyI/VQX3KC9W5w6dhTGlOnj6t59C242kbElw=
Content-Type: multipart/mixed; boundary="===============0645457923237585950=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-qthelp: upgrading to 1.0.6 FAILED
Message-ID: <0101018a55708a42-95926ef5-0699-4847-a796-5b05c0517f7e-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187079

--===============0645457923237585950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-qthelp* to *1.0.6* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-sphinxcontrib-qthelp -V 1.0.6
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1810 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-8dea312d7e0c7cfcbc9fef3f3abe8350d4d17adf"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8dea312d7e0c7cfcbc9fef3f3abe8350d4d17adf"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1810 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1808 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-8dea312d7e0c7cfcbc9fef3f3abe8350d4d17adf"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8dea312d7e0c7cfcbc9fef3f3abe8350d4d17adf"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/s/sphinxcontrib-qthelp/sphinxcontrib-qthelp-1.0.6.tar.gz;downloadfilename=sphinxcontrib-qthelp-1.0.6.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/s/sphinxcontrib-qthelp/sphinxcontrib-qthelp-1.0.6.tar.gz;downloadfilename=sphinxcontrib-qthelp-1.0.6.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-u_9bu__d/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-u_9bu__d/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-u_9bu__d/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/recipetool-u_9bu__d/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-u_9bu__d/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-u_9bu__d/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /home/pokybuild/yocto-worker/auh/build/build/build/downloads/sphinxcontrib-qthelp-1.0.6.tar.gz.tmp -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://files.pythonhosted.org/packages/source/s/sphinxcontrib-qthelp/sphinxcontrib-qthelp-1.0.6.tar.gz' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/s/sphinxcontrib-qthelp/sphinxcontrib-qthelp-1.0.6.tar.gz;downloadfilename=sphinxcontrib-qthelp-1.0.6.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-u_9bu__d/work/temp/log.do_fetch.3732035
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/s/sphinxcontrib-qthelp/sphinxcontrib-qthelp-1.0.6.tar.gz;downloadfilename=sphinxcontrib-qthelp-1.0.6.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0645457923237585950==--

