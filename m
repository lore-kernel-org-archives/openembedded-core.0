Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AC3C021AB
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:32 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8103.1739623339676694373
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Z46fc5ag;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Cms6ozmu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019509a1a683-6a561d83-38e0-43dc-a94f-ea73de97f063-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XgS8Syz7O4q1Nw9KlSRyKJhgPQ32EbqOm2keaNKFfuQ=;
	b=Z46fc5agNUUNddpNurscNwOqugEFrXzN4quXqrTMQqftRRyH8pxOlAbWpOZoL9fi
	S6j04jUJt+ILL+1lbOML7UUn8XYAM8t3vJslKP073B9Ttt7WZ0APLHlrJoelAdNidb/
	EPCZMldb9VNUbOfHFXMyRw3WPMSi24ZVA1QzBMGI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XgS8Syz7O4q1Nw9KlSRyKJhgPQ32EbqOm2keaNKFfuQ=;
	b=Cms6ozmu8G8t+3re6/7ob63MDppoOzwCLTTPAikuydAIVRewU1YTZigQLPS4vHbh
	w0KDKljo9eX6j258z5paVylE9mvcoaWOKq+lyW02Wp8GY+NxyHjfGRjPbjq59jNjKuE
	S/OVXaJ+nX+HyjU2CG0uwI8dHPmwLTpCB+8x2+xE=
Content-Type: multipart/mixed; boundary="===============4673543343764627588=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.7.1 FAILED
Message-ID: <0101019509a1a683-6a561d83-38e0-43dc-a94f-ea73de97f063-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211446

--===============4673543343764627588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xz* to *5.7.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade xz -V 5.7.1
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
workspace            = "tmp-auh-upgrades:c4e7f5b31c57cb2e7545ec4393338ca4d26f87c8"

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
workspace            = "tmp-auh-upgrades:c4e7f5b31c57cb2e7545ec4393338ca4d26f87c8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://github.com/tukaani-project/xz/releases/download/v5.7.1/xz-5.7.1.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215091040.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215091040.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/tukaani-project/xz/releases/download/v5.7.1/xz-5.7.1.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export PATH="/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/srv/pokybuild/yocto-worker/auh/build/scripts:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-m22406y1/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-m22406y1/work/recipe-sysroot/usr/bin/crossscripts:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-m22406y1/work/recipe-sysroot-native/usr/sbin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-m22406y1/work/recipe-sysroot-native/usr/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/re
 cipetool-m22406y1/work/recipe-sysroot-native/sbin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-m22406y1/work/recipe-sysroot-native/bin:/srv/pokybuild/yocto-worker/auh/build/bitbake/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools"; export HOME="/srv/pokybuild"; /usr/bin/env wget -t 2 -T 100 -O /srv/pokybuild/yocto-worker/auh/build/build/downloads/xz-5.7.1.tar.gz.tmp -P /srv/pokybuild/yocto-worker/auh/build/build/downloads 'https://github.com/tukaani-project/xz/releases/download/v5.7.1/xz-5.7.1.tar.gz' --progress=dot -v failed with exit code 8, see logfile for output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/tukaani-project/xz/releases/download/v5.7.1/xz-5.7.1.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-m22406y1/work/temp/log.do_fetch.562898
ERROR: Failed to fetch URL https://github.com/tukaani-project/xz/releases/download/v5.7.1/xz-5.7.1.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4673543343764627588==--

