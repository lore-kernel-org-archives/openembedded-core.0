Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C67EEFCBB7
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:56 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28965.1773582112022947695
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Xs7SmeAD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LhomFtkd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019cf1bb5219-70e3829e-5580-4e56-848b-4c1721677d4c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582111;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RMhhU9nAfH3nU+fb1ZDDKPbxO+QHLHCqnCHyvPsBv1A=;
	b=Xs7SmeADiRTXMBY8L+9ffIPVc46ogRpvLeFgZyjddh0yndC5r9UiqrWn2okY3vrR
	ncNWmbWF/2gd27TBdhf2Fd8q5FKzF7qwF8/SrlnHQDn2Uemsu9SqoBDEyQWNodsAfGo
	Oe+QFxIHHD6/J1+OryBXRJd190tOcpVWBl8M1a08=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582111;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RMhhU9nAfH3nU+fb1ZDDKPbxO+QHLHCqnCHyvPsBv1A=;
	b=LhomFtkd2k5NiV/CkOVsmcEdSVg08uRcNeuzYi6TFc1aEOEcr9qWrZR6Prqo87Ck
	bm6vG9Zi4pRiNSosjDkqtyKep/fKbYg6cMi/+6YqvfhWOizx5o1qC95jp1AC7z5YdS8
	a+P0CXNZ5BoTpKVeTUHOnPd3U7kgQSjV6SzxkRis=
Content-Type: multipart/mixed; boundary="===============7229952292656788866=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules,lttng-ust,lttng-tools: upgrading to
 2.15.0,2.15.0,2.15.0 FAILED
Message-ID: <0101019cf1bb5219-70e3829e-5580-4e56-848b-4c1721677d4c-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233123

--===============7229952292656788866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lttng-modules,lttng-ust,lttng-tools* to *2.15.0,2.15.0,2.15.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade lttng-tools -V 2.15.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1971 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (950 cached, 2 parsed). 1974 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-db045f0a204ad18cdc101e749f4c17c2d1df68fc"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:db045f0a204ad18cdc101e749f4c17c2d1df68fc"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
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
Parsing of 953 .bb files complete (0 cached, 953 parsed). 1975 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-db045f0a204ad18cdc101e749f4c17c2d1df68fc"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:db045f0a204ad18cdc101e749f4c17c2d1df68fc"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
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
INFO: Rebasing devtool onto f38e14a98db5410a60e4f5c16e3955980a28f68a
WARNING: Command 'git rebase f38e14a98db5410a60e4f5c16e3955980a28f68a' failed:
CONFLICT (modify/delete): tests/utils/testapp/userspace-probe-elf-binary/Makefile.am deleted in HEAD and modified in 1c42c65 (tests: do not strip a helper library).  Version 1c42c65 (tests: do not strip a helper library) of tests/utils/testapp/userspace-probe-elf-binary/Makefile.am left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
tests/utils/testapp/userspace-probe-elf-binary/Makefile.am: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7229952292656788866==--

