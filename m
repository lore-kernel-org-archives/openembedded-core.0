Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F4A10F9313
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:05 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14645.1775054155865529887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=v6gBtrYQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=B7qK5be1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d4978eda1-44eb7d2f-805a-41fe-bfc6-8fed2d4619ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l1kXZdZI7kp6AAKF9F2xdr4h9bkK8Wr1TohLg+w0a94=;
	b=v6gBtrYQw3c+/qXAOXLBkZeaUjjdQnm/iZ8c/6bWfxJwG1n+1oDRbqcbuYs6x2a9
	dUSs+mO0xhQcv7uTDbdI1RzhWMAyYi/EzTj0sEdUVnA5/ZWEtiZmFhWJrLhTgGhV8RP
	N6+vW8BUC/vW2eiSB8L3I1+nMFukIjDXOLL3yyJ8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l1kXZdZI7kp6AAKF9F2xdr4h9bkK8Wr1TohLg+w0a94=;
	b=B7qK5be1l43kVfp7/3ztTd29e+kOKAyX+FdwOETU5zoY5rBxpNXf1xFgSBYo0RyU
	Ss544h5tlizV418wIrg7X5jI7EvK8FT3pBbb8xpVtkFFVS9HY3Lgz4PwTWNNEJKyJzn
	wB1fppraMfHTGIrQNothW1BYLolsBNaSSXSL99vQ=
Content-Type: multipart/mixed; boundary="===============5230463468363206074=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules,lttng-ust,lttng-tools: upgrading to
 2.15.0,2.15.0,2.15.0 FAILED
Message-ID: <0101019d4978eda1-44eb7d2f-805a-41fe-bfc6-8fed2d4619ab-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:35:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234359

--===============5230463468363206074==
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
Loaded 1975 entries from dependency cache.
Parsing recipes...done.
Parsing of 953 .bb files complete (951 cached, 2 parsed). 1973 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-e6a1c9f8fbf8323e1121ab59bb4fe8fde7117f5e"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e6a1c9f8fbf8323e1121ab59bb4fe8fde7117f5e"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
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
Parsing of 954 .bb files complete (0 cached, 954 parsed). 1974 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-e6a1c9f8fbf8323e1121ab59bb4fe8fde7117f5e"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e6a1c9f8fbf8323e1121ab59bb4fe8fde7117f5e"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
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
INFO: Rebasing devtool onto fc9901a1c9d5bf1b153b2c799594ab5a5e3d6f8e
WARNING: Command 'git rebase fc9901a1c9d5bf1b153b2c799594ab5a5e3d6f8e' failed:
CONFLICT (modify/delete): tests/utils/testapp/userspace-probe-elf-binary/Makefile.am deleted in HEAD and modified in abbb752 (tests: do not strip a helper library).  Version abbb752 (tests: do not strip a helper library) of tests/utils/testapp/userspace-probe-elf-binary/Makefile.am left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
tests/utils/testapp/userspace-probe-elf-binary/Makefile.am: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5230463468363206074==--

