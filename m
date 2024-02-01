Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A68FC4829A
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:15 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.2126.1706810408580349583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JnGhi9m7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VpRmGOQ8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018d65d3fc9a-accc6b4f-660f-4a8b-94a0-c0696816474c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cSCKpNUs1w+tV0WLMGx7H4hhwakINKCYYbaxUHZFIRk=;
	b=JnGhi9m7qREgaoowa7YtUln1pIlhAjL5kthNMK4NONQw5Ein1GpfwktJ4m1Y54L6
	iI9JUxH+VQ+OYOIFG0okRImyZGyRStu6CkTNBsMJpL4StKKmm01yfcy2WH3zloYgoAj
	1TCIyuon2O7fzaBs1nCJZK7LUAbHBUzsHAxDHi5g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cSCKpNUs1w+tV0WLMGx7H4hhwakINKCYYbaxUHZFIRk=;
	b=VpRmGOQ8d61GVMF2IxMY0M5o2Qxd/1sKa/Hdgb278wOt9dEJ0AIzMJLegqDAq9p9
	OIJKmBsOVG4O9hI47MZRbbUVgROYGgawc+2L25tKDoCt6XwQ7Hp5D0Z5qLQMgCk62Gk
	5rUISxhl3iH/0qsKkriKPai9iH6RlpgdGSl8uXOc=
Content-Type: multipart/mixed; boundary="===============7582024772916008434=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] attr: upgrading to 2.5.2 FAILED
Message-ID: <0101018d65d3fc9a-accc6b4f-660f-4a8b-94a0-c0696816474c-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194713

--===============7582024772916008434==
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
Loaded 1849 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-eccefd46dd9b3195820e6697118b831de7c2fb5f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:eccefd46dd9b3195820e6697118b831de7c2fb5f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 4 Mirrors 0 Missed 3 Current 22 (57% match, 89% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| NOTE: Unpacking /srv/autobuilder/autobuilder.yocto.io/current_sources/attr-2.5.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-yzg_bjrf/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/run-ptest to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-yzg_bjrf/workdir/
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
| NOTE: Unpacking /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch to /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-yzg_bjrf/workdir/
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| DEBUG: Executing python function create_source_date_epoch_stamp
| DEBUG: Newest file found: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-yzg_bjrf/workdir/attr-2.5.1/include/config.h.in
| DEBUG: SOURCE_DATE_EPOCH: 1615877358
| DEBUG: Python function create_source_date_epoch_stamp finished
| DEBUG: Executing python function do_qa_unpack
| DEBUG: Python function do_qa_unpack finished
| DEBUG: Executing python function devtool_post_unpack
| DEBUG: Python function devtool_post_unpack finished
NOTE: Tasks Summary: Attempted 93 tasks of which 85 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201163816.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201163816.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: ExecutionError('git init', 128, '', 'shell-init: error retrieving current directory: getcwd: cannot access parent directories: No such file or directory\nfatal: unable to get current working directory: No such file or directory\n')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/attr/2.5.1/devtooltmp-yzg_bjrf/temp/log.do_unpack.3553490
ERROR: Extracting source for attr failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7582024772916008434==--

