Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BC7C47DA2
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:05 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.4642.1704114721091759672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MuKJwUaA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mudA7FwW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018cc5270f79-febc89f3-e792-4bc3-9945-40ba2ecedc38-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FJCLUZHUut3Up0YFamjpbYOPv2MEMWzFD0PxuSKzzUc=;
	b=MuKJwUaA1h+0RzsL9N9g0kYjr36QFEbukiHUY2vtmLnxgN0ABMMQ8XvtPalkXwy4
	l5Oxde18OI6tuwwUvFFarDngag4AHp2i0qr774xacx37DK3cCa8TdzRbJ1MmKwbNOIM
	Da1jYbmzRISqhMfvOXry52/4iGUnj1yIkRkhov8A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FJCLUZHUut3Up0YFamjpbYOPv2MEMWzFD0PxuSKzzUc=;
	b=mudA7FwWHkQnKpUtb6PMfuhC0kraDQncPrrFaoi0HbSBHNoZ89gg/alGdvsAxTNv
	1VCeQ4ONuyz4NQtjvugyN2Fw3LU94oiVjne15Vjpu3XJaFaulMPc2r2QW9sJlQTUUmh
	IAhL8+BaYVRl5pBCEuXBZ9Drnj6EXYp/j24wogiQ=
Content-Type: multipart/mixed; boundary="===============8364909186837291842=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libusb1: upgrading to 1.0.27 FAILED
Message-ID: <0101018cc5270f79-febc89f3-e792-4bc3-9945-40ba2ecedc38-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:12:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193176

--===============8364909186837291842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libusb1* to *1.0.27* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libusb1 -V 1.0.27
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1847 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-07dd0cdf385719ed7bc7bafdf56e0905b69046de"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:07dd0cdf385719ed7bc7bafdf56e0905b69046de"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 6 Local 6 Mirrors 0 Missed 0 Current 24 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1847 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (912 cached, 2 parsed). 1848 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-07dd0cdf385719ed7bc7bafdf56e0905b69046de"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:07dd0cdf385719ed7bc7bafdf56e0905b69046de"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://github.com/libusb/libusb/releases/download/v1.0.27/libusb-1.0.27.tar.bz2, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101125507.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101125507.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/libusb/libusb/releases/download/v1.0.27/libusb-1.0.27.tar.bz2...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/scripts:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-z3asjvk4/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-z3asjvk4/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-z3asjvk4/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipe
 tool-z3asjvk4/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-z3asjvk4/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-z3asjvk4/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /srv/autobuilder/autobuilder.yocto.io/current_sources/libusb-1.0.27.tar.bz2.tmp -P /srv/autobuilder/autobuilder.yocto.io/current_sources 'https://github.com/libusb/libusb/releases/download/v1.0.27/libusb-1.0.27.tar.bz2' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/libusb/libusb/releases/download/v1.0.27/libusb-1.0.27.tar.bz2')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-z3asjvk4/work/temp/log.do_fetch.2870439
ERROR: Failed to fetch URL https://github.com/libusb/libusb/releases/download/v1.0.27/libusb-1.0.27.tar.bz2


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8364909186837291842==--

