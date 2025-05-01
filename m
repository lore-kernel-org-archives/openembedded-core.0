Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8162CC54EDA
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:57 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1801.1746113625872174560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Imnp51uJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WWWhMPdz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101968c7b7c8e-3022f4ac-80ac-431e-98ae-d29e75a1f11a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q6BYcZhizZ1bZJWUjdqlLkkXM91CbXSJboKSRwQ6KR8=;
	b=Imnp51uJmqu0+sETHnTPGdvoagW3HYDxGza0Hv0+WQNThVv2gcTmU03Kmie7HG14
	xlBw9W/xEeZoNSAVgmzrwxZrvHLfauT68Jcj/rDO6Wd7uudna09EkIWF+5CSq+3IZys
	KlEcmA5U1L9m9l9QjQBpVCopZJdA7mUtq9iPrBNw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113625;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q6BYcZhizZ1bZJWUjdqlLkkXM91CbXSJboKSRwQ6KR8=;
	b=WWWhMPdz3Qt7o61JcLxeI5yqurcJzRr7v1orp+di1dal0Io9043wjoYiFnKJhess
	dr/Iu7Ho8RQQTxYXGE9M6NLMNabFNX/HSXu906cAA5Uac+V9dQ9moFWRte4Y/3mBRQ4
	+IcYTt98TNWu3LaUa7U1L5lINuVx+88Av46oT1tA=
Content-Type: multipart/mixed; boundary="===============2433197626682068608=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo-c: upgrading to 0.10.12+cargo-0.87.0 FAILED
Message-ID: <010101968c7b7c8e-3022f4ac-80ac-431e-98ae-d29e75a1f11a-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215838

