Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742A2C54ECA
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.2154.1706810405264903285
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=g8Zs7nMo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=E1ZEAa8G;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018d65d3ee90-9e9aa926-6a4c-400b-ab80-96aa2a0057b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0DCbJGVtuPAlTfxkwNdg/9QaYVyklUqmWP5pxoDwhjs=;
	b=g8Zs7nMoitvlmEdlrgsTUZD4xv35Vy9PVRrnGevR4o/AXcprmfT3fs9QxIIyF6lH
	BJLgOzfsy4Jd+XyOYJy1MYF7GkpOq8gPocpBGhdhpo8eXhMdo6IiKvhP3f1w1bJeApC
	HwuRlj9hpJmQyZy0VbVrqKlXK5ny0zqcCnt6jsoM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0DCbJGVtuPAlTfxkwNdg/9QaYVyklUqmWP5pxoDwhjs=;
	b=E1ZEAa8GEYIPl2DFHJDWTY7W96W/cMPQCYgcRjTXJtHcmWRPpNzsoq7ABFZ+eT+T
	yVn4/7J69E++8wVzl0EgjQY0jUHNocyLrTSaPr5Scibt9GwW2UzQKjRt34iWIiqVTS2
	cTZwoEp5SPDD3fMf0o7K8h+uKeSljOsIdqw3DCL0=
Content-Type: multipart/mixed; boundary="===============1295261243022761009=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to
 948ae97ca5703224bd3eada06b7a69f40dd15a02 FAILED
Message-ID: <0101018d65d3ee90-9e9aa926-6a4c-400b-ab80-96aa2a0057b6-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194617

--===============1295261243022761009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-config* to *948ae97ca5703224bd3eada06b7a69f40dd15a02* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gnu-config -S 948ae97ca5703224bd3eada06b7a69f40dd15a02
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1849 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7596767c592f937eebb2ad9a0acd91b4cb1be35c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7596767c592f937eebb2ad9a0acd91b4cb1be35c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 17 Local 9 Mirrors 0 Missed 8 Current 12 (52% match, 72% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
WARNING: Failed to find a git repository in WORKDIR: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20231127+git/devtooltmp-88xk76q6/workdir
WARNING: gnu-config: the directory ${WORKDIR}/git (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20231127+git/devtooltmp-88xk76q6/workdir/git) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
WARNING: No source unpacked to S - either the gnu-config recipe doesn't use any source or the correct source directory could not be determined
NOTE: Tasks Summary: Attempted 65 tasks of which 42 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201071031.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201071031.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: Bitbake Fetcher Error: FetchError('Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/scripts/native-intercept:/home/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/scripts:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20231127+git/devtooltmp-88xk76q6/workdir/recipe-sysroot-native/usr/bin/x86_64-linux:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20231127+git/devtooltmp-88xk76q6/workdir/recipe-sysroot-native/usr/bin:/home
 /pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20231127+git/devtooltmp-88xk76q6/workdir/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20231127+git/devtooltmp-88xk76q6/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20231127+git/devtooltmp-88xk76q6/workdir/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20231127+git/devtooltmp-88xk76q6/workdir/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; git -c gc.autoDetach=false -c core.pager=cat clone -n -s /srv/autobuilder/autobuilder.yocto.io/current_sources/git2/git.savannah.gnu.org.git.config.git/ /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/202
 31127+git/devtooltmp-88xk76q6/workdir/git/ failed with exit code 128, output:\nfatal: destination path \'/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20231127+git/devtooltmp-88xk76q6/workdir/git\' already exists and is not an empty directory.\n', None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnu-config/20231127+git/devtooltmp-88xk76q6/temp/log.do_unpack.3646896
ERROR: Extracting source for gnu-config failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1295261243022761009==--

