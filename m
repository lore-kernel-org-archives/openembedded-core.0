Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D814C25B79
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.17608.1690907331792095644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=d1sy57/Z;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ojG+pYny;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010189b1ee4a9d-2b0a1fa9-f512-4d8a-852c-9d098b03d718-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4ntiXC0GTM8/r5howuJ2MQzmrhD0h8n0gU19dUXc6nc=;
	b=d1sy57/ZylwMGLtRHbnnUyzq0HinDrixNcyGQCe7KcCzw3l6SCBaI7miglY7qsLW
	5x7n9tuijWRAhPKIbhc927w9x4QunvcgzTW5IcJ3p2g1eiI3EkCy/tMXWQ9cX/6PJpU
	uWUYUNSP0BSvuuyy9QY9jXial7QLesrielMcsXgk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4ntiXC0GTM8/r5howuJ2MQzmrhD0h8n0gU19dUXc6nc=;
	b=ojG+pYnyccO5EaAJJyq2bkCJNhIgQC5PoKsGvEcrMScTNJbKtBVnDKSn7qriJ8MP
	oRCD9s4J1WI0QaH2t52zgTn2tLLQU9aB1oLXkXUOBxw+WyKSSWNwEHU07S4j2Hz/D/j
	MfCp46DBDXO2IZonWxLms4BQD7qlnv54UXDYqtO0=
Content-Type: multipart/mixed; boundary="===============8130301808276136544=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] adwaita-icon-theme: upgrading to 44.0 FAILED
Message-ID: <01010189b1ee4a9d-2b0a1fa9-f512-4d8a-852c-9d098b03d718-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185310

--===============8130301808276136544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *adwaita-icon-theme* to *44.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade adwaita-icon-theme -V 44.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (13:35:40.004906)
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
meta-yocto-bsp       = "tmp-auh-upgrades:00e7000d2b7af0a1f22d03c58956595f416e12f4"
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
meta-yocto-bsp       = "tmp-auh-upgrades:00e7000d2b7af0a1f22d03c58956595f416e12f4"
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
Adding changed files:   3% |#                                   | ETA:  0:00:04
Adding changed files:   7% |##                                  | ETA:  0:00:03
Adding changed files:  11% |####                                | ETA:  0:00:02
Adding changed files:  15% |#####                               | ETA:  0:00:02
Adding changed files:  18% |######                              | ETA:  0:00:01
Adding changed files:  22% |########                            | ETA:  0:00:01
Adding changed files:  26% |#########                           | ETA:  0:00:01
Adding changed files:  30% |##########                          | ETA:  0:00:01
Adding changed files:  34% |############                        | ETA:  0:00:01
Adding changed files:  37% |#############                       | ETA:  0:00:01
Adding changed files:  41% |###############                     | ETA:  0:00:01
Adding changed files:  45% |################                    | ETA:  0:00:00
Adding changed files:  49% |#################                   | ETA:  0:00:00
Adding changed files:  53% |###################                 | ETA:  0:00:00
Adding changed files:  56% |####################                | ETA:  0:00:00
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  71% |#########################           | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  79% |############################        | ETA:  0:00:00
Adding changed files:  83% |##############################      | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  94% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//adwaita-icon-theme/44/adwaita-icon-theme-44.0.tar.xz;name=archive...
INFO: Rebasing devtool onto 9d0d373a45250c236f2c31848fcf4c47392921c1
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
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/adwaita-icon-theme/COPYING'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8130301808276136544==--

