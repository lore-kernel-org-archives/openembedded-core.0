Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99120C10F09
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:14 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8662.1698848704901501752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L9XbtvIS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=P9Q0ygPG;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b4606c2-29cca8b3-1b67-4f82-84e3-87742ce65580-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iY0lvuRBGpzb7DW2DIX2yUhwHcsftLXIJSE7gH534zo=;
	b=L9XbtvISKPVGa0tMqfnoGWaf0B876Elkr4M9bBagIpYXUlDEPWgYWVbxxTJxWLTs
	coLfrGbI/Y9G06qAiievCXmQ4qHihOZKUhZf9lzM8uXrn4kcSMi3fNpxAkv81PbCgUi
	R5oordqG0ibGUP6CmI7wTg4WQNZemn3gDU+EA9IM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iY0lvuRBGpzb7DW2DIX2yUhwHcsftLXIJSE7gH534zo=;
	b=P9Q0ygPGxsYNao8DF+FFpNyL7iQ10ZW3ga34Gz0O8myT/q1ZcqyNMB0rszAqs97r
	uMFx4XZQb+7Vdb980zFVsyAKK0s95A8WUpweBJMYqpGVnwgOSsoGWoyNZ0CW7VjRu4h
	zkkGet2x08UGUSi6X43WjXJJqAyX+0gCqAoIODQc=
Content-Type: multipart/mixed; boundary="===============6504244272572030449=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-devhelp: upgrading to 1.0.5 FAILED
Message-ID: <0101018b8b4606c2-29cca8b3-1b67-4f82-84e3-87742ce65580-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189974

--===============6504244272572030449==
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
NOTE: Retrying server connection (#1)... (09:33:36.292407)
Loading cache...done.
Loaded 1843 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-bc44915620e6572561931642eb1c41aa00fdf750"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bc44915620e6572561931642eb1c41aa00fdf750"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (910 cached, 2 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-bc44915620e6572561931642eb1c41aa00fdf750"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bc44915620e6572561931642eb1c41aa00fdf750"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/s/sphinxcontrib-devhelp/sphinxcontrib-devhelp-1.0.5.tar.gz;downloadfilename=sphinxcontrib-devhelp-1.0.5.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/s/sphinxcontrib-devhelp/sphinxcontrib-devhelp-1.0.5.tar.gz;downloadfilename=sphinxcontrib-devhelp-1.0.5.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-rljeky04/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-rljeky04/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-rljeky04/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/recipetool-rljeky04/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-rljeky04/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-rljeky04/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /home/pokybuild/yocto-worker/auh/build/build/build/downloads/sphinxcontrib-devhelp-1.0.5.tar.gz.tmp -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://files.pythonhosted.org/packages/source/s/sphinxcontrib-devhelp/sphinxcontrib-devhelp-1.0.5.tar.gz' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/s/sphinxcontrib-devhelp/sphinxcontrib-devhelp-1.0.5.tar.gz;downloadfilename=sphinxcontrib-devhelp-1.0.5.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-rljeky04/work/temp/log.do_fetch.3804816
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/s/sphinxcontrib-devhelp/sphinxcontrib-devhelp-1.0.5.tar.gz;downloadfilename=sphinxcontrib-devhelp-1.0.5.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6504244272572030449==--

