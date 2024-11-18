Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CC4D62066
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:42 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.4693.1731964647033860545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QOQBN+Gk;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=H27hRlqp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010193412370f6-d5c0f23c-9ff6-4b7b-8bfc-aff1eb31c644-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964662;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mIATdpAXzr81mLo7c/pONw4nTvLUC3ofis5aMDKGXYM=;
	b=QOQBN+GkCBVCQS+lPRK0EdNz2y6BWWNuVDiBaPdwwgfXFGVoAPYcj3q9SO3Z9gyY
	7OXcVgH8y/urjqW3GXiiFIw++uryWH9FMaxIQNTBt0PqDhUd9xg16kl/vvvkTebHTX3
	JLO45WEAKCsAfFeJzbFqVaORSdk1843BQRvpue08=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964662;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mIATdpAXzr81mLo7c/pONw4nTvLUC3ofis5aMDKGXYM=;
	b=H27hRlqpfgki5hXBbGvxHUtYDyNyqbmdvNJcDFX7Io3cYk/lFAOzmo5iIjWcoQjA
	M71H3j9DlydsKt30airryzlNnof8vmHuQ5Hc9EuBFMsMMSTo6xRF1zoff7vRGdZQ5V0
	OaJ3BEOL2BOwSpCeEl046rfLZKPgn1ZgXKxF9rtY=
Content-Type: multipart/mixed; boundary="===============7347521498299463704=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 24.2.7 FAILED
Message-ID: <01010193412370f6-d5c0f23c-9ff6-4b7b-8bfc-aff1eb31c644-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207325

--===============7347521498299463704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa* to *24.2.7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe mesa failed.
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
workspace            = "tmp-auh-upgrades:4f0d8301a8f2498f4780860d4a2c38aef69f7dca"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 13 seconds
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
workspace            = "tmp-auh-upgrades:4f0d8301a8f2498f4780860d4a2c38aef69f7dca"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-vklguzbj: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-7uw5ac8q/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-7uw5ac8q/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 13 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:01:12
Adding changed files:   3% |#                                   | ETA:  0:00:54
Adding changed files:   4% |#                                   | ETA:  0:00:51
Adding changed files:   6% |##                                  | ETA:  0:01:01
Adding changed files:   7% |##                                  | ETA:  0:01:04
Adding changed files:   9% |###                                 | ETA:  0:01:18
Adding changed files:  11% |####                                | ETA:  0:01:11
Adding changed files:  12% |####                                | ETA:  0:01:04
Adding changed files:  14% |#####                               | ETA:  0:00:58
Adding changed files:  15% |#####                               | ETA:  0:00:53
Adding changed files:  17% |######                              | ETA:  0:00:49
Adding changed files:  19% |######                              | ETA:  0:00:46
Adding changed files:  20% |#######                             | ETA:  0:00:43
Adding changed files:  22% |########                            | ETA:  0:00:41
Adding changed files:  23% |########                            | ETA:  0:00:40
Adding changed files:  25% |#########                           | ETA:  0:00:38
Adding changed files:  27% |#########                           | ETA:  0:00:37
Adding changed files:  28% |##########                          | ETA:  0:00:36
Adding changed files:  30% |##########                          | ETA:  0:00:35
Adding changed files:  31% |###########                         | ETA:  0:00:35
Adding changed files:  33% |############                        | ETA:  0:00:34
Adding changed files:  34% |############                        | ETA:  0:00:33
Adding changed files:  36% |#############                       | ETA:  0:00:32
Adding changed files:  38% |#############                       | ETA:  0:00:32
Adding changed files:  39% |##############                      | ETA:  0:00:31
Adding changed files:  41% |##############                      | ETA:  0:00:30
Adding changed files:  42% |###############                     | ETA:  0:00:29
Adding changed files:  44% |################                    | ETA:  0:00:29
Adding changed files:  46% |################                    | ETA:  0:00:28
Adding changed files:  47% |#################                   | ETA:  0:00:27
Adding changed files:  49% |#################                   | ETA:  0:00:26
Adding changed files:  50% |##################                  | ETA:  0:00:25
Adding changed files:  52% |##################                  | ETA:  0:00:25
Adding changed files:  54% |###################                 | ETA:  0:00:24
Adding changed files:  55% |####################                | ETA:  0:00:23
Adding changed files:  57% |####################                | ETA:  0:00:22
Adding changed files:  58% |#####################               | ETA:  0:00:21
Adding changed files:  60% |#####################               | ETA:  0:00:20
Adding changed files:  61% |######################              | ETA:  0:00:19
Adding changed files:  63% |######################              | ETA:  0:00:19
Adding changed files:  65% |#######################             | ETA:  0:00:18
Adding changed files:  66% |########################            | ETA:  0:00:17
Adding changed files:  68% |########################            | ETA:  0:00:16
Adding changed files:  69% |#########################           | ETA:  0:00:15
Adding changed files:  71% |#########################           | ETA:  0:00:14
Adding changed files:  73% |##########################          | ETA:  0:00:13
Adding changed files:  74% |##########################          | ETA:  0:00:12
Adding changed files:  76% |###########################         | ETA:  0:00:12
Adding changed files:  77% |############################        | ETA:  0:00:11
Adding changed files:  79% |############################        | ETA:  0:00:10
Adding changed files:  81% |#############################       | ETA:  0:00:09
Adding changed files:  82% |#############################       | ETA:  0:00:08
Adding changed files:  84% |##############################      | ETA:  0:00:07
Adding changed files:  85% |##############################      | ETA:  0:00:06
Adding changed files:  87% |###############################     | ETA:  0:00:06
Adding changed files:  89% |################################    | ETA:  0:00:05
Adding changed files:  90% |################################    | ETA:  0:00:04
Adding changed files:  92% |#################################   | ETA:  0:00:03
Adding changed files:  93% |#################################   | ETA:  0:00:03
Adding changed files:  95% |##################################  | ETA:  0:00:02
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:48
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://mesa.freedesktop.org/archive/mesa-24.2.7.tar.xz...
INFO: Rebasing devtool onto 60c801027476beac2c7f470eec463b50cc67220c
WARNING: Command 'git rebase 60c801027476beac2c7f470eec463b50cc67220c' failed:
Auto-merging src/glx/drisw_glx.c
CONFLICT (content): Merge conflict in src/glx/drisw_glx.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/mesa
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/mesa/mesa.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7347521498299463704==--

