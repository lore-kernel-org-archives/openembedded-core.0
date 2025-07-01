Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FCEC83F0B
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1438.1751386811244308341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=w9MmW51c;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=sEDTCACT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010197c6ca0bbc-b298a9c4-85a9-4777-911e-4d07b9f42d43-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XmKAB9ZxyUXlI3OunF8PTaw0b3HYXe0lyJtIxSDxGqM=;
	b=w9MmW51cXikVnPmE2AbDEjfTbJoGdbvrdv/5vQFgv8rhqNJqfC2lMD9Siqq9/to0
	VOx5MkU699V4dy+luwjtiUVEaLfemr/tDoWITTQiO1PgeOfxdMkyhXQC2oT3Gy4A4mk
	uikRjBsQoBVlJaXFYJ9F7h+tqgSSUevNbtlSqV1o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386819;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XmKAB9ZxyUXlI3OunF8PTaw0b3HYXe0lyJtIxSDxGqM=;
	b=sEDTCACT3qjkr6xIfuQOlVVaBBoPpG9ykFUpGmpUj9AtnhGDp/MQpMK0KmCL2v/r
	abVIsjHJaho5DaVR00QYgyVVP2QozFd+AKDFXfgpek8q8NeWJqizViwU3IaYyFw6sqw
	xKTlos3WrX0gi87oR5nqKoPl0YE1S1MVAh6URnK4=
Content-Type: multipart/mixed; boundary="===============4694969349385156004=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gperf: upgrading to 3.3 FAILED
Message-ID: <01010197c6ca0bbc-b298a9c4-85a9-4777-911e-4d07b9f42d43-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219653

--===============4694969349385156004==
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
Loaded 1917 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-efe56f75419b290fb34e30a6e318eaf89354ee0d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:efe56f75419b290fb34e30a6e318eaf89354ee0d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 938 .bb files complete (0 cached, 938 parsed). 1918 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-efe56f75419b290fb34e30a6e318eaf89354ee0d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:efe56f75419b290fb34e30a6e318eaf89354ee0d"

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
INFO: Rebasing devtool onto 2b1ee6e0ce857d5427e7cd545a22afd6d9677dee
WARNING: Command 'git rebase 2b1ee6e0ce857d5427e7cd545a22afd6d9677dee' failed:
CONFLICT (modify/delete): lib/getline.cc deleted in HEAD and modified in febdfe9 (Make the code C++17 compliant.).  Version febdfe9 (Make the code C++17 compliant.) of lib/getline.cc left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
lib/getline.cc: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4694969349385156004==--

