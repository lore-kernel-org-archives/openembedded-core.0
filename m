Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A962C25B75
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.17589.1690907328808840636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DQGzxjDu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hsKapWMf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189b1ee3d42-fb4a87a0-a537-4c28-92d1-703ac2078b63-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907328;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=mtLz0w7nBFTdQGOxPWcoyspTlJHHVTLXMysSU6gjziE=;
	b=DQGzxjDul+ZTXF+CUJEDB+z3d1RL1cvjHEsjYjVVjlN07ZKJfTib17Hkw9NXJXI/
	91oyqHH1hsDB/ErmSmNbVRVbmmqjcav5q5UlO66rSd0XuIKuEI0v3UC+jHtIS8//sRP
	SPoeuets6cy+aHHTlFkx2Km+NRaGbhzoeLPLisMs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907328;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=mtLz0w7nBFTdQGOxPWcoyspTlJHHVTLXMysSU6gjziE=;
	b=hsKapWMf1z2feE34zXcUzoosDryt+imwPblUQcOHhlzh8Orh3NEiAZH/SGw1DLHU
	D9ImeCpONjGMIufRXZbHiXvHzu22yQdp8+RigB4mITBBm36zuujUgxJJeACby4753DX
	9v9V4sKZhfGUMoaMQ4zP0OfoyIloIWwtub9WQcJ8=
Content-Type: multipart/mixed; boundary="===============9163767402679175677=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.18.17 FAILED
Message-ID: <01010189b1ee3d42-fb4a87a0-a537-4c28-92d1-703ac2078b63-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185261

--===============9163767402679175677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.18.17* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade bind -V 9.18.17
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (06:01:28.353966)
NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (06:01:28.353966)
NOTE: Retrying server connection (#1)... (06:01:28.353966)
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (06:01:29.209206)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.

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
meta-yocto-bsp       = "tmp-auh-upgrades:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 33 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
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
meta-yocto-bsp       = "tmp-auh-upgrades:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 27 (0% match, 96% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:00:10
Adding changed files:   2% |                                    | ETA:  0:00:07
Adding changed files:   3% |#                                   | ETA:  0:00:06
Adding changed files:   4% |#                                   | ETA:  0:00:05
Adding changed files:   5% |##                                  | ETA:  0:00:05
Adding changed files:   6% |##                                  | ETA:  0:00:04
Adding changed files:   8% |##                                  | ETA:  0:00:04
Adding changed files:   9% |###                                 | ETA:  0:00:04
Adding changed files:  10% |###                                 | ETA:  0:00:04
Adding changed files:  11% |####                                | ETA:  0:00:04
Adding changed files:  12% |####                                | ETA:  0:00:04
Adding changed files:  13% |####                                | ETA:  0:00:04
Adding changed files:  14% |#####                               | ETA:  0:00:04
Adding changed files:  16% |#####                               | ETA:  0:00:03
Adding changed files:  17% |######                              | ETA:  0:00:03
Adding changed files:  18% |######                              | ETA:  0:00:03
Adding changed files:  19% |#######                             | ETA:  0:00:03
Adding changed files:  20% |#######                             | ETA:  0:00:03
Adding changed files:  21% |#######                             | ETA:  0:00:03
Adding changed files:  22% |########                            | ETA:  0:00:03
Adding changed files:  24% |########                            | ETA:  0:00:03
Adding changed files:  25% |#########                           | ETA:  0:00:03
Adding changed files:  26% |#########                           | ETA:  0:00:03
Adding changed files:  27% |#########                           | ETA:  0:00:03
Adding changed files:  28% |##########                          | ETA:  0:00:03
Adding changed files:  29% |##########                          | ETA:  0:00:03
Adding changed files:  30% |###########                         | ETA:  0:00:03
Adding changed files:  32% |###########                         | ETA:  0:00:03
Adding changed files:  33% |###########                         | ETA:  0:00:03
Adding changed files:  34% |############                        | ETA:  0:00:03
Adding changed files:  35% |############                        | ETA:  0:00:03
Adding changed files:  36% |#############                       | ETA:  0:00:02
Adding changed files:  37% |#############                       | ETA:  0:00:02
Adding changed files:  38% |##############                      | ETA:  0:00:02
Adding changed files:  40% |##############                      | ETA:  0:00:02
Adding changed files:  41% |##############                      | ETA:  0:00:02
Adding changed files:  42% |###############                     | ETA:  0:00:02
Adding changed files:  43% |###############                     | ETA:  0:00:02
Adding changed files:  44% |################                    | ETA:  0:00:02
Adding changed files:  45% |################                    | ETA:  0:00:02
Adding changed files:  46% |################                    | ETA:  0:00:02
Adding changed files:  48% |#################                   | ETA:  0:00:02
Adding changed files:  49% |#################                   | ETA:  0:00:02
Adding changed files:  50% |##################                  | ETA:  0:00:02
Adding changed files:  51% |##################                  | ETA:  0:00:02
Adding changed files:  52% |##################                  | ETA:  0:00:02
Adding changed files:  53% |###################                 | ETA:  0:00:02
Adding changed files:  54% |###################                 | ETA:  0:00:02
Adding changed files:  56% |####################                | ETA:  0:00:02
Adding changed files:  57% |####################                | ETA:  0:00:02
Adding changed files:  58% |#####################               | ETA:  0:00:01
Adding changed files:  59% |#####################               | ETA:  0:00:01
Adding changed files:  60% |#####################               | ETA:  0:00:01
Adding changed files:  61% |######################              | ETA:  0:00:01
Adding changed files:  62% |######################              | ETA:  0:00:01
Adding changed files:  64% |#######################             | ETA:  0:00:01
Adding changed files:  65% |#######################             | ETA:  0:00:01
Adding changed files:  66% |#######################             | ETA:  0:00:01
Adding changed files:  67% |########################            | ETA:  0:00:01
Adding changed files:  68% |########################            | ETA:  0:00:01
Adding changed files:  69% |#########################           | ETA:  0:00:01
Adding changed files:  70% |#########################           | ETA:  0:00:01
Adding changed files:  72% |#########################           | ETA:  0:00:01
Adding changed files:  73% |##########################          | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  75% |###########################         | ETA:  0:00:01
Adding changed files:  76% |###########################         | ETA:  0:00:01
Adding changed files:  77% |############################        | ETA:  0:00:01
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  83% |##############################      | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:04

INFO: Creating workspace layer in /home/pokybuild/yocto-worker/auh/build/build/build/workspace
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.isc.org/isc/bind9/9.18.17/bind-9.18.17.tar.xz...
INFO: Rebasing devtool onto 871b6457cb3fa93089a9f6d6007a349abc2989bc
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
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/bind/COPYRIGHT'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9163767402679175677==--

