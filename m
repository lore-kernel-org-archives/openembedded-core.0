Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F698CA0EC6
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:51 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.12493.1752594941733324220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vGaEy4K4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=euRnDil6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101980ecc9716-b1048599-1f3d-4a54-8ace-66d168ac8c17-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594945;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HY3l/h1eulFEApq0l8pMb0w89wOT+GcYJAiRDdb0Oh4=;
	b=vGaEy4K4w+aWMSa4J+QO5DdWPSEGXiX45bUlGClMY8SnYCUH4+g8V7q816tM4JuB
	TkstDRO5GQKiFuizKWjVHRiYag88Lu/Ex80Ic1HhCUp/OcPU6/sGRbc30BZxpJ75Z5g
	lbPAk2rP/IC0xMERNBT3btdT/sqhXbmFbaZ6Iwwo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594945;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HY3l/h1eulFEApq0l8pMb0w89wOT+GcYJAiRDdb0Oh4=;
	b=euRnDil6YLu1U1jb08vnS7i3uXPerkAF7s7VGlUXZGTk27hdiVPGdLTuaHqE4W4N
	05gVIK/r3e/9fbhYMS9aDwzkibLGVpmGmee30YhuspSN4zMt+6s5EvvH8igoWQbRv5O
	ux8iwP3a9YDJMquoSlnIqUDr7o/k2AxC1/Dpwww0=
Content-Type: multipart/mixed; boundary="===============9002053204408390114=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gperf: upgrading to 3.3 FAILED
Message-ID: <010101980ecc9716-b1048599-1f3d-4a54-8ace-66d168ac8c17-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220361

--===============9002053204408390114==
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
Loaded 1928 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-70facaf9c90d42f9e1ecdcacd1a52da80d4db337"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:70facaf9c90d42f9e1ecdcacd1a52da80d4db337"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 4 Local 4 Mirrors 0 Missed 0 Current 26 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (0 cached, 942 parsed). 1929 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-70facaf9c90d42f9e1ecdcacd1a52da80d4db337"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:70facaf9c90d42f9e1ecdcacd1a52da80d4db337"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  33% |############                        | ETA:  0:00:00
Adding changed files:  66% |########################            | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftpmirror.gnu.org/gnu/gperf/gperf-3.3.tar.gz...
INFO: Rebasing devtool onto 72b19b1eea22cb173b0bce8b885da298bc142297
WARNING: Command 'git rebase 72b19b1eea22cb173b0bce8b885da298bc142297' failed:
CONFLICT (modify/delete): lib/getline.cc deleted in HEAD and modified in afda1f0 (Make the code C++17 compliant.).  Version afda1f0 (Make the code C++17 compliant.) of lib/getline.cc left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
lib/getline.cc: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9002053204408390114==--

