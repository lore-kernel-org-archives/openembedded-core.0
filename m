Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13125C3DA40
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:27 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1300.1715794340171986457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=H6ZXkSRP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NuAUmhAQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f7d4fe6e7-d5f3361a-0f52-4619-8bba-5ea1bb3c4250-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P3yljl1zOwsGHUI5g7ETJNTyL6gcItz/Poo4I/tPMh0=;
	b=H6ZXkSRPXNkUnGviiYrtD+GEH82LuFHYy6uDc/inNNZwAJCVx7UFnXKOkKkABAgy
	W9U24fxfiRkxTiLTTNrO9p0VAQGaq4IsWWOyYBlk2xcKbBDDJixMIEHxs19+1Ced3mR
	HBPKOTwMhMhGP7XHqMRhLQwhasnnwCK6aXfWqEO8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P3yljl1zOwsGHUI5g7ETJNTyL6gcItz/Poo4I/tPMh0=;
	b=NuAUmhAQx2KwtWDp5vu7zbdlm1/T4PSayTGqELG/1bZykhXuMUOTL7pWuTTUTG5J
	32qMiaJq3YtDnNoyb+CK7qVwAT/8bNVTax1LNIuGUL6/6VRCVxZgwExALqEF/QDJU8p
	XcEYqTE1ClEXwr36yTNF1DG8HAlBxv3dnUI5GOM0=
Content-Type: multipart/mixed; boundary="===============7040522334930442664=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] boost: upgrading to 1.85.0 FAILED
Message-ID: <0101018f7d4fe6e7-d5f3361a-0f52-4619-8bba-5ea1bb3c4250-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199417

