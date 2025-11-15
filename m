Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3533CED63B
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:06 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11959.1763224746123669911
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iPdFzoey;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SzvnEmBA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a88627700-6e24f9de-39a8-402e-b5b7-55df32ba91b5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9A/mgJnYNtMDuTOJGLqGPD1dcXsGLbvBR364WvwwRmk=;
	b=iPdFzoeyXWWExjfPW47+fm65+AGNS7yoadpy6853FlXR8jaPOJiUXwju5CBBO29q
	4jTFelA04C0yWq96zDBfyQlLW4oVPtByRejB2OIwho2Lyf7DR1FM0EFCoZgS54UbbRV
	hjOCnnl2K9xUiKo81Ow5AJ0Tp6Bm9B60keHNvN90=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9A/mgJnYNtMDuTOJGLqGPD1dcXsGLbvBR364WvwwRmk=;
	b=SzvnEmBAgPelgYX3DyvaFGsCGpaCmRj/w5CzN6j4i9YtZ/8djD88GCYaHGQ8mGl3
	3xVREEdT9B8UQVHuGNAptl3Lc3HnzeH6vkVIeZmA8J9UFsPFP02PjYoPEKx3h7XvQ1s
	pDt5OgxorN/9R/atQBhYnTbq42k8QY2wej3XSuaA=
Content-Type: multipart/mixed; boundary="===============5163965109164780570=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mesa: upgrading to 25.3.0 FAILED
Message-ID: <0101019a88627700-6e24f9de-39a8-402e-b5b7-55df32ba91b5-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226417

--===============5163965109164780570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa* to *25.3.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe mesa failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1944 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-0568c5ba3551972d72a9f54e1b936e56d648bedb"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:0568c5ba3551972d72a9f54e1b936e56d648bedb"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

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
Parsing of 948 .bb files complete (0 cached, 948 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-0568c5ba3551972d72a9f54e1b936e56d648bedb"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:0568c5ba3551972d72a9f54e1b936e56d648bedb"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:16
Adding changed files:   3% |#                                   | ETA:  0:00:09
Adding changed files:   5% |##                                  | ETA:  0:00:07
Adding changed files:   7% |##                                  | ETA:  0:00:06
Adding changed files:   9% |###                                 | ETA:  0:00:05
Adding changed files:  11% |####                                | ETA:  0:00:04
Adding changed files:  13% |####                                | ETA:  0:00:04
Adding changed files:  15% |#####                               | ETA:  0:00:04
Adding changed files:  17% |######                              | ETA:  0:00:04
Adding changed files:  19% |######                              | ETA:  0:00:03
Adding changed files:  21% |#######                             | ETA:  0:00:03
Adding changed files:  23% |########                            | ETA:  0:00:03
Adding changed files:  25% |#########                           | ETA:  0:00:03
Adding changed files:  27% |#########                           | ETA:  0:00:03
Adding changed files:  29% |##########                          | ETA:  0:00:03
Adding changed files:  30% |###########                         | ETA:  0:00:03
Adding changed files:  32% |###########                         | ETA:  0:00:03
Adding changed files:  34% |############                        | ETA:  0:00:03
Adding changed files:  36% |#############                       | ETA:  0:00:03
Adding changed files:  38% |#############                       | ETA:  0:00:03
Adding changed files:  40% |##############                      | ETA:  0:00:03
Adding changed files:  42% |###############                     | ETA:  0:00:02
Adding changed files:  44% |################                    | ETA:  0:00:02
Adding changed files:  46% |################                    | ETA:  0:00:02
Adding changed files:  48% |#################                   | ETA:  0:00:02
Adding changed files:  50% |##################                  | ETA:  0:00:02
Adding changed files:  52% |##################                  | ETA:  0:00:02
Adding changed files:  54% |###################                 | ETA:  0:00:02
Adding changed files:  56% |####################                | ETA:  0:00:02
Adding changed files:  58% |####################                | ETA:  0:00:02
Adding changed files:  60% |#####################               | ETA:  0:00:02
Adding changed files:  61% |######################              | ETA:  0:00:01
Adding changed files:  63% |#######################             | ETA:  0:00:01
Adding changed files:  65% |#######################             | ETA:  0:00:01
Adding changed files:  67% |########################            | ETA:  0:00:01
Adding changed files:  69% |#########################           | ETA:  0:00:01
Adding changed files:  71% |#########################           | ETA:  0:00:01
Adding changed files:  73% |##########################          | ETA:  0:00:01
Adding changed files:  75% |###########################         | ETA:  0:00:01
Adding changed files:  77% |###########################         | ETA:  0:00:01
Adding changed files:  79% |############################        | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  83% |#############################       | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:04
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://archive.mesa3d.org/mesa-25.3.0.tar.xz...
INFO: Rebasing devtool onto e27ec562ea8aec9613dd3a235f88b9a4168b0d38
WARNING: Command 'git rebase e27ec562ea8aec9613dd3a235f88b9a4168b0d38' failed:
Auto-merging src/freedreno/decode/meson.build
Auto-merging src/freedreno/registers/gen_header.py
CONFLICT (content): Merge conflict in src/freedreno/registers/gen_header.py

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/mesa
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/mesa/mesa.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5163965109164780570==--

