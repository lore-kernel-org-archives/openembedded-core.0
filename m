Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84F9C10F1A
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:51 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.17704.1690907328533334860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=buSnp2cO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BxjI+6mx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189b1ee425c-924981bd-4229-4258-8c76-6d92d5f8b5a8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xFm37aTT48qr8HuDrxV7cWGo88HE9AAR8qoouNW8lfI=;
	b=buSnp2cOc9gDNEt12adMSpoCMTsSlHs1OKk6QYpkRIVu/s8zBnv0p+zvLbL0Ct1w
	u9ISiWNeeJFvdFG5NFcf/vTECgym/p6wDC4iymSDbsetJGQvtQSJqMln/BZ9HA/91p5
	VwqjvPm762rZ3n1JBNicpk9lB+VVuQJ1rDBSyhrs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xFm37aTT48qr8HuDrxV7cWGo88HE9AAR8qoouNW8lfI=;
	b=BxjI+6mxZ5S70PRQKr/F9Dttd9ZdS+LtcfuRq/3yvMigys3TLTHnQ8qWK+8Qb1/M
	hfbb3SMXjKsuUe3+auJt7vV0BzpfhE+DRFbB0bsYlIrLJ0xYL3wMNczSmO0iSimqwMb
	Ch3wXwf7ppx3aLmt98YQ1BqyxnqnAkiAjVGoBFNo=
Content-Type: multipart/mixed; boundary="===============3555476721250518953=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux: upgrading to 2.39.1 FAILED
Message-ID: <01010189b1ee425c-924981bd-4229-4258-8c76-6d92d5f8b5a8-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185268

--===============3555476721250518953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux* to *2.39.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade util-linux -V 2.39.1
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (07:42:29.436000)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f4be1e2a09caa3a622752ef05645bdbd264a0738"
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
meta-yocto-bsp       = "tmp-auh-upgrades:f4be1e2a09caa3a622752ef05645bdbd264a0738"
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
Adding changed files:   1% |                                    | ETA:  0:00:06
Adding changed files:   3% |#                                   | ETA:  0:00:05
Adding changed files:   4% |#                                   | ETA:  0:00:04
Adding changed files:   6% |##                                  | ETA:  0:00:04
Adding changed files:   8% |##                                  | ETA:  0:00:04
Adding changed files:   9% |###                                 | ETA:  0:00:03
Adding changed files:  11% |####                                | ETA:  0:00:03
Adding changed files:  13% |####                                | ETA:  0:00:03
Adding changed files:  14% |#####                               | ETA:  0:00:08
Adding changed files:  16% |#####                               | ETA:  0:00:08
Adding changed files:  18% |######                              | ETA:  0:00:07
Adding changed files:  19% |#######                             | ETA:  0:00:06
Adding changed files:  21% |#######                             | ETA:  0:00:06
Adding changed files:  22% |########                            | ETA:  0:00:06
Adding changed files:  24% |########                            | ETA:  0:00:05
Adding changed files:  26% |#########                           | ETA:  0:00:05
Adding changed files:  27% |##########                          | ETA:  0:00:04
Adding changed files:  29% |##########                          | ETA:  0:00:04
Adding changed files:  31% |###########                         | ETA:  0:00:04
Adding changed files:  32% |###########                         | ETA:  0:00:04
Adding changed files:  34% |############                        | ETA:  0:00:04
Adding changed files:  36% |############                        | ETA:  0:00:03
Adding changed files:  37% |#############                       | ETA:  0:00:03
Adding changed files:  39% |##############                      | ETA:  0:00:03
Adding changed files:  40% |##############                      | ETA:  0:00:03
Adding changed files:  42% |###############                     | ETA:  0:00:03
Adding changed files:  44% |###############                     | ETA:  0:00:03
Adding changed files:  45% |################                    | ETA:  0:00:02
Adding changed files:  47% |#################                   | ETA:  0:00:02
Adding changed files:  49% |#################                   | ETA:  0:00:02
Adding changed files:  50% |##################                  | ETA:  0:00:02
Adding changed files:  52% |##################                  | ETA:  0:00:02
Adding changed files:  54% |###################                 | ETA:  0:00:02
Adding changed files:  55% |####################                | ETA:  0:00:02
Adding changed files:  57% |####################                | ETA:  0:00:02
Adding changed files:  59% |#####################               | ETA:  0:00:01
Adding changed files:  60% |#####################               | ETA:  0:00:01
Adding changed files:  62% |######################              | ETA:  0:00:01
Adding changed files:  63% |#######################             | ETA:  0:00:01
Adding changed files:  65% |#######################             | ETA:  0:00:01
Adding changed files:  67% |########################            | ETA:  0:00:01
Adding changed files:  68% |########################            | ETA:  0:00:01
Adding changed files:  70% |#########################           | ETA:  0:00:01
Adding changed files:  72% |#########################           | ETA:  0:00:01
Adding changed files:  73% |##########################          | ETA:  0:00:01
Adding changed files:  75% |###########################         | ETA:  0:00:01
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  83% |##############################      | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  86% |###############################     | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  91% |#################################   | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:03

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.1.tar.xz...
INFO: Rebasing devtool onto 6e8b4ce98db2002c1774d5a7b619ac949c906f8f
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
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/util-linux/README.licensing'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3555476721250518953==--

