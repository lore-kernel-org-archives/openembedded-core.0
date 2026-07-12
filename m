Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644F9C4450B
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 06:31:41 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9789.1783837894126618116
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 23:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IstQ0h+r;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dUXBk8lU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019f55062240-4bb3ff10-fa7f-45f8-a592-22722a8bdd44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783837893;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=E1J7q4R0WPbj5cdcYJ3SMWA2uOLQ/zpa+YMeSt3PwBM=;
	b=IstQ0h+rEYQb/+nKIVGuax2M5xqCUH1Zto6SFszchlZwNi4xFJq6Ah8k8PGZH7Vt
	hDxxFx+1GezQwPuClGj8otANWnrSBhOcr0ck/VhW1jodGnCmkbdWw6JFzO+ZqXEDIdp
	rpSwkWXX9AkgRh2gEnzsvmnm3eHSH6K3KS+71fcc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783837893;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=E1J7q4R0WPbj5cdcYJ3SMWA2uOLQ/zpa+YMeSt3PwBM=;
	b=dUXBk8lUVt91MTkbw0T3lBUMhZNrnAfuYDhy1aq9JoJkoMkZu7GcKHuOxZgynGP3
	LDIl7r4nnyBduz6EJRFVjgBbbuA/CubqSjMiohBrRq4yBm611hh+SmXeP0sqHIhk+tz
	TqT2dPMfZuYX7TRPAsoPJduhr8XsdKGWOOPs+oYs=
Content-Type: multipart/mixed; boundary="===============7629621018797916905=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] screen: upgrading to 5.0.2 FAILED
Message-ID: <0101019f55062240-4bb3ff10-fa7f-45f8-a592-22722a8bdd44-000000@us-west-2.amazonses.com>
Date: Sun, 12 Jul 2026 06:31:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.12-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 06:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240760

--===============7629621018797916905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *screen* to *5.0.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade screen -V 5.0.2
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-0284bfcf6681bc6c9197c2952aa60a3686d4bf64"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:0284bfcf6681bc6c9197c2952aa60a3686d4bf64"
meta-yocto-bsp       
meta-poky            = "master:8a8f9ad79e3d50312566620998dadff0aa29c7a7"
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
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-0284bfcf6681bc6c9197c2952aa60a3686d4bf64"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:0284bfcf6681bc6c9197c2952aa60a3686d4bf64"
meta-yocto-bsp       
meta-poky            = "master:8a8f9ad79e3d50312566620998dadff0aa29c7a7"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://ftpmirror.gnu.org/gnu/screen/screen-5.0.2.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260712060005.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260712060005.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/screen/screen-5.0.2.tar.gz...
ERROR: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/screen-5.0.2.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://ftpmirror.gnu.org/gnu/screen/screen-5.0.2.tar.gz', '--progress=dot', '--verbose'] failed with exit code 8, see logfile for output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://ftpmirror.gnu.org/gnu/screen/screen-5.0.2.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-v45r7u7i/work/temp/log.do_fetch.755246
ERROR: Failed to fetch URL https://ftpmirror.gnu.org/gnu/screen/screen-5.0.2.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7629621018797916905==--

