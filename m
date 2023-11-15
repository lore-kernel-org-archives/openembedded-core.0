Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85527C54F7B
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:11 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.14629.1700059030787227195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XVJMDYlK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q+YjqjMS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018bd36a226d-20b6a7a0-3cb5-4146-ac37-b8348494b6f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pXbpU2C8bekua21fFcZxoJl6VXq7T6X9JtfDsG/z3sM=;
	b=XVJMDYlKZYJbycz6/puYQTyl5/esIaCylAC5maiJnzgIDiCMHUxEQPIurk0NcfD8
	X7Ucfvnb9HWEPkVwqIUjv7WuRGPaKDParldT4ZR5RI4gX6q+Dw7h80njJd0/IjHsqOv
	zlc4zcXbRjvz3yRIfRvNEbCgpzEE0/lIXH2NB77w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pXbpU2C8bekua21fFcZxoJl6VXq7T6X9JtfDsG/z3sM=;
	b=Q+YjqjMSwqz9DYklhwcPbaUFFvLl6UurpQjpGnBaqr3qC86ROK24Z+wKDJC4/zoN
	rteQdsOsia3wdQn7FRSI0TvdrcCXlnIo+onSx2+TuGK7ZcFABs2ljZ7EAF+8PfRY0LA
	OxGbERqDkgGIJjEdAx57O5068vfLDWmUV+rkxVcQ=
Content-Type: multipart/mixed; boundary="===============6027283697555537580=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-applehelp: upgrading to 1.0.7 FAILED
Message-ID: <0101018bd36a226d-20b6a7a0-3cb5-4146-ac37-b8348494b6f0-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190637

--===============6027283697555537580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-applehelp* to *1.0.7* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-sphinxcontrib-applehelp -V 1.0.7
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-b069c82b6528ca90c25a7b0e8fd6aa0829d4bdad"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b069c82b6528ca90c25a7b0e8fd6aa0829d4bdad"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 6 Local 6 Mirrors 0 Missed 0 Current 24 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (910 cached, 2 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-b069c82b6528ca90c25a7b0e8fd6aa0829d4bdad"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b069c82b6528ca90c25a7b0e8fd6aa0829d4bdad"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/s/sphinxcontrib-applehelp/sphinxcontrib-applehelp-1.0.7.tar.gz;downloadfilename=sphinxcontrib-applehelp-1.0.7.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115073849.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115073849.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/s/sphinxcontrib-applehelp/sphinxcontrib-applehelp-1.0.7.tar.gz;downloadfilename=sphinxcontrib-applehelp-1.0.7.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/scripts:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-tzj0s__5/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-tzj0s__5/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-tzj0s__5/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipe
 tool-tzj0s__5/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-tzj0s__5/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-tzj0s__5/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /srv/autobuilder/autobuilder.yocto.io/current_sources/sphinxcontrib-applehelp-1.0.7.tar.gz.tmp -P /srv/autobuilder/autobuilder.yocto.io/current_sources 'https://files.pythonhosted.org/packages/source/s/sphinxcontrib-applehelp/sphinxcontrib-applehelp-1.0.7.tar.gz' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/s/sphinxcontrib-applehelp/sphinxcontrib-applehelp-1.0.7.tar.gz;downloadfilename=sphinxcontrib-applehelp-1.0.7.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-tzj0s__5/work/temp/log.do_fetch.1844520
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/s/sphinxcontrib-applehelp/sphinxcontrib-applehelp-1.0.7.tar.gz;downloadfilename=sphinxcontrib-applehelp-1.0.7.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6027283697555537580==--

