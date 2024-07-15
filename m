Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9448CC54747
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1371.1721071147167946565
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=EznvxNXk;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nn5LzDnl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010190b7d595cb-e57b5134-5b45-47ee-909f-27832a01222f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tuT6FI4SNdclIgBwJ8wxktIChnvOiQB3w0x7oca9eNg=;
	b=EznvxNXktmRdhB55MzAyFF+kanexGA6KzPRn9uqIO/gGFtWvw3ZNnHxVmJaPogOY
	nv6yF6d1d9Yr4dp46GWgLd8vIKjma/D4q/lKiaJ8shbbQuhWQNs8QmK2vwqfBaztvTf
	OlovXPTFP06orr8BngBKinpS1e4EFhqb8+0GnXtk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tuT6FI4SNdclIgBwJ8wxktIChnvOiQB3w0x7oca9eNg=;
	b=nn5LzDnlxVmS+c/aexxcfjq5l+2oY/BmmIrZWsk0ihQcaPhd2kB9vRgteY1YAfRc
	uowaXBW33UKa0m6r6eOk+K7RWjnutmBs8T6KktQ1Ln/FX6t8NsUGtP3+9BqjhFuSvUN
	ivR4sqCppWpLRiooy40yASK4i8qCZAccSv3SM2KQ=
Content-Type: multipart/mixed; boundary="===============5064142885075496892=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyproject-hooks: upgrading to 1.1.0 FAILED
Message-ID: <01010190b7d595cb-e57b5134-5b45-47ee-909f-27832a01222f-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201988

--===============5064142885075496892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyproject-hooks* to *1.1.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-pyproject-hooks -V 1.1.0
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
DISTRO_VERSION       = "5.0+snapshot-1d9739abc878b13771f33df703cbc8fcc272b84e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1d9739abc878b13771f33df703cbc8fcc272b84e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 7 Local 7 Mirrors 0 Missed 0 Current 23 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
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
DISTRO_VERSION       = "5.0+snapshot-1d9739abc878b13771f33df703cbc8fcc272b84e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1d9739abc878b13771f33df703cbc8fcc272b84e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-ii1u20x3: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-dzm624qo/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-dzm624qo/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/p/pyproject_hooks/pyproject_hooks-1.1.0.tar.gz;downloadfilename=pyproject_hooks-1.1.0.tar.gz...
INFO: Rebasing devtool onto e66eed210f9cb61b8ced7eb75c23b3d30030721a
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
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-pyproject-hooks/LICENSE'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5064142885075496892==--

