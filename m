Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B85DCA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 06:00:44 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5244.1790920842669684609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 23:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HIoKANIW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FZNTpWcA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a0fb3359e7-bc803c37-9bed-4dd6-a109-b7edad5e600e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790920841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tZzx78fsVsEv2VosoX/fgH9v4ypf03wd8owpFolrRnY=;
	b=HIoKANIW2jIpZhNc1QSvVJpgCkEQlfWPQfrBou2JgeylHiYbbpJZMD7OU9aFur0Q
	gKa5j6df+UmFpsaDFVRTU6qNUIJCc2clBbnwugRXqAWvwVQCZOKvbZCBgYUemrFLW8E
	OO127ccHcBZ7OMOKI8BZZrR2D7QJ9Y2hcYm2bpPU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790920841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tZzx78fsVsEv2VosoX/fgH9v4ypf03wd8owpFolrRnY=;
	b=FZNTpWcAuMZk9AC+S4fFqrSeFXaiMdg+HbvcJoqz4cuQgipwk/LeHhyycvrG2CAx
	9X/fjP0shwejygRe2Jv1IAAo8MjTtlxWOmkzMx1s3hMF725edWI1lV0xOWtgsJC5dgN
	+Mc8EDEnCUQFCQPi1cEETqboYBu2woO/BaTrv43M=
Content-Type: multipart/mixed; boundary="===============6199400672090760275=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust-source-1.98.1: upgrading to 1.99.0 FAILED
Message-ID: <010101a0fb3359e7-bc803c37-9bed-4dd6-a109-b7edad5e600e-000000@us-west-2.amazonses.com>
Date: Fri, 2 Oct 2026 06:00:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 06:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247061

