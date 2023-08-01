Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6F8C27C7A
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.17605.1690907331418794001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Z5ElFC0L;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aBZISN1A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010189b1ee4bfb-2f6483c0-8dac-400a-9c39-77c7e899825a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aiMr8fj2bWxXx/SzuIM6Ug9bdeEh0PsdNezXs6J2x2s=;
	b=Z5ElFC0LtD0TTgJjEF+OROhmwHIuaDwm65ro6sPE3CYD2OJE6M11FKjDWqJ/Xk9U
	fBaHc0yHv1q0nE9Bw8qa/s28VnfanM1F3HmbREGIUi/ifped4ouWCnyOGAO0tLmzcH2
	8pq7juIYRsZQcXhRsfkcefTJbea1Dshq6v51WOaM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aiMr8fj2bWxXx/SzuIM6Ug9bdeEh0PsdNezXs6J2x2s=;
	b=aBZISN1Ahdt14r4tkZTR29AyqmUlj4jNGHSB7hwHCTQyn0PGW6llQiI+MnJCpY7F
	i8GTInXDS4OONu+2Ne8inSQoMxdakVSXUvhm3pAIvdnc8RuTT7CdPutO2Vo1bAOgsRw
	Yo+GRe16SYEKKCpX/rzDN36LtQd8pEQ0cA3+gds4=
Content-Type: multipart/mixed; boundary="===============1746278077116032977=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 23.1.4 FAILED
Message-ID: <01010189b1ee4bfb-2f6483c0-8dac-400a-9c39-77c7e899825a-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185317

