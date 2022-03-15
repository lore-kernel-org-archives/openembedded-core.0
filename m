Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEFEC4167D
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:55 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.10637.1647349734779342700
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=zvPOmV4n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 0101017f8db21a0b-daab4f43-f3c7-4f40-9d59-163ad4150409-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sHiPl3rVLRPuM66P4hPDqHKJx7vi685hAhj+b1Gf3Bc=;
	b=zvPOmV4nD2cD4XPayMhIuXMOVXKU83KsxiIWbrGnmj/LmUMinC08+heqJpR9uc3a
	1s7Pv50BoCVcsfGKvhxJ6mUIs903aiGATF7G5PmBg3KLQsbx0DCd07wobtIZCE+NyPC
	qI9zpVBY44PF/gRjmmGpfLI9lHhW8KOS401wUmgQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sHiPl3rVLRPuM66P4hPDqHKJx7vi685hAhj+b1Gf3Bc=;
	b=IPts5nETpTfQVEK8NnISg3qS7ME10DCnU5I4G153RPmMM9O2DADQ56rZIjE4e/Xf
	MCVKkU58dUrRO/MzIh6Vl4a3GaluaGdul/vPrsZ6e2vamHKFJs56NuF5jcVszwBJ0Yp
	pvuNp7dzk1mFLENqDubeoJ5dt5EnwCcx4GKHINYw=
Content-Type: multipart/mixed; boundary="===============7832465460891172622=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to
 c179db1b6f2ae484bfca1e9f8bae273e3319fa7d FAILED
Message-ID: 
 <0101017f8db21a0b-daab4f43-f3c7-4f40-9d59-163ad4150409-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:54 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163248

--===============7832465460891172622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-config* to *c179db1b6f2ae484bfca1e9f8bae273e3319fa7d* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gnu-config -S c179db1b6f2ae484bfca1e9f8bae273e3319fa7d
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1521 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-45f307b7e9bcd9cadf43d0451195a366f01da04d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:45f307b7e9bcd9cadf43d0451195a366f01da04d"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 8 Local 0 Mirrors 0 Missed 8 Current 12 (0% match, 60% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
WARNING: Failed to find a git repository in WORKDIR: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20211108+gitAUTOINC+191bcb948f-r0/devtooltmp-vhmiv9k_/workdir
WARNING: gnu-config: the directory ${WORKDIR}/git (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20211108+gitAUTOINC+191bcb948f-r0/devtooltmp-vhmiv9k_/workdir/git) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 56 tasks of which 51 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
ERROR: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:devtool_post_unpack(d)
     0003:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/devtool-source.bbclass', lineno: 140, function: devtool_post_unpack
     0136:    elif os.path.dirname(srcsubdir) != workdir:
     0137:        # Handle if S is set to a subdirectory of the source
     0138:        srcsubdir = os.path.join(workdir, os.path.relpath(srcsubdir, workdir).split(os.sep)[0])
     0139:
 *** 0140:    scriptutils.git_convert_standalone_clone(srcsubdir)
     0141:
     0142:    # Make sure that srcsubdir exists
     0143:    bb.utils.mkdirhier(srcsubdir)
     0144:    if not os.listdir(srcsubdir):
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/scriptutils.py', lineno: 113, function: git_convert_standalone_clone
     0109:        if os.path.exists(alternatesfile):
     0110:            # This will have been cloned with -s, so we need to convert it so none
     0111:            # of the contents is shared
     0112:            bb.process.run('git repack -a', cwd=repodir)
 *** 0113:            os.remove(alternatesfile)
     0114:
     0115:def _get_temp_recipe_dir(d):
     0116:    # This is a little bit hacky but we need to find a place where we can put
     0117:    # the recipe so that bitbake can find it. We're going to delete it at the
Exception: FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20211108+gitAUTOINC+191bcb948f-r0/devtooltmp-vhmiv9k_/workdir/git/.git/objects/info/alternates'

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20211108+gitAUTOINC+191bcb948f-r0/devtooltmp-vhmiv9k_/temp/log.do_unpack.3458159
ERROR: Extracting source for gnu-config failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7832465460891172622==--

