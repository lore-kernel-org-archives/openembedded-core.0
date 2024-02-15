Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B88C54E78
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:35 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.20338.1708018346284850837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FtZ7eZ2a;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=L9s8JYNb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018dadd3a66f-bc94c371-459e-4630-9525-c66831b4023b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XhL4wxQSxm9z/DG156j5Pxwwmj5+orZq/b0CyHraRec=;
	b=FtZ7eZ2aEsIuc/EhVxmQJ4cdTZqs57p8o4CEhGl7YoQ19fp7ruTf0suI8jIcWrzK
	Thjy+mNZP7w6ciGIK9g4ba+rTU2wv99/aaWv5XvJsgL53m2DM4oF02DgXydsTyCXyvi
	G85oyTBvm6MLN9AjzlyZCIO1rIMBOrK4Sot82g3A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XhL4wxQSxm9z/DG156j5Pxwwmj5+orZq/b0CyHraRec=;
	b=L9s8JYNbzeNbanvGLkQDh4NZb8xE9Hvd3EERX2LvZupNn8ao9JH05t1Wp5Y/JAJL
	uuF2DAJNQI9x3xFTdWdnABGxXdw+ZjRqwBhLht1mQC2iLprrYi023f9iF+GAUreXC5U
	J4HG4pVQ01ioKLMdGbKBtMXXYvjmQb76cmK4nzWA=
Content-Type: multipart/mixed; boundary="===============8677495531082092355=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.15.0 FAILED
Message-ID: <0101018dadd3a66f-bc94c371-459e-4630-9525-c66831b4023b-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195620

--===============8677495531082092355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shadow* to *4.15.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade shadow -V 4.15.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1858 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-751ddabb138ced670a1c043db561c90a4bfc3c4b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:751ddabb138ced670a1c043db561c90a4bfc3c4b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1858 entries from dependency cache.
Parsing recipes...done.
Parsing of 915 .bb files complete (913 cached, 2 parsed). 1858 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-751ddabb138ced670a1c043db561c90a4bfc3c4b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:751ddabb138ced670a1c043db561c90a4bfc3c4b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://github.com/shadow-maint/shadow/releases/download/4.15.0/shadow-4.15.0.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215114727.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215114727.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/shadow-maint/shadow/releases/download/4.15.0/shadow-4.15.0.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/scripts:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-jx3wh1jq/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-jx3wh1jq/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-jx3wh1jq/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipe
 tool-jx3wh1jq/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-jx3wh1jq/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-jx3wh1jq/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp --user-agent='Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:84.0) Gecko/20100101 Firefox/84.0' -O /srv/autobuilder/autobuilder.yocto.io/current_sources/shadow-4.15.0.tar.gz.tmp -P /srv/autobuilder/autobuilder.yocto.io/current_sources 'https://github.com/shadow-maint/shadow/releases/download/4.15.0/shadow-4.15.0.tar.gz' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/shadow-maint/shadow/releases/download/4.15.0/shadow-4.15.0.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-jx3wh1jq/work/temp/log.do_fetch.2507681
ERROR: Failed to fetch URL https://github.com/shadow-maint/shadow/releases/download/4.15.0/shadow-4.15.0.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8677495531082092355==--

