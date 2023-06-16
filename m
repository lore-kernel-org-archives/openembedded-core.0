Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1A6C2FC1E
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:30 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.805.1686887482769896378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YljwsISQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010188c2544f61-924de2d0-02f3-4763-90bd-4192a8976ee8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iMOffbdEpWv1+LFUoazDn13vZ+SGnCPariJEKLjgIcE=;
	b=YljwsISQzi3Uood63ZG0nfHZcsQhkCZdkl+X74i03TpBZ1P/yJAwVRJgqoGp92Ds
	AYwYDQYgKnwcxn5s5738bI0UG9bZinHJVrVXIzF/sbjGn/yCcivj80jQNXQL9NYBfI3
	ekoZoU7vhbOylXqav3jgZXRCROXAabML0nPYq0v0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iMOffbdEpWv1+LFUoazDn13vZ+SGnCPariJEKLjgIcE=;
	b=OEVB2VuKWLhLkRhleRHUjXp4P4qZd8dClirAZe56B2ORN1lJ1hgGtN9/wpgmHOPU
	oGTm4aKOcpO5tK5KS0WZEJe7Ple5RkBlVYlrck+2NuuB2MZ/Ou/mzdC4e8vsWMr4g/5
	bmx++WbMwLAjbZ8fqAc/NTEimQ+FbvjC+AYVN+l8=
Content-Type: multipart/mixed; boundary="===============4558702916980506699=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libproxy: upgrading to 0.5.1 FAILED
Message-ID: <01010188c2544f61-924de2d0-02f3-4763-90bd-4192a8976ee8-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182984

--===============4558702916980506699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libproxy* to *0.5.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libproxy -V 0.5.1
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bdada0c42d1886c0fde2bcc1254098f6c87fb5fe"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1803 targets, 36 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bdada0c42d1886c0fde2bcc1254098f6c87fb5fe"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://github.com/libproxy/libproxy/releases//download/0.5.1/libproxy-0.5.1.tar.xz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 82 tasks of which 81 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/libproxy/libproxy/releases//download/0.5.1/libproxy-0.5.1.tar.xz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-7kfheui5/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-7kfheui5/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-7kfheui5/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-7kfheui5/work/recipe-sysroot-native/usr/bin:/home/
 pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-7kfheui5/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-7kfheui5/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /home/pokybuild/yocto-worker/auh/build/build/build/downloads/libproxy-0.5.1.tar.xz.tmp -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://github.com/libproxy/libproxy/releases//download/0.5.1/libproxy-0.5.1.tar.xz' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/libproxy/libproxy/releases//download/0.5.1/libproxy-0.5.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-7kfheui5/work/temp/log.do_fetch.1769752
ERROR: Failed to fetch URL https://github.com/libproxy/libproxy/releases//download/0.5.1/libproxy-0.5.1.tar.xz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4558702916980506699==--

