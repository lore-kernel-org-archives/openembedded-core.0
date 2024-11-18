Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBA6D591DD
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:49 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.4642.1731964601359175614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Xkfv21BB;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bJJd1ZQG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010193412281e5-1dd04a90-39ce-441e-a540-d2f62198d8b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CmP1OvDmAXPYGnPb0xA1W2i/7MRSheZszctJvyR9VMY=;
	b=Xkfv21BB3p+uUNVjTRgV9JNckYlCfyCEWVb+WZQrXBBakAfDMowIGr2TWpkI49pA
	L5X+L35SiiKWbMmPE3m50hBzGq4+j0GuqkzHdqqKPU58Devaz2jaJlc/db55QjdQpng
	G/HIgAOWIehKCd4vS/5Q1Jx0bfXc45Dhkadyt9f8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CmP1OvDmAXPYGnPb0xA1W2i/7MRSheZszctJvyR9VMY=;
	b=bJJd1ZQGJ247VgwKlGa07k3Hkp9PEKQCxrSPUkW+0qGOkXnmSTGJnJZvyTBY30/l
	GNHpggiUEXH3sZg9L+rL6kdfqhf9wK6sEv5wqPRa1Rhteuglc+uoMu5XaKT0GGpfh50
	W33KoEn4+BtBgMrNLTq+h3A9W5aXYsB4Wg4m+iSg=
Content-Type: multipart/mixed; boundary="===============4816236257704963338=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust-llvm,libstd-rs,rust,cargo: upgrading to
 1.82.0,1.82.0,1.82.0,1.82.0 FAILED
Message-ID: <01010193412281e5-1dd04a90-39ce-441e-a540-d2f62198d8b4-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207236

