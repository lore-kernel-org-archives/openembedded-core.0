Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE51CA0ECB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:49 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.88800.1754057267128198881
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dka9ts9j;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DMK7v2sC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019865f5d5a2-a59c2e34-c0d3-4bfb-a79b-31b7ab8fabbb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057266;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tor06trHZaASMNJAR4gv14y4I/anJZoLpBqNesBAp7I=;
	b=dka9ts9jaGd9tPwrb2KQG++3DkeFBEwh8Xy92x2QZoStLwN/+WOLC1RzZRtn64iW
	kzDA1AG/HddNJa+xBDDl7xvgSHAREXOzscy8dIzLTqFWQVSRSKlzxhYjMpQgpEwDw7M
	JqoYGpQdZ0Ixn/qZPLy6XZh+mKnM1IeNTl2Glt7g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057266;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tor06trHZaASMNJAR4gv14y4I/anJZoLpBqNesBAp7I=;
	b=DMK7v2sCHuP/BGlePxm1MUj5n1gwUwDrw8Mn2c9v8q5RKZCAdt1Q7527zCvaAnE9
	wkVGjHX720loqW7vpz2ZGqI1VbpliW30CqXdTREauvpIEscomp5fIrRI1zfZq2Z7NqG
	Gn1ZhdV/fla8nL9PmR4yVxxg6Z09CK55vPCvWFjk=
Content-Type: multipart/mixed; boundary="===============1464255929681107339=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-tools,lttng-ust,lttng-modules: upgrading to
 2.14.0,2.14.0,2.14.0 FAILED
Message-ID: <0101019865f5d5a2-a59c2e34-c0d3-4bfb-a79b-31b7ab8fabbb-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221253

--===============1464255929681107339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lttng-tools,lttng-ust,lttng-modules* to *2.14.0,2.14.0,2.14.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade lttng-tools -V 2.14.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1933 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-14787892e5cef18f15774b2950a101dc1a1b8d36"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:14787892e5cef18f15774b2950a101dc1a1b8d36"

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
Parsing of 943 .bb files complete (0 cached, 943 parsed). 1934 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-14787892e5cef18f15774b2950a101dc1a1b8d36"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:14787892e5cef18f15774b2950a101dc1a1b8d36"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   5% |#                                   | ETA:  0:00:02
Adding changed files:  10% |###                                 | ETA:  0:00:01
Adding changed files:  16% |#####                               | ETA:  0:00:01
Adding changed files:  21% |#######                             | ETA:  0:00:01
Adding changed files:  26% |#########                           | ETA:  0:00:01
Adding changed files:  32% |###########                         | ETA:  0:00:00
Adding changed files:  37% |#############                       | ETA:  0:00:00
Adding changed files:  43% |###############                     | ETA:  0:00:00
Adding changed files:  48% |#################                   | ETA:  0:00:00
Adding changed files:  53% |###################                 | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files:  69% |#########################           | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  80% |#############################       | ETA:  0:00:00
Adding changed files:  86% |##############################      | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-tools/lttng-tools-2.14.0.tar.bz2...
INFO: Rebasing devtool onto 8c8439ee5569221efdefa1fdd4f66d61b56778d4
WARNING: Command 'git rebase 8c8439ee5569221efdefa1fdd4f66d61b56778d4' failed:
CONFLICT (modify/delete): src/common/compat/compat-fcntl.c deleted in HEAD and modified in f046d1e (compat: off64_t is not defined by musl).  Version f046d1e (compat: off64_t is not defined by musl) of src/common/compat/compat-fcntl.c left in tree.
CONFLICT (modify/delete): src/common/compat/fcntl.h deleted in HEAD and modified in f046d1e (compat: off64_t is not defined by musl).  Version f046d1e (compat: off64_t is not defined by musl) of src/common/compat/fcntl.h left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
src/common/compat/compat-fcntl.c: needs merge
src/common/compat/fcntl.h: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1464255929681107339==--

