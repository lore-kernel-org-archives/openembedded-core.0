Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850A0C36011
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.10352.1742048289505815391
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Zir906Df;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EnU+LmDz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101959a2b6033-f9d8227a-a8d5-4302-9b73-a52e254b2c3d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+T2T9YZ2mkDVazD/eBRP9ZA5hYSznfVq6C1uwd5qVgw=;
	b=Zir906DfDvbbdG/s4Yn0W/5JvSiQrdPWd9Jq+OSFR9ydLjfjgzuhA7WN09SPqT8I
	L53uAJnv1w4A6feWxQg5geEcwoduS+44rXHH2fF9wotsJdFPwPa/plfWRPM5+3dvWz4
	hr7AT1tbz+tDfFw7+fhYbo8L8ja6HrRV+vMX9acs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+T2T9YZ2mkDVazD/eBRP9ZA5hYSznfVq6C1uwd5qVgw=;
	b=EnU+LmDzpJ25KBwgXRHsSvpSPLY+ze86jnhw613sNHD+Lh+9do3HYxyu+uSfr/DS
	n+wu3Xni+rGjlhlB9BC3P89zF+bRzIhmoQdULUQU24+03H1X6txPZMEZudPmVQWr/I2
	DUzyJChFrAZsZObAFVzwXLvoz9zHZJlarP9gKle4=
Content-Type: multipart/mixed; boundary="===============4845068672784994321=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust,rust-llvm,cargo,libstd-rs: upgrading to
 1.85.0,1.85.0,1.85.0,1.85.0 FAILED
Message-ID: <010101959a2b6033-f9d8227a-a8d5-4302-9b73-a52e254b2c3d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212879