--===============4816236257704963338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rust-llvm,libstd-rs,rust,cargo* to *1.82.0,1.82.0,1.82.0,1.82.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rust-llvm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:86e824ca065170108e10a9e3fe827583b294b921"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1881 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:86e824ca065170108e10a9e3fe827583b294b921"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-mne03dzt: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-kkt53o6_/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-kkt53o6_/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  1:33:13
Adding changed files:   0% |                                    | ETA:  1:10:50
Adding changed files:   0% |                                    | ETA:  1:02:20
Adding changed files:   0% |                                    | ETA:  0:56:27
Adding changed files:   0% |                                    | ETA:  0:53:08
Adding changed files:   0% |                                    | ETA:  0:51:49
Adding changed files:   0% |                                    | ETA:  0:49:47
Adding changed files:   0% |                                    | ETA:  0:48:44
Adding changed files:   0% |                                    | ETA:  0:48:18
Adding changed files:   0% |                                    | ETA:  0:47:46
Adding changed files:   0% |                                    | ETA:  0:46:42
Adding changed files:   0% |                                    | ETA:  0:45:51
Adding changed files:   1% |                                    | ETA:  0:45:27
Adding changed files:   1% |                                    | ETA:  0:45:10
Adding changed files:   1% |                                    | ETA:  0:44:41
Adding changed files:   1% |                                    | ETA:  0:44:19
Adding changed files:   1% |                                    | ETA:  0:44:05
Adding changed files:   1% |                                    | ETA:  0:44:02
Adding changed files:   1% |                                    | ETA:  0:43:53
Adding changed files:   1% |                                    | ETA:  0:43:45
Adding changed files:   1% |                                    | ETA:  0:43:32
Adding changed files:   1% |                                    | ETA:  0:43:22
Adding changed files:   1% |                                    | ETA:  0:43:18
Adding changed files:   1% |                                    | ETA:  0:43:16
Adding changed files:   1% |                                    | ETA:  0:43:02
Adding changed files:   2% |                                    | ETA:  0:43:08
Adding changed files:   2% |                                    | ETA:  0:43:05
Adding changed files:   2% |                                    | ETA:  0:43:04
Adding changed files:   2% |                                    | ETA:  0:42:58
Adding changed files:   2% |                                    | ETA:  0:42:49
Adding changed files:   2% |                                    | ETA:  0:42:42
Adding changed files:   2% |                                    | ETA:  0:42:40
Adding changed files:   2% |                                    | ETA:  0:42:58
Adding changed files:   2% |                                    | ETA:  0:42:56
Adding changed files:   2% |                                    | ETA:  0:42:48
Adding changed files:   2% |#                                   | ETA:  0:42:34
Adding changed files:   2% |#                                   | ETA:  0:42:29
Adding changed files:   3% |#                                   | ETA:  0:42:28
Adding changed files:   3% |#                                   | ETA:  0:42:21
Adding changed files:   3% |#                                   | ETA:  0:42:15
Adding changed files:   3% |#                                   | ETA:  0:42:16
Adding changed files:   3% |#                                   | ETA:  0:42:04
Adding changed files:   3% |#                                   | ETA:  0:41:51
Adding changed files:   3% |#                                   | ETA:  0:41:39
Adding changed files:   3% |#                                   | ETA:  0:41:28
Adding changed files:   3% |#                                   | ETA:  0:41:16
Adding changed files:   3% |#                                   | ETA:  0:41:16
Adding changed files:   3% |#                                   | ETA:  0:41:10
Adding changed files:   3% |#                                   | ETA:  0:41:04
Adding changed files:   3% |#                                   | ETA:  0:40:56
Adding changed files:   4% |#                                   | ETA:  0:40:48
Adding changed files:   4% |#                                   | ETA:  0:40:43
Adding changed files:   4% |#                                   | ETA:  0:40:38
Adding changed files:   4% |#                                   | ETA:  0:40:35
Adding changed files:   4% |#                                   | ETA:  0:40:34
Adding changed files:   4% |#                                   | ETA:  0:40:30
Adding changed files:   4% |#                                   | ETA:  0:40:24
Adding changed files:   4% |#                                   | ETA:  0:40:21
Adding changed files:   4% |#                                   | ETA:  0:40:16
Adding changed files:   4% |#                                   | ETA:  0:40:10
Adding changed files:   4% |#                                   | ETA:  0:40:04
Adding changed files:   4% |#                                   | ETA:  0:39:58
Adding changed files:   4% |#                                   | ETA:  0:39:55
Adding changed files:   5% |#                                   | ETA:  0:39:52
Adding changed files:   5% |#                                   | ETA:  0:39:48
Adding changed files:   5% |#                                   | ETA:  0:39:43
Adding changed files:   5% |#                                   | ETA:  0:39:40
Adding changed files:   5% |#                                   | ETA:  0:39:36
Adding changed files:   5% |#                                   | ETA:  0:39:36
Adding changed files:   5% |#                                   | ETA:  0:39:32
Adding changed files:   5% |##                                  | ETA:  0:39:27
Adding changed files:   5% |##                                  | ETA:  0:39:23
Adding changed files:   5% |##                                  | ETA:  0:39:19
Adding changed files:   5% |##                                  | ETA:  0:39:14
Adding changed files:   5% |##                                  | ETA:  0:39:09
Adding changed files:   6% |##                                  | ETA:  0:39:04
Adding changed files:   6% |##                                  | ETA:  0:39:00
Adding changed files:   6% |##                                  | ETA:  0:38:55
Adding changed files:   6% |##                                  | ETA:  0:38:50
Adding changed files:   6% |##                                  | ETA:  0:38:44
Adding changed files:   6% |##                                  | ETA:  0:38:40
Adding changed files:   6% |##                                  | ETA:  0:38:36
Adding changed files:   6% |##                                  | ETA:  0:38:30
Adding changed files:   6% |##                                  | ETA:  0:38:25
Adding changed files:   6% |##                                  | ETA:  0:38:21
Adding changed files:   6% |##                                  | ETA:  0:38:16
Adding changed files:   6% |##                                  | ETA:  0:38:11
Adding changed files:   6% |##                                  | ETA:  0:38:06
Adding changed files:   7% |##                                  | ETA:  0:38:01
Adding changed files:   7% |##                                  | ETA:  0:37:56
Adding changed files:   7% |##                                  | ETA:  0:37:51
Adding changed files:   7% |##                                  | ETA:  0:37:48
Adding changed files:   7% |##                                  | ETA:  0:37:44
Adding changed files:   7% |##                                  | ETA:  0:37:40
Adding changed files:   7% |##                                  | ETA:  0:37:37
Adding changed files:   7% |##                                  | ETA:  0:37:32
Adding changed files:   7% |##                                  | ETA:  0:37:28
Adding changed files:   7% |##                                  | ETA:  0:37:24
Adding changed files:   7% |##                                  | ETA:  0:37:20
Adding changed files:   7% |##                                  | ETA:  0:37:17
Adding changed files:   7% |##                                  | ETA:  0:37:13
Adding changed files:   8% |##                                  | ETA:  0:37:09
Adding changed files:   8% |##                                  | ETA:  0:37:06
Adding changed files:   8% |##                                  | ETA:  0:37:02
Adding changed files:   8% |##                                  | ETA:  0:36:59
Adding changed files:   8% |###                                 | ETA:  0:36:55
Adding changed files:   8% |###                                 | ETA:  0:36:52
Adding changed files:   8% |###                                 | ETA:  0:36:49
Adding changed files:   8% |###                                 | ETA:  0:36:45
Adding changed files:   8% |###                                 | ETA:  0:36:42
Adding changed files:   8% |###                                 | ETA:  0:36:39
Adding changed files:   8% |###                                 | ETA:  0:36:35
Adding changed files:   8% |###                                 | ETA:  0:36:32
Adding changed files:   9% |###                                 | ETA:  0:36:28
Adding changed files:   9% |###                                 | ETA:  0:36:25
Adding changed files:   9% |###                                 | ETA:  0:36:22
Adding changed files:   9% |###                                 | ETA:  0:36:19
Adding changed files:   9% |###                                 | ETA:  0:36:16
Adding changed files:   9% |###                                 | ETA:  0:36:13
Adding changed files:   9% |###                                 | ETA:  0:36:10
Adding changed files:   9% |###                                 | ETA:  0:36:07
Adding changed files:   9% |###                                 | ETA:  0:36:04
Adding changed files:   9% |###                                 | ETA:  0:36:01
Adding changed files:   9% |###                                 | ETA:  0:35:59
Adding changed files:   9% |###                                 | ETA:  0:35:56
Adding changed files:   9% |###                                 | ETA:  0:35:53
Adding changed files:  10% |###                                 | ETA:  0:35:51
Adding changed files:  10% |###                                 | ETA:  0:35:48
Adding changed files:  10% |###                                 | ETA:  0:35:45
Adding changed files:  10% |###                                 | ETA:  0:35:42
Adding changed files:  10% |###                                 | ETA:  0:35:40
Adding changed files:  10% |###                                 | ETA:  0:35:38
Adding changed files:  10% |###                                 | ETA:  0:35:36
Adding changed files:  10% |###                                 | ETA:  0:35:33
Adding changed files:  10% |###                                 | ETA:  0:35:32
Adding changed files:  10% |###                                 | ETA:  0:35:30
Adding changed files:  10% |###                                 | ETA:  0:35:28
Adding changed files:  10% |###                                 | ETA:  0:35:26
Adding changed files:  10% |###                                 | ETA:  0:35:24
Adding changed files:  11% |###                                 | ETA:  0:35:22
Adding changed files:  11% |####                                | ETA:  0:35:20
Adding changed files:  11% |####                                | ETA:  0:35:18
Adding changed files:  11% |####                                | ETA:  0:35:17
Adding changed files:  11% |####                                | ETA:  0:35:17
Adding changed files:  11% |####                                | ETA:  0:35:16
Adding changed files:  11% |####                                | ETA:  0:35:14
Adding changed files:  11% |####                                | ETA:  0:35:13
Adding changed files:  11% |####                                | ETA:  0:35:12
Adding changed files:  11% |####                                | ETA:  0:35:10
Adding changed files:  11% |####                                | ETA:  0:35:08
Adding changed files:  11% |####                                | ETA:  0:35:06
Adding changed files:  12% |####                                | ETA:  0:35:05
Adding changed files:  12% |####                                | ETA:  0:35:06
Adding changed files:  12% |####                                | ETA:  0:35:06
Adding changed files:  12% |####                                | ETA:  0:35:05
Adding changed files:  12% |####                                | ETA:  0:35:05
Adding changed files:  12% |####                                | ETA:  0:35:05
Adding changed files:  12% |####                                | ETA:  0:35:08
Adding changed files:  12% |####                                | ETA:  0:35:08
Adding changed files:  12% |####                                | ETA:  0:35:09
Adding changed files:  12% |####                                | ETA:  0:35:10
Adding changed files:  12% |####                                | ETA:  0:35:09
Adding changed files:  12% |####                                | ETA:  0:35:09
Adding changed files:  12% |####                                | ETA:  0:35:07
Adding changed files:  13% |####                                | ETA:  0:35:05
Adding changed files:  13% |####                                | ETA:  0:35:03
Adding changed files:  13% |####                                | ETA:  0:35:04
Adding changed files:  13% |####                                | ETA:  0:35:02
Adding changed files:  13% |####                                | ETA:  0:35:02
Adding changed files:  13% |####                                | ETA:  0:35:01
Adding changed files:  13% |####                                | ETA:  0:35:01
Adding changed files:  13% |####                                | ETA:  0:35:16
Adding changed files:  13% |####                                | ETA:  0:35:16
Adding changed files:  13% |####                                | ETA:  0:35:18
Adding changed files:  13% |####                                | ETA:  0:35:21
Adding changed files:  13% |#####                               | ETA:  0:35:22
Adding changed files:  13% |#####                               | ETA:  0:35:24
Adding changed files:  14% |#####                               | ETA:  0:35:26
Adding changed files:  14% |#####                               | ETA:  0:35:25
Adding changed files:  14% |#####                               | ETA:  0:35:27
Adding changed files:  14% |#####                               | ETA:  0:35:29
Adding changed files:  14% |#####                               | ETA:  0:35:32
Adding changed files:  14% |#####                               | ETA:  0:35:34
Adding changed files:  14% |#####                               | ETA:  0:35:36
Adding changed files:  14% |#####                               | ETA:  0:35:37
Adding changed files:  14% |#####                               | ETA:  0:35:38
Adding changed files:  14% |#####                               | ETA:  0:35:39
Adding changed files:  14% |#####                               | ETA:  0:35:40
Adding changed files:  14% |#####                               | ETA:  0:35:39
Adding changed files:  15% |#####                               | ETA:  0:35:40
Adding changed files:  15% |#####                               | ETA:  0:35:39
Adding changed files:  15% |#####                               | ETA:  0:35:39
Adding changed files:  15% |#####                               | ETA:  0:35:39
Adding changed files:  15% |#####                               | ETA:  0:35:39
Adding changed files:  15% |#####                               | ETA:  0:35:40
Adding changed files:  15% |#####                               | ETA:  0:35:52
Adding changed files:  15% |#####                               | ETA:  0:35:53
Adding changed files:  15% |#####                               | ETA:  0:35:53
Adding changed files:  15% |#####                               | ETA:  0:35:52
Adding changed files:  15% |#####                               | ETA:  0:35:53
Adding changed files:  15% |#####                               | ETA:  0:35:52
Adding changed files:  15% |#####                               | ETA:  0:35:53
Adding changed files:  16% |#####                               | ETA:  0:35:54
Adding changed files:  16% |#####                               | ETA:  0:35:55
Adding changed files:  16% |#####                               | ETA:  0:35:55
Adding changed files:  16% |#####                               | ETA:  0:35:56
Adding changed files:  16% |#####                               | ETA:  0:35:58
Adding changed files:  16% |#####                               | ETA:  0:35:59
Adding changed files:  16% |#####                               | ETA:  0:35:59
Adding changed files:  16% |#####                               | ETA:  0:36:00
Adding changed files:  16% |######                              | ETA:  0:36:00
Adding changed files:  16% |######                              | ETA:  0:36:00
Adding changed files:  16% |######                              | ETA:  0:36:01
Adding changed files:  16% |######                              | ETA:  0:36:02
Adding changed files:  16% |######                              | ETA:  0:36:04
Adding changed files:  17% |######                              | ETA:  0:36:06
Adding changed files:  17% |######                              | ETA:  0:36:07
Adding changed files:  17% |######                              | ETA:  0:36:07
Adding changed files:  17% |######                              | ETA:  0:36:09
Adding changed files:  17% |######                              | ETA:  0:36:09
Adding changed files:  17% |######                              | ETA:  0:36:10
Adding changed files:  17% |######                              | ETA:  0:36:10
Adding changed files:  17% |######                              | ETA:  0:36:11
Adding changed files:  17% |######                              | ETA:  0:36:12
Adding changed files:  17% |######                              | ETA:  0:36:12
Adding changed files:  17% |######                              | ETA:  0:36:14
Adding changed files:  17% |######                              | ETA:  0:36:15
Adding changed files:  18% |######                              | ETA:  0:36:15
Adding changed files:  18% |######                              | ETA:  0:36:14
Adding changed files:  18% |######                              | ETA:  0:36:14
Adding changed files:  18% |######                              | ETA:  0:36:12
Adding changed files:  18% |######                              | ETA:  0:36:12
Adding changed files:  18% |######                              | ETA:  0:36:11
Adding changed files:  18% |######                              | ETA:  0:36:11
Adding changed files:  18% |######                              | ETA:  0:36:11
Adding changed files:  18% |######                              | ETA:  0:36:11
Adding changed files:  18% |######                              | ETA:  0:36:12
Adding changed files:  18% |######                              | ETA:  0:36:11
Adding changed files:  18% |######                              | ETA:  0:36:10
Adding changed files:  18% |######                              | ETA:  0:36:11
Adding changed files:  19% |######                              | ETA:  0:36:10
Adding changed files:  19% |######                              | ETA:  0:36:10
Adding changed files:  19% |######                              | ETA:  0:36:10
Adding changed files:  19% |######                              | ETA:  0:36:10
Adding changed files:  19% |######                              | ETA:  0:36:10
Adding changed files:  19% |######                              | ETA:  0:36:09
Adding changed files:  19% |#######                             | ETA:  0:36:09
Adding changed files:  19% |#######                             | ETA:  0:36:08
Adding changed files:  19% |#######                             | ETA:  0:36:08
Adding changed files:  19% |#######                             | ETA:  0:36:10
Adding changed files:  19% |#######                             | ETA:  0:36:10
Adding changed files:  19% |#######                             | ETA:  0:36:09
Adding changed files:  19% |#######                             | ETA:  0:36:07
Adding changed files:  20% |#######                             | ETA:  0:36:06
Adding changed files:  20% |#######                             | ETA:  0:36:04
Adding changed files:  20% |#######                             | ETA:  0:36:03
Adding changed files:  20% |#######                             | ETA:  0:36:01
Adding changed files:  20% |#######                             | ETA:  0:35:59
Adding changed files:  20% |#######                             | ETA:  0:35:56
Adding changed files:  20% |#######                             | ETA:  0:35:54
Adding changed files:  20% |#######                             | ETA:  0:35:54
Adding changed files:  20% |#######                             | ETA:  0:35:54
Adding changed files:  20% |#######                             | ETA:  0:35:53
Adding changed files:  20% |#######                             | ETA:  0:35:53
Adding changed files:  20% |#######                             | ETA:  0:35:52
Adding changed files:  21% |#######                             | ETA:  0:35:51
Adding changed files:  21% |#######                             | ETA:  0:35:50
Adding changed files:  21% |#######                             | ETA:  0:35:48
Adding changed files:  21% |#######                             | ETA:  0:35:47
Adding changed files:  21% |#######                             | ETA:  0:35:45
Adding changed files:  21% |#######                             | ETA:  0:35:44
Adding changed files:  21% |#######                             | ETA:  0:35:42
Adding changed files:  21% |#######                             | ETA:  0:35:40
Adding changed files:  21% |#######                             | ETA:  0:35:39
Adding changed files:  21% |#######                             | ETA:  0:35:37
Adding changed files:  21% |#######                             | ETA:  0:35:35
Adding changed files:  21% |#######                             | ETA:  0:35:33
Adding changed files:  21% |#######                             | ETA:  0:35:31
Adding changed files:  22% |#######                             | ETA:  0:35:29
Adding changed files:  22% |#######                             | ETA:  0:35:28
Adding changed files:  22% |#######                             | ETA:  0:35:26
Adding changed files:  22% |########                            | ETA:  0:35:24
Adding changed files:  22% |########                            | ETA:  0:35:22
Adding changed files:  22% |########                            | ETA:  0:35:21
Adding changed files:  22% |########                            | ETA:  0:35:20
Adding changed files:  22% |########                            | ETA:  0:35:18
Adding changed files:  22% |########                            | ETA:  0:35:17
Adding changed files:  22% |########                            | ETA:  0:35:16
Adding changed files:  22% |########                            | ETA:  0:35:15
Adding changed files:  22% |########                            | ETA:  0:35:13
Adding changed files:  22% |########                            | ETA:  0:35:12
Adding changed files:  23% |########                            | ETA:  0:35:11
Adding changed files:  23% |########                            | ETA:  0:35:09
Adding changed files:  23% |########                            | ETA:  0:35:08
Adding changed files:  23% |########                            | ETA:  0:35:07
Adding changed files:  23% |########                            | ETA:  0:35:06
Adding changed files:  23% |########                            | ETA:  0:35:06
Adding changed files:  23% |########                            | ETA:  0:35:05
Adding changed files:  23% |########                            | ETA:  0:35:04
Adding changed files:  23% |########                            | ETA:  0:35:03
Adding changed files:  23% |########                            | ETA:  0:35:03
Adding changed files:  23% |########                            | ETA:  0:35:03
Adding changed files:  23% |########                            | ETA:  0:35:03
Adding changed files:  24% |########                            | ETA:  0:35:02
Adding changed files:  24% |########                            | ETA:  0:35:01
Adding changed files:  24% |########                            | ETA:  0:35:01
Adding changed files:  24% |########                            | ETA:  0:35:00
Adding changed files:  24% |########                            | ETA:  0:34:59
Adding changed files:  24% |########                            | ETA:  0:34:58
Adding changed files:  24% |########                            | ETA:  0:34:57
Adding changed files:  24% |########                            | ETA:  0:34:55
Adding changed files:  24% |########                            | ETA:  0:34:53
Adding changed files:  24% |########                            | ETA:  0:34:52
Adding changed files:  24% |########                            | ETA:  0:34:51
Adding changed files:  24% |########                            | ETA:  0:34:50
Adding changed files:  24% |########                            | ETA:  0:34:50
Adding changed files:  25% |#########                           | ETA:  0:34:51
Adding changed files:  25% |#########                           | ETA:  0:35:01
Adding changed files:  25% |#########                           | ETA:  0:35:41
Adding changed files:  25% |#########                           | ETA:  0:36:29
Adding changed files:  25% |#########                           | ETA:  0:37:13
Adding changed files:  25% |#########                           | ETA:  0:37:18
Adding changed files:  25% |#########                           | ETA:  0:37:21
Adding changed files:  25% |#########                           | ETA:  0:37:26
Adding changed files:  25% |#########                           | ETA:  0:37:52
Adding changed files:  25% |#########                           | ETA:  0:37:53
Adding changed files:  25% |#########                           | ETA:  0:37:52
Adding changed files:  25% |#########                           | ETA:  0:37:52
Adding changed files:  25% |#########                           | ETA:  0:37:52
Adding changed files:  26% |#########                           | ETA:  0:37:57
Adding changed files:  26% |#########                           | ETA:  0:37:59
Adding changed files:  26% |#########                           | ETA:  0:37:57
Adding changed files:  26% |#########                           | ETA:  0:37:56
Adding changed files:  26% |#########                           | ETA:  0:37:54
Adding changed files:  26% |#########                           | ETA:  0:37:53
Adding changed files:  26% |#########                           | ETA:  0:37:51
Adding changed files:  26% |#########                           | ETA:  0:37:51
Adding changed files:  26% |#########                           | ETA:  0:37:49
Adding changed files:  26% |#########                           | ETA:  0:37:47
Adding changed files:  26% |#########                           | ETA:  0:37:46
Adding changed files:  26% |#########                           | ETA:  0:37:44
Adding changed files:  27% |#########                           | ETA:  0:37:42
Adding changed files:  27% |#########                           | ETA:  0:37:40
Adding changed files:  27% |#########                           | ETA:  0:37:38
Adding changed files:  27% |#########                           | ETA:  0:37:36
Adding changed files:  27% |#########                           | ETA:  0:37:34
Adding changed files:  27% |#########                           | ETA:  0:37:32
Adding changed files:  27% |#########                           | ETA:  0:37:29
Adding changed files:  27% |#########                           | ETA:  0:37:27
Adding changed files:  27% |#########                           | ETA:  0:37:24
Adding changed files:  27% |#########                           | ETA:  0:37:21
Adding changed files:  27% |##########                          | ETA:  0:37:19
Adding changed files:  27% |##########                          | ETA:  0:37:17
Adding changed files:  27% |##########                          | ETA:  0:37:13
Adding changed files:  28% |##########                          | ETA:  0:37:10
Adding changed files:  28% |##########                          | ETA:  0:37:07
Adding changed files:  28% |##########                          | ETA:  0:37:04
Adding changed files:  28% |##########                          | ETA:  0:37:01
Adding changed files:  28% |##########                          | ETA:  0:36:59
Adding changed files:  28% |##########                          | ETA:  0:36:57
Adding changed files:  28% |##########                          | ETA:  0:36:55
Adding changed files:  28% |##########                          | ETA:  0:36:53
Adding changed files:  28% |##########                          | ETA:  0:36:51
Adding changed files:  28% |##########                          | ETA:  0:36:49
Adding changed files:  28% |##########                          | ETA:  0:36:46
Adding changed files:  28% |##########                          | ETA:  0:36:44
Adding changed files:  28% |##########                          | ETA:  0:36:42
Adding changed files:  29% |##########                          | ETA:  0:36:39
Adding changed files:  29% |##########                          | ETA:  0:36:37
Adding changed files:  29% |##########                          | ETA:  0:36:35
Adding changed files:  29% |##########                          | ETA:  0:36:32
Adding changed files:  29% |##########                          | ETA:  0:36:31
Adding changed files:  29% |##########                          | ETA:  0:36:28
Adding changed files:  29% |##########                          | ETA:  0:36:26
Adding changed files:  29% |##########                          | ETA:  0:36:24
Adding changed files:  29% |##########                          | ETA:  0:36:21
Adding changed files:  29% |##########                          | ETA:  0:36:19
Adding changed files:  29% |##########                          | ETA:  0:36:17
Adding changed files:  29% |##########                          | ETA:  0:36:15
Adding changed files:  30% |##########                          | ETA:  0:36:12
Adding changed files:  30% |##########                          | ETA:  0:36:11
Adding changed files:  30% |##########                          | ETA:  0:36:08
Adding changed files:  30% |##########                          | ETA:  0:36:06
Adding changed files:  30% |##########                          | ETA:  0:36:03
Adding changed files:  30% |##########                          | ETA:  0:36:01
Adding changed files:  30% |##########                          | ETA:  0:35:59
Adding changed files:  30% |###########                         | ETA:  0:35:57
Adding changed files:  30% |###########                         | ETA:  0:35:54
Adding changed files:  30% |###########                         | ETA:  0:35:52
Adding changed files:  30% |###########                         | ETA:  0:35:49
Adding changed files:  30% |###########                         | ETA:  0:35:46
Adding changed files:  30% |###########                         | ETA:  0:35:44
Adding changed files:  31% |###########                         | ETA:  0:35:41
Adding changed files:  31% |###########                         | ETA:  0:35:39
Adding changed files:  31% |###########                         | ETA:  0:35:37
Adding changed files:  31% |###########                         | ETA:  0:35:35
Adding changed files:  31% |###########                         | ETA:  0:35:33
Adding changed files:  31% |###########                         | ETA:  0:35:31
Adding changed files:  31% |###########                         | ETA:  0:35:28
Adding changed files:  31% |###########                         | ETA:  0:35:25
Adding changed files:  31% |###########                         | ETA:  0:35:22
Adding changed files:  31% |###########                         | ETA:  0:35:19
Adding changed files:  31% |###########                         | ETA:  0:35:17
Adding changed files:  31% |###########                         | ETA:  0:35:14
Adding changed files:  32% |###########                         | ETA:  0:35:12
Adding changed files:  32% |###########                         | ETA:  0:35:08
Adding changed files:  32% |###########                         | ETA:  0:35:05
Adding changed files:  32% |###########                         | ETA:  0:35:02
Adding changed files:  32% |###########                         | ETA:  0:35:00
Adding changed files:  32% |###########                         | ETA:  0:34:57
Adding changed files:  32% |###########                         | ETA:  0:34:55
Adding changed files:  32% |###########                         | ETA:  0:34:52
Adding changed files:  32% |###########                         | ETA:  0:34:49
Adding changed files:  32% |###########                         | ETA:  0:34:47
Adding changed files:  32% |###########                         | ETA:  0:34:44
Adding changed files:  32% |###########                         | ETA:  0:34:42
Adding changed files:  32% |###########                         | ETA:  0:34:39
Adding changed files:  33% |###########                         | ETA:  0:34:37
Adding changed files:  33% |###########                         | ETA:  0:34:34
Adding changed files:  33% |###########                         | ETA:  0:34:31
Adding changed files:  33% |###########                         | ETA:  0:34:30
Adding changed files:  33% |############                        | ETA:  0:34:59
Adding changed files:  33% |############                        | ETA:  0:35:25
Adding changed files:  33% |############                        | ETA:  0:35:27
Adding changed files:  33% |############                        | ETA:  0:35:27
Adding changed files:  33% |############                        | ETA:  0:35:25
Adding changed files:  33% |############                        | ETA:  0:35:23
Adding changed files:  33% |############                        | ETA:  0:35:26
Adding changed files:  33% |############                        | ETA:  0:35:23
Adding changed files:  33% |############                        | ETA:  0:35:21
Adding changed files:  34% |############                        | ETA:  0:35:19
Adding changed files:  34% |############                        | ETA:  0:35:17
Adding changed files:  34% |############                        | ETA:  0:35:14
Adding changed files:  34% |############                        | ETA:  0:35:12
Adding changed files:  34% |############                        | ETA:  0:35:10
Adding changed files:  34% |############                        | ETA:  0:35:08
Adding changed files:  34% |############                        | ETA:  0:35:05
Adding changed files:  34% |############                        | ETA:  0:35:03
Adding changed files:  34% |############                        | ETA:  0:35:01
Adding changed files:  34% |############                        | ETA:  0:34:59
Adding changed files:  34% |############                        | ETA:  0:34:57
Adding changed files:  34% |############                        | ETA:  0:34:55
Adding changed files:  35% |############                        | ETA:  0:34:53
Adding changed files:  35% |############                        | ETA:  0:34:51
Adding changed files:  35% |############                        | ETA:  0:34:49
Adding changed files:  35% |############                        | ETA:  0:34:47
Adding changed files:  35% |############                        | ETA:  0:34:45
Adding changed files:  35% |############                        | ETA:  0:34:43
Adding changed files:  35% |############                        | ETA:  0:34:41
Adding changed files:  35% |############                        | ETA:  0:34:39
Adding changed files:  35% |############                        | ETA:  0:34:37
Adding changed files:  35% |############                        | ETA:  0:34:35
Adding changed files:  35% |############                        | ETA:  0:34:33
Adding changed files:  35% |############                        | ETA:  0:34:30
Adding changed files:  35% |############                        | ETA:  0:34:28
Adding changed files:  36% |############                        | ETA:  0:34:26
Adding changed files:  36% |############                        | ETA:  0:34:24
Adding changed files:  36% |#############                       | ETA:  0:34:22
Adding changed files:  36% |#############                       | ETA:  0:34:20
Adding changed files:  36% |#############                       | ETA:  0:34:18
Adding changed files:  36% |#############                       | ETA:  0:34:16
Adding changed files:  36% |#############                       | ETA:  0:34:13
Adding changed files:  36% |#############                       | ETA:  0:34:10
Adding changed files:  36% |#############                       | ETA:  0:34:08
Adding changed files:  36% |#############                       | ETA:  0:34:05
Adding changed files:  36% |#############                       | ETA:  0:34:02
Adding changed files:  36% |#############                       | ETA:  0:33:59
Adding changed files:  36% |#############                       | ETA:  0:33:57
Adding changed files:  37% |#############                       | ETA:  0:33:54
Adding changed files:  37% |#############                       | ETA:  0:33:51
Adding changed files:  37% |#############                       | ETA:  0:33:48
Adding changed files:  37% |#############                       | ETA:  0:33:45
Adding changed files:  37% |#############                       | ETA:  0:33:43
Adding changed files:  37% |#############                       | ETA:  0:33:40
Adding changed files:  37% |#############                       | ETA:  0:33:37
Adding changed files:  37% |#############                       | ETA:  0:33:34
Adding changed files:  37% |#############                       | ETA:  0:33:31
Adding changed files:  37% |#############                       | ETA:  0:33:28
Adding changed files:  37% |#############                       | ETA:  0:33:25
Adding changed files:  37% |#############                       | ETA:  0:33:23
Adding changed files:  38% |#############                       | ETA:  0:33:20
Adding changed files:  38% |#############                       | ETA:  0:33:18
Adding changed files:  38% |#############                       | ETA:  0:33:15
Adding changed files:  38% |#############                       | ETA:  0:33:13
Adding changed files:  38% |#############                       | ETA:  0:33:10
Adding changed files:  38% |#############                       | ETA:  0:33:07
Adding changed files:  38% |#############                       | ETA:  0:33:04
Adding changed files:  38% |#############                       | ETA:  0:33:02
Adding changed files:  38% |#############                       | ETA:  0:32:59
Adding changed files:  38% |#############                       | ETA:  0:32:56
Adding changed files:  38% |#############                       | ETA:  0:32:53
Adding changed files:  38% |#############                       | ETA:  0:32:51
Adding changed files:  38% |##############                      | ETA:  0:32:48
Adding changed files:  39% |##############                      | ETA:  0:32:45
Adding changed files:  39% |##############                      | ETA:  0:32:42
Adding changed files:  39% |##############                      | ETA:  0:32:39
Adding changed files:  39% |##############                      | ETA:  0:32:36
Adding changed files:  39% |##############                      | ETA:  0:32:34
Adding changed files:  39% |##############                      | ETA:  0:32:31
Adding changed files:  39% |##############                      | ETA:  0:32:28
Adding changed files:  39% |##############                      | ETA:  0:32:25
Adding changed files:  39% |##############                      | ETA:  0:32:23
Adding changed files:  39% |##############                      | ETA:  0:32:21
Adding changed files:  39% |##############                      | ETA:  0:32:19
Adding changed files:  39% |##############                      | ETA:  0:32:16
Adding changed files:  39% |##############                      | ETA:  0:32:14
Adding changed files:  40% |##############                      | ETA:  0:32:12
Adding changed files:  40% |##############                      | ETA:  0:32:10
Adding changed files:  40% |##############                      | ETA:  0:32:08
Adding changed files:  40% |##############                      | ETA:  0:32:06
Adding changed files:  40% |##############                      | ETA:  0:32:03
Adding changed files:  40% |##############                      | ETA:  0:32:02
Adding changed files:  40% |##############                      | ETA:  0:32:00
Adding changed files:  40% |##############                      | ETA:  0:31:58
Adding changed files:  40% |##############                      | ETA:  0:31:56
Adding changed files:  40% |##############                      | ETA:  0:31:54
Adding changed files:  40% |##############                      | ETA:  0:31:52
Adding changed files:  40% |##############                      | ETA:  0:31:50
Adding changed files:  41% |##############                      | ETA:  0:31:47
Adding changed files:  41% |##############                      | ETA:  0:31:44
Adding changed files:  41% |##############                      | ETA:  0:31:42
Adding changed files:  41% |##############                      | ETA:  0:31:46
Adding changed files:  41% |##############                      | ETA:  0:31:44
Adding changed files:  41% |##############                      | ETA:  0:31:42
Adding changed files:  41% |##############                      | ETA:  0:31:39
Adding changed files:  41% |##############                      | ETA:  0:31:37
Adding changed files:  41% |##############                      | ETA:  0:31:35
Adding changed files:  41% |###############                     | ETA:  0:31:32
Adding changed files:  41% |###############                     | ETA:  0:31:30
Adding changed files:  41% |###############                     | ETA:  0:31:28
Adding changed files:  41% |###############                     | ETA:  0:31:25
Adding changed files:  42% |###############                     | ETA:  0:31:23
Adding changed files:  42% |###############                     | ETA:  0:31:21
Adding changed files:  42% |###############                     | ETA:  0:31:19
Adding changed files:  42% |###############                     | ETA:  0:31:17
Adding changed files:  42% |###############                     | ETA:  0:31:15
Adding changed files:  42% |###############                     | ETA:  0:31:13
Adding changed files:  42% |###############                     | ETA:  0:31:11
Adding changed files:  42% |###############                     | ETA:  0:31:08
Adding changed files:  42% |###############                     | ETA:  0:31:06
Adding changed files:  42% |###############                     | ETA:  0:31:04
Adding changed files:  42% |###############                     | ETA:  0:31:02
Adding changed files:  42% |###############                     | ETA:  0:31:00
Adding changed files:  42% |###############                     | ETA:  0:30:58
Adding changed files:  43% |###############                     | ETA:  0:30:55
Adding changed files:  43% |###############                     | ETA:  0:30:53
Adding changed files:  43% |###############                     | ETA:  0:30:51
Adding changed files:  43% |###############                     | ETA:  0:30:49
Adding changed files:  43% |###############                     | ETA:  0:30:46
Adding changed files:  43% |###############                     | ETA:  0:30:44
Adding changed files:  43% |###############                     | ETA:  0:30:42
Adding changed files:  43% |###############                     | ETA:  0:30:40
Adding changed files:  43% |###############                     | ETA:  0:30:38
Adding changed files:  43% |###############                     | ETA:  0:30:36
Adding changed files:  43% |###############                     | ETA:  0:30:34
Adding changed files:  43% |###############                     | ETA:  0:30:32
Adding changed files:  44% |###############                     | ETA:  0:30:31
Adding changed files:  44% |###############                     | ETA:  0:30:28
Adding changed files:  44% |###############                     | ETA:  0:30:26
Adding changed files:  44% |###############                     | ETA:  0:30:24
Adding changed files:  44% |###############                     | ETA:  0:30:22
Adding changed files:  44% |###############                     | ETA:  0:30:20
Adding changed files:  44% |################                    | ETA:  0:30:17
Adding changed files:  44% |################                    | ETA:  0:30:15
Adding changed files:  44% |################                    | ETA:  0:30:12
Adding changed files:  44% |################                    | ETA:  0:30:10
Adding changed files:  44% |################                    | ETA:  0:30:08
Adding changed files:  44% |################                    | ETA:  0:30:06
Adding changed files:  44% |################                    | ETA:  0:30:03
Adding changed files:  45% |################                    | ETA:  0:30:01
Adding changed files:  45% |################                    | ETA:  0:29:59
Adding changed files:  45% |################                    | ETA:  0:29:56
Adding changed files:  45% |################                    | ETA:  0:29:54
Adding changed files:  45% |################                    | ETA:  0:29:52
Adding changed files:  45% |################                    | ETA:  0:29:50
Adding changed files:  45% |################                    | ETA:  0:29:48
Adding changed files:  45% |################                    | ETA:  0:29:45
Adding changed files:  45% |################                    | ETA:  0:29:43
Adding changed files:  45% |################                    | ETA:  0:29:40
Adding changed files:  45% |################                    | ETA:  0:29:38
Adding changed files:  45% |################                    | ETA:  0:29:36
Adding changed files:  45% |################                    | ETA:  0:29:34
Adding changed files:  46% |################                    | ETA:  0:29:31
Adding changed files:  46% |################                    | ETA:  0:29:29
Adding changed files:  46% |################                    | ETA:  0:29:26
Adding changed files:  46% |################                    | ETA:  0:29:24
Adding changed files:  46% |################                    | ETA:  0:29:22
Adding changed files:  46% |################                    | ETA:  0:29:20
Adding changed files:  46% |################                    | ETA:  0:29:17
Adding changed files:  46% |################                    | ETA:  0:29:15
Adding changed files:  46% |################                    | ETA:  0:29:13
Adding changed files:  46% |################                    | ETA:  0:29:10
Adding changed files:  46% |################                    | ETA:  0:29:08
Adding changed files:  46% |################                    | ETA:  0:29:05
Adding changed files:  47% |################                    | ETA:  0:29:03
Adding changed files:  47% |################                    | ETA:  0:29:01
Adding changed files:  47% |################                    | ETA:  0:28:59
Adding changed files:  47% |#################                   | ETA:  0:28:57
Adding changed files:  47% |#################                   | ETA:  0:28:55
Adding changed files:  47% |#################                   | ETA:  0:28:53
Adding changed files:  47% |#################                   | ETA:  0:28:50
Adding changed files:  47% |#################                   | ETA:  0:28:48
Adding changed files:  47% |#################                   | ETA:  0:28:46
Adding changed files:  47% |#################                   | ETA:  0:28:44
Adding changed files:  47% |#################                   | ETA:  0:28:42
Adding changed files:  47% |#################                   | ETA:  0:28:40
Adding changed files:  47% |#################                   | ETA:  0:28:37
Adding changed files:  48% |#################                   | ETA:  0:28:35
Adding changed files:  48% |#################                   | ETA:  0:28:33
Adding changed files:  48% |#################                   | ETA:  0:28:31
Adding changed files:  48% |#################                   | ETA:  0:28:29
Adding changed files:  48% |#################                   | ETA:  0:28:26
Adding changed files:  48% |#################                   | ETA:  0:28:24
Adding changed files:  48% |#################                   | ETA:  0:28:22
Adding changed files:  48% |#################                   | ETA:  0:28:20
Adding changed files:  48% |#################                   | ETA:  0:28:17
Adding changed files:  48% |#################                   | ETA:  0:28:15
Adding changed files:  48% |#################                   | ETA:  0:28:13
Adding changed files:  48% |#################                   | ETA:  0:28:11
Adding changed files:  48% |#################                   | ETA:  0:28:08
Adding changed files:  49% |#################                   | ETA:  0:28:06
Adding changed files:  49% |#################                   | ETA:  0:28:04
Adding changed files:  49% |#################                   | ETA:  0:28:02
Adding changed files:  49% |#################                   | ETA:  0:27:59
Adding changed files:  49% |#################                   | ETA:  0:27:57
Adding changed files:  49% |#################                   | ETA:  0:27:55
Adding changed files:  49% |#################                   | ETA:  0:27:52
Adding changed files:  49% |#################                   | ETA:  0:27:50
Adding changed files:  49% |#################                   | ETA:  0:27:48
Adding changed files:  49% |#################                   | ETA:  0:27:45
Adding changed files:  49% |#################                   | ETA:  0:27:43
Adding changed files:  49% |#################                   | ETA:  0:27:41
Adding changed files:  50% |##################                  | ETA:  0:27:38
Adding changed files:  50% |##################                  | ETA:  0:27:36
Adding changed files:  50% |##################                  | ETA:  0:27:34
Adding changed files:  50% |##################                  | ETA:  0:27:31
Adding changed files:  50% |##################                  | ETA:  0:27:29
Adding changed files:  50% |##################                  | ETA:  0:27:27
Adding changed files:  50% |##################                  | ETA:  0:27:25
Adding changed files:  50% |##################                  | ETA:  0:27:22
Adding changed files:  50% |##################                  | ETA:  0:27:19
Adding changed files:  50% |##################                  | ETA:  0:27:17
Adding changed files:  50% |##################                  | ETA:  0:27:14
Adding changed files:  50% |##################                  | ETA:  0:27:11
Adding changed files:  50% |##################                  | ETA:  0:27:08
Adding changed files:  51% |##################                  | ETA:  0:27:05
Adding changed files:  51% |##################                  | ETA:  0:27:03
Adding changed files:  51% |##################                  | ETA:  0:27:00
Adding changed files:  51% |##################                  | ETA:  0:26:57
Adding changed files:  51% |##################                  | ETA:  0:26:54
Adding changed files:  51% |##################                  | ETA:  0:26:51
Adding changed files:  51% |##################                  | ETA:  0:26:49
Adding changed files:  51% |##################                  | ETA:  0:26:46
Adding changed files:  51% |##################                  | ETA:  0:26:44
Adding changed files:  51% |##################                  | ETA:  0:26:42
Adding changed files:  51% |##################                  | ETA:  0:26:39
Adding changed files:  51% |##################                  | ETA:  0:26:37
Adding changed files:  51% |##################                  | ETA:  0:26:35
Adding changed files:  52% |##################                  | ETA:  0:26:33
Adding changed files:  52% |##################                  | ETA:  0:26:31
Adding changed files:  52% |##################                  | ETA:  0:26:28
Adding changed files:  52% |##################                  | ETA:  0:26:26
Adding changed files:  52% |##################                  | ETA:  0:26:24
Adding changed files:  52% |##################                  | ETA:  0:26:21
Adding changed files:  52% |##################                  | ETA:  0:26:18
Adding changed files:  52% |##################                  | ETA:  0:26:16
Adding changed files:  52% |##################                  | ETA:  0:26:13
Adding changed files:  52% |###################                 | ETA:  0:26:10
Adding changed files:  52% |###################                 | ETA:  0:26:08
Adding changed files:  52% |###################                 | ETA:  0:26:05
Adding changed files:  53% |###################                 | ETA:  0:26:03
Adding changed files:  53% |###################                 | ETA:  0:26:00
Adding changed files:  53% |###################                 | ETA:  0:25:58
Adding changed files:  53% |###################                 | ETA:  0:25:55
Adding changed files:  53% |###################                 | ETA:  0:25:53
Adding changed files:  53% |###################                 | ETA:  0:25:50
Adding changed files:  53% |###################                 | ETA:  0:25:48
Adding changed files:  53% |###################                 | ETA:  0:25:45
Adding changed files:  53% |###################                 | ETA:  0:25:43
Adding changed files:  53% |###################                 | ETA:  0:25:40
Adding changed files:  53% |###################                 | ETA:  0:25:37
Adding changed files:  53% |###################                 | ETA:  0:25:35
Adding changed files:  53% |###################                 | ETA:  0:25:32
Adding changed files:  54% |###################                 | ETA:  0:25:29
Adding changed files:  54% |###################                 | ETA:  0:25:27
Adding changed files:  54% |###################                 | ETA:  0:25:24
Adding changed files:  54% |###################                 | ETA:  0:25:21
Adding changed files:  54% |###################                 | ETA:  0:25:19
Adding changed files:  54% |###################                 | ETA:  0:25:16
Adding changed files:  54% |###################                 | ETA:  0:25:14
Adding changed files:  54% |###################                 | ETA:  0:25:11
Adding changed files:  54% |###################                 | ETA:  0:25:09
Adding changed files:  54% |###################                 | ETA:  0:25:06
Adding changed files:  54% |###################                 | ETA:  0:25:03
Adding changed files:  54% |###################                 | ETA:  0:25:00
Adding changed files:  54% |###################                 | ETA:  0:24:58
Adding changed files:  55% |###################                 | ETA:  0:24:55
Adding changed files:  55% |###################                 | ETA:  0:24:53
Adding changed files:  55% |###################                 | ETA:  0:24:50
Adding changed files:  55% |###################                 | ETA:  0:24:47
Adding changed files:  55% |###################                 | ETA:  0:24:45
Adding changed files:  55% |###################                 | ETA:  0:24:42
Adding changed files:  55% |###################                 | ETA:  0:24:39
Adding changed files:  55% |####################                | ETA:  0:24:37
Adding changed files:  55% |####################                | ETA:  0:24:34
Adding changed files:  55% |####################                | ETA:  0:24:31
Adding changed files:  55% |####################                | ETA:  0:24:29
Adding changed files:  55% |####################                | ETA:  0:24:26
Adding changed files:  56% |####################                | ETA:  0:24:23
Adding changed files:  56% |####################                | ETA:  0:24:21
Adding changed files:  56% |####################                | ETA:  0:24:18
Adding changed files:  56% |####################                | ETA:  0:24:15
Adding changed files:  56% |####################                | ETA:  0:24:13
Adding changed files:  56% |####################                | ETA:  0:24:10
Adding changed files:  56% |####################                | ETA:  0:24:07
Adding changed files:  56% |####################                | ETA:  0:24:05
Adding changed files:  56% |####################                | ETA:  0:24:02
Adding changed files:  56% |####################                | ETA:  0:23:59
Adding changed files:  56% |####################                | ETA:  0:23:57
Adding changed files:  56% |####################                | ETA:  0:23:54
Adding changed files:  56% |####################                | ETA:  0:23:51
Adding changed files:  57% |####################                | ETA:  0:23:49
Adding changed files:  57% |####################                | ETA:  0:23:46
Adding changed files:  57% |####################                | ETA:  0:23:44
Adding changed files:  57% |####################                | ETA:  0:23:41
Adding changed files:  57% |####################                | ETA:  0:23:38
Adding changed files:  57% |####################                | ETA:  0:23:36
Adding changed files:  57% |####################                | ETA:  0:23:33
Adding changed files:  57% |####################                | ETA:  0:23:30
Adding changed files:  57% |####################                | ETA:  0:23:28
Adding changed files:  57% |####################                | ETA:  0:23:25
Adding changed files:  57% |####################                | ETA:  0:23:23
Adding changed files:  57% |####################                | ETA:  0:23:20
Adding changed files:  57% |####################                | ETA:  0:23:17
Adding changed files:  58% |####################                | ETA:  0:23:15
Adding changed files:  58% |####################                | ETA:  0:23:12
Adding changed files:  58% |####################                | ETA:  0:23:09
Adding changed files:  58% |####################                | ETA:  0:23:07
Adding changed files:  58% |#####################               | ETA:  0:23:04
Adding changed files:  58% |#####################               | ETA:  0:23:01
Adding changed files:  58% |#####################               | ETA:  0:22:59
Adding changed files:  58% |#####################               | ETA:  0:22:56
Adding changed files:  58% |#####################               | ETA:  0:22:54
Adding changed files:  58% |#####################               | ETA:  0:22:52
Adding changed files:  58% |#####################               | ETA:  0:22:50
Adding changed files:  58% |#####################               | ETA:  0:22:47
Adding changed files:  59% |#####################               | ETA:  0:22:45
Adding changed files:  59% |#####################               | ETA:  0:22:43
Adding changed files:  59% |#####################               | ETA:  0:22:42
Adding changed files:  59% |#####################               | ETA:  0:22:40
Adding changed files:  59% |#####################               | ETA:  0:22:38
Adding changed files:  59% |#####################               | ETA:  0:22:37
Adding changed files:  59% |#####################               | ETA:  0:22:35
Adding changed files:  59% |#####################               | ETA:  0:22:32
Adding changed files:  59% |#####################               | ETA:  0:22:30
Adding changed files:  59% |#####################               | ETA:  0:22:28
Adding changed files:  59% |#####################               | ETA:  0:22:25
Adding changed files:  59% |#####################               | ETA:  0:22:24
Adding changed files:  59% |#####################               | ETA:  0:22:22
Adding changed files:  60% |#####################               | ETA:  0:22:20
Adding changed files:  60% |#####################               | ETA:  0:22:18
Adding changed files:  60% |#####################               | ETA:  0:22:16
Adding changed files:  60% |#####################               | ETA:  0:22:17
Adding changed files:  60% |#####################               | ETA:  0:22:14
Adding changed files:  60% |#####################               | ETA:  0:22:12
Adding changed files:  60% |#####################               | ETA:  0:22:10
Adding changed files:  60% |#####################               | ETA:  0:22:07
Adding changed files:  60% |#####################               | ETA:  0:22:05
Adding changed files:  60% |#####################               | ETA:  0:22:03
Adding changed files:  60% |#####################               | ETA:  0:22:01
Adding changed files:  60% |#####################               | ETA:  0:21:58
Adding changed files:  61% |#####################               | ETA:  0:21:56
Adding changed files:  61% |#####################               | ETA:  0:21:54
Adding changed files:  61% |######################              | ETA:  0:21:54
Adding changed files:  61% |######################              | ETA:  0:21:54
Adding changed files:  61% |######################              | ETA:  0:21:51
Adding changed files:  61% |######################              | ETA:  0:21:49
Adding changed files:  61% |######################              | ETA:  0:21:46
Adding changed files:  61% |######################              | ETA:  0:21:43
Adding changed files:  61% |######################              | ETA:  0:21:40
Adding changed files:  61% |######################              | ETA:  0:21:38
Adding changed files:  61% |######################              | ETA:  0:21:35
Adding changed files:  61% |######################              | ETA:  0:21:32
Adding changed files:  61% |######################              | ETA:  0:21:29
Adding changed files:  62% |######################              | ETA:  0:21:27
Adding changed files:  62% |######################              | ETA:  0:21:24
Adding changed files:  62% |######################              | ETA:  0:21:21
Adding changed files:  62% |######################              | ETA:  0:21:19
Adding changed files:  62% |######################              | ETA:  0:21:16
Adding changed files:  62% |######################              | ETA:  0:21:13
Adding changed files:  62% |######################              | ETA:  0:21:11
Adding changed files:  62% |######################              | ETA:  0:21:08
Adding changed files:  62% |######################              | ETA:  0:21:05
Adding changed files:  62% |######################              | ETA:  0:21:03
Adding changed files:  62% |######################              | ETA:  0:21:00
Adding changed files:  62% |######################              | ETA:  0:20:58
Adding changed files:  62% |######################              | ETA:  0:20:56
Adding changed files:  63% |######################              | ETA:  0:20:53
Adding changed files:  63% |######################              | ETA:  0:20:51
Adding changed files:  63% |######################              | ETA:  0:20:49
Adding changed files:  63% |######################              | ETA:  0:20:46
Adding changed files:  63% |######################              | ETA:  0:20:44
Adding changed files:  63% |######################              | ETA:  0:20:42
Adding changed files:  63% |######################              | ETA:  0:20:40
Adding changed files:  63% |######################              | ETA:  0:20:37
Adding changed files:  63% |######################              | ETA:  0:20:35
Adding changed files:  63% |######################              | ETA:  0:20:33
Adding changed files:  63% |######################              | ETA:  0:20:30
Adding changed files:  63% |#######################             | ETA:  0:20:28
Adding changed files:  64% |#######################             | ETA:  0:20:25
Adding changed files:  64% |#######################             | ETA:  0:20:23
Adding changed files:  64% |#######################             | ETA:  0:20:20
Adding changed files:  64% |#######################             | ETA:  0:20:18
Adding changed files:  64% |#######################             | ETA:  0:20:16
Adding changed files:  64% |#######################             | ETA:  0:20:13
Adding changed files:  64% |#######################             | ETA:  0:20:11
Adding changed files:  64% |#######################             | ETA:  0:20:09
Adding changed files:  64% |#######################             | ETA:  0:20:07
Adding changed files:  64% |#######################             | ETA:  0:20:04
Adding changed files:  64% |#######################             | ETA:  0:20:02
Adding changed files:  64% |#######################             | ETA:  0:20:00
Adding changed files:  64% |#######################             | ETA:  0:19:58
Adding changed files:  65% |#######################             | ETA:  0:19:55
Adding changed files:  65% |#######################             | ETA:  0:19:53
Adding changed files:  65% |#######################             | ETA:  0:19:50
Adding changed files:  65% |#######################             | ETA:  0:19:48
Adding changed files:  65% |#######################             | ETA:  0:19:46
Adding changed files:  65% |#######################             | ETA:  0:19:43
Adding changed files:  65% |#######################             | ETA:  0:19:41
Adding changed files:  65% |#######################             | ETA:  0:19:38
Adding changed files:  65% |#######################             | ETA:  0:19:35
Adding changed files:  65% |#######################             | ETA:  0:19:33
Adding changed files:  65% |#######################             | ETA:  0:19:30
Adding changed files:  65% |#######################             | ETA:  0:19:28
Adding changed files:  65% |#######################             | ETA:  0:19:26
Adding changed files:  66% |#######################             | ETA:  0:19:23
Adding changed files:  66% |#######################             | ETA:  0:19:21
Adding changed files:  66% |#######################             | ETA:  0:19:19
Adding changed files:  66% |#######################             | ETA:  0:19:17
Adding changed files:  66% |#######################             | ETA:  0:19:14
Adding changed files:  66% |#######################             | ETA:  0:19:12
Adding changed files:  66% |#######################             | ETA:  0:19:10
Adding changed files:  66% |#######################             | ETA:  0:19:08
Adding changed files:  66% |########################            | ETA:  0:19:05
Adding changed files:  66% |########################            | ETA:  0:19:02
Adding changed files:  66% |########################            | ETA:  0:19:00
Adding changed files:  66% |########################            | ETA:  0:18:57
Adding changed files:  67% |########################            | ETA:  0:18:55
Adding changed files:  67% |########################            | ETA:  0:18:52
Adding changed files:  67% |########################            | ETA:  0:18:50
Adding changed files:  67% |########################            | ETA:  0:18:47
Adding changed files:  67% |########################            | ETA:  0:18:45
Adding changed files:  67% |########################            | ETA:  0:18:42
Adding changed files:  67% |########################            | ETA:  0:18:40
Adding changed files:  67% |########################            | ETA:  0:18:37
Adding changed files:  67% |########################            | ETA:  0:18:34
Adding changed files:  67% |########################            | ETA:  0:18:33
Adding changed files:  67% |########################            | ETA:  0:18:35
Adding changed files:  67% |########################            | ETA:  0:18:34
Adding changed files:  67% |########################            | ETA:  0:18:33
Adding changed files:  68% |########################            | ETA:  0:18:31
Adding changed files:  68% |########################            | ETA:  0:18:34
Adding changed files:  68% |########################            | ETA:  0:18:33
Adding changed files:  68% |########################            | ETA:  0:18:30
Adding changed files:  68% |########################            | ETA:  0:18:28
Adding changed files:  68% |########################            | ETA:  0:18:25
Adding changed files:  68% |########################            | ETA:  0:18:22
Adding changed files:  68% |########################            | ETA:  0:18:20
Adding changed files:  68% |########################            | ETA:  0:18:17
Adding changed files:  68% |########################            | ETA:  0:18:14
Adding changed files:  68% |########################            | ETA:  0:18:12
Adding changed files:  68% |########################            | ETA:  0:18:09
Adding changed files:  68% |########################            | ETA:  0:18:07
Adding changed files:  69% |########################            | ETA:  0:18:04
Adding changed files:  69% |########################            | ETA:  0:18:02
Adding changed files:  69% |########################            | ETA:  0:17:59
Adding changed files:  69% |########################            | ETA:  0:17:57
Adding changed files:  69% |########################            | ETA:  0:17:55
Adding changed files:  69% |#########################           | ETA:  0:17:52
Adding changed files:  69% |#########################           | ETA:  0:17:49
Adding changed files:  69% |#########################           | ETA:  0:17:47
Adding changed files:  69% |#########################           | ETA:  0:17:44
Adding changed files:  69% |#########################           | ETA:  0:17:42
Adding changed files:  69% |#########################           | ETA:  0:17:39
Adding changed files:  69% |#########################           | ETA:  0:17:36
Adding changed files:  70% |#########################           | ETA:  0:17:34
Adding changed files:  70% |#########################           | ETA:  0:17:31
Adding changed files:  70% |#########################           | ETA:  0:17:29
Adding changed files:  70% |#########################           | ETA:  0:17:26
Adding changed files:  70% |#########################           | ETA:  0:17:23
Adding changed files:  70% |#########################           | ETA:  0:17:21
Adding changed files:  70% |#########################           | ETA:  0:17:18
Adding changed files:  70% |#########################           | ETA:  0:17:16
Adding changed files:  70% |#########################           | ETA:  0:17:13
Adding changed files:  70% |#########################           | ETA:  0:17:11
Adding changed files:  70% |#########################           | ETA:  0:17:08
Adding changed files:  70% |#########################           | ETA:  0:17:06
Adding changed files:  70% |#########################           | ETA:  0:17:03
Adding changed files:  71% |#########################           | ETA:  0:17:00
Adding changed files:  71% |#########################           | ETA:  0:16:58
Adding changed files:  71% |#########################           | ETA:  0:16:55
Adding changed files:  71% |#########################           | ETA:  0:16:52
Adding changed files:  71% |#########################           | ETA:  0:16:49
Adding changed files:  71% |#########################           | ETA:  0:16:47
Adding changed files:  71% |#########################           | ETA:  0:16:44
Adding changed files:  71% |#########################           | ETA:  0:16:42
Adding changed files:  71% |#########################           | ETA:  0:16:39
Adding changed files:  71% |#########################           | ETA:  0:16:36
Adding changed files:  71% |#########################           | ETA:  0:16:34
Adding changed files:  71% |#########################           | ETA:  0:16:31
Adding changed files:  71% |#########################           | ETA:  0:16:29
Adding changed files:  72% |#########################           | ETA:  0:16:26
Adding changed files:  72% |#########################           | ETA:  0:16:24
Adding changed files:  72% |#########################           | ETA:  0:16:21
Adding changed files:  72% |##########################          | ETA:  0:16:19
Adding changed files:  72% |##########################          | ETA:  0:16:16
Adding changed files:  72% |##########################          | ETA:  0:16:14
Adding changed files:  72% |##########################          | ETA:  0:16:11
Adding changed files:  72% |##########################          | ETA:  0:16:09
Adding changed files:  72% |##########################          | ETA:  0:16:06
Adding changed files:  72% |##########################          | ETA:  0:16:04
Adding changed files:  72% |##########################          | ETA:  0:16:01
Adding changed files:  72% |##########################          | ETA:  0:15:59
Adding changed files:  73% |##########################          | ETA:  0:15:57
Adding changed files:  73% |##########################          | ETA:  0:15:57
Adding changed files:  73% |##########################          | ETA:  0:15:54
Adding changed files:  73% |##########################          | ETA:  0:15:52
Adding changed files:  73% |##########################          | ETA:  0:15:49
Adding changed files:  73% |##########################          | ETA:  0:15:46
Adding changed files:  73% |##########################          | ETA:  0:15:44
Adding changed files:  73% |##########################          | ETA:  0:15:42
Adding changed files:  73% |##########################          | ETA:  0:15:39
Adding changed files:  73% |##########################          | ETA:  0:15:36
Adding changed files:  73% |##########################          | ETA:  0:15:34
Adding changed files:  73% |##########################          | ETA:  0:15:31
Adding changed files:  73% |##########################          | ETA:  0:15:28
Adding changed files:  74% |##########################          | ETA:  0:15:26
Adding changed files:  74% |##########################          | ETA:  0:15:23
Adding changed files:  74% |##########################          | ETA:  0:15:20
Adding changed files:  74% |##########################          | ETA:  0:15:17
Adding changed files:  74% |##########################          | ETA:  0:15:14
Adding changed files:  74% |##########################          | ETA:  0:15:12
Adding changed files:  74% |##########################          | ETA:  0:15:09
Adding changed files:  74% |##########################          | ETA:  0:15:06
Adding changed files:  74% |##########################          | ETA:  0:15:04
Adding changed files:  74% |##########################          | ETA:  0:15:01
Adding changed files:  74% |##########################          | ETA:  0:14:59
Adding changed files:  74% |##########################          | ETA:  0:14:56
Adding changed files:  74% |##########################          | ETA:  0:14:54
Adding changed files:  75% |###########################         | ETA:  0:14:51
Adding changed files:  75% |###########################         | ETA:  0:14:48
Adding changed files:  75% |###########################         | ETA:  0:14:46
Adding changed files:  75% |###########################         | ETA:  0:14:43
Adding changed files:  75% |###########################         | ETA:  0:14:40
Adding changed files:  75% |###########################         | ETA:  0:14:38
Adding changed files:  75% |###########################         | ETA:  0:14:35
Adding changed files:  75% |###########################         | ETA:  0:14:33
Adding changed files:  75% |###########################         | ETA:  0:14:30
Adding changed files:  75% |###########################         | ETA:  0:14:27
Adding changed files:  75% |###########################         | ETA:  0:14:24
Adding changed files:  75% |###########################         | ETA:  0:14:22
Adding changed files:  76% |###########################         | ETA:  0:14:19
Adding changed files:  76% |###########################         | ETA:  0:14:16
Adding changed files:  76% |###########################         | ETA:  0:14:14
Adding changed files:  76% |###########################         | ETA:  0:14:11
Adding changed files:  76% |###########################         | ETA:  0:14:08
Adding changed files:  76% |###########################         | ETA:  0:14:06
Adding changed files:  76% |###########################         | ETA:  0:14:03
Adding changed files:  76% |###########################         | ETA:  0:14:00
Adding changed files:  76% |###########################         | ETA:  0:13:58
Adding changed files:  76% |###########################         | ETA:  0:13:55
Adding changed files:  76% |###########################         | ETA:  0:13:52
Adding changed files:  76% |###########################         | ETA:  0:13:50
Adding changed files:  76% |###########################         | ETA:  0:13:47
Adding changed files:  77% |###########################         | ETA:  0:13:45
Adding changed files:  77% |###########################         | ETA:  0:13:42
Adding changed files:  77% |###########################         | ETA:  0:13:39
Adding changed files:  77% |###########################         | ETA:  0:13:36
Adding changed files:  77% |###########################         | ETA:  0:13:34
Adding changed files:  77% |###########################         | ETA:  0:13:31
Adding changed files:  77% |###########################         | ETA:  0:13:28
Adding changed files:  77% |###########################         | ETA:  0:13:26
Adding changed files:  77% |###########################         | ETA:  0:13:23
Adding changed files:  77% |###########################         | ETA:  0:13:20
Adding changed files:  77% |############################        | ETA:  0:13:17
Adding changed files:  77% |############################        | ETA:  0:13:14
Adding changed files:  77% |############################        | ETA:  0:13:12
Adding changed files:  78% |############################        | ETA:  0:13:09
Adding changed files:  78% |############################        | ETA:  0:13:06
Adding changed files:  78% |############################        | ETA:  0:13:03
Adding changed files:  78% |############################        | ETA:  0:13:00
Adding changed files:  78% |############################        | ETA:  0:12:58
Adding changed files:  78% |############################        | ETA:  0:12:55
Adding changed files:  78% |############################        | ETA:  0:12:53
Adding changed files:  78% |############################        | ETA:  0:12:50
Adding changed files:  78% |############################        | ETA:  0:12:47
Adding changed files:  78% |############################        | ETA:  0:12:45
Adding changed files:  78% |############################        | ETA:  0:12:42
Adding changed files:  78% |############################        | ETA:  0:12:40
Adding changed files:  79% |############################        | ETA:  0:12:37
Adding changed files:  79% |############################        | ETA:  0:12:34
Adding changed files:  79% |############################        | ETA:  0:12:31
Adding changed files:  79% |############################        | ETA:  0:12:29
Adding changed files:  79% |############################        | ETA:  0:12:26
Adding changed files:  79% |############################        | ETA:  0:12:23
Adding changed files:  79% |############################        | ETA:  0:12:20
Adding changed files:  79% |############################        | ETA:  0:12:17
Adding changed files:  79% |############################        | ETA:  0:12:15
Adding changed files:  79% |############################        | ETA:  0:12:12
Adding changed files:  79% |############################        | ETA:  0:12:09
Adding changed files:  79% |############################        | ETA:  0:12:07
Adding changed files:  79% |############################        | ETA:  0:12:04
Adding changed files:  80% |############################        | ETA:  0:12:01
Adding changed files:  80% |############################        | ETA:  0:11:59
Adding changed files:  80% |############################        | ETA:  0:11:56
Adding changed files:  80% |############################        | ETA:  0:11:53
Adding changed files:  80% |############################        | ETA:  0:11:51
Adding changed files:  80% |############################        | ETA:  0:11:48
Adding changed files:  80% |############################        | ETA:  0:11:45
Adding changed files:  80% |#############################       | ETA:  0:11:43
Adding changed files:  80% |#############################       | ETA:  0:11:40
Adding changed files:  80% |#############################       | ETA:  0:11:37
Adding changed files:  80% |#############################       | ETA:  0:11:35
Adding changed files:  80% |#############################       | ETA:  0:11:32
Adding changed files:  80% |#############################       | ETA:  0:11:29
Adding changed files:  81% |#############################       | ETA:  0:11:27
Adding changed files:  81% |#############################       | ETA:  0:11:24
Adding changed files:  81% |#############################       | ETA:  0:11:21
Adding changed files:  81% |#############################       | ETA:  0:11:18
Adding changed files:  81% |#############################       | ETA:  0:11:16
Adding changed files:  81% |#############################       | ETA:  0:11:13
Adding changed files:  81% |#############################       | ETA:  0:11:10
Adding changed files:  81% |#############################       | ETA:  0:11:08
Adding changed files:  81% |#############################       | ETA:  0:11:05
Adding changed files:  81% |#############################       | ETA:  0:11:02
Adding changed files:  81% |#############################       | ETA:  0:10:59
Adding changed files:  81% |#############################       | ETA:  0:10:57
Adding changed files:  82% |#############################       | ETA:  0:10:54
Adding changed files:  82% |#############################       | ETA:  0:10:51
Adding changed files:  82% |#############################       | ETA:  0:10:48
Adding changed files:  82% |#############################       | ETA:  0:10:46
Adding changed files:  82% |#############################       | ETA:  0:10:43
Adding changed files:  82% |#############################       | ETA:  0:10:40
Adding changed files:  82% |#############################       | ETA:  0:10:38
Adding changed files:  82% |#############################       | ETA:  0:10:35
Adding changed files:  82% |#############################       | ETA:  0:10:32
Adding changed files:  82% |#############################       | ETA:  0:10:29
Adding changed files:  82% |#############################       | ETA:  0:10:26
Adding changed files:  82% |#############################       | ETA:  0:10:24
Adding changed files:  82% |#############################       | ETA:  0:10:21
Adding changed files:  83% |#############################       | ETA:  0:10:18
Adding changed files:  83% |#############################       | ETA:  0:10:16
Adding changed files:  83% |#############################       | ETA:  0:10:13
Adding changed files:  83% |#############################       | ETA:  0:10:10
Adding changed files:  83% |##############################      | ETA:  0:10:07
Adding changed files:  83% |##############################      | ETA:  0:10:05
Adding changed files:  83% |##############################      | ETA:  0:10:02
Adding changed files:  83% |##############################      | ETA:  0:09:59
Adding changed files:  83% |##############################      | ETA:  0:09:56
Adding changed files:  83% |##############################      | ETA:  0:09:53
Adding changed files:  83% |##############################      | ETA:  0:09:51
Adding changed files:  83% |##############################      | ETA:  0:09:48
Adding changed files:  83% |##############################      | ETA:  0:09:45
Adding changed files:  84% |##############################      | ETA:  0:09:42
Adding changed files:  84% |##############################      | ETA:  0:09:40
Adding changed files:  84% |##############################      | ETA:  0:09:37
Adding changed files:  84% |##############################      | ETA:  0:09:34
Adding changed files:  84% |##############################      | ETA:  0:09:31
Adding changed files:  84% |##############################      | ETA:  0:09:28
Adding changed files:  84% |##############################      | ETA:  0:09:26
Adding changed files:  84% |##############################      | ETA:  0:09:23
Adding changed files:  84% |##############################      | ETA:  0:09:20
Adding changed files:  84% |##############################      | ETA:  0:09:17
Adding changed files:  84% |##############################      | ETA:  0:09:14
Adding changed files:  84% |##############################      | ETA:  0:09:12
Adding changed files:  85% |##############################      | ETA:  0:09:09
Adding changed files:  85% |##############################      | ETA:  0:09:06
Adding changed files:  85% |##############################      | ETA:  0:09:03
Adding changed files:  85% |##############################      | ETA:  0:09:00
Adding changed files:  85% |##############################      | ETA:  0:08:57
Adding changed files:  85% |##############################      | ETA:  0:08:54
Adding changed files:  85% |##############################      | ETA:  0:08:52
Adding changed files:  85% |##############################      | ETA:  0:08:49
Adding changed files:  85% |##############################      | ETA:  0:08:46
Adding changed files:  85% |##############################      | ETA:  0:08:43
Adding changed files:  85% |##############################      | ETA:  0:08:40
Adding changed files:  85% |##############################      | ETA:  0:08:37
Adding changed files:  85% |##############################      | ETA:  0:08:34
Adding changed files:  86% |##############################      | ETA:  0:08:31
Adding changed files:  86% |###############################     | ETA:  0:08:28
Adding changed files:  86% |###############################     | ETA:  0:08:26
Adding changed files:  86% |###############################     | ETA:  0:08:23
Adding changed files:  86% |###############################     | ETA:  0:08:20
Adding changed files:  86% |###############################     | ETA:  0:08:17
Adding changed files:  86% |###############################     | ETA:  0:08:14
Adding changed files:  86% |###############################     | ETA:  0:08:11
Adding changed files:  86% |###############################     | ETA:  0:08:08
Adding changed files:  86% |###############################     | ETA:  0:08:05
Adding changed files:  86% |###############################     | ETA:  0:08:03
Adding changed files:  86% |###############################     | ETA:  0:08:00
Adding changed files:  86% |###############################     | ETA:  0:07:57
Adding changed files:  87% |###############################     | ETA:  0:07:54
Adding changed files:  87% |###############################     | ETA:  0:07:51
Adding changed files:  87% |###############################     | ETA:  0:07:48
Adding changed files:  87% |###############################     | ETA:  0:07:45
Adding changed files:  87% |###############################     | ETA:  0:07:43
Adding changed files:  87% |###############################     | ETA:  0:07:40
Adding changed files:  87% |###############################     | ETA:  0:07:37
Adding changed files:  87% |###############################     | ETA:  0:07:34
Adding changed files:  87% |###############################     | ETA:  0:07:31
Adding changed files:  87% |###############################     | ETA:  0:07:28
Adding changed files:  87% |###############################     | ETA:  0:07:25
Adding changed files:  87% |###############################     | ETA:  0:07:22
Adding changed files:  88% |###############################     | ETA:  0:07:19
Adding changed files:  88% |###############################     | ETA:  0:07:17
Adding changed files:  88% |###############################     | ETA:  0:07:14
Adding changed files:  88% |###############################     | ETA:  0:07:11
Adding changed files:  88% |###############################     | ETA:  0:07:08
Adding changed files:  88% |###############################     | ETA:  0:07:05
Adding changed files:  88% |###############################     | ETA:  0:07:03
Adding changed files:  88% |###############################     | ETA:  0:07:00
Adding changed files:  88% |###############################     | ETA:  0:06:57
Adding changed files:  88% |###############################     | ETA:  0:06:54
Adding changed files:  88% |###############################     | ETA:  0:06:51
Adding changed files:  88% |################################    | ETA:  0:06:49
Adding changed files:  88% |################################    | ETA:  0:06:46
Adding changed files:  89% |################################    | ETA:  0:06:43
Adding changed files:  89% |################################    | ETA:  0:06:40
Adding changed files:  89% |################################    | ETA:  0:06:37
Adding changed files:  89% |################################    | ETA:  0:06:34
Adding changed files:  89% |################################    | ETA:  0:06:32
Adding changed files:  89% |################################    | ETA:  0:06:29
Adding changed files:  89% |################################    | ETA:  0:06:26
Adding changed files:  89% |################################    | ETA:  0:06:23
Adding changed files:  89% |################################    | ETA:  0:06:20
Adding changed files:  89% |################################    | ETA:  0:06:17
Adding changed files:  89% |################################    | ETA:  0:06:14
Adding changed files:  89% |################################    | ETA:  0:06:12
Adding changed files:  90% |################################    | ETA:  0:06:09
Adding changed files:  90% |################################    | ETA:  0:06:06
Adding changed files:  90% |################################    | ETA:  0:06:03
Adding changed files:  90% |################################    | ETA:  0:06:00
Adding changed files:  90% |################################    | ETA:  0:05:57
Adding changed files:  90% |################################    | ETA:  0:05:54
Adding changed files:  90% |################################    | ETA:  0:05:51
Adding changed files:  90% |################################    | ETA:  0:05:48
Adding changed files:  90% |################################    | ETA:  0:05:45
Adding changed files:  90% |################################    | ETA:  0:05:43
Adding changed files:  90% |################################    | ETA:  0:05:40
Adding changed files:  90% |################################    | ETA:  0:05:37
Adding changed files:  90% |################################    | ETA:  0:05:34
Adding changed files:  91% |################################    | ETA:  0:05:31
Adding changed files:  91% |################################    | ETA:  0:05:28
Adding changed files:  91% |################################    | ETA:  0:05:25
Adding changed files:  91% |################################    | ETA:  0:05:22
Adding changed files:  91% |################################    | ETA:  0:05:19
Adding changed files:  91% |################################    | ETA:  0:05:16
Adding changed files:  91% |################################    | ETA:  0:05:13
Adding changed files:  91% |################################    | ETA:  0:05:10
Adding changed files:  91% |################################    | ETA:  0:05:07
Adding changed files:  91% |#################################   | ETA:  0:05:05
Adding changed files:  91% |#################################   | ETA:  0:05:02
Adding changed files:  91% |#################################   | ETA:  0:04:59
Adding changed files:  91% |#################################   | ETA:  0:04:56
Adding changed files:  92% |#################################   | ETA:  0:04:53
Adding changed files:  92% |#################################   | ETA:  0:04:50
Adding changed files:  92% |#################################   | ETA:  0:04:47
Adding changed files:  92% |#################################   | ETA:  0:04:44
Adding changed files:  92% |#################################   | ETA:  0:04:41
Adding changed files:  92% |#################################   | ETA:  0:04:39
Adding changed files:  92% |#################################   | ETA:  0:04:36
Adding changed files:  92% |#################################   | ETA:  0:04:33
Adding changed files:  92% |#################################   | ETA:  0:04:30
Adding changed files:  92% |#################################   | ETA:  0:04:27
Adding changed files:  92% |#################################   | ETA:  0:04:24
Adding changed files:  92% |#################################   | ETA:  0:04:21
Adding changed files:  93% |#################################   | ETA:  0:04:19
Adding changed files:  93% |#################################   | ETA:  0:04:16
Adding changed files:  93% |#################################   | ETA:  0:04:13
Adding changed files:  93% |#################################   | ETA:  0:04:10
Adding changed files:  93% |#################################   | ETA:  0:04:07
Adding changed files:  93% |#################################   | ETA:  0:04:04
Adding changed files:  93% |#################################   | ETA:  0:04:01
Adding changed files:  93% |#################################   | ETA:  0:03:58
Adding changed files:  93% |#################################   | ETA:  0:03:55
Adding changed files:  93% |#################################   | ETA:  0:03:52
Adding changed files:  93% |#################################   | ETA:  0:03:49
Adding changed files:  93% |#################################   | ETA:  0:03:46
Adding changed files:  93% |#################################   | ETA:  0:03:43
Adding changed files:  94% |#################################   | ETA:  0:03:41
Adding changed files:  94% |#################################   | ETA:  0:03:38
Adding changed files:  94% |#################################   | ETA:  0:03:35
Adding changed files:  94% |#################################   | ETA:  0:03:32
Adding changed files:  94% |#################################   | ETA:  0:03:29
Adding changed files:  94% |#################################   | ETA:  0:03:26
Adding changed files:  94% |##################################  | ETA:  0:03:23
Adding changed files:  94% |##################################  | ETA:  0:03:20
Adding changed files:  94% |##################################  | ETA:  0:03:17
Adding changed files:  94% |##################################  | ETA:  0:03:14
Adding changed files:  94% |##################################  | ETA:  0:03:11
Adding changed files:  94% |##################################  | ETA:  0:03:08
Adding changed files:  94% |##################################  | ETA:  0:03:06
Adding changed files:  95% |##################################  | ETA:  0:03:03
Adding changed files:  95% |##################################  | ETA:  0:03:00
Adding changed files:  95% |##################################  | ETA:  0:02:57
Adding changed files:  95% |##################################  | ETA:  0:02:54
Adding changed files:  95% |##################################  | ETA:  0:02:51
Adding changed files:  95% |##################################  | ETA:  0:02:48
Adding changed files:  95% |##################################  | ETA:  0:02:45
Adding changed files:  95% |##################################  | ETA:  0:02:42
Adding changed files:  95% |##################################  | ETA:  0:02:39
Adding changed files:  95% |##################################  | ETA:  0:02:36
Adding changed files:  95% |##################################  | ETA:  0:02:34
Adding changed files:  95% |##################################  | ETA:  0:02:31
Adding changed files:  96% |##################################  | ETA:  0:02:28
Adding changed files:  96% |##################################  | ETA:  0:02:25
Adding changed files:  96% |##################################  | ETA:  0:02:22
Adding changed files:  96% |##################################  | ETA:  0:02:19
Adding changed files:  96% |##################################  | ETA:  0:02:16
Adding changed files:  96% |##################################  | ETA:  0:02:13
Adding changed files:  96% |##################################  | ETA:  0:02:10
Adding changed files:  96% |##################################  | ETA:  0:02:07
Adding changed files:  96% |##################################  | ETA:  0:02:04
Adding changed files:  96% |##################################  | ETA:  0:02:02
Adding changed files:  96% |##################################  | ETA:  0:01:59
Adding changed files:  96% |##################################  | ETA:  0:01:56
Adding changed files:  96% |##################################  | ETA:  0:01:53
Adding changed files:  97% |##################################  | ETA:  0:01:50
Adding changed files:  97% |##################################  | ETA:  0:01:47
Adding changed files:  97% |##################################  | ETA:  0:01:44
Adding changed files:  97% |################################### | ETA:  0:01:41
Adding changed files:  97% |################################### | ETA:  0:01:38
Adding changed files:  97% |################################### | ETA:  0:01:35
Adding changed files:  97% |################################### | ETA:  0:01:32
Adding changed files:  97% |################################### | ETA:  0:01:29
Adding changed files:  97% |################################### | ETA:  0:01:26
Adding changed files:  97% |################################### | ETA:  0:01:24
Adding changed files:  97% |################################### | ETA:  0:01:21
Adding changed files:  97% |################################### | ETA:  0:01:18
Adding changed files:  97% |################################### | ETA:  0:01:15
Adding changed files:  98% |################################### | ETA:  0:01:12
Adding changed files:  98% |################################### | ETA:  0:01:09
Adding changed files:  98% |################################### | ETA:  0:01:06
Adding changed files:  98% |################################### | ETA:  0:01:03
Adding changed files:  98% |################################### | ETA:  0:01:00
Adding changed files:  98% |################################### | ETA:  0:00:57
Adding changed files:  98% |################################### | ETA:  0:00:54
Adding changed files:  98% |################################### | ETA:  0:00:51
Adding changed files:  98% |################################### | ETA:  0:00:48
Adding changed files:  98% |################################### | ETA:  0:00:45
Adding changed files:  98% |################################### | ETA:  0:00:42
Adding changed files:  98% |################################### | ETA:  0:00:39
Adding changed files:  99% |################################### | ETA:  0:00:36
Adding changed files:  99% |################################### | ETA:  0:00:34
Adding changed files:  99% |################################### | ETA:  0:00:31
Adding changed files:  99% |################################### | ETA:  0:00:28
Adding changed files:  99% |################################### | ETA:  0:00:25
Adding changed files:  99% |################################### | ETA:  0:00:22
Adding changed files:  99% |################################### | ETA:  0:00:19
Adding changed files:  99% |################################### | ETA:  0:00:16
Adding changed files:  99% |################################### | ETA:  0:00:13
Adding changed files:  99% |################################### | ETA:  0:00:10
Adding changed files:  99% |################################### | ETA:  0:00:07
Adding changed files:  99% |################################### | ETA:  0:00:04
Adding changed files:  99% |################################### | ETA:  0:00:01
Adding changed files: 100% |####################################| Time: 1:02:14
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.82.0-src.tar.xz;name=rust...
INFO: Rebasing devtool onto 2c29cf775aff15cc8e1e57504684db6e3a93fd44
WARNING: Command 'git rebase 2c29cf775aff15cc8e1e57504684db6e3a93fd44' failed:
Auto-merging compiler/rustc_codegen_llvm/src/context.rs
CONFLICT (content): Merge conflict in compiler/rustc_codegen_llvm/src/context.rs

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/rust-llvm
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/rust-llvm/rust-llvm_1.82.0.bb
WARNING: Version is pinned to 1.79% via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4816236257704963338==--

