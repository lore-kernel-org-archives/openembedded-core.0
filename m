Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A305CC52D73
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:01 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.2173.1719853075645059463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Zj+rSSpj;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=vDJYeQ5A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101906f3b4950-809f6fe4-eece-47c6-8df6-d66cfeef2c11-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853074;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xOfrtFFAhYSFctrJT2/2ai2iB5VQGTPxuzLWmJHkQhw=;
	b=Zj+rSSpj6SsTlnFvIXHEPFD6gLuyVCTOsCrKPlqgNj1vdpmxEq+B7Aiyox+EJ/hj
	wm5ggyXYf58f2CNPSDgMjmVszSfjGn/9xSttFxOLECaGz5Azv6rjho+v8Jf5PTpaH0B
	y0vNf9HJkcpGYW598tU/WidMp4w1qZSGALJQdAeg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853074;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xOfrtFFAhYSFctrJT2/2ai2iB5VQGTPxuzLWmJHkQhw=;
	b=vDJYeQ5AY0zk+pGx4WhCuZ6bWsinODbJShCT/zedAI3JO9K2Hz5UEFUqesard6SS
	uK76Tk7kBlZvGJoDU9YN+7QiOBqBehFG0EnZRSwFxwDY1GgsWQiJ2mTtrECS58FgAsC
	sqSABj1axuskwFd65UFaRb4oR/Ee1dGuowWCq5/4=
Content-Type: multipart/mixed; boundary="===============5746970369105483636=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.13.1 FAILED
Message-ID: <010101906f3b4950-809f6fe4-eece-47c6-8df6-d66cfeef2c11-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201319

--===============5746970369105483636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxml2* to *2.13.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libxml2 -V 2.13.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-74741c9e37621d9720e8bd72a0f2c390739aea0f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:74741c9e37621d9720e8bd72a0f2c390739aea0f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (917 cached, 2 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-74741c9e37621d9720e8bd72a0f2c390739aea0f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:74741c9e37621d9720e8bd72a0f2c390739aea0f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-8ex3eyum: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-bw_53w76/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-bw_53w76/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |                                    | ETA:  0:00:07
Adding changed files:   5% |#                                   | ETA:  0:00:04
Adding changed files:   7% |##                                  | ETA:  0:00:04
Adding changed files:  10% |###                                 | ETA:  0:00:03
Adding changed files:  12% |####                                | ETA:  0:00:03
Adding changed files:  15% |#####                               | ETA:  0:00:02
Adding changed files:  18% |######                              | ETA:  0:00:02
Adding changed files:  20% |#######                             | ETA:  0:00:02
Adding changed files:  23% |########                            | ETA:  0:00:02
Adding changed files:  25% |#########                           | ETA:  0:00:02
Adding changed files:  28% |##########                          | ETA:  0:00:01
Adding changed files:  31% |###########                         | ETA:  0:00:01
Adding changed files:  33% |############                        | ETA:  0:00:01
Adding changed files:  36% |#############                       | ETA:  0:00:01
Adding changed files:  38% |##############                      | ETA:  0:00:01
Adding changed files:  41% |##############                      | ETA:  0:00:01
Adding changed files:  44% |###############                     | ETA:  0:00:01
Adding changed files:  46% |################                    | ETA:  0:00:01
Adding changed files:  49% |#################                   | ETA:  0:00:01
Adding changed files:  51% |##################                  | ETA:  0:00:01
Adding changed files:  54% |###################                 | ETA:  0:00:01
Adding changed files:  57% |####################                | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files:  67% |########################            | ETA:  0:00:00
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files:  72% |##########################          | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  77% |############################        | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  83% |#############################       | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:02

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//libxml2/2.13/libxml2-2.13.1.tar.xz;name=archive...
INFO: Rebasing devtool onto ce5e8b8dac383e0ed7c6f0c87f0a4ff293f3e0e0
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/scripts/devtool", line 350, in <module>
    ret = main()
          ^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/devtool", line 337, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 609, in upgrade
    new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 508, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libxml2/trio.c'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5746970369105483636==--

