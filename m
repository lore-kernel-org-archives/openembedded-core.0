Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061B6C44501
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 05:52:38 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14770.1782798750849008378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 22:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HjwEBM3g;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=k1Rpz4e1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019f171610cb-e269d473-870d-42f4-b339-12dd1cb74387-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782798750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=69vIFS1NaM8fgKW313b6e7znAIr7Mdx3+YZdVPa6r3s=;
	b=HjwEBM3gN0uUWN+jWqijeFkXznXvL3avnd5ljAWa9fiDOvErMKKbKvG8ikT9FfZY
	OhafTmdynR1rvIyqDjedPE0xDvcXcibcZKYDwXhulns7bzECxb5l8SSeZXN+BIkkppQ
	jW/yw14l5hTBEkQhdx3bBNgutap+Oc1pf9VXp+UU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782798750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=69vIFS1NaM8fgKW313b6e7znAIr7Mdx3+YZdVPa6r3s=;
	b=k1Rpz4e1NGNBZ3cVxGjJz4tkJaw5fdoFsrogAGCQyufhlmLZSn1Z+bS/ctYxkLbt
	TIJyI78razsGPPhMJifxfVjbUJ/D4ok00rSz1AaxoJ37OoHJVepm/m/nmcguZfaRZJu
	gMLhZMXBZnILynKk9y89UiC+rRj/92OFVZ/1YZF4=
Content-Type: multipart/mixed; boundary="===============1307496881185515784=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] attr: upgrading to 2.6.0 FAILED
Message-ID: <0101019f171610cb-e269d473-870d-42f4-b339-12dd1cb74387-000000@us-west-2.amazonses.com>
Date: Tue, 30 Jun 2026 05:52:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.30-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 05:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239842

--===============1307496881185515784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *attr* to *2.6.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade attr -V 2.6.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1978 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-b0b96a6f58970c151af40419f21234b5a43c4e8a"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:b0b96a6f58970c151af40419f21234b5a43c4e8a"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 12 Local 9 Mirrors 0 Missed 3 Current 17 (75% match, 89% complete)
done.
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| NOTE: Unpacking /srv/pokybuild/yocto-worker/auh/build/build/downloads/attr-2.5.2.tar.gz to /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/attr/2.5.2/devtooltmp-17x5570d/workdir/sources/
| DEBUG: Searching for run-ptest in paths:
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr-2.5.2/poky
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr/poky
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/files/poky
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr-2.5.2/qemux86-64
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr/qemux86-64
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/files/qemux86-64
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr-2.5.2/qemuall
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr/qemuall
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/files/qemuall
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr-2.5.2/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/files/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr-2.5.2/
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr/
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/files/
| DEBUG: Using /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr/run-ptest for run-ptest
| NOTE: Unpacking /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr/run-ptest to /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/attr/2.5.2/devtooltmp-17x5570d/workdir/sources/
| DEBUG: Searching for 0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch in paths:
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr-2.5.2/poky
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr/poky
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/files/poky
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr-2.5.2/qemux86-64
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr/qemux86-64
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/files/qemux86-64
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr-2.5.2/qemuall
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr/qemuall
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/files/qemuall
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr-2.5.2/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/files/x86-64
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr-2.5.2/
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr/
|     /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/files/
| DEBUG: Using /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch for 0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch
| NOTE: Unpacking /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch to /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/attr/2.5.2/devtooltmp-17x5570d/workdir/sources/
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished
| DEBUG: Executing python function create_source_date_epoch_stamp
| DEBUG: Newest file found: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/attr/2.5.2/devtooltmp-17x5570d/workdir/sources/attr-2.5.2/po/fr.po
| DEBUG: SOURCE_DATE_EPOCH: 1705199994
| DEBUG: Python function create_source_date_epoch_stamp finished
| DEBUG: Executing python function do_qa_unpack
| DEBUG: Python function do_qa_unpack finished
| DEBUG: Executing python function devtool_post_unpack
| DEBUG: Python function devtool_post_unpack finished
NOTE: Tasks Summary: Attempted 93 tasks of which 82 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260630055027.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260630055027.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: Execution of 'git init' failed with exit code 128:
shell-init: error retrieving current directory: getcwd: cannot access parent directories: No such file or directory
fatal: unable to get current working directory: No such file or directory

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/attr/2.5.2/devtooltmp-17x5570d/temp/log.do_unpack.2499421
ERROR: Extracting source for attr failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1307496881185515784==--

