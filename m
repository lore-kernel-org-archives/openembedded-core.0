Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3764FCD5BA1
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:35 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34754.1778851225997440227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nqcqKnHb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3+I2QiPf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e2bcb9f30-5987c479-3158-4ac2-a29c-b2a60fb01861-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=R9lodELFzYgKU7qMfa95Fc0r8Yi9rwhPdAt5Ncx4iHQ=;
	b=nqcqKnHb+CtME/hEXNEK7aGhy5KysIhne+PB9xkKpCQA7ODd4rsPcTkw5dFm8Amo
	j3IYy3YjWSems42pomTDMCJrXGsT7NYCF92JRiLgx1Kg0K4y/rPgk/VXdnTrgVsiwOZ
	HhuYQ+U/UaOfJhOtYOltzJdNSZ5daQixBw9KUJ/g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=R9lodELFzYgKU7qMfa95Fc0r8Yi9rwhPdAt5Ncx4iHQ=;
	b=3+I2QiPfeX9/x02F9eRq84bQGfd/a2KgP/jKzBqxNHZOHPIubQeyBbfUfOCk5qra
	tDo6MXzt0g6HTuu+VuQUlkxXCnvgexdjq+dWWvElrrEmZSCGvnVW8SRikMlqxbZQ03n
	aG7h3OB8OnM+ImEYMNqaaO7y2uN31axxUT6TsYF4=
Content-Type: multipart/mixed; boundary="===============5896174301316329880=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules,lttng-ust,lttng-tools: upgrading to
 2.15.1,2.15.0,2.15.0 FAILED
Message-ID: <0101019e2bcb9f30-5987c479-3158-4ac2-a29c-b2a60fb01861-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237094

--===============5896174301316329880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lttng-modules,lttng-ust,lttng-tools* to *2.15.1,2.15.0,2.15.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade lttng-tools -V 2.15.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1974 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (949 cached, 2 parsed). 1977 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-764edc6c8d7b4863e7866db44c96cf7ff0daa262"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:764edc6c8d7b4863e7866db44c96cf7ff0daa262"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
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
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1978 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-764edc6c8d7b4863e7866db44c96cf7ff0daa262"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:764edc6c8d7b4863e7866db44c96cf7ff0daa262"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  11% |####                                | ETA:  0:00:00
Adding changed files:  22% |########                            | ETA:  0:00:00
Adding changed files:  33% |############                        | ETA:  0:00:00
Adding changed files:  44% |################                    | ETA:  0:00:00
Adding changed files:  55% |####################                | ETA:  0:00:00
Adding changed files:  66% |########################            | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-tools/lttng-tools-2.15.0.tar.bz2...
INFO: Rebasing devtool onto c5f743fa345bbf85015618d660fe637e47ddce94
WARNING: Command 'git rebase c5f743fa345bbf85015618d660fe637e47ddce94' failed:
CONFLICT (modify/delete): tests/utils/testapp/userspace-probe-elf-binary/Makefile.am deleted in HEAD and modified in 30b5a5c (tests: do not strip a helper library).  Version 30b5a5c (tests: do not strip a helper library) of tests/utils/testapp/userspace-probe-elf-binary/Makefile.am left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
tests/utils/testapp/userspace-probe-elf-binary/Makefile.am: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5896174301316329880==--

