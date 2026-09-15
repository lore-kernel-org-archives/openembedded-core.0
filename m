Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E8AC88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 05:49:26 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16931.1789451365054748058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 22:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bv+O+jQT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=w20cFxye;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a0a39ce629-269c78ad-9246-4c17-aa47-a7df378d29de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789451364;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w278AefKHANGuzAsrskJq6y2q/9j3oRgO17tfun3gx0=;
	b=bv+O+jQT8LMZFdoj6fzrbgncqY8N1SzkxWEuSCiv/NbYjYMfjcI7X4VxzFTcZ+2P
	qrde9+kiRHXSn6ymsKrJMqRKKht1ZRS67vSsh1pNldTIBI9s6dv72/AR6CCi0wRY60i
	jYmSsaNJtinuCqhOLVhctyTaWfe2djU6DndOpwbg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789451364;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w278AefKHANGuzAsrskJq6y2q/9j3oRgO17tfun3gx0=;
	b=w20cFxyeMUlKM5x66cv3BAFQ/R9C7FHyXCfoJVQDqQjIOIzm4mtUrCv/9Dxecy/w
	IdQRN6HEWwyM8lomyc9tpJOmK8YG02vUXy6j1rO8VBgXNIDUuERhd/+9/D9XnCRDx37
	pBiAQnZtHfMufDWFdd7SWFFfSFkTA/j2tyuIjaWs=
Content-Type: multipart/mixed; boundary="===============4930965882644243081=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtest-fatal-perl: upgrading to 0.019 FAILED
Message-ID: <010101a0a39ce629-269c78ad-9246-4c17-aa47-a7df378d29de-000000@us-west-2.amazonses.com>
Date: Tue, 15 Sep 2026 05:49:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 05:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245812

--===============4930965882644243081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtest-fatal-perl* to *0.019* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libtest-fatal-perl -V 0.019
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1993 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-225db9c0df20fdf07479c6d0b992dd52fe2a8464"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:225db9c0df20fdf07479c6d0b992dd52fe2a8464"
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
Parsing of 960 .bb files complete (0 cached, 960 parsed). 1994 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-225db9c0df20fdf07479c6d0b992dd52fe2a8464"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:225db9c0df20fdf07479c6d0b992dd52fe2a8464"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Test-Fatal-0.019.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260915051127.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260915051127.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Test-Fatal-0.019.tar.gz...
ERROR: Fetcher failure: Fetch command ['wget', '--tries=2', '--timeout=100', '--output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/Test-Fatal-0.019.tar.gz.tmp', '--continue', '--directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads', 'https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Test-Fatal-0.019.tar.gz', '--progress=dot', '--verbose'] failed with exit code 8, see logfile for output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Test-Fatal-0.019.tar.gz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-pb8glgu8/work/temp/log.do_fetch.3436952
ERROR: Failed to fetch URL https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Test-Fatal-0.019.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4930965882644243081==--