--===============1746278077116032977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *23.1.4* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade mesa -V 23.1.4
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (13:50:20.140443)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1160fcdcd4deb55354a9b97df27b378f6c3f6d78"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 32 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1160fcdcd4deb55354a9b97df27b378f6c3f6d78"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 2 Local 1 Mirrors 0 Missed 1 Current 26 (50% match, 96% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:00:21
Adding changed files:   1% |                                    | ETA:  0:00:15
Adding changed files:   1% |                                    | ETA:  0:00:13
Adding changed files:   2% |                                    | ETA:  0:00:12
Adding changed files:   2% |#                                   | ETA:  0:00:11
Adding changed files:   3% |#                                   | ETA:  0:00:11
Adding changed files:   3% |#                                   | ETA:  0:00:11
Adding changed files:   4% |#                                   | ETA:  0:00:11
Adding changed files:   5% |#                                   | ETA:  0:00:11
Adding changed files:   5% |##                                  | ETA:  0:00:11
Adding changed files:   6% |##                                  | ETA:  0:00:11
Adding changed files:   6% |##                                  | ETA:  0:00:11
Adding changed files:   7% |##                                  | ETA:  0:00:11
Adding changed files:   7% |##                                  | ETA:  0:00:11
Adding changed files:   8% |###                                 | ETA:  0:00:11
Adding changed files:   9% |###                                 | ETA:  0:00:10
Adding changed files:   9% |###                                 | ETA:  0:00:10
Adding changed files:  10% |###                                 | ETA:  0:00:10
Adding changed files:  10% |###                                 | ETA:  0:00:10
Adding changed files:  11% |####                                | ETA:  0:00:10
Adding changed files:  11% |####                                | ETA:  0:00:10
Adding changed files:  12% |####                                | ETA:  0:00:10
Adding changed files:  13% |####                                | ETA:  0:00:10
Adding changed files:  13% |####                                | ETA:  0:00:10
Adding changed files:  14% |#####                               | ETA:  0:00:10
Adding changed files:  14% |#####                               | ETA:  0:00:10
Adding changed files:  15% |#####                               | ETA:  0:00:10
Adding changed files:  15% |#####                               | ETA:  0:00:09
Adding changed files:  16% |#####                               | ETA:  0:00:09
Adding changed files:  16% |######                              | ETA:  0:00:09
Adding changed files:  17% |######                              | ETA:  0:00:09
Adding changed files:  18% |######                              | ETA:  0:00:09
Adding changed files:  18% |######                              | ETA:  0:00:09
Adding changed files:  19% |######                              | ETA:  0:00:09
Adding changed files:  19% |#######                             | ETA:  0:00:09
Adding changed files:  20% |#######                             | ETA:  0:00:09
Adding changed files:  20% |#######                             | ETA:  0:00:09
Adding changed files:  21% |#######                             | ETA:  0:00:09
Adding changed files:  22% |#######                             | ETA:  0:00:09
Adding changed files:  22% |########                            | ETA:  0:00:08
Adding changed files:  23% |########                            | ETA:  0:00:08
Adding changed files:  23% |########                            | ETA:  0:00:08
Adding changed files:  24% |########                            | ETA:  0:00:08
Adding changed files:  24% |########                            | ETA:  0:00:08
Adding changed files:  25% |#########                           | ETA:  0:00:08
Adding changed files:  26% |#########                           | ETA:  0:00:08
Adding changed files:  26% |#########                           | ETA:  0:00:08
Adding changed files:  27% |#########                           | ETA:  0:00:08
Adding changed files:  27% |#########                           | ETA:  0:00:08
Adding changed files:  28% |##########                          | ETA:  0:00:08
Adding changed files:  28% |##########                          | ETA:  0:00:08
Adding changed files:  29% |##########                          | ETA:  0:00:08
Adding changed files:  29% |##########                          | ETA:  0:00:08
Adding changed files:  30% |##########                          | ETA:  0:00:08
Adding changed files:  31% |###########                         | ETA:  0:00:07
Adding changed files:  31% |###########                         | ETA:  0:00:07
Adding changed files:  32% |###########                         | ETA:  0:00:07
Adding changed files:  32% |###########                         | ETA:  0:00:07
Adding changed files:  33% |############                        | ETA:  0:00:07
Adding changed files:  33% |############                        | ETA:  0:00:07
Adding changed files:  34% |############                        | ETA:  0:00:07
Adding changed files:  35% |############                        | ETA:  0:00:07
Adding changed files:  35% |############                        | ETA:  0:00:07
Adding changed files:  36% |#############                       | ETA:  0:00:07
Adding changed files:  36% |#############                       | ETA:  0:00:07
Adding changed files:  37% |#############                       | ETA:  0:00:07
Adding changed files:  37% |#############                       | ETA:  0:00:07
Adding changed files:  38% |#############                       | ETA:  0:00:07
Adding changed files:  39% |##############                      | ETA:  0:00:07
Adding changed files:  39% |##############                      | ETA:  0:00:07
Adding changed files:  40% |##############                      | ETA:  0:00:07
Adding changed files:  40% |##############                      | ETA:  0:00:07
Adding changed files:  41% |##############                      | ETA:  0:00:07
Adding changed files:  41% |###############                     | ETA:  0:00:07
Adding changed files:  42% |###############                     | ETA:  0:00:07
Adding changed files:  42% |###############                     | ETA:  0:00:06
Adding changed files:  43% |###############                     | ETA:  0:00:06
Adding changed files:  44% |###############                     | ETA:  0:00:06
Adding changed files:  44% |################                    | ETA:  0:00:06
Adding changed files:  45% |################                    | ETA:  0:00:06
Adding changed files:  45% |################                    | ETA:  0:00:06
Adding changed files:  46% |################                    | ETA:  0:00:06
Adding changed files:  46% |################                    | ETA:  0:00:06
Adding changed files:  47% |#################                   | ETA:  0:00:06
Adding changed files:  48% |#################                   | ETA:  0:00:06
Adding changed files:  48% |#################                   | ETA:  0:00:06
Adding changed files:  49% |#################                   | ETA:  0:00:06
Adding changed files:  49% |#################                   | ETA:  0:00:06
Adding changed files:  50% |##################                  | ETA:  0:00:06
Adding changed files:  50% |##################                  | ETA:  0:00:06
Adding changed files:  51% |##################                  | ETA:  0:00:05
Adding changed files:  52% |##################                  | ETA:  0:00:05
Adding changed files:  52% |##################                  | ETA:  0:00:05
Adding changed files:  53% |###################                 | ETA:  0:00:05
Adding changed files:  53% |###################                 | ETA:  0:00:05
Adding changed files:  54% |###################                 | ETA:  0:00:05
Adding changed files:  54% |###################                 | ETA:  0:00:05
Adding changed files:  55% |###################                 | ETA:  0:00:05
Adding changed files:  55% |####################                | ETA:  0:00:05
Adding changed files:  56% |####################                | ETA:  0:00:05
Adding changed files:  57% |####################                | ETA:  0:00:05
Adding changed files:  57% |####################                | ETA:  0:00:05
Adding changed files:  58% |####################                | ETA:  0:00:05
Adding changed files:  58% |#####################               | ETA:  0:00:05
Adding changed files:  59% |#####################               | ETA:  0:00:04
Adding changed files:  59% |#####################               | ETA:  0:00:04
Adding changed files:  60% |#####################               | ETA:  0:00:04
Adding changed files:  61% |#####################               | ETA:  0:00:04
Adding changed files:  61% |######################              | ETA:  0:00:04
Adding changed files:  62% |######################              | ETA:  0:00:04
Adding changed files:  62% |######################              | ETA:  0:00:04
Adding changed files:  63% |######################              | ETA:  0:00:04
Adding changed files:  63% |#######################             | ETA:  0:00:04
Adding changed files:  64% |#######################             | ETA:  0:00:04
Adding changed files:  65% |#######################             | ETA:  0:00:04
Adding changed files:  65% |#######################             | ETA:  0:00:04
Adding changed files:  66% |#######################             | ETA:  0:00:04
Adding changed files:  66% |########################            | ETA:  0:00:04
Adding changed files:  67% |########################            | ETA:  0:00:03
Adding changed files:  67% |########################            | ETA:  0:00:03
Adding changed files:  68% |########################            | ETA:  0:00:03
Adding changed files:  68% |########################            | ETA:  0:00:03
Adding changed files:  69% |#########################           | ETA:  0:00:03
Adding changed files:  70% |#########################           | ETA:  0:00:03
Adding changed files:  70% |#########################           | ETA:  0:00:03
Adding changed files:  71% |#########################           | ETA:  0:00:03
Adding changed files:  71% |#########################           | ETA:  0:00:03
Adding changed files:  72% |##########################          | ETA:  0:00:03
Adding changed files:  72% |##########################          | ETA:  0:00:03
Adding changed files:  73% |##########################          | ETA:  0:00:03
Adding changed files:  74% |##########################          | ETA:  0:00:03
Adding changed files:  74% |##########################          | ETA:  0:00:03
Adding changed files:  75% |###########################         | ETA:  0:00:02
Adding changed files:  75% |###########################         | ETA:  0:00:02
Adding changed files:  76% |###########################         | ETA:  0:00:02
Adding changed files:  76% |###########################         | ETA:  0:00:02
Adding changed files:  77% |###########################         | ETA:  0:00:02
Adding changed files:  78% |############################        | ETA:  0:00:02
Adding changed files:  78% |############################        | ETA:  0:00:02
Adding changed files:  79% |############################        | ETA:  0:00:02
Adding changed files:  79% |############################        | ETA:  0:00:02
Adding changed files:  80% |############################        | ETA:  0:00:02
Adding changed files:  80% |#############################       | ETA:  0:00:02
Adding changed files:  81% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  82% |#############################       | ETA:  0:00:02
Adding changed files:  83% |#############################       | ETA:  0:00:02
Adding changed files:  83% |##############################      | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  85% |##############################      | ETA:  0:00:01
Adding changed files:  86% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  87% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  88% |###############################     | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  89% |################################    | ETA:  0:00:01
Adding changed files:  90% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:01
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:11

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://mesa.freedesktop.org/archive/mesa-23.1.4.tar.xz...
INFO: Rebasing devtool onto 59deff9e64202f8f4e0fa0e57057912620623ef6
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 349, in <module>
    ret = main()
          ^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 336, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 565, in upgrade
    new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 473, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/mesa/docs/license.rst'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1746278077116032977==--

