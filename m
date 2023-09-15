Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C843EEE248
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.29665.1694804393252974225
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HgHjgp6w;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bKZANxXm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018a9a36be2e-291a2e7b-ad33-4e4f-b2f1-a1ccfea86680-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Fm0I39V8CvCMGpZHS8LUmYKQVoR+4p47gvbTCrfjeis=;
	b=HgHjgp6wD+yiYz2vPL8NQjExkPZ8nT3uhBVq5XpT+rCyQAfL/uacXni7XAqltBth
	QF173rZE0SHQW8eJhe4MQKGBWlKL4f8qu3CbngGQxfTz0ytTaUh35vLvbttj+6GPlf+
	ezWdkz5zGobTSFZK7xi7tCPhr/Aq2olQyEyRlIUA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Fm0I39V8CvCMGpZHS8LUmYKQVoR+4p47gvbTCrfjeis=;
	b=bKZANxXmjBRweyfcgwNeiK/rYOqPg4oNA3xfc7Rn4WEi4pcv8Dk4p2NLXetYmgnM
	hNaKQaxVZB4r4Xk0iyYYjZxci3jF9Jmrp2HmACvjq/GcAf8Tv1cEL5TFva2R27lNOSu
	aCBCvflAXv5/dfTJ9rVj/xgYuX+TuP0L3KzESszE=
Content-Type: multipart/mixed; boundary="===============0679097240022694316=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-devhelp: upgrading to 1.0.5 FAILED
Message-ID: <0101018a9a36be2e-291a2e7b-ad33-4e4f-b2f1-a1ccfea86680-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187700

--===============0679097240022694316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-devhelp* to *1.0.5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-sphinxcontrib-devhelp -V 1.0.5
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (10:52:22.687270)
Loading cache...done.
Loaded 1808 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-e5eb34a4d1a4ba30136b7d5cf80200952ef2670e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e5eb34a4d1a4ba30136b7d5cf80200952ef2670e"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1808 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1808 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-e5eb34a4d1a4ba30136b7d5cf80200952ef2670e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e5eb34a4d1a4ba30136b7d5cf80200952ef2670e"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/s/sphinxcontrib-devhelp/sphinxcontrib-devhelp-1.0.5.tar.gz;downloadfilename=sphinxcontrib-devhelp-1.0.5.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/s/sphinxcontrib-devhelp/sphinxcontrib-devhelp-1.0.5.tar.gz;downloadfilename=sphinxcontrib-devhelp-1.0.5.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-r7_o77o5/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-r7_o77o5/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-r7_o77o5/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/recipetool-r7_o77o5/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-r7_o77o5/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-r7_o77o5/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /home/pokybuild/yocto-worker/auh/build/build/build/downloads/sphinxcontrib-devhelp-1.0.5.tar.gz.tmp -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://files.pythonhosted.org/packages/source/s/sphinxcontrib-devhelp/sphinxcontrib-devhelp-1.0.5.tar.gz' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/s/sphinxcontrib-devhelp/sphinxcontrib-devhelp-1.0.5.tar.gz;downloadfilename=sphinxcontrib-devhelp-1.0.5.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-r7_o77o5/work/temp/log.do_fetch.2215463
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/s/sphinxcontrib-devhelp/sphinxcontrib-devhelp-1.0.5.tar.gz;downloadfilename=sphinxcontrib-devhelp-1.0.5.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0679097240022694316==--

