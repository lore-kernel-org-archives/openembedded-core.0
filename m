Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4942BC3DA4E
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:29 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.18372.1718475799216777303
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LcCGdHUb;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=GcT0qx76;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101901d23bc06-197ff674-0145-46fc-973b-36d2afec874a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=urOO0J2Z5HO+3vnTQlvDYFQeHNXZTBnPuROKnijZ660=;
	b=LcCGdHUbNu1QHlODp+gKN9jeEB4zaKnxQs223i6n4QYhgzSEFpjjwf/R6JeuizLq
	/etQz+401hgqPze84LopXeNaz24rTj8b2HF+A2tB3Oh82EufFcEF0mzg/H8KC5oIjRQ
	v7QzI2VLVLrJe5RrEPVhr293ALfsM7+jX6tV9Tf4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475799;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=urOO0J2Z5HO+3vnTQlvDYFQeHNXZTBnPuROKnijZ660=;
	b=GcT0qx76FSS8PgCUI00dHLtfyHVn0SVx8y3E2CQbAAkKbSRZadd++ChrRaiabOeJ
	Gs4FSL2/E2RWSaaLwO1bMvUVQoRwi+EgjUwvqsQBEvRd8OuMemAdAPCoC6mReDDBjWJ
	Fsx5/EfX8grDwRgLHQbsMeqsxwFI75Nno9Ft8GsY=
Content-Type: multipart/mixed; boundary="===============0693763470016783704=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.16.0 FAILED
Message-ID: <010101901d23bc06-197ff674-0145-46fc-973b-36d2afec874a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200711

--===============0693763470016783704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shadow* to *4.16.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade shadow -V 4.16.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-54b16bf0386a8e701353d41e162b39c06a145a43"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:54b16bf0386a8e701353d41e162b39c06a145a43"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1882 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-54b16bf0386a8e701353d41e162b39c06a145a43"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:54b16bf0386a8e701353d41e162b39c06a145a43"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://github.com/shadow-maint/shadow/releases/download/4.16.0/shadow-4.16.0.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240615113507.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240615113507.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/shadow-maint/shadow/releases/download/4.16.0/shadow-4.16.0.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/scripts:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-j5vaw_3r/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-j5vaw_3r/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-j5vaw_3r/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipe
 tool-j5vaw_3r/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-j5vaw_3r/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-j5vaw_3r/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 -O /srv/autobuilder/autobuilder.yocto.io/current_sources/shadow-4.16.0.tar.gz.tmp -P /srv/autobuilder/autobuilder.yocto.io/current_sources 'https://github.com/shadow-maint/shadow/releases/download/4.16.0/shadow-4.16.0.tar.gz' --progress=dot -v failed with exit code 8, see logfile for output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/shadow-maint/shadow/releases/download/4.16.0/shadow-4.16.0.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-j5vaw_3r/work/temp/log.do_fetch.3460961
ERROR: Failed to fetch URL https://github.com/shadow-maint/shadow/releases/download/4.16.0/shadow-4.16.0.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0693763470016783704==--

