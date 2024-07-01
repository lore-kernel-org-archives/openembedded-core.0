Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD27FC52D7B
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:01 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.2178.1719853075960535777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WqytxF5W;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=BF9TB60b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101906f3b4e90-c8f19158-33dc-436e-8dcc-6e7046e27018-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CvUYb5X1AhfNjQJvPemvhMaca+xDqkzCnlZb0yRLPj8=;
	b=WqytxF5WVwiLdFXFpr48zATEaKl66VAY+GrZT5ZlOTsHWUeof63ZdADIo2OVLPqP
	LdDtkta9BzsPPYB1TEe9mFjSGAWLK29DYGlxp9nu0b053tHUF2kh/1yym1T4pfvqm08
	9jR9zNZrsuAl/8tAoRawYMAzQfBjBjzBS/oT1ZYg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CvUYb5X1AhfNjQJvPemvhMaca+xDqkzCnlZb0yRLPj8=;
	b=BF9TB60bgurgeeg1sln9A9Qs4m0zInyIA2BUn23KWyCqOZAUAHYw84+gZ4d0oAY+
	fwdTFhOudXqMw6KbqOY/iZZEJLmgWSzxoHNoXCCvxS90ZGHTP1M8Y8U+9VZE2yaskch
	0QPeXGRF2k8s+nukiwMIlXyulLTaCZfbb5ycBjGc=
Content-Type: multipart/mixed; boundary="===============7109821669246279011=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.9.1 FAILED
Message-ID: <010101906f3b4e90-c8f19158-33dc-436e-8dcc-6e7046e27018-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201345

--===============7109821669246279011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-pages* to *6.9.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade man-pages -V 6.9.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-c7a7a4f6d49fb8321d0874506204f0312e78d231"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c7a7a4f6d49fb8321d0874506204f0312e78d231"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
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
DISTRO_VERSION       = "5.0+snapshot-c7a7a4f6d49fb8321d0874506204f0312e78d231"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c7a7a4f6d49fb8321d0874506204f0312e78d231"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-gelzcmuz: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-z9h1nuos/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-z9h1nuos/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.9.1.tar.gz...
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/scripts/devtool", line 350, in <module>
    ret = main()
          ^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/devtool", line 337, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 606, in upgrade
    rev2, checksums, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 238, in _extract_new_source
    shutil.rmtree(itempath)
  File "/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.12/shutil.py", line 802, in rmtree
    onexc(os.path.islink, path, err)
  File "/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.12/shutil.py", line 800, in rmtree
    raise OSError("Cannot call rmtree on a symbolic link")
OSError: Cannot call rmtree on a symbolic link


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7109821669246279011==--

