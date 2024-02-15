Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C478C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:31 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.20174.1708018346248962546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WJq7KFYG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=L6tOghYb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018dadd3acfc-0c8efd51-f257-481a-b71f-ef5c0dfc35bd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7sCqgTbnoRK/f0JQoCsGBYvkrziUJo7RWp+5RQXw8LY=;
	b=WJq7KFYG23Kw/GcFxvOhaKaixFWlqxf8HeEiiyl2GIN3M8NYo8N+pngaR5ifWWvR
	3rpdrPxsiPFSdxx7Kd1dNo/XL6bnSeqr+OnhkzsU/HfvNjPlZ29MJZjqe4XQe/vc1X+
	pymLBsv+ulMuptRdLyLCU+9dKpEkXLh6CFoFhCsY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7sCqgTbnoRK/f0JQoCsGBYvkrziUJo7RWp+5RQXw8LY=;
	b=L6tOghYbdt5cA4j93iw+zlPCRYv4phNJqY8kkOlHV4PtumFICG1gVwdkTCgU0MFI
	eZMIceuwV1jYrODV1RBWpfrEU2q0BiyX9fzRQM8+iZPLAuFEETEjAvufzl0ROvs42np
	k3ZVqd3Z0Da+gkgZE6ZVi/gQziTE2D8OgIVSYY3M=
Content-Type: multipart/mixed; boundary="===============5375735028511598676=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] icu: upgrading to 74-2 FAILED
Message-ID: <0101018dadd3acfc-0c8efd51-f257-481a-b71f-ef5c0dfc35bd-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195667

--===============5375735028511598676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *icu* to *74-2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade icu -V 74-2
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1857 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-80a361dcef41da3c1c486879bea167af5e18d820"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:80a361dcef41da3c1c486879bea167af5e18d820"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 1857 entries from dependency cache.
Parsing recipes...done.
Parsing of 915 .bb files complete (913 cached, 2 parsed). 1858 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-80a361dcef41da3c1c486879bea167af5e18d820"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:80a361dcef41da3c1c486879bea167af5e18d820"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/unicode-org/icu/releases/download/release-74-2/icu4c-74_2-src.tgz;name=code...
INFO: Rebasing devtool onto a1878f7f36979adca66ab54804a463a688767df3
INFO: Rebasing devtool-override-class-target onto a1878f7f36979adca66ab54804a463a688767df3
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/scripts/devtool", line 350, in <module>
    ret = main()
          ^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/devtool", line 337, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 582, in upgrade
    new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 490, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/workspace/sources/icu/source/../LICENSE'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5375735028511598676==--