--===============2433197626682068608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cargo-c* to *0.10.12+cargo-0.87.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade cargo-c -V 0.10.12+cargo-0.87.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:74765b884b940118470a17e042a41815c3ab759d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 929 .bb files complete (0 cached, 929 parsed). 1898 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:74765b884b940118470a17e042a41815c3ab759d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-uo897hek: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-27xlq8hv/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-27xlq8hv/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:31
Adding changed files:   0% |                                    | ETA:  0:00:23
Adding changed files:   1% |                                    | ETA:  0:00:20
Adding changed files:   1% |                                    | ETA:  0:00:18
Adding changed files:   2% |                                    | ETA:  0:00:17
Adding changed files:   2% |                                    | ETA:  0:00:17
Adding changed files:   2% |#                                   | ETA:  0:00:16
Adding changed files:   3% |#                                   | ETA:  0:00:16
Adding changed files:   3% |#                                   | ETA:  0:00:15
Adding changed files:   4% |#                                   | ETA:  0:00:15
Adding changed files:   4% |#                                   | ETA:  0:00:15
Adding changed files:   4% |#                                   | ETA:  0:00:15
Adding changed files:   5% |#                                   | ETA:  0:00:15
Adding changed files:   5% |##                                  | ETA:  0:00:14
Adding changed files:   6% |##                                  | ETA:  0:00:14
Adding changed files:   6% |##                                  | ETA:  0:00:14
Adding changed files:   6% |##                                  | ETA:  0:00:14
Adding changed files:   7% |##                                  | ETA:  0:00:14
Adding changed files:   7% |##                                  | ETA:  0:00:14
Adding changed files:   8% |##                                  | ETA:  0:00:14
Adding changed files:   8% |###                                 | ETA:  0:00:14
Adding changed files:   8% |###                                 | ETA:  0:00:13
Adding changed files:   9% |###                                 | ETA:  0:00:13
Adding changed files:   9% |###                                 | ETA:  0:00:13
Adding changed files:  10% |###                                 | ETA:  0:00:13
Adding changed files:  10% |###                                 | ETA:  0:00:13
Adding changed files:  10% |###                                 | ETA:  0:00:13
Adding changed files:  11% |####                                | ETA:  0:00:13
Adding changed files:  11% |####                                | ETA:  0:00:13
Adding changed files:  12% |####                                | ETA:  0:00:13
Adding changed files:  12% |####                                | ETA:  0:00:13
Adding changed files:  12% |####                                | ETA:  0:00:13
Adding changed files:  13% |####                                | ETA:  0:00:13
Adding changed files:  13% |####                                | ETA:  0:00:12
Adding changed files:  14% |#####                               | ETA:  0:00:12
Adding changed files:  14% |#####                               | ETA:  0:00:12
Adding changed files:  14% |#####                               | ETA:  0:00:12
Adding changed files:  15% |#####                               | ETA:  0:00:12
Adding changed files:  15% |#####                               | ETA:  0:00:12
Adding changed files:  16% |#####                               | ETA:  0:00:12
Adding changed files:  16% |#####                               | ETA:  0:00:12
Adding changed files:  16% |######                              | ETA:  0:00:12
Adding changed files:  17% |######                              | ETA:  0:00:12
Adding changed files:  17% |######                              | ETA:  0:00:12
Adding changed files:  18% |######                              | ETA:  0:00:12
Adding changed files:  18% |######                              | ETA:  0:00:12
Adding changed files:  18% |######                              | ETA:  0:00:11
Adding changed files:  19% |######                              | ETA:  0:00:11
Adding changed files:  19% |#######                             | ETA:  0:00:11
Adding changed files:  20% |#######                             | ETA:  0:00:11
Adding changed files:  20% |#######                             | ETA:  0:00:11
Adding changed files:  20% |#######                             | ETA:  0:00:11
Adding changed files:  21% |#######                             | ETA:  0:00:11
Adding changed files:  21% |#######                             | ETA:  0:00:11
Adding changed files:  22% |#######                             | ETA:  0:00:11
Adding changed files:  22% |########                            | ETA:  0:00:11
Adding changed files:  22% |########                            | ETA:  0:00:11
Adding changed files:  23% |########                            | ETA:  0:00:11
Adding changed files:  23% |########                            | ETA:  0:00:11
Adding changed files:  24% |########                            | ETA:  0:00:10
Adding changed files:  24% |########                            | ETA:  0:00:10
Adding changed files:  24% |########                            | ETA:  0:00:10
Adding changed files:  25% |#########                           | ETA:  0:00:10
Adding changed files:  25% |#########                           | ETA:  0:00:10
Adding changed files:  26% |#########                           | ETA:  0:00:10
Adding changed files:  26% |#########                           | ETA:  0:00:10
Adding changed files:  26% |#########                           | ETA:  0:00:10
Adding changed files:  27% |#########                           | ETA:  0:00:10
Adding changed files:  27% |#########                           | ETA:  0:00:10
Adding changed files:  28% |##########                          | ETA:  0:00:10
Adding changed files:  28% |##########                          | ETA:  0:00:10
Adding changed files:  28% |##########                          | ETA:  0:00:10
Adding changed files:  29% |##########                          | ETA:  0:00:10
Adding changed files:  29% |##########                          | ETA:  0:00:10
Adding changed files:  30% |##########                          | ETA:  0:00:09
Adding changed files:  30% |##########                          | ETA:  0:00:09
Adding changed files:  30% |###########                         | ETA:  0:00:09
Adding changed files:  31% |###########                         | ETA:  0:00:09
Adding changed files:  31% |###########                         | ETA:  0:00:09
Adding changed files:  32% |###########                         | ETA:  0:00:09
Adding changed files:  32% |###########                         | ETA:  0:00:09
Adding changed files:  32% |###########                         | ETA:  0:00:09
Adding changed files:  33% |###########                         | ETA:  0:00:09
Adding changed files:  33% |############                        | ETA:  0:00:09
Adding changed files:  34% |############                        | ETA:  0:00:09
Adding changed files:  34% |############                        | ETA:  0:00:09
Adding changed files:  34% |############                        | ETA:  0:00:09
Adding changed files:  35% |############                        | ETA:  0:00:09
Adding changed files:  35% |############                        | ETA:  0:00:09
Adding changed files:  36% |#############                       | ETA:  0:00:09
Adding changed files:  36% |#############                       | ETA:  0:00:08
Adding changed files:  36% |#############                       | ETA:  0:00:08
Adding changed files:  37% |#############                       | ETA:  0:00:08
Adding changed files:  37% |#############                       | ETA:  0:00:08
Adding changed files:  38% |#############                       | ETA:  0:00:08
Adding changed files:  38% |#############                       | ETA:  0:00:08
Adding changed files:  38% |##############                      | ETA:  0:00:08
Adding changed files:  39% |##############                      | ETA:  0:00:08
Adding changed files:  39% |##############                      | ETA:  0:00:08
Adding changed files:  40% |##############                      | ETA:  0:00:08
Adding changed files:  40% |##############                      | ETA:  0:00:08
Adding changed files:  40% |##############                      | ETA:  0:00:08
Adding changed files:  41% |##############                      | ETA:  0:00:08
Adding changed files:  41% |###############                     | ETA:  0:00:08
Adding changed files:  42% |###############                     | ETA:  0:00:08
Adding changed files:  42% |###############                     | ETA:  0:00:08
Adding changed files:  42% |###############                     | ETA:  0:00:07
Adding changed files:  43% |###############                     | ETA:  0:00:07
Adding changed files:  43% |###############                     | ETA:  0:00:07
Adding changed files:  44% |###############                     | ETA:  0:00:07
Adding changed files:  44% |################                    | ETA:  0:00:07
Adding changed files:  44% |################                    | ETA:  0:00:07
Adding changed files:  45% |################                    | ETA:  0:00:07
Adding changed files:  45% |################                    | ETA:  0:00:07
Adding changed files:  46% |################                    | ETA:  0:00:07
Adding changed files:  46% |################                    | ETA:  0:00:07
Adding changed files:  46% |################                    | ETA:  0:00:07
Adding changed files:  47% |#################                   | ETA:  0:00:07
Adding changed files:  47% |#################                   | ETA:  0:00:07
Adding changed files:  48% |#################                   | ETA:  0:00:07
Adding changed files:  48% |#################                   | ETA:  0:00:07
Adding changed files:  48% |#################                   | ETA:  0:00:07
Adding changed files:  49% |#################                   | ETA:  0:00:06
Adding changed files:  49% |#################                   | ETA:  0:00:06
Adding changed files:  50% |##################                  | ETA:  0:00:06
Adding changed files:  50% |##################                  | ETA:  0:00:06
Adding changed files:  50% |##################                  | ETA:  0:00:06
Adding changed files:  51% |##################                  | ETA:  0:00:06
Adding changed files:  51% |##################                  | ETA:  0:00:06
Adding changed files:  52% |##################                  | ETA:  0:00:06
Adding changed files:  52% |##################                  | ETA:  0:00:06
Adding changed files:  52% |###################                 | ETA:  0:00:06
Adding changed files:  53% |###################                 | ETA:  0:00:06
Adding changed files:  53% |###################                 | ETA:  0:00:06
Adding changed files:  54% |###################                 | ETA:  0:00:06
Adding changed files:  54% |###################                 | ETA:  0:00:06
Adding changed files:  55% |###################                 | ETA:  0:00:06
Adding changed files:  55% |###################                 | ETA:  0:00:06
Adding changed files:  55% |####################                | ETA:  0:00:06
Adding changed files:  56% |####################                | ETA:  0:00:05
Adding changed files:  56% |####################                | ETA:  0:00:05
Adding changed files:  57% |####################                | ETA:  0:00:05
Adding changed files:  57% |####################                | ETA:  0:00:05
Adding changed files:  57% |####################                | ETA:  0:00:05
Adding changed files:  58% |####################                | ETA:  0:00:05
Adding changed files:  58% |#####################               | ETA:  0:00:05
Adding changed files:  59% |#####################               | ETA:  0:00:05
Adding changed files:  59% |#####################               | ETA:  0:00:05
Adding changed files:  59% |#####################               | ETA:  0:00:05
Adding changed files:  60% |#####################               | ETA:  0:00:05
Adding changed files:  60% |#####################               | ETA:  0:00:05
Adding changed files:  61% |#####################               | ETA:  0:00:05
Adding changed files:  61% |######################              | ETA:  0:00:05
Adding changed files:  61% |######################              | ETA:  0:00:05
Adding changed files:  62% |######################              | ETA:  0:00:05
Adding changed files:  62% |######################              | ETA:  0:00:05
Adding changed files:  63% |######################              | ETA:  0:00:04
Adding changed files:  63% |######################              | ETA:  0:00:04
Adding changed files:  63% |######################              | ETA:  0:00:04
Adding changed files:  64% |#######################             | ETA:  0:00:04
Adding changed files:  64% |#######################             | ETA:  0:00:04
Adding changed files:  65% |#######################             | ETA:  0:00:04
Adding changed files:  65% |#######################             | ETA:  0:00:04
Adding changed files:  65% |#######################             | ETA:  0:00:04
Adding changed files:  66% |#######################             | ETA:  0:00:04
Adding changed files:  66% |#######################             | ETA:  0:00:04
Adding changed files:  67% |########################            | ETA:  0:00:04
Adding changed files:  67% |########################            | ETA:  0:00:04
Adding changed files:  67% |########################            | ETA:  0:00:04
Adding changed files:  68% |########################            | ETA:  0:00:04
Adding changed files:  68% |########################            | ETA:  0:00:04
Adding changed files:  69% |########################            | ETA:  0:00:04
Adding changed files:  69% |#########################           | ETA:  0:00:04
Adding changed files:  69% |#########################           | ETA:  0:00:03
Adding changed files:  70% |#########################           | ETA:  0:00:03
Adding changed files:  70% |#########################           | ETA:  0:00:03
Adding changed files:  71% |#########################           | ETA:  0:00:03
Adding changed files:  71% |#########################           | ETA:  0:00:03
Adding changed files:  71% |#########################           | ETA:  0:00:03
Adding changed files:  72% |##########################          | ETA:  0:00:03
Adding changed files:  72% |##########################          | ETA:  0:00:03
Adding changed files:  73% |##########################          | ETA:  0:00:03
Adding changed files:  73% |##########################          | ETA:  0:00:03
Adding changed files:  73% |##########################          | ETA:  0:00:03
Adding changed files:  74% |##########################          | ETA:  0:00:03
Adding changed files:  74% |##########################          | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:03
Adding changed files:  76% |###########################         | ETA:  0:00:03
Adding changed files:  76% |###########################         | ETA:  0:00:03
Adding changed files:  77% |###########################         | ETA:  0:00:02
Adding changed files:  77% |###########################         | ETA:  0:00:02
Adding changed files:  77% |############################        | ETA:  0:00:02
Adding changed files:  78% |############################        | ETA:  0:00:02
Adding changed files:  78% |############################        | ETA:  0:00:02
Adding changed files:  79% |############################        | ETA:  0:00:02
Adding changed files:  79% |############################        | ETA:  0:00:02
Adding changed files:  79% |############################        | ETA:  0:00:02
Adding changed files:  80% |############################        | ETA:  0:00:02
Adding changed files:  80% |#############################       | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  83% |#############################       | ETA:  0:00:02
Adding changed files:  83% |##############################      | ETA:  0:00:02
Adding changed files:  83% |##############################      | ETA:  0:00:02
Adding changed files:  84% |##############################      | ETA:  0:00:02
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  91% |#################################   | ETA:  0:00:01
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:12

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching crate://crates.io/cargo-c/0.10.12+cargo-0.87.0;name=cargo-c...
INFO: Rebasing devtool onto 960a2cc1ddba5ec497c7bf0259c21aafa3079cee
WARNING: Command 'git rebase 960a2cc1ddba5ec497c7bf0259c21aafa3079cee' failed:
CONFLICT (modify/delete): cargo_home/bitbake/libc-0.2.161/src/unix/linux_like/linux/arch/generic/mod.rs deleted in HEAD and modified in 4cd2cc69 (Define more ioctl codes on riscv32gc-unknown-linux-gnu).  Version 4cd2cc69 (Define more ioctl codes on riscv32gc-unknown-linux-gnu) of cargo_home/bitbake/libc-0.2.161/src/unix/linux_like/linux/arch/generic/mod.rs left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
cargo_home/bitbake/libc-0.2.161/src/unix/linux_like/linux/arch/generic/mod.rs: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2433197626682068608==--