--===============7040522334930442664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *boost* to *1.85.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe boost failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-955f0f1135c34b41d9889f602fdc1450d38692b4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:955f0f1135c34b41d9889f602fdc1450d38692b4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (920 cached, 2 parsed). 1880 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-955f0f1135c34b41d9889f602fdc1450d38692b4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:955f0f1135c34b41d9889f602fdc1450d38692b4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:01:57
Adding changed files:   1% |                                    | ETA:  0:01:25
Adding changed files:   1% |                                    | ETA:  0:01:15
Adding changed files:   2% |                                    | ETA:  0:01:12
Adding changed files:   2% |#                                   | ETA:  0:01:07
Adding changed files:   3% |#                                   | ETA:  0:01:05
Adding changed files:   4% |#                                   | ETA:  0:01:02
Adding changed files:   4% |#                                   | ETA:  0:01:01
Adding changed files:   5% |#                                   | ETA:  0:01:00
Adding changed files:   5% |##                                  | ETA:  0:00:59
Adding changed files:   6% |##                                  | ETA:  0:00:57
Adding changed files:   7% |##                                  | ETA:  0:00:57
Adding changed files:   7% |##                                  | ETA:  0:00:56
Adding changed files:   8% |###                                 | ETA:  0:00:56
Adding changed files:   8% |###                                 | ETA:  0:00:55
Adding changed files:   9% |###                                 | ETA:  0:00:55
Adding changed files:  10% |###                                 | ETA:  0:00:54
Adding changed files:  10% |###                                 | ETA:  0:00:53
Adding changed files:  11% |####                                | ETA:  0:00:52
Adding changed files:  11% |####                                | ETA:  0:00:50
Adding changed files:  12% |####                                | ETA:  0:00:49
Adding changed files:  13% |####                                | ETA:  0:00:48
Adding changed files:  13% |####                                | ETA:  0:00:47
Adding changed files:  14% |#####                               | ETA:  0:00:46
Adding changed files:  14% |#####                               | ETA:  0:00:45
Adding changed files:  15% |#####                               | ETA:  0:00:44
Adding changed files:  16% |#####                               | ETA:  0:00:44
Adding changed files:  16% |######                              | ETA:  0:00:43
Adding changed files:  17% |######                              | ETA:  0:00:42
Adding changed files:  17% |######                              | ETA:  0:00:42
Adding changed files:  18% |######                              | ETA:  0:00:41
Adding changed files:  19% |######                              | ETA:  0:00:40
Adding changed files:  19% |#######                             | ETA:  0:00:40
Adding changed files:  20% |#######                             | ETA:  0:00:39
Adding changed files:  20% |#######                             | ETA:  0:00:39
Adding changed files:  21% |#######                             | ETA:  0:00:38
Adding changed files:  22% |#######                             | ETA:  0:00:38
Adding changed files:  22% |########                            | ETA:  0:00:37
Adding changed files:  23% |########                            | ETA:  0:00:37
Adding changed files:  23% |########                            | ETA:  0:00:36
Adding changed files:  24% |########                            | ETA:  0:00:35
Adding changed files:  25% |#########                           | ETA:  0:00:35
Adding changed files:  25% |#########                           | ETA:  0:00:34
Adding changed files:  26% |#########                           | ETA:  0:00:34
Adding changed files:  26% |#########                           | ETA:  0:00:33
Adding changed files:  27% |#########                           | ETA:  0:00:33
Adding changed files:  28% |##########                          | ETA:  0:00:32
Adding changed files:  28% |##########                          | ETA:  0:00:32
Adding changed files:  29% |##########                          | ETA:  0:00:31
Adding changed files:  29% |##########                          | ETA:  0:00:31
Adding changed files:  30% |###########                         | ETA:  0:00:30
Adding changed files:  31% |###########                         | ETA:  0:00:30
Adding changed files:  31% |###########                         | ETA:  0:00:29
Adding changed files:  32% |###########                         | ETA:  0:00:29
Adding changed files:  32% |###########                         | ETA:  0:00:28
Adding changed files:  33% |############                        | ETA:  0:00:28
Adding changed files:  34% |############                        | ETA:  0:00:28
Adding changed files:  34% |############                        | ETA:  0:00:27
Adding changed files:  35% |############                        | ETA:  0:00:27
Adding changed files:  35% |############                        | ETA:  0:00:27
Adding changed files:  36% |#############                       | ETA:  0:00:26
Adding changed files:  37% |#############                       | ETA:  0:00:26
Adding changed files:  37% |#############                       | ETA:  0:00:25
Adding changed files:  38% |#############                       | ETA:  0:00:25
Adding changed files:  38% |##############                      | ETA:  0:00:25
Adding changed files:  39% |##############                      | ETA:  0:00:24
Adding changed files:  40% |##############                      | ETA:  0:00:24
Adding changed files:  40% |##############                      | ETA:  0:00:24
Adding changed files:  41% |##############                      | ETA:  0:00:23
Adding changed files:  41% |###############                     | ETA:  0:00:23
Adding changed files:  42% |###############                     | ETA:  0:00:23
Adding changed files:  43% |###############                     | ETA:  0:00:22
Adding changed files:  43% |###############                     | ETA:  0:00:22
Adding changed files:  44% |###############                     | ETA:  0:00:22
Adding changed files:  44% |################                    | ETA:  0:00:21
Adding changed files:  45% |################                    | ETA:  0:00:21
Adding changed files:  46% |################                    | ETA:  0:00:21
Adding changed files:  46% |################                    | ETA:  0:00:21
Adding changed files:  47% |#################                   | ETA:  0:00:20
Adding changed files:  47% |#################                   | ETA:  0:00:20
Adding changed files:  48% |#################                   | ETA:  0:00:20
Adding changed files:  49% |#################                   | ETA:  0:00:19
Adding changed files:  49% |#################                   | ETA:  0:00:19
Adding changed files:  50% |##################                  | ETA:  0:00:19
Adding changed files:  50% |##################                  | ETA:  0:00:19
Adding changed files:  51% |##################                  | ETA:  0:00:18
Adding changed files:  52% |##################                  | ETA:  0:00:18
Adding changed files:  52% |###################                 | ETA:  0:00:18
Adding changed files:  53% |###################                 | ETA:  0:00:18
Adding changed files:  53% |###################                 | ETA:  0:00:17
Adding changed files:  54% |###################                 | ETA:  0:00:17
Adding changed files:  55% |###################                 | ETA:  0:00:17
Adding changed files:  55% |####################                | ETA:  0:00:17
Adding changed files:  56% |####################                | ETA:  0:00:16
Adding changed files:  56% |####################                | ETA:  0:00:16
Adding changed files:  57% |####################                | ETA:  0:00:16
Adding changed files:  58% |####################                | ETA:  0:00:16
Adding changed files:  58% |#####################               | ETA:  0:00:15
Adding changed files:  59% |#####################               | ETA:  0:00:15
Adding changed files:  59% |#####################               | ETA:  0:00:15
Adding changed files:  60% |#####################               | ETA:  0:00:15
Adding changed files:  61% |######################              | ETA:  0:00:14
Adding changed files:  61% |######################              | ETA:  0:00:14
Adding changed files:  62% |######################              | ETA:  0:00:14
Adding changed files:  62% |######################              | ETA:  0:00:14
Adding changed files:  63% |######################              | ETA:  0:00:13
Adding changed files:  64% |#######################             | ETA:  0:00:13
Adding changed files:  64% |#######################             | ETA:  0:00:13
Adding changed files:  65% |#######################             | ETA:  0:00:13
Adding changed files:  65% |#######################             | ETA:  0:00:12
Adding changed files:  66% |#######################             | ETA:  0:00:12
Adding changed files:  67% |########################            | ETA:  0:00:12
Adding changed files:  67% |########################            | ETA:  0:00:12
Adding changed files:  68% |########################            | ETA:  0:00:11
Adding changed files:  68% |########################            | ETA:  0:00:11
Adding changed files:  69% |#########################           | ETA:  0:00:11
Adding changed files:  70% |#########################           | ETA:  0:00:11
Adding changed files:  70% |#########################           | ETA:  0:00:11
Adding changed files:  71% |#########################           | ETA:  0:00:10
Adding changed files:  71% |#########################           | ETA:  0:00:10
Adding changed files:  72% |##########################          | ETA:  0:00:10
Adding changed files:  73% |##########################          | ETA:  0:00:10
Adding changed files:  73% |##########################          | ETA:  0:00:09
Adding changed files:  74% |##########################          | ETA:  0:00:09
Adding changed files:  74% |##########################          | ETA:  0:00:09
Adding changed files:  75% |###########################         | ETA:  0:00:09
Adding changed files:  76% |###########################         | ETA:  0:00:08
Adding changed files:  76% |###########################         | ETA:  0:00:08
Adding changed files:  77% |###########################         | ETA:  0:00:08
Adding changed files:  77% |############################        | ETA:  0:00:08
Adding changed files:  78% |############################        | ETA:  0:00:08
Adding changed files:  79% |############################        | ETA:  0:00:07
Adding changed files:  79% |############################        | ETA:  0:00:07
Adding changed files:  80% |############################        | ETA:  0:00:07
Adding changed files:  80% |#############################       | ETA:  0:00:07
Adding changed files:  81% |#############################       | ETA:  0:00:06
Adding changed files:  82% |#############################       | ETA:  0:00:06
Adding changed files:  82% |#############################       | ETA:  0:00:06
Adding changed files:  83% |##############################      | ETA:  0:00:06
Adding changed files:  83% |##############################      | ETA:  0:00:06
Adding changed files:  84% |##############################      | ETA:  0:00:05
Adding changed files:  85% |##############################      | ETA:  0:00:05
Adding changed files:  85% |##############################      | ETA:  0:00:05
Adding changed files:  86% |###############################     | ETA:  0:00:05
Adding changed files:  86% |###############################     | ETA:  0:00:04
Adding changed files:  87% |###############################     | ETA:  0:00:04
Adding changed files:  88% |###############################     | ETA:  0:00:04
Adding changed files:  88% |###############################     | ETA:  0:00:04
Adding changed files:  89% |################################    | ETA:  0:00:03
Adding changed files:  89% |################################    | ETA:  0:00:03
Adding changed files:  90% |################################    | ETA:  0:00:03
Adding changed files:  91% |################################    | ETA:  0:00:03
Adding changed files:  91% |#################################   | ETA:  0:00:03
Adding changed files:  92% |#################################   | ETA:  0:00:02
Adding changed files:  92% |#################################   | ETA:  0:00:02
Adding changed files:  93% |#################################   | ETA:  0:00:02
Adding changed files:  94% |#################################   | ETA:  0:00:02
Adding changed files:  94% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  97% |##################################  | ETA:  0:00:01
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:37
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://boostorg.jfrog.io/artifactory/main/release/1.85.0/source/boost_1_85_0.tar.bz2...
INFO: Rebasing devtool onto 46a21b01e56f8ae3d09dbe4c4d92cb3bfe69fa4a
WARNING: Command 'git rebase 46a21b01e56f8ae3d09dbe4c4d92cb3bfe69fa4a' failed:
Auto-merging libs/math/build/Jamfile.v2
CONFLICT (content): Merge conflict in libs/math/build/Jamfile.v2

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/boost
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/boost/boost_1.85.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7040522334930442664==--

