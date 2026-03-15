Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25332EFCBC5
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:57 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28787.1773582108951290625
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CdPlihWk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AeDoXouZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019cf1bb4604-d39c6a0a-2fb0-40ef-804f-05ffc0c2669a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582108;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kng6R0CHH4406EeIOEghKt6QydqE+uwqze2LVDwy0BQ=;
	b=CdPlihWkFJTCUwIM8yYFhlYG2NJVkN3KiXPfCICtxsY5MbLCPXfL0e/4AHcWRylt
	eD5izz67asEc/TqPHOhWFU9paxT2PRDrWPN4GzTb3UqIvSCZIOJnpv6B/ReDsPR3Fe/
	SiQJ0+TihSZHcWwrXewaDBtNBI3pVRin2rLAXjFQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582108;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kng6R0CHH4406EeIOEghKt6QydqE+uwqze2LVDwy0BQ=;
	b=AeDoXouZGj/+HoIIe8KU41rYkh2S28eRHzR2dhHIEnvJXG5vAfiQFw2nOzYVO+i0
	pUu+1BEuO/zgH3F/lMn9JFVsnyUkAkG/BRcoV9qf5jID6i0fF3fiHYJiZwIlwKqCSDk
	KsN+2F++l4WFgd257rL8xT2alBnmG/s/aPqVQeB0=
Content-Type: multipart/mixed; boundary="===============6466095226239202624=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm-project-source-21.1.8: upgrading to 22.1.1 FAILED
Message-ID: <0101019cf1bb4604-d39c6a0a-2fb0-40ef-804f-05ffc0c2669a-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233116

--===============6466095226239202624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm-project-source-21.1.8* to *22.1.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade llvm-project-source-21.1.8 -V 22.1.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-2c396e36fd9d47b29f42ed84a4393d6980ac8a49"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:2c396e36fd9d47b29f42ed84a4393d6980ac8a49"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 112 tasks of which 110 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315051910.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260315051910.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: S should be set relative to UNPACKDIR, e.g. replace WORKDIR with UNPACKDIR in "S = ${WORKDIR}/llvm-project-21.1.8.src"
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work-shared/llvm-project-source-21.1.8-r1/devtooltmp-vj9nlhp_/temp/log.do_unpack.1304443
ERROR: Extracting source for llvm-project-source-21.1.8 failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6466095226239202624==--