--===============4845068672784994321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rust,rust-llvm,cargo,libstd-rs* to *1.85.0,1.85.0,1.85.0,1.85.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rust -V 1.85.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:ab1d69f89006b3a721cef452a46b7fddce543512"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 924 .bb files complete (0 cached, 924 parsed). 1885 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:ab1d69f89006b3a721cef452a46b7fddce543512"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-br1s1gr4: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-3yabdmb5/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-3yabdmb5/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:27:21
Adding changed files:   0% |                                    | ETA:  0:19:25
Adding changed files:   0% |                                    | ETA:  0:16:49
Adding changed files:   0% |                                    | ETA:  0:15:17
Adding changed files:   0% |                                    | ETA:  0:14:22
Adding changed files:   0% |                                    | ETA:  0:13:44
Adding changed files:   0% |                                    | ETA:  0:13:22
Adding changed files:   0% |                                    | ETA:  0:13:06
Adding changed files:   0% |                                    | ETA:  0:13:08
Adding changed files:   0% |                                    | ETA:  0:12:58
Adding changed files:   0% |                                    | ETA:  0:12:52
Adding changed files:   0% |                                    | ETA:  0:12:49
Adding changed files:   0% |                                    | ETA:  0:12:42
Adding changed files:   0% |                                    | ETA:  0:12:47
Adding changed files:   0% |                                    | ETA:  0:12:47
Adding changed files:   0% |                                    | ETA:  0:12:48
Adding changed files:   0% |                                    | ETA:  0:12:49
Adding changed files:   1% |                                    | ETA:  0:12:47
Adding changed files:   1% |                                    | ETA:  0:12:45
Adding changed files:   1% |                                    | ETA:  0:12:43
Adding changed files:   1% |                                    | ETA:  0:12:42
Adding changed files:   1% |                                    | ETA:  0:12:41
Adding changed files:   1% |                                    | ETA:  0:12:41
Adding changed files:   1% |                                    | ETA:  0:12:40
Adding changed files:   1% |                                    | ETA:  0:12:38
Adding changed files:   1% |                                    | ETA:  0:12:37
Adding changed files:   1% |                                    | ETA:  0:12:35
Adding changed files:   1% |                                    | ETA:  0:12:34
Adding changed files:   1% |                                    | ETA:  0:12:35
Adding changed files:   1% |                                    | ETA:  0:12:37
Adding changed files:   1% |                                    | ETA:  0:12:38
Adding changed files:   1% |                                    | ETA:  0:12:40
Adding changed files:   1% |                                    | ETA:  0:12:41
Adding changed files:   1% |                                    | ETA:  0:12:42
Adding changed files:   2% |                                    | ETA:  0:12:40
Adding changed files:   2% |                                    | ETA:  0:12:39
Adding changed files:   2% |                                    | ETA:  0:12:39
Adding changed files:   2% |                                    | ETA:  0:12:38
Adding changed files:   2% |                                    | ETA:  0:12:39
Adding changed files:   2% |                                    | ETA:  0:12:38
Adding changed files:   2% |                                    | ETA:  0:12:37
Adding changed files:   2% |                                    | ETA:  0:12:37
Adding changed files:   2% |                                    | ETA:  0:12:37
Adding changed files:   2% |                                    | ETA:  0:12:37
Adding changed files:   2% |                                    | ETA:  0:12:36
Adding changed files:   2% |                                    | ETA:  0:12:36
Adding changed files:   2% |                                    | ETA:  0:12:37
Adding changed files:   2% |                                    | ETA:  0:12:36
Adding changed files:   2% |#                                   | ETA:  0:12:35
Adding changed files:   2% |#                                   | ETA:  0:12:34
Adding changed files:   2% |#                                   | ETA:  0:12:33
Adding changed files:   2% |#                                   | ETA:  0:12:31
Adding changed files:   3% |#                                   | ETA:  0:12:29
Adding changed files:   3% |#                                   | ETA:  0:12:28
Adding changed files:   3% |#                                   | ETA:  0:12:28
Adding changed files:   3% |#                                   | ETA:  0:12:28
Adding changed files:   3% |#                                   | ETA:  0:12:29
Adding changed files:   3% |#                                   | ETA:  0:12:30
Adding changed files:   3% |#                                   | ETA:  0:12:30
Adding changed files:   3% |#                                   | ETA:  0:12:29
Adding changed files:   3% |#                                   | ETA:  0:12:29
Adding changed files:   3% |#                                   | ETA:  0:12:29
Adding changed files:   3% |#                                   | ETA:  0:12:29
Adding changed files:   3% |#                                   | ETA:  0:12:30
Adding changed files:   3% |#                                   | ETA:  0:12:30
Adding changed files:   3% |#                                   | ETA:  0:12:30
Adding changed files:   3% |#                                   | ETA:  0:12:30
Adding changed files:   3% |#                                   | ETA:  0:12:30
Adding changed files:   3% |#                                   | ETA:  0:12:30
Adding changed files:   4% |#                                   | ETA:  0:12:30
Adding changed files:   4% |#                                   | ETA:  0:12:30
Adding changed files:   4% |#                                   | ETA:  0:12:30
Adding changed files:   4% |#                                   | ETA:  0:12:30
Adding changed files:   4% |#                                   | ETA:  0:12:31
Adding changed files:   4% |#                                   | ETA:  0:12:31
Adding changed files:   4% |#                                   | ETA:  0:12:30
Adding changed files:   4% |#                                   | ETA:  0:12:30
Adding changed files:   4% |#                                   | ETA:  0:12:28
Adding changed files:   4% |#                                   | ETA:  0:12:29
Adding changed files:   4% |#                                   | ETA:  0:12:30
Adding changed files:   4% |#                                   | ETA:  0:12:30
Adding changed files:   4% |#                                   | ETA:  0:12:29
Adding changed files:   4% |#                                   | ETA:  0:12:29
Adding changed files:   4% |#                                   | ETA:  0:12:28
Adding changed files:   4% |#                                   | ETA:  0:12:28
Adding changed files:   4% |#                                   | ETA:  0:12:28
Adding changed files:   5% |#                                   | ETA:  0:12:28
Adding changed files:   5% |#                                   | ETA:  0:12:28
Adding changed files:   5% |#                                   | ETA:  0:12:27
Adding changed files:   5% |#                                   | ETA:  0:12:27
Adding changed files:   5% |#                                   | ETA:  0:12:27
Adding changed files:   5% |#                                   | ETA:  0:12:27
Adding changed files:   5% |#                                   | ETA:  0:12:27
Adding changed files:   5% |#                                   | ETA:  0:12:27
Adding changed files:   5% |#                                   | ETA:  0:12:27
Adding changed files:   5% |#                                   | ETA:  0:12:25
Adding changed files:   5% |##                                  | ETA:  0:12:24
Adding changed files:   5% |##                                  | ETA:  0:12:24
Adding changed files:   5% |##                                  | ETA:  0:12:24
Adding changed files:   5% |##                                  | ETA:  0:12:23
Adding changed files:   5% |##                                  | ETA:  0:12:23
Adding changed files:   5% |##                                  | ETA:  0:12:23
Adding changed files:   5% |##                                  | ETA:  0:12:23
Adding changed files:   5% |##                                  | ETA:  0:12:23
Adding changed files:   6% |##                                  | ETA:  0:12:23
Adding changed files:   6% |##                                  | ETA:  0:12:22
Adding changed files:   6% |##                                  | ETA:  0:12:21
Adding changed files:   6% |##                                  | ETA:  0:12:21
Adding changed files:   6% |##                                  | ETA:  0:12:21
Adding changed files:   6% |##                                  | ETA:  0:12:21
Adding changed files:   6% |##                                  | ETA:  0:12:21
Adding changed files:   6% |##                                  | ETA:  0:12:21
Adding changed files:   6% |##                                  | ETA:  0:12:21
Adding changed files:   6% |##                                  | ETA:  0:12:20
Adding changed files:   6% |##                                  | ETA:  0:12:19
Adding changed files:   6% |##                                  | ETA:  0:12:19
Adding changed files:   6% |##                                  | ETA:  0:12:19
Adding changed files:   6% |##                                  | ETA:  0:12:18
Adding changed files:   6% |##                                  | ETA:  0:12:18
Adding changed files:   6% |##                                  | ETA:  0:12:17
Adding changed files:   6% |##                                  | ETA:  0:12:17
Adding changed files:   7% |##                                  | ETA:  0:12:17
Adding changed files:   7% |##                                  | ETA:  0:12:16
Adding changed files:   7% |##                                  | ETA:  0:12:14
Adding changed files:   7% |##                                  | ETA:  0:12:13
Adding changed files:   7% |##                                  | ETA:  0:12:13
Adding changed files:   7% |##                                  | ETA:  0:12:12
Adding changed files:   7% |##                                  | ETA:  0:12:12
Adding changed files:   7% |##                                  | ETA:  0:12:12
Adding changed files:   7% |##                                  | ETA:  0:12:11
Adding changed files:   7% |##                                  | ETA:  0:12:11
Adding changed files:   7% |##                                  | ETA:  0:12:11
Adding changed files:   7% |##                                  | ETA:  0:12:11
Adding changed files:   7% |##                                  | ETA:  0:12:11
Adding changed files:   7% |##                                  | ETA:  0:12:10
Adding changed files:   7% |##                                  | ETA:  0:12:09
Adding changed files:   7% |##                                  | ETA:  0:12:09
Adding changed files:   7% |##                                  | ETA:  0:12:08
Adding changed files:   7% |##                                  | ETA:  0:12:07
Adding changed files:   8% |##                                  | ETA:  0:12:07
Adding changed files:   8% |##                                  | ETA:  0:12:07
Adding changed files:   8% |##                                  | ETA:  0:12:07
Adding changed files:   8% |##                                  | ETA:  0:12:07
Adding changed files:   8% |##                                  | ETA:  0:12:07
Adding changed files:   8% |###                                 | ETA:  0:12:07
Adding changed files:   8% |###                                 | ETA:  0:12:07
Adding changed files:   8% |###                                 | ETA:  0:12:07
Adding changed files:   8% |###                                 | ETA:  0:12:06
Adding changed files:   8% |###                                 | ETA:  0:12:06
Adding changed files:   8% |###                                 | ETA:  0:12:05
Adding changed files:   8% |###                                 | ETA:  0:12:04
Adding changed files:   8% |###                                 | ETA:  0:12:04
Adding changed files:   8% |###                                 | ETA:  0:12:02
Adding changed files:   8% |###                                 | ETA:  0:12:01
Adding changed files:   8% |###                                 | ETA:  0:11:59
Adding changed files:   8% |###                                 | ETA:  0:11:58
Adding changed files:   9% |###                                 | ETA:  0:11:57
Adding changed files:   9% |###                                 | ETA:  0:11:57
Adding changed files:   9% |###                                 | ETA:  0:11:57
Adding changed files:   9% |###                                 | ETA:  0:11:56
Adding changed files:   9% |###                                 | ETA:  0:11:56
Adding changed files:   9% |###                                 | ETA:  0:11:56
Adding changed files:   9% |###                                 | ETA:  0:11:56
Adding changed files:   9% |###                                 | ETA:  0:11:55
Adding changed files:   9% |###                                 | ETA:  0:11:55
Adding changed files:   9% |###                                 | ETA:  0:11:55
Adding changed files:   9% |###                                 | ETA:  0:11:54
Adding changed files:   9% |###                                 | ETA:  0:11:54
Adding changed files:   9% |###                                 | ETA:  0:11:54
Adding changed files:   9% |###                                 | ETA:  0:11:54
Adding changed files:   9% |###                                 | ETA:  0:11:53
Adding changed files:   9% |###                                 | ETA:  0:11:53
Adding changed files:   9% |###                                 | ETA:  0:11:53
Adding changed files:  10% |###                                 | ETA:  0:11:53
Adding changed files:  10% |###                                 | ETA:  0:11:53
Adding changed files:  10% |###                                 | ETA:  0:11:52
Adding changed files:  10% |###                                 | ETA:  0:11:52
Adding changed files:  10% |###                                 | ETA:  0:11:51
Adding changed files:  10% |###                                 | ETA:  0:11:50
Adding changed files:  10% |###                                 | ETA:  0:11:50
Adding changed files:  10% |###                                 | ETA:  0:11:49
Adding changed files:  10% |###                                 | ETA:  0:11:48
Adding changed files:  10% |###                                 | ETA:  0:11:47
Adding changed files:  10% |###                                 | ETA:  0:11:47
Adding changed files:  10% |###                                 | ETA:  0:11:46
Adding changed files:  10% |###                                 | ETA:  0:11:45
Adding changed files:  10% |###                                 | ETA:  0:11:44
Adding changed files:  10% |###                                 | ETA:  0:11:44
Adding changed files:  10% |###                                 | ETA:  0:11:43
Adding changed files:  10% |###                                 | ETA:  0:11:42
Adding changed files:  10% |###                                 | ETA:  0:11:41
Adding changed files:  11% |###                                 | ETA:  0:11:41
Adding changed files:  11% |###                                 | ETA:  0:11:40
Adding changed files:  11% |####                                | ETA:  0:11:40
Adding changed files:  11% |####                                | ETA:  0:11:39
Adding changed files:  11% |####                                | ETA:  0:11:38
Adding changed files:  11% |####                                | ETA:  0:11:37
Adding changed files:  11% |####                                | ETA:  0:11:36
Adding changed files:  11% |####                                | ETA:  0:11:35
Adding changed files:  11% |####                                | ETA:  0:11:34
Adding changed files:  11% |####                                | ETA:  0:11:33
Adding changed files:  11% |####                                | ETA:  0:11:33
Adding changed files:  11% |####                                | ETA:  0:11:32
Adding changed files:  11% |####                                | ETA:  0:11:31
Adding changed files:  11% |####                                | ETA:  0:11:30
Adding changed files:  11% |####                                | ETA:  0:11:30
Adding changed files:  11% |####                                | ETA:  0:11:30
Adding changed files:  11% |####                                | ETA:  0:11:30
Adding changed files:  12% |####                                | ETA:  0:11:30
Adding changed files:  12% |####                                | ETA:  0:11:30
Adding changed files:  12% |####                                | ETA:  0:11:30
Adding changed files:  12% |####                                | ETA:  0:11:30
Adding changed files:  12% |####                                | ETA:  0:11:30
Adding changed files:  12% |####                                | ETA:  0:11:30
Adding changed files:  12% |####                                | ETA:  0:11:30
Adding changed files:  12% |####                                | ETA:  0:11:31
Adding changed files:  12% |####                                | ETA:  0:11:31
Adding changed files:  12% |####                                | ETA:  0:11:30
Adding changed files:  12% |####                                | ETA:  0:11:30
Adding changed files:  12% |####                                | ETA:  0:11:30
Adding changed files:  12% |####                                | ETA:  0:11:30
Adding changed files:  12% |####                                | ETA:  0:11:30
Adding changed files:  12% |####                                | ETA:  0:11:30
Adding changed files:  12% |####                                | ETA:  0:11:31
Adding changed files:  12% |####                                | ETA:  0:11:31
Adding changed files:  12% |####                                | ETA:  0:11:31
Adding changed files:  13% |####                                | ETA:  0:11:31
Adding changed files:  13% |####                                | ETA:  0:11:30
Adding changed files:  13% |####                                | ETA:  0:11:30
Adding changed files:  13% |####                                | ETA:  0:11:29
Adding changed files:  13% |####                                | ETA:  0:11:28
Adding changed files:  13% |####                                | ETA:  0:11:27
Adding changed files:  13% |####                                | ETA:  0:11:27
Adding changed files:  13% |####                                | ETA:  0:11:27
Adding changed files:  13% |####                                | ETA:  0:11:27
Adding changed files:  13% |####                                | ETA:  0:11:27
Adding changed files:  13% |####                                | ETA:  0:11:27
Adding changed files:  13% |####                                | ETA:  0:11:27
Adding changed files:  13% |####                                | ETA:  0:11:27
Adding changed files:  13% |####                                | ETA:  0:11:27
Adding changed files:  13% |####                                | ETA:  0:11:26
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.85.0-src.tar.xz;name=rust...
ERROR: Execution of 'git add -f -A "src/gcc/fixincludes/tests/base/malloc.h" "src/gcc/fixincludes/tests/base/math.h" "src/gcc/fixincludes/tests/base/net/if.h" "src/gcc/fixincludes/tests/base/net/if_arp.h" "src/gcc/fixincludes/tests/base/netdnet/dnetdb.h" "src/gcc/fixincludes/tests/base/netinet/in.h" "src/gcc/fixincludes/tests/base/netinet/ip.h" "src/gcc/fixincludes/tests/base/objc/runtime.h" "src/gcc/fixincludes/tests/base/obstack.h" "src/gcc/fixincludes/tests/base/os/availability.h" "src/gcc/fixincludes/tests/base/os/base.h" "src/gcc/fixincludes/tests/base/os/trace.h" "src/gcc/fixincludes/tests/base/pixrect/memvar.h" "src/gcc/fixincludes/tests/base/pthread.h" "src/gcc/fixincludes/tests/base/reg_types.h" "src/gcc/fixincludes/tests/base/regex.h" "src/gcc/fixincludes/tests/base/regexp.h" "src/gcc/fixincludes/tests/base/rpc/auth.h" "src/gcc/fixincludes/tests/base/rpc/rpc.h" "src/gcc/fixincludes/tests/base/rpc/xdr.h" "src/gcc/fixincludes/tests/base/rpcsvc/rstat.h" "src/gcc/fixincludes/te
 sts/base/rpcsvc/rusers.h" "src/gcc/fixincludes/tests/base/rtldef/decc$types.h" "src/gcc/fixincludes/tests/base/rtldef/if.h" "src/gcc/fixincludes/tests/base/rtldef/resolv.h" "src/gcc/fixincludes/tests/base/rtldef/setjmp.h" "src/gcc/fixincludes/tests/base/rtldef/signal.h" "src/gcc/fixincludes/tests/base/rtldef/stdio.h" "src/gcc/fixincludes/tests/base/rtldef/string.h" "src/gcc/fixincludes/tests/base/rtldef/wait.h" "src/gcc/fixincludes/tests/base/setjmp.h" "src/gcc/fixincludes/tests/base/signal.h" "src/gcc/fixincludes/tests/base/sparc/asm_linkage.h" "src/gcc/fixincludes/tests/base/spawn.h" "src/gcc/fixincludes/tests/base/stdarg.h" "src/gcc/fixincludes/tests/base/stdint-aix.h" "src/gcc/fixincludes/tests/base/stdint-darwin.h" "src/gcc/fixincludes/tests/base/stdint-hpux11.h" "src/gcc/fixincludes/tests/base/stdint-newlib.h" "src/gcc/fixincludes/tests/base/stdint.h" "src/gcc/fixincludes/tests/base/stdio.h" "src/gcc/fixincludes/tests/base/stdio_tag.h" "src/gcc/fixincludes/tests/base/stdlib.h"
  "src/gcc/fixincludes/tests/base/string.h" "src/gcc/fixincludes/tests/base/strings.h" "src/gcc/fixincludes/tests/base/sundev/vuid_event.h" "src/gcc/fixincludes/tests/base/sunwindow/win_lock.h" "src/gcc/fixincludes/tests/base/sym.h" "src/gcc/fixincludes/tests/base/sys/_inttypes.h" "src/gcc/fixincludes/tests/base/sys/cdefs.h" "src/gcc/fixincludes/tests/base/sys/feature_tests.h" "src/gcc/fixincludes/tests/base/sys/file.h" "src/gcc/fixincludes/tests/base/sys/int_const.h" "src/gcc/fixincludes/tests/base/sys/int_limits.h" "src/gcc/fixincludes/tests/base/sys/inttypes.h" "src/gcc/fixincludes/tests/base/sys/machine.h" "src/gcc/fixincludes/tests/base/sys/mman.h" "src/gcc/fixincludes/tests/base/sys/pthread.h" "src/gcc/fixincludes/tests/base/sys/signal.h" "src/gcc/fixincludes/tests/base/sys/socket.h" "src/gcc/fixincludes/tests/base/sys/spinlock.h" "src/gcc/fixincludes/tests/base/sys/stat.h" "src/gcc/fixincludes/tests/base/sys/sysmacros.h" "src/gcc/fixincludes/tests/base/sys/time.h" "src/gcc/fix
 includes/tests/base/sys/types.h" "src/gcc/fixincludes/tests/base/sys/ucontext.h" "src/gcc/fixincludes/tests/base/sys/wait.h" "src/gcc/fixincludes/tests/base/testing.h" "src/gcc/fixincludes/tests/base/tgmath.h" "src/gcc/fixincludes/tests/base/time.h" "src/gcc/fixincludes/tests/base/tinfo.h" "src/gcc/fixincludes/tests/base/types/vxTypesBase.h" "src/gcc/fixincludes/tests/base/unistd.h" "src/gcc/fixincludes/tests/base/yvals.h" "src/gcc/gcc/ABOUT-GCC-NLS" "src/gcc/gcc/BASE-VER" "src/gcc/gcc/COPYING" "src/gcc/gcc/COPYING.LIB" "src/gcc/gcc/COPYING3" "src/gcc/gcc/COPYING3.LIB" "src/gcc/gcc/ChangeLog" "src/gcc/gcc/ChangeLog-1997" "src/gcc/gcc/ChangeLog-1998" "src/gcc/gcc/ChangeLog-1999" "src/gcc/gcc/ChangeLog-2000" "src/gcc/gcc/ChangeLog-2001" "src/gcc/gcc/ChangeLog-2002" "src/gcc/gcc/ChangeLog-2003" "src/gcc/gcc/ChangeLog-2004" "src/gcc/gcc/ChangeLog-2005" "src/gcc/gcc/ChangeLog-2006" "src/gcc/gcc/ChangeLog-2007" "src/gcc/gcc/ChangeLog-2008" "src/gcc/gcc/ChangeLog-2009" "src/gcc/gcc/ChangeL
 og-2010" "src/gcc/gcc/ChangeLog-2011" "src/gcc/gcc/ChangeLog-2012" "src/gcc/gcc/ChangeLog-2013" "src/gcc/gcc/ChangeLog-2014" "src/gcc/gcc/ChangeLog-2015"' failed with exit code 128:
warning: could not open directory 'src/gcc/': No such file or directory
fatal: pathspec 'src/gcc/fixincludes/tests/base/rtldef/decc.h' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4845068672784994321==--

