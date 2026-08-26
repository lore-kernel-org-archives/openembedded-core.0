Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336ECC61DCB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:59:58 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6367.1787723991779476836
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=javBRKZg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VBPMpwfl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a03ca747a1-37a1e637-84cf-4a49-ab4d-19913042e70e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787723991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Y3zG2zj85cZvNv3+QiGPSQ5+9rQ0l0/jNS7v3TXJk7s=;
	b=javBRKZglBYnmamp5ulRKkLp5v2qCrAiCLFBaws7yB+1V6P2MgukP3QbQai3097A
	73+YbsNsL9ZLVR6yDdKH5DyBjvq0IJUIOIYLqaYvgXTbk3BJzcQAaHyyNGIwE+MLEYs
	MScSrLzohWf/mYmVJBHVGOKkTBYAupWnU8o4on68=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787723991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Y3zG2zj85cZvNv3+QiGPSQ5+9rQ0l0/jNS7v3TXJk7s=;
	b=VBPMpwfl04I6rlQI2YsQ7HVeJpQHBcz3ydb8bE+4caS23Ah2GxEwkYxeYqkqCxbY
	0ftxCuiBXqNWv8hvrFmZR18cYUHyiLI61Y/LcBpqsW7qD6oEvnQAU7DW/2p+Wuyj5k1
	yyknteJh88Nfg/sAJ7bWoH9kiOQtFQREvAdI0Id8=
Content-Type: multipart/mixed; boundary="===============1239691492751072567=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.19 FAILED
Message-ID: <010101a03ca747a1-37a1e637-84cf-4a49-ab4d-19913042e70e-000000@us-west-2.amazonses.com>
Date: Wed, 26 Aug 2026 05:59:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.26-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244309

--===============1239691492751072567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *man-pages* to *6.19* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade man-pages -V 6.19
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1986 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-4bbd8e4a0e2a547f36c1df5fc883e84544480d78"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:4bbd8e4a0e2a547f36c1df5fc883e84544480d78"
meta-yocto-bsp       
meta-poky            = "master:6ce984c0a3a68c2fdc3c32bc185b6729d09e7829"
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
Parsing of 957 .bb files complete (0 cached, 957 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-4bbd8e4a0e2a547f36c1df5fc883e84544480d78"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:4bbd8e4a0e2a547f36c1df5fc883e84544480d78"
meta-yocto-bsp       
meta-poky            = "master:6ce984c0a3a68c2fdc3c32bc185b6729d09e7829"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.19.tar.gz...
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 352, in <module>
    ret = main()
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 800, in upgrade
    rev2, checksums, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
                                             ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                            args.srcrev, args.srcbranch, args.branch, args.keep_temp,
                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                            tinfoil, rd)
                                            ^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/upgrade.py", line 280, in _extract_new_source
    shutil.rmtree(itempath)
    ~~~~~~~~~~~~~^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.13/shutil.py", line 763, in rmtree
    _rmtree_safe_fd(stack, onexc)
    ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.13/shutil.py", line 707, in _rmtree_safe_fd
    onexc(func, path, err)
    ~~~~~^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.13/shutil.py", line 676, in _rmtree_safe_fd
    raise OSError("Cannot call rmtree on a symbolic link")
OSError: [Errno None] None: '/srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/man-pages/man6'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1239691492751072567==--

