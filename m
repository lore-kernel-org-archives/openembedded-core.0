Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C179C88E40
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 05:20:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20299.1789276850940827244
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 22:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V9LPiDEW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oRFXKznL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a09936075a-42859f2e-69ab-4b84-b1dd-9464df25b16a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789276850;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=n5yXuJLh9iWw53ODg87MsRQDUh+iNW/FQ2uJifywOUI=;
	b=V9LPiDEWeAHPbgO05iJzjWxigwxZuvT45u3rcVzGTBJV0iYArxRLlwcxPRbMDFTr
	nUtJwkgQX9LNpOucbv707JPpI7wQAeKyVZGIY5KRHaU1vTVWd6V9pxNRBvu+P1gt9by
	TQKWgag+c9zikpKD9wOgYwbmaH3MBNOO78O8EEoU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789276850;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=n5yXuJLh9iWw53ODg87MsRQDUh+iNW/FQ2uJifywOUI=;
	b=oRFXKznL1P3BFFkf8jmIRFbZkkknrClevdfGR21wYLVyCH7dzAAKYfIghLH/oqab
	8yNt5uR8XBcJO3qciuZfx/wj5bnfbE3sb3abd8oc7c1cT/HJodOLlQ3Lz7HcgiU1Lvt
	bi5BuG/qo87J2Ok2/6PTBS1o0iSGBFC6O9x2rmy4=
Content-Type: multipart/mixed; boundary="===============0301984648617044982=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libsecret: upgrading to 0.21.8.2 FAILED
Message-ID: <010101a09936075a-42859f2e-69ab-4b84-b1dd-9464df25b16a-000000@us-west-2.amazonses.com>
Date: Sun, 13 Sep 2026 05:20:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.13-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 05:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245709

--===============0301984648617044982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsecret* to *0.21.8.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libsecret -V 0.21.8.2
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1990 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-0a2ed2a706462c245c702ac22b55a93fccfd3342"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:0a2ed2a706462c245c702ac22b55a93fccfd3342"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

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
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1991 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-0a2ed2a706462c245c702ac22b55a93fccfd3342"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:0a2ed2a706462c245c702ac22b55a93fccfd3342"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://download.gnome.org/sources//libsecret/0.21.8/libsecret-0.21.8.2.tar.xz;name=archive, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260913052034.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260913052034.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//libsecret/0.21.8/libsecret-0.21.8.2.tar.xz;name=archive...
ERROR: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/libsecret-0.21.8.2.tar.xz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://download.gnome.org/sources//libsecret/0.21.8/libsecret-0.21.8.2.tar.xz', '--progress=dot', '--verbose'] failed with exit code 8, see logfile for output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://download.gnome.org/sources//libsecret/0.21.8/libsecret-0.21.8.2.tar.xz;name=archive')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-o2sq1ou7/work/temp/log.do_fetch.4056832
ERROR: Failed to fetch URL https://download.gnome.org/sources//libsecret/0.21.8/libsecret-0.21.8.2.tar.xz;name=archive


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0301984648617044982==--

