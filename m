Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73410C47DB7
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.88860.1705340030340406462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TL15yQnI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DWAx5swW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018d0e2fd083-3b69a324-e624-4793-938f-2a2adc4cbd1d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lB1xuTm48a/p4WwfH/Om8dIjaIw+vddKjxvauBlwfXc=;
	b=TL15yQnImxxLBZFKEweTqBIpD9l+zLB5kOlz0tta5W9tvv7fXfs5e9KNHFcnlEoE
	N9um41b6vaj94UkNHTExJEo1/C7DJ9Q9ZAbXy5VusRKDkBa5mmxZZgLkf9plLFzNqfj
	1GuwrzLB/Td85N+ORcKrCoVZoVOm1O8yGNCzbxCY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lB1xuTm48a/p4WwfH/Om8dIjaIw+vddKjxvauBlwfXc=;
	b=DWAx5swWnOfeH2Q+Lhi9zlZEqE6Ufi7LtwdSgz+REQfhWDNFLNccTIRFH88VmyuF
	oWeiOlvOIdMYdHB0QMFOU9T/TwlSVAukgw4ZQUTBAzsbV7E9gWpJArHDjMQAT/3T5es
	aeYYkIgI9xWHfh2b//ASWNOvX+yrbCVPRV05IrHA=
Content-Type: multipart/mixed; boundary="===============3461573295805315720=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] attr: upgrading to 2.5.2 FAILED
Message-ID: <0101018d0e2fd083-3b69a324-e624-4793-938f-2a2adc4cbd1d-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193783

--===============3461573295805315720==
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
Loaded 1850 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-f1bfd35926ef2cc8183886b304ade121f235a655"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f1bfd35926ef2cc8183886b304ade121f235a655"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 4 Mirrors 0 Missed 3 Current 22 (57% match, 89% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
WARNING: No source unpacked to S - either the attr recipe doesn't use any source or the correct source directory could not be determined
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| NOTE: Unpacking /srv/autobuilder/autobuilder.yocto.io/current_sources/attr-2.5.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-zr91b77q/workdir/
| DEBUG: Searching for run-ptest in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/run-ptest for run-ptest
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/run-ptest to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-zr91b77q/workdir/
| DEBUG: Searching for 0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch in paths:
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/poky
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/x86-64
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr-2.5.1/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/
|     /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch for 0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-zr91b77q/workdir/
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| DEBUG: Executing python function create_source_date_epoch_stamp
| DEBUG: Newest file found: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-zr91b77q/workdir/attr-2.5.1/po/nl.po
| DEBUG: SOURCE_DATE_EPOCH: 1615877358
| DEBUG: Python function create_source_date_epoch_stamp finished
| DEBUG: Executing python function do_qa_unpack
| DEBUG: Python function do_qa_unpack finished
| DEBUG: Executing python function devtool_post_unpack
| DEBUG: Python function devtool_post_unpack finished
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| NOTE: Unpacking /srv/autobuilder/autobuilder.yocto.io/current_sources/attr-2.5.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-zr91b77q/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/run-ptest to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-zr91b77q/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-zr91b77q/workdir/
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| DEBUG: Executing python function create_source_date_epoch_stamp
| DEBUG: Newest file found: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-zr91b77q/workdir/attr-2.5.1/po/nl.po
| DEBUG: SOURCE_DATE_EPOCH: 1615877358
| DEBUG: Python function create_source_date_epoch_stamp finished
| DEBUG: Executing python function do_qa_unpack
| DEBUG: Python function do_qa_unpack finished
| DEBUG: Executing python function devtool_post_unpack
| WARNING: No source unpacked to S - either the attr recipe doesn't use any source or the correct source directory could not be determined
| DEBUG: Python function devtool_post_unpack finished
NOTE: Tasks Summary: Attempted 90 tasks of which 85 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115161650.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115161650.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: ExecutionError('git tag -f devtool-base', 128, '', "fatal: Failed to resolve 'HEAD' as a valid ref.\n")
ERROR: ExecutionError('git checkout -b devtool-orig', 128, '', "fatal: a branch named 'devtool-orig' already exists\n")
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-zr91b77q/temp/log.do_unpack.1160815
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-zr91b77q/temp/log.do_unpack.1160767
ERROR: Extracting source for attr failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3461573295805315720==--

