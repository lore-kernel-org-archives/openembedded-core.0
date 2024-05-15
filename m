Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B9CC2BA15
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:21 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1266.1715794336722949347
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=C6zNE9mN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=C2KETNmK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018f7d4fe246-d7dfe8a6-9222-4108-a8ba-f0e171e8f63e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NrZxIazgnQ4yMX1XUtXXKMs6/78+gtj0rs/PP38f93k=;
	b=C6zNE9mNjOqMlRInmBEsRMIyfWhafpszyt9l3fCoGJN+n8hrGKPIPueFncMgZ547
	ulPMq6E39xR3eN7EybIh96m//yOvuJMEoHzNi07Og7BMW2iG1GbrLaoGcnTP+ZS9mMy
	Fu1LRPm+10vQ0D0tDmlPc3TNF79LMb7u/ez9uSug=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NrZxIazgnQ4yMX1XUtXXKMs6/78+gtj0rs/PP38f93k=;
	b=C2KETNmKcB1VV8mzZHF4BkW0jsLtctx5UCERpP2KTtTd4o6TtQxJHiHyjB0miQpJ
	MTh0i5a8Z7EgnlS2KWBXkj/Y4rxbuhtcJdbk0zcxvCjdTMorMV/ZGAXECxKpYmcw9Rr
	0in4FThV082trxsS7JZ1EO2ND5bCrix/iUUTI1Nc=
Content-Type: multipart/mixed; boundary="===============2058784168819347882=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 8.1.0 FAILED
Message-ID: <0101018f7d4fe246-d7dfe8a6-9222-4108-a8ba-f0e171e8f63e-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199358

--===============2058784168819347882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-scm* to *8.1.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-setuptools-scm -V 8.1.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-b42883fef514bff64dc37a5bcd44402eea630a93"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b42883fef514bff64dc37a5bcd44402eea630a93"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (920 cached, 2 parsed). 1880 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-b42883fef514bff64dc37a5bcd44402eea630a93"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b42883fef514bff64dc37a5bcd44402eea630a93"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/s/setuptools-scm/setuptools-scm-8.1.0.tar.gz;downloadfilename=setuptools-scm-8.1.0.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515101111.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515101111.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/s/setuptools-scm/setuptools-scm-8.1.0.tar.gz;downloadfilename=setuptools-scm-8.1.0.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/scripts:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-43kk6vo7/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-43kk6vo7/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-43kk6vo7/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipe
 tool-43kk6vo7/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-43kk6vo7/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-43kk6vo7/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 -O /srv/autobuilder/autobuilder.yocto.io/current_sources/setuptools-scm-8.1.0.tar.gz.tmp -P /srv/autobuilder/autobuilder.yocto.io/current_sources 'https://files.pythonhosted.org/packages/source/s/setuptools-scm/setuptools-scm-8.1.0.tar.gz' --progress=dot -v failed with exit code 8, see logfile for output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/s/setuptools-scm/setuptools-scm-8.1.0.tar.gz;downloadfilename=setuptools-scm-8.1.0.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-43kk6vo7/work/temp/log.do_fetch.2098479
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/s/setuptools-scm/setuptools-scm-8.1.0.tar.gz;downloadfilename=setuptools-scm-8.1.0.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2058784168819347882==--

