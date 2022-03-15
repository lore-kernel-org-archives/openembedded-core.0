Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F75C433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:54 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.10636.1647349733675347215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JmyR/xto;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 0101017f8db214a5-6ff86ae8-28f5-463e-bfe0-da23f632d659-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349733;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uC1nwMZZofYPfoq3jXVBwwj5fzm0PMo2JLavI94f11k=;
	b=JmyR/xto5oiZnLU1Gfvt91YROGuOEN61bL9dB6KmuipXjcr1sF7WaH2OIWWSHX5C
	Jpqq3HAbE6C89+87FY2E4WM51C0sw3BLb0EiW6WaNGkit0wWBavNwCTDMl/XQ89iZTI
	2E0OwsmM6L8iNTMJaOMybmV1ha18zCmrLkrAnLqM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349733;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uC1nwMZZofYPfoq3jXVBwwj5fzm0PMo2JLavI94f11k=;
	b=fpRamKVFY9sk0Ofbm9SruFQP+jAstuTviFEokBTPH6W37igCeSdNthusgGWFdIs+
	kyZa4dYxEOereWUFwoEB8ex3BLzz+GQo8S+fVHrBSDTyLou4bNiHjiLtFq4/XrW/Ogj
	3xLLS0StKK04MS7n03+avisCqC3kMKY3mCuIqW8w=
Content-Type: multipart/mixed; boundary="===============1091980589439084876=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dbus-test: upgrading to 1.14.0 FAILED
Message-ID: 
 <0101017f8db214a5-6ff86ae8-28f5-463e-bfe0-da23f632d659-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:52 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163241

--===============1091980589439084876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dbus-test* to *1.14.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade dbus-test -V 1.14.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1521 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-21af5c2b7862e9ce9f5f1d5bf4161f26f49542b9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:21af5c2b7862e9ce9f5f1d5bf4161f26f49542b9"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds
Loading cache...done.
Loaded 1521 entries from dependency cache.
Parsing recipes...done.
Parsing of 844 .bb files complete (842 cached, 2 parsed). 1522 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-21af5c2b7862e9ce9f5f1d5bf4161f26f49542b9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:21af5c2b7862e9ce9f5f1d5bf4161f26f49542b9"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://dbus.freedesktop.org/releases/dbus/dbus-1.14.0.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://dbus.freedesktop.org/releases/dbus/dbus-1.14.0.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-qv4gqoqv/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-qv4gqoqv/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-qv4gqoqv/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-qv4gqoqv/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-qv4gqoqv/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-qv4g
 qoqv/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://dbus.freedesktop.org/releases/dbus/dbus-1.14.0.tar.gz' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://dbus.freedesktop.org/releases/dbus/dbus-1.14.0.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-qv4gqoqv/work/temp/log.do_fetch.1481845
ERROR: Failed to fetch URL https://dbus.freedesktop.org/releases/dbus/dbus-1.14.0.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1091980589439084876==--

