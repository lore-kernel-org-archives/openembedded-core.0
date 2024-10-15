Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1386AD1D896
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:02 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11799.1728994554420866434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NMkOIlOD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=KO47Z06M;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010192901b3ad8-281b98d7-740e-43cd-a91c-fde581787728-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gBgIwuhdOKg90XcPvKOjKlwjXI+YHA4na4xGsd4G2oo=;
	b=NMkOIlODSqJz/dIE2LRWfQs2mZZymLJIJBRUVvuHRXU+XMPBjwtm/nyqpHZt3vOt
	de82oCd3yqrX4ouJO+Pq9/AWNz6XOn7SYiIMIDiMxW5SMYWxkRlDtCQUXieOrrcFiN7
	A7Dav3iC0IbZnAxp5H6XaakUPt9wmuABHL0Jxx/I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gBgIwuhdOKg90XcPvKOjKlwjXI+YHA4na4xGsd4G2oo=;
	b=KO47Z06Mc3GShKeAenryZCli4d4eI/coP1cNPmpwOigK2hs743SMue2fjDMIx4Da
	iW4a1uI0d/9qT+aiK0qfU/7T55pX/rLPCzdhVKNAetF164qzf+3YEQ7vyEt0PvdMg/E
	OFsorZJ8Lmt6sVg3d8XaCXmRxfqjWFjTnx333zyw=
Content-Type: multipart/mixed; boundary="===============0034196322391719672=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markupsafe: upgrading to 3.0.1 FAILED
Message-ID: <01010192901b3ad8-281b98d7-740e-43cd-a91c-fde581787728-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205843

--===============0034196322391719672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markupsafe* to *3.0.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-markupsafe -V 3.0.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:73832299977a8233c36067b39ee00b7f8df6e03a"

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
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:73832299977a8233c36067b39ee00b7f8df6e03a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-3.0.1.tar.gz;downloadfilename=MarkupSafe-3.0.1.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015083142.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015083142.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-3.0.1.tar.gz;downloadfilename=MarkupSafe-3.0.1.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export PATH="/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/srv/pokybuild/yocto-worker/auh/build/scripts:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-bao0ygjd/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-bao0ygjd/work/recipe-sysroot/usr/bin/crossscripts:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-bao0ygjd/work/recipe-sysroot-native/usr/sbin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-bao0ygjd/work/recipe-sysroot-native/usr/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/re
 cipetool-bao0ygjd/work/recipe-sysroot-native/sbin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-bao0ygjd/work/recipe-sysroot-native/bin:/srv/pokybuild/yocto-worker/auh/build/bitbake/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools"; export HOME="/srv/pokybuild"; /usr/bin/env wget -t 2 -T 30 -O /srv/pokybuild/yocto-worker/auh/build/build/downloads/MarkupSafe-3.0.1.tar.gz.tmp -P /srv/pokybuild/yocto-worker/auh/build/build/downloads 'https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-3.0.1.tar.gz' --progress=dot -v failed with exit code 8, see logfile for output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-3.0.1.tar.gz;downloadfilename=MarkupSafe-3.0.1.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-bao0ygjd/work/temp/log.do_fetch.4068767
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-3.0.1.tar.gz;downloadfilename=MarkupSafe-3.0.1.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0034196322391719672==--

