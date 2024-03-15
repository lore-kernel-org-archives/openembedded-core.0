Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F03C54F36
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:17 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1250.1710522012666851723
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZiQTjUHG;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=D9bCD3X8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018e430ea0a1-0e6c196f-9ec0-430e-bdc5-425bb1875dea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522016;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hZAeN+BQ5pV0PpgfsqRd45UCNeWs7Pcp1jg+BgoSb7Y=;
	b=ZiQTjUHGnIHlTJdjmqTl6VY0c+96Uti5tRvy9FZNdq7e/fL/edL0AbL+W2xgCzLP
	XFJj9hH/OZtlZ294yjPnENleOhJie6D3s3xtJdFqAiW1kQ5sLYKZMCQ5jrJfPKI3CIN
	o3Z2A/tymEiEiz5znqpvo5GRL4lIVnH6Mb/MjeRw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522016;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hZAeN+BQ5pV0PpgfsqRd45UCNeWs7Pcp1jg+BgoSb7Y=;
	b=D9bCD3X8uXnPgCPWodnQ2zLph0PfYeyd/2XmDp7uAPaoAkdRXQFPLkppiOdZdHnO
	l0ozJtf/U5124/bFqMQY5nRLaKL+0C3kgLcLWlagxJAzEP74e9SdWLYpEMTYKbfzy0f
	q728pbwX00bYOVdU7THh7SHxUJVt0WUtRKBI5azc=
Content-Type: multipart/mixed; boundary="===============0403591696684672425=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] attr: upgrading to 2.5.2 FAILED
Message-ID: <0101018e430ea0a1-0e6c196f-9ec0-430e-bdc5-425bb1875dea-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197245

--===============0403591696684672425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *attr* to *2.5.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade attr -V 2.5.2
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7c250ed9a56d84dedd8a32f73d777f02328bbb1b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7c250ed9a56d84dedd8a32f73d777f02328bbb1b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 12 Local 9 Mirrors 0 Missed 3 Current 17 (75% match, 89% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| NOTE: Unpacking /srv/autobuilder/autobuilder.yocto.io/current_sources/attr-2.5.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-4t78np04/workdir/
| DEBUG: Searching for run-ptest in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/run-ptest for run-ptest
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/run-ptest to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-4t78np04/workdir/
| DEBUG: Searching for 0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/qemuall
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch for 0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-4t78np04/workdir/
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| DEBUG: Executing python function create_source_date_epoch_stamp
| DEBUG: Newest file found: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-4t78np04/workdir/attr-2.5.1/po/de.gmo
| DEBUG: SOURCE_DATE_EPOCH: 1615877358
| DEBUG: Python function create_source_date_epoch_stamp finished
| DEBUG: Executing python function do_qa_unpack
| DEBUG: Python function do_qa_unpack finished
| DEBUG: Executing python function devtool_post_unpack
| DEBUG: Python function devtool_post_unpack finished
NOTE: Tasks Summary: Attempted 93 tasks of which 82 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315150119.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315150119.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: ExecutionError('git config --local gc.autodetach 0', 128, '', 'shell-init: error retrieving current directory: getcwd: cannot access parent directories: No such file or directory\nfatal: Unable to read current working directory: No such file or directory\n')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-4t78np04/temp/log.do_unpack.1723102
ERROR: Extracting source for attr failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0403591696684672425==--

