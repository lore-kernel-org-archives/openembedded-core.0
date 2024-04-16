Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDDBC3DA44
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.13581.1713248037586380073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Q+a9iGyP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=TC3Q+nfF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018ee58aa2b5-69c5bc75-657d-4b05-888f-894c50f8d2a5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IakcQWWYYx9PkWoev+GfFaR7zbTIl1UJPudwGDnsxG8=;
	b=Q+a9iGyP8PQehHozl31wvpzxqX6nh8bUTqGes/cu44UpZmKEKO3R5HF3ic/S/c2Y
	zrlWzsN7w4bGwuYlsJFUQ1VfeudD+SasivXgwhEM9Ig9RIF+Rs9k3TmJLiLGnbH0HQP
	fY0dOtZnHZxcekMHZlMqZprdCLkBqtRVpS8FIgRw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IakcQWWYYx9PkWoev+GfFaR7zbTIl1UJPudwGDnsxG8=;
	b=TC3Q+nfFa5UoNxwlGCpCt1ekB4G3tBPNAg3OBGBPg/1dJRYBvsG6J8DdclMhhkkx
	LahVw5ImsWKUqGngbLk4Gxpe1E/MdXDI/OjIl8KqVR1ef9N6iKovdUsRG2tUJdV0Yci
	dgCkAdlLxrvmWS20Oy/YbM7KR+d8OVcnOW0x3vx8=
Content-Type: multipart/mixed; boundary="===============3049680689465217259=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] attr: upgrading to 2.5.2 FAILED
Message-ID: <0101018ee58aa2b5-69c5bc75-657d-4b05-888f-894c50f8d2a5-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198412

--===============3049680689465217259==
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
Loaded 1878 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-36ac18a6366edb43e0e1d33e59d333139cd827bb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:36ac18a6366edb43e0e1d33e59d333139cd827bb"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 12 Local 9 Mirrors 0 Missed 3 Current 17 (75% match, 89% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| NOTE: Unpacking /srv/autobuilder/autobuilder.yocto.io/current_sources/attr-2.5.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-7cnce3wq/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/run-ptest to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-7cnce3wq/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-7cnce3wq/workdir/
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| DEBUG: Executing python function create_source_date_epoch_stamp
| DEBUG: Newest file found: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-7cnce3wq/workdir/attr-2.5.1/include/config.h.in
| DEBUG: SOURCE_DATE_EPOCH: 1615877358
| DEBUG: Python function create_source_date_epoch_stamp finished
| DEBUG: Executing python function do_qa_unpack
| DEBUG: Python function do_qa_unpack finished
| DEBUG: Executing python function devtool_post_unpack
| DEBUG: Python function devtool_post_unpack finished
NOTE: Tasks Summary: Attempted 93 tasks of which 82 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240416035901.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240416035901.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: ExecutionError('git init', 128, '', 'shell-init: error retrieving current directory: getcwd: cannot access parent directories: No such file or directory\nfatal: unable to get current working directory: No such file or directory\n')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-7cnce3wq/temp/log.do_unpack.2297105
ERROR: Extracting source for attr failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3049680689465217259==--