--===============6199400672090760275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rust-source-1.98.1* to *1.99.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rust-source-1.98.1 -V 1.99.0
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1994 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-d8195f7a0813c959e5e3337ff8297e99f7549e93"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d8195f7a0813c959e5e3337ff8297e99f7549e93"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 1995 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-d8195f7a0813c959e5e3337ff8297e99f7549e93"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:d8195f7a0813c959e5e3337ff8297e99f7549e93"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:11:02
Adding changed files:   0% |                                    | ETA:  0:08:02
Adding changed files:   0% |                                    | ETA:  0:07:00
Adding changed files:   0% |                                    | ETA:  0:06:31
Adding changed files:   0% |                                    | ETA:  0:06:12
Adding changed files:   0% |                                    | ETA:  0:06:01
Adding changed files:   0% |                                    | ETA:  0:05:53
Adding changed files:   0% |                                    | ETA:  0:05:48
Adding changed files:   1% |                                    | ETA:  0:05:43
Adding changed files:   1% |                                    | ETA:  0:05:37
Adding changed files:   1% |                                    | ETA:  0:05:31
Adding changed files:   1% |                                    | ETA:  0:05:25
Adding changed files:   1% |                                    | ETA:  0:05:19
Adding changed files:   1% |                                    | ETA:  0:05:18
Adding changed files:   1% |                                    | ETA:  0:05:15
Adding changed files:   1% |                                    | ETA:  0:05:13
Adding changed files:   2% |                                    | ETA:  0:05:11
Adding changed files:   2% |                                    | ETA:  0:05:08
Adding changed files:   2% |                                    | ETA:  0:05:05
Adding changed files:   2% |                                    | ETA:  0:05:02
Adding changed files:   2% |                                    | ETA:  0:05:00
Adding changed files:   2% |                                    | ETA:  0:04:59
Adding changed files:   2% |                                    | ETA:  0:04:58
Adding changed files:   2% |#                                   | ETA:  0:04:58
Adding changed files:   2% |#                                   | ETA:  0:04:57
Adding changed files:   3% |#                                   | ETA:  0:04:56
Adding changed files:   3% |#                                   | ETA:  0:04:56
Adding changed files:   3% |#                                   | ETA:  0:04:55
Adding changed files:   3% |#                                   | ETA:  0:04:54
Adding changed files:   3% |#                                   | ETA:  0:04:53
Adding changed files:   3% |#                                   | ETA:  0:04:53
Adding changed files:   3% |#                                   | ETA:  0:04:52
Adding changed files:   3% |#                                   | ETA:  0:04:51
Adding changed files:   4% |#                                   | ETA:  0:04:50
Adding changed files:   4% |#                                   | ETA:  0:04:50
Adding changed files:   4% |#                                   | ETA:  0:04:49
Adding changed files:   4% |#                                   | ETA:  0:04:49
Adding changed files:   4% |#                                   | ETA:  0:04:48
Adding changed files:   4% |#                                   | ETA:  0:04:48
Adding changed files:   4% |#                                   | ETA:  0:04:47
Adding changed files:   4% |#                                   | ETA:  0:04:47
Adding changed files:   4% |#                                   | ETA:  0:04:46
Adding changed files:   5% |#                                   | ETA:  0:04:46
Adding changed files:   5% |#                                   | ETA:  0:04:46
Adding changed files:   5% |#                                   | ETA:  0:04:46
Adding changed files:   5% |#                                   | ETA:  0:04:46
Adding changed files:   5% |#                                   | ETA:  0:04:45
Adding changed files:   5% |##                                  | ETA:  0:04:45
Adding changed files:   5% |##                                  | ETA:  0:04:44
Adding changed files:   5% |##                                  | ETA:  0:04:44
Adding changed files:   6% |##                                  | ETA:  0:04:44
Adding changed files:   6% |##                                  | ETA:  0:04:44
Adding changed files:   6% |##                                  | ETA:  0:04:43
Adding changed files:   6% |##                                  | ETA:  0:04:43
Adding changed files:   6% |##                                  | ETA:  0:04:43
Adding changed files:   6% |##                                  | ETA:  0:04:43
Adding changed files:   6% |##                                  | ETA:  0:04:43
Adding changed files:   6% |##                                  | ETA:  0:04:42
Adding changed files:   6% |##                                  | ETA:  0:04:42
Adding changed files:   7% |##                                  | ETA:  0:04:42
Adding changed files:   7% |##                                  | ETA:  0:04:41
Adding changed files:   7% |##                                  | ETA:  0:04:41
Adding changed files:   7% |##                                  | ETA:  0:04:41
Adding changed files:   7% |##                                  | ETA:  0:04:41
Adding changed files:   7% |##                                  | ETA:  0:04:40
Adding changed files:   7% |##                                  | ETA:  0:04:40
Adding changed files:   7% |##                                  | ETA:  0:04:42
Adding changed files:   8% |##                                  | ETA:  0:04:42
Adding changed files:   8% |##                                  | ETA:  0:04:42
Adding changed files:   8% |##                                  | ETA:  0:04:41
Adding changed files:   8% |###                                 | ETA:  0:04:41
Adding changed files:   8% |###                                 | ETA:  0:04:41
Adding changed files:   8% |###                                 | ETA:  0:04:41
Adding changed files:   8% |###                                 | ETA:  0:04:40
Adding changed files:   8% |###                                 | ETA:  0:04:40
Adding changed files:   8% |###                                 | ETA:  0:04:40
Adding changed files:   9% |###                                 | ETA:  0:04:39
Adding changed files:   9% |###                                 | ETA:  0:04:39
Adding changed files:   9% |###                                 | ETA:  0:04:39
Adding changed files:   9% |###                                 | ETA:  0:04:39
Adding changed files:   9% |###                                 | ETA:  0:04:38
Adding changed files:   9% |###                                 | ETA:  0:04:38
Adding changed files:   9% |###                                 | ETA:  0:04:38
Adding changed files:   9% |###                                 | ETA:  0:04:37
Adding changed files:  10% |###                                 | ETA:  0:04:37
Adding changed files:  10% |###                                 | ETA:  0:04:36
Adding changed files:  10% |###                                 | ETA:  0:04:36
Adding changed files:  10% |###                                 | ETA:  0:04:36
Adding changed files:  10% |###                                 | ETA:  0:04:36
Adding changed files:  10% |###                                 | ETA:  0:04:35
Adding changed files:  10% |###                                 | ETA:  0:04:35
Adding changed files:  10% |###                                 | ETA:  0:04:35
Adding changed files:  10% |###                                 | ETA:  0:04:35
Adding changed files:  11% |###                                 | ETA:  0:04:34
Adding changed files:  11% |####                                | ETA:  0:04:34
Adding changed files:  11% |####                                | ETA:  0:04:34
Adding changed files:  11% |####                                | ETA:  0:04:33
Adding changed files:  11% |####                                | ETA:  0:04:33
Adding changed files:  11% |####                                | ETA:  0:04:33
Adding changed files:  11% |####                                | ETA:  0:04:33
Adding changed files:  11% |####                                | ETA:  0:04:32
Adding changed files:  12% |####                                | ETA:  0:04:32
Adding changed files:  12% |####                                | ETA:  0:04:31
Adding changed files:  12% |####                                | ETA:  0:04:31
Adding changed files:  12% |####                                | ETA:  0:04:31
Adding changed files:  12% |####                                | ETA:  0:04:30
Adding changed files:  12% |####                                | ETA:  0:04:30
Adding changed files:  12% |####                                | ETA:  0:04:29
Adding changed files:  12% |####                                | ETA:  0:04:29
Adding changed files:  12% |####                                | ETA:  0:04:28
Adding changed files:  13% |####                                | ETA:  0:04:28
Adding changed files:  13% |####                                | ETA:  0:04:28
Adding changed files:  13% |####                                | ETA:  0:04:27
Adding changed files:  13% |####                                | ETA:  0:04:27
Adding changed files:  13% |####                                | ETA:  0:04:26
Adding changed files:  13% |####                                | ETA:  0:04:26
Adding changed files:  13% |####                                | ETA:  0:04:26
Adding changed files:  13% |#####                               | ETA:  0:04:25
Adding changed files:  14% |#####                               | ETA:  0:04:25
Adding changed files:  14% |#####                               | ETA:  0:04:25
Adding changed files:  14% |#####                               | ETA:  0:04:24
Adding changed files:  14% |#####                               | ETA:  0:04:24
Adding changed files:  14% |#####                               | ETA:  0:04:23
Adding changed files:  14% |#####                               | ETA:  0:04:23
Adding changed files:  14% |#####                               | ETA:  0:04:22
Adding changed files:  14% |#####                               | ETA:  0:04:22
Adding changed files:  14% |#####                               | ETA:  0:04:22
Adding changed files:  15% |#####                               | ETA:  0:04:21
Adding changed files:  15% |#####                               | ETA:  0:04:21
Adding changed files:  15% |#####                               | ETA:  0:04:20
Adding changed files:  15% |#####                               | ETA:  0:04:20
Adding changed files:  15% |#####                               | ETA:  0:04:20
Adding changed files:  15% |#####                               | ETA:  0:04:19
Adding changed files:  15% |#####                               | ETA:  0:04:19
Adding changed files:  15% |#####                               | ETA:  0:04:19
Adding changed files:  16% |#####                               | ETA:  0:04:18
Adding changed files:  16% |#####                               | ETA:  0:04:18
Adding changed files:  16% |#####                               | ETA:  0:04:18
Adding changed files:  16% |#####                               | ETA:  0:04:17
Adding changed files:  16% |#####                               | ETA:  0:04:17
Adding changed files:  16% |#####                               | ETA:  0:04:17
Adding changed files:  16% |######                              | ETA:  0:04:16
Adding changed files:  16% |######                              | ETA:  0:04:16
Adding changed files:  16% |######                              | ETA:  0:04:16
Adding changed files:  17% |######                              | ETA:  0:04:15
Adding changed files:  17% |######                              | ETA:  0:04:15
Adding changed files:  17% |######                              | ETA:  0:04:15
Adding changed files:  17% |######                              | ETA:  0:04:14
Adding changed files:  17% |######                              | ETA:  0:04:14
Adding changed files:  17% |######                              | ETA:  0:04:14
Adding changed files:  17% |######                              | ETA:  0:04:14
Adding changed files:  17% |######                              | ETA:  0:04:13
Adding changed files:  18% |######                              | ETA:  0:04:13
Adding changed files:  18% |######                              | ETA:  0:04:12
Adding changed files:  18% |######                              | ETA:  0:04:12
Adding changed files:  18% |######                              | ETA:  0:04:11
Adding changed files:  18% |######                              | ETA:  0:04:11
Adding changed files:  18% |######                              | ETA:  0:04:10
Adding changed files:  18% |######                              | ETA:  0:04:10
Adding changed files:  18% |######                              | ETA:  0:04:09
Adding changed files:  18% |######                              | ETA:  0:04:09
Adding changed files:  19% |######                              | ETA:  0:04:08
Adding changed files:  19% |######                              | ETA:  0:04:08
Adding changed files:  19% |######                              | ETA:  0:04:07
Adding changed files:  19% |######                              | ETA:  0:04:07
Adding changed files:  19% |#######                             | ETA:  0:04:06
Adding changed files:  19% |#######                             | ETA:  0:04:06
Adding changed files:  19% |#######                             | ETA:  0:04:05
Adding changed files:  19% |#######                             | ETA:  0:04:05
Adding changed files:  20% |#######                             | ETA:  0:04:04
Adding changed files:  20% |#######                             | ETA:  0:04:04
Adding changed files:  20% |#######                             | ETA:  0:04:03
Adding changed files:  20% |#######                             | ETA:  0:04:03
Adding changed files:  20% |#######                             | ETA:  0:04:02
Adding changed files:  20% |#######                             | ETA:  0:04:02
Adding changed files:  20% |#######                             | ETA:  0:04:01
Adding changed files:  20% |#######                             | ETA:  0:04:01
Adding changed files:  20% |#######                             | ETA:  0:04:00
Adding changed files:  21% |#######                             | ETA:  0:04:00
Adding changed files:  21% |#######                             | ETA:  0:03:59
Adding changed files:  21% |#######                             | ETA:  0:03:59
Adding changed files:  21% |#######                             | ETA:  0:03:58
Adding changed files:  21% |#######                             | ETA:  0:03:58
Adding changed files:  21% |#######                             | ETA:  0:03:57
Adding changed files:  21% |#######                             | ETA:  0:03:57
Adding changed files:  21% |#######                             | ETA:  0:03:56
Adding changed files:  22% |#######                             | ETA:  0:03:56
Adding changed files:  22% |#######                             | ETA:  0:03:56
Adding changed files:  22% |########                            | ETA:  0:03:55
Adding changed files:  22% |########                            | ETA:  0:03:55
Adding changed files:  22% |########                            | ETA:  0:03:54
Adding changed files:  22% |########                            | ETA:  0:03:54
Adding changed files:  22% |########                            | ETA:  0:03:53
Adding changed files:  22% |########                            | ETA:  0:03:53
Adding changed files:  22% |########                            | ETA:  0:03:52
Adding changed files:  23% |########                            | ETA:  0:03:52
Adding changed files:  23% |########                            | ETA:  0:03:51
Adding changed files:  23% |########                            | ETA:  0:03:51
Adding changed files:  23% |########                            | ETA:  0:03:50
Adding changed files:  23% |########                            | ETA:  0:03:50
Adding changed files:  23% |########                            | ETA:  0:03:50
Adding changed files:  23% |########                            | ETA:  0:03:49
Adding changed files:  23% |########                            | ETA:  0:03:49
Adding changed files:  24% |########                            | ETA:  0:03:48
Adding changed files:  24% |########                            | ETA:  0:03:48
Adding changed files:  24% |########                            | ETA:  0:03:47
Adding changed files:  24% |########                            | ETA:  0:03:47
Adding changed files:  24% |########                            | ETA:  0:03:46
Adding changed files:  24% |########                            | ETA:  0:03:46
Adding changed files:  24% |########                            | ETA:  0:03:46
Adding changed files:  24% |########                            | ETA:  0:03:45
Adding changed files:  24% |########                            | ETA:  0:03:45
Adding changed files:  25% |#########                           | ETA:  0:03:44
Adding changed files:  25% |#########                           | ETA:  0:03:44
Adding changed files:  25% |#########                           | ETA:  0:03:43
Adding changed files:  25% |#########                           | ETA:  0:03:43
Adding changed files:  25% |#########                           | ETA:  0:03:42
Adding changed files:  25% |#########                           | ETA:  0:03:42
Adding changed files:  25% |#########                           | ETA:  0:03:42
Adding changed files:  25% |#########                           | ETA:  0:03:41
Adding changed files:  26% |#########                           | ETA:  0:03:41
Adding changed files:  26% |#########                           | ETA:  0:03:40
Adding changed files:  26% |#########                           | ETA:  0:03:40
Adding changed files:  26% |#########                           | ETA:  0:03:40
Adding changed files:  26% |#########                           | ETA:  0:03:39
Adding changed files:  26% |#########                           | ETA:  0:03:39
Adding changed files:  26% |#########                           | ETA:  0:03:39
Adding changed files:  26% |#########                           | ETA:  0:03:38
Adding changed files:  26% |#########                           | ETA:  0:03:38
Adding changed files:  27% |#########                           | ETA:  0:03:37
Adding changed files:  27% |#########                           | ETA:  0:03:37
Adding changed files:  27% |#########                           | ETA:  0:03:37
Adding changed files:  27% |#########                           | ETA:  0:03:36
Adding changed files:  27% |#########                           | ETA:  0:03:36
Adding changed files:  27% |#########                           | ETA:  0:03:35
Adding changed files:  27% |##########                          | ETA:  0:03:35
Adding changed files:  27% |##########                          | ETA:  0:03:35
Adding changed files:  28% |##########                          | ETA:  0:03:34
Adding changed files:  28% |##########                          | ETA:  0:03:34
Adding changed files:  28% |##########                          | ETA:  0:03:34
Adding changed files:  28% |##########                          | ETA:  0:03:33
Adding changed files:  28% |##########                          | ETA:  0:03:33
Adding changed files:  28% |##########                          | ETA:  0:03:32
Adding changed files:  28% |##########                          | ETA:  0:03:32
Adding changed files:  28% |##########                          | ETA:  0:03:32
Adding changed files:  28% |##########                          | ETA:  0:03:31
Adding changed files:  29% |##########                          | ETA:  0:03:31
Adding changed files:  29% |##########                          | ETA:  0:03:30
Adding changed files:  29% |##########                          | ETA:  0:03:30
Adding changed files:  29% |##########                          | ETA:  0:03:30
Adding changed files:  29% |##########                          | ETA:  0:03:29
Adding changed files:  29% |##########                          | ETA:  0:03:29
Adding changed files:  29% |##########                          | ETA:  0:03:29
Adding changed files:  29% |##########                          | ETA:  0:03:28
Adding changed files:  30% |##########                          | ETA:  0:03:28
Adding changed files:  30% |##########                          | ETA:  0:03:28
Adding changed files:  30% |##########                          | ETA:  0:03:28
Adding changed files:  30% |##########                          | ETA:  0:03:27
Adding changed files:  30% |##########                          | ETA:  0:03:27
Adding changed files:  30% |###########                         | ETA:  0:03:27
Adding changed files:  30% |###########                         | ETA:  0:03:27
Adding changed files:  30% |###########                         | ETA:  0:03:26
Adding changed files:  30% |###########                         | ETA:  0:03:26
Adding changed files:  31% |###########                         | ETA:  0:03:26
Adding changed files:  31% |###########                         | ETA:  0:03:25
Adding changed files:  31% |###########                         | ETA:  0:03:25
Adding changed files:  31% |###########                         | ETA:  0:03:25
Adding changed files:  31% |###########                         | ETA:  0:03:25
Adding changed files:  31% |###########                         | ETA:  0:03:24
Adding changed files:  31% |###########                         | ETA:  0:03:24
Adding changed files:  31% |###########                         | ETA:  0:03:24
Adding changed files:  32% |###########                         | ETA:  0:03:24
Adding changed files:  32% |###########                         | ETA:  0:03:23
Adding changed files:  32% |###########                         | ETA:  0:03:23
Adding changed files:  32% |###########                         | ETA:  0:03:23
Adding changed files:  32% |###########                         | ETA:  0:03:23
Adding changed files:  32% |###########                         | ETA:  0:03:22
Adding changed files:  32% |###########                         | ETA:  0:03:22
Adding changed files:  32% |###########                         | ETA:  0:03:22
Adding changed files:  32% |###########                         | ETA:  0:03:21
Adding changed files:  33% |###########                         | ETA:  0:03:21
Adding changed files:  33% |###########                         | ETA:  0:03:21
Adding changed files:  33% |###########                         | ETA:  0:03:21
Adding changed files:  33% |############                        | ETA:  0:03:20
Adding changed files:  33% |############                        | ETA:  0:03:20
Adding changed files:  33% |############                        | ETA:  0:03:20
Adding changed files:  33% |############                        | ETA:  0:03:19
Adding changed files:  33% |############                        | ETA:  0:03:19
Adding changed files:  34% |############                        | ETA:  0:03:19
Adding changed files:  34% |############                        | ETA:  0:03:18
Adding changed files:  34% |############                        | ETA:  0:03:18
Adding changed files:  34% |############                        | ETA:  0:03:18
Adding changed files:  34% |############                        | ETA:  0:03:17
Adding changed files:  34% |############                        | ETA:  0:03:17
Adding changed files:  34% |############                        | ETA:  0:03:17
Adding changed files:  34% |############                        | ETA:  0:03:16
Adding changed files:  34% |############                        | ETA:  0:03:16
Adding changed files:  35% |############                        | ETA:  0:03:16
Adding changed files:  35% |############                        | ETA:  0:03:16
Adding changed files:  35% |############                        | ETA:  0:03:15
Adding changed files:  35% |############                        | ETA:  0:03:15
Adding changed files:  35% |############                        | ETA:  0:03:15
Adding changed files:  35% |############                        | ETA:  0:03:14
Adding changed files:  35% |############                        | ETA:  0:03:14
Adding changed files:  35% |############                        | ETA:  0:03:14
Adding changed files:  36% |############                        | ETA:  0:03:14
Adding changed files:  36% |#############                       | ETA:  0:03:13
Adding changed files:  36% |#############                       | ETA:  0:03:13
Adding changed files:  36% |#############                       | ETA:  0:03:13
Adding changed files:  36% |#############                       | ETA:  0:03:12
Adding changed files:  36% |#############                       | ETA:  0:03:12
Adding changed files:  36% |#############                       | ETA:  0:03:12
Adding changed files:  36% |#############                       | ETA:  0:03:12
Adding changed files:  36% |#############                       | ETA:  0:03:11
Adding changed files:  37% |#############                       | ETA:  0:03:11
Adding changed files:  37% |#############                       | ETA:  0:03:11
Adding changed files:  37% |#############                       | ETA:  0:03:10
Adding changed files:  37% |#############                       | ETA:  0:03:10
Adding changed files:  37% |#############                       | ETA:  0:03:10
Adding changed files:  37% |#############                       | ETA:  0:03:09
Adding changed files:  37% |#############                       | ETA:  0:03:09
Adding changed files:  37% |#############                       | ETA:  0:03:09
Adding changed files:  38% |#############                       | ETA:  0:03:09
Adding changed files:  38% |#############                       | ETA:  0:03:08
Adding changed files:  38% |#############                       | ETA:  0:03:08
Adding changed files:  38% |#############                       | ETA:  0:03:07
Adding changed files:  38% |#############                       | ETA:  0:03:07
Adding changed files:  38% |#############                       | ETA:  0:03:07
Adding changed files:  38% |#############                       | ETA:  0:03:06
Adding changed files:  38% |#############                       | ETA:  0:03:06
Adding changed files:  38% |##############                      | ETA:  0:03:06
Adding changed files:  39% |##############                      | ETA:  0:03:06
Adding changed files:  39% |##############                      | ETA:  0:03:05
Adding changed files:  39% |##############                      | ETA:  0:03:05
Adding changed files:  39% |##############                      | ETA:  0:03:05
Adding changed files:  39% |##############                      | ETA:  0:03:04
Adding changed files:  39% |##############                      | ETA:  0:03:04
Adding changed files:  39% |##############                      | ETA:  0:03:04
Adding changed files:  39% |##############                      | ETA:  0:03:04
Adding changed files:  40% |##############                      | ETA:  0:03:03
Adding changed files:  40% |##############                      | ETA:  0:03:03
Adding changed files:  40% |##############                      | ETA:  0:03:03
Adding changed files:  40% |##############                      | ETA:  0:03:03
Adding changed files:  40% |##############                      | ETA:  0:03:02
Adding changed files:  40% |##############                      | ETA:  0:03:02
Adding changed files:  40% |##############                      | ETA:  0:03:02
Adding changed files:  40% |##############                      | ETA:  0:03:01
Adding changed files:  40% |##############                      | ETA:  0:03:01
Adding changed files:  41% |##############                      | ETA:  0:03:01
Adding changed files:  41% |##############                      | ETA:  0:03:00
Adding changed files:  41% |##############                      | ETA:  0:03:00
Adding changed files:  41% |##############                      | ETA:  0:03:00
Adding changed files:  41% |##############                      | ETA:  0:03:00
Adding changed files:  41% |###############                     | ETA:  0:02:59
Adding changed files:  41% |###############                     | ETA:  0:02:59
Adding changed files:  41% |###############                     | ETA:  0:02:59
Adding changed files:  42% |###############                     | ETA:  0:02:58
Adding changed files:  42% |###############                     | ETA:  0:02:58
Adding changed files:  42% |###############                     | ETA:  0:02:58
Adding changed files:  42% |###############                     | ETA:  0:02:57
Adding changed files:  42% |###############                     | ETA:  0:02:57
Adding changed files:  42% |###############                     | ETA:  0:02:57
Adding changed files:  42% |###############                     | ETA:  0:02:56
Adding changed files:  42% |###############                     | ETA:  0:02:56
Adding changed files:  42% |###############                     | ETA:  0:02:56
Adding changed files:  43% |###############                     | ETA:  0:02:56
Adding changed files:  43% |###############                     | ETA:  0:02:55
Adding changed files:  43% |###############                     | ETA:  0:02:55
Adding changed files:  43% |###############                     | ETA:  0:02:55
Adding changed files:  43% |###############                     | ETA:  0:02:54
Adding changed files:  43% |###############                     | ETA:  0:02:54
Adding changed files:  43% |###############                     | ETA:  0:02:54
Adding changed files:  43% |###############                     | ETA:  0:02:54
Adding changed files:  44% |###############                     | ETA:  0:02:53
Adding changed files:  44% |###############                     | ETA:  0:02:53
Adding changed files:  44% |###############                     | ETA:  0:02:53
Adding changed files:  44% |###############                     | ETA:  0:02:52
Adding changed files:  44% |################                    | ETA:  0:02:52
Adding changed files:  44% |################                    | ETA:  0:02:52
Adding changed files:  44% |################                    | ETA:  0:02:52
Adding changed files:  44% |################                    | ETA:  0:02:51
Adding changed files:  44% |################                    | ETA:  0:02:51
Adding changed files:  45% |################                    | ETA:  0:02:51
Adding changed files:  45% |################                    | ETA:  0:02:50
Adding changed files:  45% |################                    | ETA:  0:02:50
Adding changed files:  45% |################                    | ETA:  0:02:50
Adding changed files:  45% |################                    | ETA:  0:02:49
Adding changed files:  45% |################                    | ETA:  0:02:49
Adding changed files:  45% |################                    | ETA:  0:02:49
Adding changed files:  45% |################                    | ETA:  0:02:48
Adding changed files:  46% |################                    | ETA:  0:02:48
Adding changed files:  46% |################                    | ETA:  0:02:48
Adding changed files:  46% |################                    | ETA:  0:02:48
Adding changed files:  46% |################                    | ETA:  0:02:47
Adding changed files:  46% |################                    | ETA:  0:02:47
Adding changed files:  46% |################                    | ETA:  0:02:47
Adding changed files:  46% |################                    | ETA:  0:02:46
Adding changed files:  46% |################                    | ETA:  0:02:46
Adding changed files:  46% |################                    | ETA:  0:02:45
Adding changed files:  47% |################                    | ETA:  0:02:45
Adding changed files:  47% |################                    | ETA:  0:02:45
Adding changed files:  47% |#################                   | ETA:  0:02:44
Adding changed files:  47% |#################                   | ETA:  0:02:44
Adding changed files:  47% |#################                   | ETA:  0:02:44
Adding changed files:  47% |#################                   | ETA:  0:02:43
Adding changed files:  47% |#################                   | ETA:  0:02:43
Adding changed files:  47% |#################                   | ETA:  0:02:43
Adding changed files:  48% |#################                   | ETA:  0:02:42
Adding changed files:  48% |#################                   | ETA:  0:02:42
Adding changed files:  48% |#################                   | ETA:  0:02:42
Adding changed files:  48% |#################                   | ETA:  0:02:41
Adding changed files:  48% |#################                   | ETA:  0:02:41
Adding changed files:  48% |#################                   | ETA:  0:02:41
Adding changed files:  48% |#################                   | ETA:  0:02:40
Adding changed files:  48% |#################                   | ETA:  0:02:40
Adding changed files:  48% |#################                   | ETA:  0:02:40
Adding changed files:  49% |#################                   | ETA:  0:02:39
Adding changed files:  49% |#################                   | ETA:  0:02:39
Adding changed files:  49% |#################                   | ETA:  0:02:38
Adding changed files:  49% |#################                   | ETA:  0:02:38
Adding changed files:  49% |#################                   | ETA:  0:02:38
Adding changed files:  49% |#################                   | ETA:  0:02:37
Adding changed files:  49% |#################                   | ETA:  0:02:37
Adding changed files:  49% |#################                   | ETA:  0:02:37
Adding changed files:  50% |##################                  | ETA:  0:02:36
Adding changed files:  50% |##################                  | ETA:  0:02:36
Adding changed files:  50% |##################                  | ETA:  0:02:36
Adding changed files:  50% |##################                  | ETA:  0:02:35
Adding changed files:  50% |##################                  | ETA:  0:02:35
Adding changed files:  50% |##################                  | ETA:  0:02:34
Adding changed files:  50% |##################                  | ETA:  0:02:34
Adding changed files:  50% |##################                  | ETA:  0:02:34
Adding changed files:  50% |##################                  | ETA:  0:02:33
Adding changed files:  51% |##################                  | ETA:  0:02:33
Adding changed files:  51% |##################                  | ETA:  0:02:32
Adding changed files:  51% |##################                  | ETA:  0:02:32
Adding changed files:  51% |##################                  | ETA:  0:02:32
Adding changed files:  51% |##################                  | ETA:  0:02:31
Adding changed files:  51% |##################                  | ETA:  0:02:31
Adding changed files:  51% |##################                  | ETA:  0:02:31
Adding changed files:  51% |##################                  | ETA:  0:02:30
Adding changed files:  52% |##################                  | ETA:  0:02:30
Adding changed files:  52% |##################                  | ETA:  0:02:29
Adding changed files:  52% |##################                  | ETA:  0:02:29
Adding changed files:  52% |##################                  | ETA:  0:02:29
Adding changed files:  52% |##################                  | ETA:  0:02:28
Adding changed files:  52% |##################                  | ETA:  0:02:28
Adding changed files:  52% |##################                  | ETA:  0:02:27
Adding changed files:  52% |###################                 | ETA:  0:02:27
Adding changed files:  52% |###################                 | ETA:  0:02:26
Adding changed files:  53% |###################                 | ETA:  0:02:26
Adding changed files:  53% |###################                 | ETA:  0:02:26
Adding changed files:  53% |###################                 | ETA:  0:02:25
Adding changed files:  53% |###################                 | ETA:  0:02:25
Adding changed files:  53% |###################                 | ETA:  0:02:24
Adding changed files:  53% |###################                 | ETA:  0:02:24
Adding changed files:  53% |###################                 | ETA:  0:02:24
Adding changed files:  53% |###################                 | ETA:  0:02:23
Adding changed files:  54% |###################                 | ETA:  0:02:23
Adding changed files:  54% |###################                 | ETA:  0:02:23
Adding changed files:  54% |###################                 | ETA:  0:02:22
Adding changed files:  54% |###################                 | ETA:  0:02:22
Adding changed files:  54% |###################                 | ETA:  0:02:21
Adding changed files:  54% |###################                 | ETA:  0:02:21
Adding changed files:  54% |###################                 | ETA:  0:02:21
Adding changed files:  54% |###################                 | ETA:  0:02:20
Adding changed files:  54% |###################                 | ETA:  0:02:20
Adding changed files:  55% |###################                 | ETA:  0:02:19
Adding changed files:  55% |###################                 | ETA:  0:02:19
Adding changed files:  55% |###################                 | ETA:  0:02:19
Adding changed files:  55% |###################                 | ETA:  0:02:18
Adding changed files:  55% |####################                | ETA:  0:02:18
Adding changed files:  55% |####################                | ETA:  0:02:18
Adding changed files:  55% |####################                | ETA:  0:02:17
Adding changed files:  55% |####################                | ETA:  0:02:17
Adding changed files:  56% |####################                | ETA:  0:02:16
Adding changed files:  56% |####################                | ETA:  0:02:16
Adding changed files:  56% |####################                | ETA:  0:02:16
Adding changed files:  56% |####################                | ETA:  0:02:16
Adding changed files:  56% |####################                | ETA:  0:02:15
Adding changed files:  56% |####################                | ETA:  0:02:15
Adding changed files:  56% |####################                | ETA:  0:02:14
Adding changed files:  56% |####################                | ETA:  0:02:14
Adding changed files:  56% |####################                | ETA:  0:02:14
Adding changed files:  57% |####################                | ETA:  0:02:13
Adding changed files:  57% |####################                | ETA:  0:02:13
Adding changed files:  57% |####################                | ETA:  0:02:12
Adding changed files:  57% |####################                | ETA:  0:02:12
Adding changed files:  57% |####################                | ETA:  0:02:12
Adding changed files:  57% |####################                | ETA:  0:02:11
Adding changed files:  57% |####################                | ETA:  0:02:11
Adding changed files:  57% |####################                | ETA:  0:02:11
Adding changed files:  58% |####################                | ETA:  0:02:10
Adding changed files:  58% |####################                | ETA:  0:02:10
Adding changed files:  58% |####################                | ETA:  0:02:09
Adding changed files:  58% |#####################               | ETA:  0:02:09
Adding changed files:  58% |#####################               | ETA:  0:02:09
Adding changed files:  58% |#####################               | ETA:  0:02:08
Adding changed files:  58% |#####################               | ETA:  0:02:08
Adding changed files:  58% |#####################               | ETA:  0:02:07
Adding changed files:  58% |#####################               | ETA:  0:02:07
Adding changed files:  59% |#####################               | ETA:  0:02:07
Adding changed files:  59% |#####################               | ETA:  0:02:06
Adding changed files:  59% |#####################               | ETA:  0:02:06
Adding changed files:  59% |#####################               | ETA:  0:02:06
Adding changed files:  59% |#####################               | ETA:  0:02:05
Adding changed files:  59% |#####################               | ETA:  0:02:05
Adding changed files:  59% |#####################               | ETA:  0:02:05
Adding changed files:  59% |#####################               | ETA:  0:02:04
Adding changed files:  60% |#####################               | ETA:  0:02:04
Adding changed files:  60% |#####################               | ETA:  0:02:04
Adding changed files:  60% |#####################               | ETA:  0:02:03
Adding changed files:  60% |#####################               | ETA:  0:02:03
Adding changed files:  60% |#####################               | ETA:  0:02:02
Adding changed files:  60% |#####################               | ETA:  0:02:02
Adding changed files:  60% |#####################               | ETA:  0:02:02
Adding changed files:  60% |#####################               | ETA:  0:02:01
Adding changed files:  60% |#####################               | ETA:  0:02:01
Adding changed files:  61% |#####################               | ETA:  0:02:01
Adding changed files:  61% |######################              | ETA:  0:02:00
Adding changed files:  61% |######################              | ETA:  0:02:00
Adding changed files:  61% |######################              | ETA:  0:02:00
Adding changed files:  61% |######################              | ETA:  0:01:59
Adding changed files:  61% |######################              | ETA:  0:01:59
Adding changed files:  61% |######################              | ETA:  0:01:59
Adding changed files:  61% |######################              | ETA:  0:01:58
Adding changed files:  62% |######################              | ETA:  0:01:58
Adding changed files:  62% |######################              | ETA:  0:01:57
Adding changed files:  62% |######################              | ETA:  0:01:57
Adding changed files:  62% |######################              | ETA:  0:01:57
Adding changed files:  62% |######################              | ETA:  0:01:56
Adding changed files:  62% |######################              | ETA:  0:01:56
Adding changed files:  62% |######################              | ETA:  0:01:56
Adding changed files:  62% |######################              | ETA:  0:01:55
Adding changed files:  62% |######################              | ETA:  0:01:55
Adding changed files:  63% |######################              | ETA:  0:01:55
Adding changed files:  63% |######################              | ETA:  0:01:54
Adding changed files:  63% |######################              | ETA:  0:01:54
Adding changed files:  63% |######################              | ETA:  0:01:53
Adding changed files:  63% |######################              | ETA:  0:01:53
Adding changed files:  63% |######################              | ETA:  0:01:53
Adding changed files:  63% |######################              | ETA:  0:01:52
Adding changed files:  63% |#######################             | ETA:  0:01:52
Adding changed files:  64% |#######################             | ETA:  0:01:52
Adding changed files:  64% |#######################             | ETA:  0:01:51
Adding changed files:  64% |#######################             | ETA:  0:01:51
Adding changed files:  64% |#######################             | ETA:  0:01:51
Adding changed files:  64% |#######################             | ETA:  0:01:50
Adding changed files:  64% |#######################             | ETA:  0:01:50
Adding changed files:  64% |#######################             | ETA:  0:01:49
Adding changed files:  64% |#######################             | ETA:  0:01:49
Adding changed files:  64% |#######################             | ETA:  0:01:49
Adding changed files:  65% |#######################             | ETA:  0:01:48
Adding changed files:  65% |#######################             | ETA:  0:01:48
Adding changed files:  65% |#######################             | ETA:  0:01:48
Adding changed files:  65% |#######################             | ETA:  0:01:47
Adding changed files:  65% |#######################             | ETA:  0:01:47
Adding changed files:  65% |#######################             | ETA:  0:01:47
Adding changed files:  65% |#######################             | ETA:  0:01:46
Adding changed files:  65% |#######################             | ETA:  0:01:46
Adding changed files:  66% |#######################             | ETA:  0:01:46
Adding changed files:  66% |#######################             | ETA:  0:01:45
Adding changed files:  66% |#######################             | ETA:  0:01:45
Adding changed files:  66% |#######################             | ETA:  0:01:45
Adding changed files:  66% |#######################             | ETA:  0:01:44
Adding changed files:  66% |#######################             | ETA:  0:01:44
Adding changed files:  66% |########################            | ETA:  0:01:44
Adding changed files:  66% |########################            | ETA:  0:01:43
Adding changed files:  66% |########################            | ETA:  0:01:43
Adding changed files:  67% |########################            | ETA:  0:01:42
Adding changed files:  67% |########################            | ETA:  0:01:42
Adding changed files:  67% |########################            | ETA:  0:01:42
Adding changed files:  67% |########################            | ETA:  0:01:41
Adding changed files:  67% |########################            | ETA:  0:01:41
Adding changed files:  67% |########################            | ETA:  0:01:41
Adding changed files:  67% |########################            | ETA:  0:01:40
Adding changed files:  67% |########################            | ETA:  0:01:40
Adding changed files:  68% |########################            | ETA:  0:01:40
Adding changed files:  68% |########################            | ETA:  0:01:39
Adding changed files:  68% |########################            | ETA:  0:01:39
Adding changed files:  68% |########################            | ETA:  0:01:39
Adding changed files:  68% |########################            | ETA:  0:01:38
Adding changed files:  68% |########################            | ETA:  0:01:38
Adding changed files:  68% |########################            | ETA:  0:01:38
Adding changed files:  68% |########################            | ETA:  0:01:37
Adding changed files:  68% |########################            | ETA:  0:01:37
Adding changed files:  69% |########################            | ETA:  0:01:37
Adding changed files:  69% |########################            | ETA:  0:01:36
Adding changed files:  69% |########################            | ETA:  0:01:36
Adding changed files:  69% |#########################           | ETA:  0:01:36
Adding changed files:  69% |#########################           | ETA:  0:01:35
Adding changed files:  69% |#########################           | ETA:  0:01:35
Adding changed files:  69% |#########################           | ETA:  0:01:34
Adding changed files:  69% |#########################           | ETA:  0:01:34
Adding changed files:  70% |#########################           | ETA:  0:01:34
Adding changed files:  70% |#########################           | ETA:  0:01:33
Adding changed files:  70% |#########################           | ETA:  0:01:33
Adding changed files:  70% |#########################           | ETA:  0:01:33
Adding changed files:  70% |#########################           | ETA:  0:01:32
Adding changed files:  70% |#########################           | ETA:  0:01:32
Adding changed files:  70% |#########################           | ETA:  0:01:32
Adding changed files:  70% |#########################           | ETA:  0:01:31
Adding changed files:  70% |#########################           | ETA:  0:01:31
Adding changed files:  71% |#########################           | ETA:  0:01:30
Adding changed files:  71% |#########################           | ETA:  0:01:30
Adding changed files:  71% |#########################           | ETA:  0:01:30
Adding changed files:  71% |#########################           | ETA:  0:01:29
Adding changed files:  71% |#########################           | ETA:  0:01:29
Adding changed files:  71% |#########################           | ETA:  0:01:29
Adding changed files:  71% |#########################           | ETA:  0:01:28
Adding changed files:  71% |#########################           | ETA:  0:01:28
Adding changed files:  72% |#########################           | ETA:  0:01:28
Adding changed files:  72% |#########################           | ETA:  0:01:27
Adding changed files:  72% |##########################          | ETA:  0:01:27
Adding changed files:  72% |##########################          | ETA:  0:01:27
Adding changed files:  72% |##########################          | ETA:  0:01:26
Adding changed files:  72% |##########################          | ETA:  0:01:26
Adding changed files:  72% |##########################          | ETA:  0:01:25
Adding changed files:  72% |##########################          | ETA:  0:01:25
Adding changed files:  72% |##########################          | ETA:  0:01:25
Adding changed files:  73% |##########################          | ETA:  0:01:24
Adding changed files:  73% |##########################          | ETA:  0:01:24
Adding changed files:  73% |##########################          | ETA:  0:01:24
Adding changed files:  73% |##########################          | ETA:  0:01:23
Adding changed files:  73% |##########################          | ETA:  0:01:23
Adding changed files:  73% |##########################          | ETA:  0:01:23
Adding changed files:  73% |##########################          | ETA:  0:01:22
Adding changed files:  73% |##########################          | ETA:  0:01:22
Adding changed files:  74% |##########################          | ETA:  0:01:21
Adding changed files:  74% |##########################          | ETA:  0:01:21
Adding changed files:  74% |##########################          | ETA:  0:01:21
Adding changed files:  74% |##########################          | ETA:  0:01:20
Adding changed files:  74% |##########################          | ETA:  0:01:20
Adding changed files:  74% |##########################          | ETA:  0:01:20
Adding changed files:  74% |##########################          | ETA:  0:01:19
Adding changed files:  74% |##########################          | ETA:  0:01:19
Adding changed files:  74% |##########################          | ETA:  0:01:19
Adding changed files:  75% |###########################         | ETA:  0:01:18
Adding changed files:  75% |###########################         | ETA:  0:01:18
Adding changed files:  75% |###########################         | ETA:  0:01:18
Adding changed files:  75% |###########################         | ETA:  0:01:17
Adding changed files:  75% |###########################         | ETA:  0:01:17
Adding changed files:  75% |###########################         | ETA:  0:01:16
Adding changed files:  75% |###########################         | ETA:  0:01:16
Adding changed files:  75% |###########################         | ETA:  0:01:16
Adding changed files:  76% |###########################         | ETA:  0:01:15
Adding changed files:  76% |###########################         | ETA:  0:01:15
Adding changed files:  76% |###########################         | ETA:  0:01:15
Adding changed files:  76% |###########################         | ETA:  0:01:14
Adding changed files:  76% |###########################         | ETA:  0:01:14
Adding changed files:  76% |###########################         | ETA:  0:01:14
Adding changed files:  76% |###########################         | ETA:  0:01:13
Adding changed files:  76% |###########################         | ETA:  0:01:13
Adding changed files:  76% |###########################         | ETA:  0:01:13
Adding changed files:  77% |###########################         | ETA:  0:01:12
Adding changed files:  77% |###########################         | ETA:  0:01:12
Adding changed files:  77% |###########################         | ETA:  0:01:11
Adding changed files:  77% |###########################         | ETA:  0:01:11
Adding changed files:  77% |###########################         | ETA:  0:01:11
Adding changed files:  77% |###########################         | ETA:  0:01:10
Adding changed files:  77% |############################        | ETA:  0:01:10
Adding changed files:  77% |############################        | ETA:  0:01:10
Adding changed files:  78% |############################        | ETA:  0:01:09
Adding changed files:  78% |############################        | ETA:  0:01:09
Adding changed files:  78% |############################        | ETA:  0:01:09
Adding changed files:  78% |############################        | ETA:  0:01:08
Adding changed files:  78% |############################        | ETA:  0:01:08
Adding changed files:  78% |############################        | ETA:  0:01:08
Adding changed files:  78% |############################        | ETA:  0:01:07
Adding changed files:  78% |############################        | ETA:  0:01:07
INFO: Creating workspace layer in /srv/pokybuild/yocto-worker/auh/build/build/workspace
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.99.0-src.tar.xz;name=rust...
ERROR: Execution of 'git add -f -A "tests/ui/coherence/orphan-check-weak-aliases-not-covering.rs" "tests/ui/coherence/warn-when-cycle-is-error-in-coherence.rs" "tests/ui/coherence/warn-when-cycle-is-error-in-coherence.stderr" "tests/ui/command/command-setgroups.rs" "tests/ui/compile-flags/invalid/need-crate-arg-ignore-tidy$x.stderr" "tests/ui/compile-flags/invalid/print-file-names-request-malformed-crate-name-1.stderr" "tests/ui/comptime/feature-gate-test.stderr" "tests/ui/comptime/trait_comptime.stderr" "tests/ui/conditional-compilation/cfg-attr-crate-2.rs" "tests/ui/conditional-compilation/cfg-attr-crate-2.stderr" "tests/ui/conditional-compilation/cfg-attr-invalid-predicate.stderr" "tests/ui/conditional-compilation/cfg-attr-multi-invalid-1.rs" "tests/ui/conditional-compilation/cfg-attr-multi-invalid-1.stderr" "tests/ui/conditional-compilation/cfg-attr-multi-invalid-2.rs" "tests/ui/conditional-compilation/cfg-attr-multi-invalid-2.stderr" "tests/ui/conditional-compilation/cfg-attr-pa
 rse.stderr" "tests/ui/conditional-compilation/cfg-attr-parsed-span-issue-154801.rs" "tests/ui/conditional-compilation/cfg-attr-parsed-span-issue-154801.stderr" "tests/ui/conditional-compilation/cfg-attr-syntax-validation.stderr" "tests/ui/conditional-compilation/cfg_attr-attr-syntax-validation.stderr" "tests/ui/conditional-compilation/cfg_attr-invalid-predicate-inner.stderr" "tests/ui/conditional-compilation/invalid-node-range-issue-129166.rs" "tests/ui/const-generics/adt_const_params/alias_const_param_ty-1.rs" "tests/ui/const-generics/adt_const_params/index-oob-ice-83993.stderr" "tests/ui/const-generics/adt_const_params/unsizing-wfcheck-issue-126272.stderr" "tests/ui/const-generics/assoc_const_as_type_argument.rs" "tests/ui/const-generics/assoc_const_as_type_argument.stderr" "tests/ui/const-generics/associated-const-bindings/dyn-compat-const-param-default-mentions-self.rs" "tests/ui/const-generics/associated-const-bindings/dyn-compat-const-projection-behind-trait-alias-mentions-sel
 f.rs" "tests/ui/const-generics/associated-const-bindings/dyn-compat-const-projection-from-supertrait-mentions-self.rs" "tests/ui/const-generics/associated-const-bindings/dyn-compat-non-type-assoc-const.rs" "tests/ui/const-generics/associated-const-bindings/dyn-compat-self-const-projections-in-assoc-const-ty.rs" "tests/ui/const-generics/associated-const-bindings/dyn-compat-self-const-projections-in-assoc-const-ty.stderr" "tests/ui/const-generics/associated-const-bindings/dyn-compat-self-const-projections-in-methods.rs" "tests/ui/const-generics/associated-const-bindings/dyn-compat-self-const-projections-in-supertrait-bounds.rs" "tests/ui/const-generics/associated-const-bindings/normalization-via-param-env.rs" "tests/ui/const-generics/associated-const-bindings/wf-mismatch-3.rs" "tests/ui/const-generics/check_const_arg_type_in_free_alias.rs" "tests/ui/const-generics/const-arg-in-const-arg.min.stderr" "tests/ui/const-generics/const-argument-if-length.min.stderr" "tests/ui/const-generics/
 const-argument-non-static-lifetime.min.stderr" "tests/ui/const-generics/const-generic-function.rs" "tests/ui/const-generics/const-generic-function.stderr" "tests/ui/const-generics/defaults/complex-generic-default-expr.min.stderr" "tests/ui/const-generics/early/closing-args-token.rs" "tests/ui/const-generics/early/closing-args-token.stderr" "tests/ui/const-generics/early/const_arg_trivial_macro_expansion-4.stderr" "tests/ui/const-generics/early/macro_rules-braces.stderr" "tests/ui/const-generics/early/trivial-const-arg-macro-nested-braces-2.stderr" "tests/ui/const-generics/early/trivial-const-arg-macro-nested-braces.stderr" "tests/ui/const-generics/early/trivial-const-arg-nested-braces.stderr" "tests/ui/const-generics/fn-item-as-const-arg-137084.rs" "tests/ui/const-generics/fn-item-as-const-arg-137084.stderr" "tests/ui/const-generics/gca/ambiguous-on-failed-eval-with-vars-fail.next.stderr" "tests/ui/const-generics/gca/ambiguous-on-failed-eval-with-vars-fail.old.stderr" "tests/ui/cons
 t-generics/gca/ambiguous-on-failed-eval-with-vars-fail.rs" "tests/ui/const-generics/gca/ambiguous-on-failed-eval-with-vars.rs" "tests/ui/const-generics/gca/generic-free-const.rs" "tests/ui/const-generics/gca/non-type-equality-fail.rs" "tests/ui/const-generics/gca/non-type-equality-fail.stderr" "tests/ui/const-generics/gca/non-type-equality-ok.rs" "tests/ui/const-generics/gca/path-to-non-type-const.rs" "tests/ui/const-generics/gca/path-to-non-type-inherent-associated-const.rs" "tests/ui/const-generics/gca/path-to-non-type-inherent-associated-const.stderr" "tests/ui/const-generics/generic_const_exprs/array-size-in-generic-struct-param.min.stderr" "tests/ui/const-generics/generic_const_exprs/assoc_const_unification/doesnt_unify_evaluatable.stderr" "tests/ui/const-generics/generic_const_exprs/bad-multiply.stderr" "tests/ui/const-generics/generic_const_exprs/dependence_lint.full.stderr" "tests/ui/const-generics/generic_const_exprs/dyn-compatibility-ok-infer-err.rs" "tests/ui/const-generi
 cs/generic_const_exprs/dyn-compatibility-ok-infer-err.stderr" "tests/ui/const-generics/generic_const_exprs/feature-attribute-missing-in-dependent-crate-ice.stderr" "tests/ui/const-generics/generic_const_exprs/feature-gate-generic_const_exprs.stderr" "tests/ui/const-generics/generic_const_exprs/issue-69654.rs" "tests/ui/const-generics/generic_const_exprs/issue-69654.stderr" "tests/ui/const-generics/generic_const_exprs/issue-72787.min.stderr" "tests/ui/const-generics/generic_const_exprs/issue-72819-generic-in-const-eval.min.stderr" "tests/ui/const-generics/generic_const_exprs/issue-74713.stderr" "tests/ui/const-generics/generic_const_exprs/non-local-const.rs" "tests/ui/const-generics/generic_const_exprs/non-local-const.stderr" "tests/ui/const-generics/generic_const_exprs/trivial-anon-const-use-cases.min.stderr" "tests/ui/const-generics/generic_const_exprs/unknown-alias-defkind-anonconst-ice-116710.rs" "tests/ui/const-generics/generic_const_exprs/unknown-alias-defkind-anonconst-ice-116
 710.stderr" "tests/ui/const-generics/ice-151186-fn-ptr-in-where-clause.rs" "tests/ui/const-generics/ice-151186-fn-ptr-in-where-clause.stderr" "tests/ui/const-generics/ice-68875.stderr" "tests/ui/const-generics/incorrect-const-param.rs" "tests/ui/const-generics/incorrect-const-param.stderr" "tests/ui/const-generics/infer/issue-77092.rs" "tests/ui/const-generics/infer/issue-77092.stderr" "tests/ui/const-generics/intrinsics-type_name-as-const-argument.min.stderr" "tests/ui/const-generics/invalid-attributes-on-const-params-78957.stderr" "tests/ui/const-generics/invalid-rustc_legacy_const_generics-arguments.rs" "tests/ui/const-generics/invalid-rustc_legacy_const_generics-arguments.stderr" "tests/ui/const-generics/issue-46511.stderr" "tests/ui/const-generics/issues/issue-56445-2.stderr" "tests/ui/const-generics/issues/issue-56445-3.stderr" "tests/ui/const-generics/issues/issue-67375.min.stderr" "tests/ui/const-generics/issues/issue-67945-1.min.stderr" "tests/ui/const-generics/issues/issue
 -67945-2.min.stderr" "tests/ui/const-generics/issues/issue-67945-3.min.stderr"' failed with exit code 128:
fatal: pathspec 'tests/ui/compile-flags/invalid/need-crate-arg-ignore-tidy.stderr' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6199400672090760275==--

