Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6385AC7115E
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:45 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.27793.1748786130625406169
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wmNSQukE;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=QUw2yK6I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101972bc6e169-eaf60dd4-2c23-4fd7-9f51-1e0cd41240b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZWiCdNKZovyo+Rn8ktfUVQPPchoffecAGUKJoTP9gxA=;
	b=wmNSQukECJ5nhtT5uFpVv5ccR7OaSkLdZTnZZNqE/WZOaKoTUu/XQh7fG2bkUGan
	Rj92vYSqFAtoUZsL6h2DHEDTDfg9YRSUL57MROdLzvjfXZrNxpErkHefl3h6wn8ojIv
	tVMd1+wCgDbDAbPXINlmF9CLaLRGvEF5G0N5t4yo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786143;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZWiCdNKZovyo+Rn8ktfUVQPPchoffecAGUKJoTP9gxA=;
	b=QUw2yK6I2G9yTurWomgbOTWx9n/SbLiWBXB8Gq9rBgRkQYztYNS/a4v4db/e2+BC
	+2yvky2bsjjyApwC7SzLA68E3qxRYpUVYxycVA1FkLmKs8mCuWloKNl87PBe0J4eAtB
	Fr2kh/2o2NKaox2e9L8oTB/pMg1kEAw9AmE57VE8=
Content-Type: multipart/mixed; boundary="===============8601821435427583817=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gperf: upgrading to 3.3 FAILED
Message-ID: <010101972bc6e169-eaf60dd4-2c23-4fd7-9f51-1e0cd41240b6-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217630

--===============8601821435427583817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gperf* to *3.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gperf -V 3.3
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1f87b5d8504fd92b0c1db16d6743fdf603399c69"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1f87b5d8504fd92b0c1db16d6743fdf603399c69"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-81avx214: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-qiy19nry/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-qiy19nry/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  33% |############                        | ETA:  0:00:00
Adding changed files:  66% |########################            | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/gperf/gperf-3.3.tar.gz...
INFO: Rebasing devtool onto 384e1b51ed85f6de5b35112a2c9cbed00b1836ed
WARNING: Command 'git rebase 384e1b51ed85f6de5b35112a2c9cbed00b1836ed' failed:
CONFLICT (modify/delete): lib/getline.cc deleted in HEAD and modified in 543ef72 (Make the code C++17 compliant.).  Version 543ef72 (Make the code C++17 compliant.) of lib/getline.cc left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
lib/getline.cc: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8601821435427583817==--

