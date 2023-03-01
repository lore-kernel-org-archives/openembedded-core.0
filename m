Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7A1C7EE43
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.24033.1677681915841978985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=K0RUExw+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101869da273c1-3fe42e61-2987-4a5b-b9b4-58a8d2b10d63-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681915;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=1cpv6C5lAJQhT+hgPjNvHmFq4FpCuYM0wggR/+JFrPM=;
	b=K0RUExw+KWWJk1qm/gTsQMgzSpKlT1IZ6Y7Q4GhyAbCNerLcfUkYPQRKzbPVj7YN
	+ybNKdldvtNmqgDiZPh7Ei1gYbr1wFxxiOPgJeaGeR/iwruJrb6/gvt5xJuarBneXVQ
	n283SANs+Ag8r6Yf9LtxMqEDVS+70E9V5frZ7k0c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681915;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=1cpv6C5lAJQhT+hgPjNvHmFq4FpCuYM0wggR/+JFrPM=;
	b=QGLDKPMSiKJR/nYkPHfoRHPZ39SssPcI6IZLSocgb1LqcUvmWpavpd7m482diCgH
	fJEDfXwOB0bcRTRdZEy47Aa0BV7pKeOBLQenPGHZlukocp82xbnyFWPPbaR3UUpnpEP
	0c/DSJIijNjQ5S+HkY3PRmQCduUuFGW/uV2jyy54=
Content-Type: multipart/mixed; boundary="===============6512441304464213127=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] font-alias: upgrading to 1.0.5 FAILED
Message-ID: <010101869da273c1-3fe42e61-2987-4a5b-b9b4-58a8d2b10d63-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177928

--===============6512441304464213127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *font-alias* to *1.0.5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade font-alias -V 1.0.5
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (13:50:19.333016)
Loading cache...done.
Loaded 1697 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-72965b51fda2db558ca3a589625f9b4c41eb1081"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:72965b51fda2db558ca3a589625f9b4c41eb1081"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (894 cached, 2 parsed). 1698 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-72965b51fda2db558ca3a589625f9b4c41eb1081"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:72965b51fda2db558ca3a589625f9b4c41eb1081"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://www.x.org/releases//individual/font/font-alias-1.0.5.tar.bz2, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.x.org/releases//individual/font/font-alias-1.0.5.tar.bz2...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-g2stg_qo/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-g2stg_qo/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-g2stg_qo/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-g2stg_qo/work/recipe-sysroot-native/usr/bin:/home/
 pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-g2stg_qo/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-g2stg_qo/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /home/pokybuild/yocto-worker/auh/build/build/build/downloads/font-alias-1.0.5.tar.bz2.tmp -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://www.x.org/releases//individual/font/font-alias-1.0.5.tar.bz2' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://www.x.org/releases//individual/font/font-alias-1.0.5.tar.bz2')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-g2stg_qo/work/temp/log.do_fetch.3047160
ERROR: Failed to fetch URL https://www.x.org/releases//individual/font/font-alias-1.0.5.tar.bz2


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6512441304464213127==--

