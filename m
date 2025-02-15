Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD39C282D9
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8096.1739623335941482662
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ddw9tTDu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Ydf1CjfO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019509a1a95e-ce8471d0-6449-4399-a7f0-d0e612e5a46d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FtLZYdfaXonL/2jRr1NkYto9zuCu8pIe3czJLaiZD2Y=;
	b=ddw9tTDujcehZ+gTxPqlRSoO1YH2VDBKj88psIpnD7VWZVeupz7QVUXXd11Wmwbl
	u2NBZ0MS108HZ9BYRG8HEH3m7jKPCCUTG/XAgyM0IfIA9j8V1FUb+ggbd5nZ1ZcuMvC
	h3I06nS4fq0bY/oYlfYqlrJMsg+Fx1x1k9a6/v2Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FtLZYdfaXonL/2jRr1NkYto9zuCu8pIe3czJLaiZD2Y=;
	b=Ydf1CjfOlLd7TAuZqzgimmqfCOZzkXQVtydfQozzqOFT6JqIxnoZFc2ZAXx+tzhL
	YtLwd/cGaYoGpabaMcn6U6IZman4ZshRgxcEjsYksXvgF7I7UZLAjRDl5FvAtQ/ft9R
	OXF45qOkvuFywE0pZ/FjnZoDs9FlCa5t8Ck6I09M=
Content-Type: multipart/mixed; boundary="===============6301880481949411032=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fontconfig: upgrading to 2.16.0 FAILED
Message-ID: <0101019509a1a95e-ce8471d0-6449-4399-a7f0-d0e612e5a46d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211450

--===============6301880481949411032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fontconfig* to *2.16.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade fontconfig -V 2.16.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:dd39f82db1a8da53be50d250f9b98a690da46da4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1870 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:dd39f82db1a8da53be50d250f9b98a690da46da4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL http://fontconfig.org/release/fontconfig-2.16.0.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215092902.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215092902.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://fontconfig.org/release/fontconfig-2.16.0.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export PATH="/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/srv/pokybuild/yocto-worker/auh/build/scripts:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-5dqfoswi/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-5dqfoswi/work/recipe-sysroot/usr/bin/crossscripts:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-5dqfoswi/work/recipe-sysroot-native/usr/sbin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-5dqfoswi/work/recipe-sysroot-native/usr/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/re
 cipetool-5dqfoswi/work/recipe-sysroot-native/sbin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-5dqfoswi/work/recipe-sysroot-native/bin:/srv/pokybuild/yocto-worker/auh/build/bitbake/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools"; export HOME="/srv/pokybuild"; /usr/bin/env wget -t 2 -T 100 -O /srv/pokybuild/yocto-worker/auh/build/build/downloads/fontconfig-2.16.0.tar.gz.tmp -P /srv/pokybuild/yocto-worker/auh/build/build/downloads 'http://fontconfig.org/release/fontconfig-2.16.0.tar.gz' --progress=dot -v failed with exit code 8, see logfile for output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://fontconfig.org/release/fontconfig-2.16.0.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-5dqfoswi/work/temp/log.do_fetch.917559
ERROR: Failed to fetch URL http://fontconfig.org/release/fontconfig-2.16.0.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6301880481949411032==--

