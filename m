Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3057C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 06:54:21 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33925.1789109660787133067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 23:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gWo1P14P;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=I/f93nJJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a08f3ee886-85743345-5083-4df4-9b54-ed2298aa16a5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789109659;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fV5QS66r7qucKVU6dbWHD+fZlWDsSa0RSXPmkON6Xds=;
	b=gWo1P14PN3X4ogkX/89qrxk6zv6RwijCJ4FVgi1Mywrup5kL8ExhjfzZSJ4i9fct
	xc77yM7YwTdObrJ95W9FuGS19Fsx1MNkPYSUEX27+xvTtdEudkpSXcUEO+L1d4km8JT
	eaXSPra4oX2t3oDLnxTdcvw4TTqbvzXlIAYXT+ZU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789109659;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fV5QS66r7qucKVU6dbWHD+fZlWDsSa0RSXPmkON6Xds=;
	b=I/f93nJJulkFRh4rmUZWdYZpLVfAq7Zph7rKMxhG3Z/DIisEjU0MpfLYP6L6KcOr
	rAyFadcqz5qpyGtslLWlOCr8CDrYW4DpMR943gI4B0pbiQfZFinudLARp7024YYpBFx
	LEpxErjiE+CI/C/DslStkrDpjUbFvclfeXToIOXg=
Content-Type: multipart/mixed; boundary="===============4886252916525530935=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Liu Yiding <liuyd.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] blueprint-compiler: upgrading to 0.22.2 FAILED
Message-ID: <010101a08f3ee886-85743345-5083-4df4-9b54-ed2298aa16a5-000000@us-west-2.amazonses.com>
Date: Fri, 11 Sep 2026 06:54:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.11-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 06:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245611

--===============4886252916525530935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *blueprint-compiler* to *0.22.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade blueprint-compiler -V 0.22.2 -S ed35ac74de0c1bb1f5e852410b97edd1f08904c9
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
DISTRO_VERSION       = "6.0.99+snapshot-d61d83291d89d255078ae92395330a98b83f8ae5"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d61d83291d89d255078ae92395330a98b83f8ae5"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout ed35ac74de0c1bb1f5e852410b97edd1f08904c9' failed with exit code 128:
fatal: unable to read tree (ed35ac74de0c1bb1f5e852410b97edd1f08904c9)



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4886252916525530935==--

