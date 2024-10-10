Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5BFD0EE1E
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:06 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.53359.1728588948215278863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XpaBubQi;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=BJjla1TY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019277ee4954-140113e8-bc86-49d6-9cb8-0a99cf2818f8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588958;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jTTRMfmG2CeVtrh/ZpuH+dtU2IO8L/cysv6rmDkjY/4=;
	b=XpaBubQiRaYGvThnbB8VliYSJfKgX3QS1Iq3enKcyEeh4rqR01U+Ajql2BhXWiJH
	xhRSEcWdHM0GPwuqGIZ15pfxixgFARm5KeUx6JGZGDmF8/YQW1aWPt64XxWLg92Ja/K
	SMGUf1YGrLGZXq9rgaosp+pMfb5OH2yf23kb2B8I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588958;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jTTRMfmG2CeVtrh/ZpuH+dtU2IO8L/cysv6rmDkjY/4=;
	b=BJjla1TYws4DKUKXAU5Wk6+2h5j9D9sbgmV0AiWbiaXGPTSu7EFssI8Cb3izXblI
	+WgvzYZTldcvS4Sd3uZ6jC3H1gOyxPbMkBuU8xl+/D/KRhr2t7aDvAyiFbBk+GvxOXD
	xPF/JO05bMhk+uIN8GDsfLAL1n+CSQvjWSV0xCls=
Content-Type: multipart/mixed; boundary="===============9005272016549110132=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.7 FAILED
Message-ID: <0101019277ee4954-140113e8-bc86-49d6-9cb8-0a99cf2818f8-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205487

--===============9005272016549110132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markdown* to *3.7* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-markdown -V 3.7
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:50ee37975bd69440bd16785af6b53015b74d571f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1872 targets, 40 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:50ee37975bd69440bd16785af6b53015b74d571f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.7.tar.gz;downloadfilename=Markdown-3.7.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010133153.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010133153.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.7.tar.gz;downloadfilename=Markdown-3.7.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export PATH="/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/srv/pokybuild/yocto-worker/auh/build/scripts:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-if30ynmp/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-if30ynmp/work/recipe-sysroot/usr/bin/crossscripts:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-if30ynmp/work/recipe-sysroot-native/usr/sbin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-if30ynmp/work/recipe-sysroot-native/usr/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/re
 cipetool-if30ynmp/work/recipe-sysroot-native/sbin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-if30ynmp/work/recipe-sysroot-native/bin:/srv/pokybuild/yocto-worker/auh/build/bitbake/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools"; export HOME="/srv/pokybuild"; /usr/bin/env wget -t 2 -T 30 -O /srv/pokybuild/yocto-worker/auh/build/build/downloads/Markdown-3.7.tar.gz.tmp -P /srv/pokybuild/yocto-worker/auh/build/build/downloads 'https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.7.tar.gz' --progress=dot -v failed with exit code 8, see logfile for output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.7.tar.gz;downloadfilename=Markdown-3.7.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-if30ynmp/work/temp/log.do_fetch.563336
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.7.tar.gz;downloadfilename=Markdown-3.7.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9005272016549110132==--

