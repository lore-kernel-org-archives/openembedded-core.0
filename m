Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE7BC79F8E
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 06:28:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3416.1788589715343453452
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 23:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=a2FZL6PO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TiO/EOFN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a070412b0f-6673ac55-4c4b-415e-9aec-cb2180720d4d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788589714;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Gll5ISrL7VISrjbB4FGqM9reRFl1sRTY6ZDMuuu/gU0=;
	b=a2FZL6PO/LNlyXNYEOeLytbWEJydRbg5PA+q6uWROq0SYxYncMLfRgHzsJSZ8UlM
	cL014LBRFh5V91pOcEBO/pYY04uBVxNW0PUG4gePL6d6bXBPX0YpmNUzSnHUsy0VXvu
	+/GPw+3+S0poDq2kOS5WBegtDVO+aIG/NCf2+Xf8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788589714;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Gll5ISrL7VISrjbB4FGqM9reRFl1sRTY6ZDMuuu/gU0=;
	b=TiO/EOFNXK6rUSS7U1b3ikJKmvpW7XC0+83GwucEA/tc3foqAnyyyyXZw7StgaKd
	1rgnrF/AZQH7y3swi3xVaRv8B1RkaBizmbHR5NxkRqcmWPUZpBY3l9j5f8c9G3ZZ3IK
	i5T4PrjOo3ARsKgSkhJDqjO4FGsp2iroMwcY4ywg=
Content-Type: multipart/mixed; boundary="===============8810167917393485299=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-libarchive-c: upgrading to 5.3 FAILED
Message-ID: <010101a070412b0f-6673ac55-4c4b-415e-9aec-cb2180720d4d-000000@us-west-2.amazonses.com>
Date: Sat, 5 Sep 2026 06:28:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 06:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245133

--===============8810167917393485299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-libarchive-c* to *5.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-libarchive-c -V 5.3
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1988 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-042bcc71cbedb2cc5fc224b025d236ed0ff53b42"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:042bcc71cbedb2cc5fc224b025d236ed0ff53b42"
meta-yocto-bsp       
meta-poky            = "master:3bb1295755628c4facec3a0a2800a9c12345ce00"
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
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1989 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-042bcc71cbedb2cc5fc224b025d236ed0ff53b42"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:042bcc71cbedb2cc5fc224b025d236ed0ff53b42"
meta-yocto-bsp       
meta-poky            = "master:3bb1295755628c4facec3a0a2800a9c12345ce00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.3.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260905055953.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260905055953.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.3.tar.gz...
ERROR: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/libarchive-c-5.3.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.3.tar.gz', '--progress=dot', '--verbose'] failed with exit code 8, see logfile for output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.3.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-p6mkuwd5/work/temp/log.do_fetch.2554869
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.3.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8810167917393485299==--

