Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC45C5B55B
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:08 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.131416.1723748333739600321
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BHlHgXgD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=KtF2mH/v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019157683510-bc9d991d-0b42-4fcf-8db8-18ac652ef409-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rKzVYEVBLvKaGZo2J820RmVBLmi/vgHPR43pqyGl898=;
	b=BHlHgXgDZhNI397/nsUl2L70KMfFEgo0V6rVnhp04jCgEKEhhiVt7YDy8yuY6YXD
	Hw11DW9wRS41mB/oXLYCfW7tBQrWAfUOGie2+qJVmM9w0Mrir2dsfP92/PjPsFeehEm
	XYDCP99yfT9SBb49Qu1tZbTkuDAu7Nzv2evORTKs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rKzVYEVBLvKaGZo2J820RmVBLmi/vgHPR43pqyGl898=;
	b=KtF2mH/v/UGrIM1Qe0/1J74PVyOyo1+oeMOHWVD+4Ziiqy5VfNQ8sU3f17kLeNHq
	Z6ly+V/4S7f5dX685vTuLxdlyC8bQywdq2zOsGP4spQv0ZNwLc9IVw7nr5LJnDQzHFF
	0ne/GU0+eVU38F+brGrXiGv7xf4OR38ZpHfUkdOc=
Content-Type: multipart/mixed; boundary="===============1197107043056246353=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 go-crosssdk-x86_64-pokysdk-linux,go-cross-canadian-x86-64,go-runtime,go,go-cross-core2-64:
 upgrading to 1.23.0,1.23.0,1.23.0,1.23.0,1.23.0 FAILED
Message-ID: <0101019157683510-bc9d991d-0b42-4fcf-8db8-18ac652ef409-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203345

--===============1197107043056246353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-crosssdk-x86_64-pokysdk-linux,go-cross-canadian-x86-64,go-runtime,go,go-cross-core2-64* to *1.23.0,1.23.0,1.23.0,1.23.0,1.23.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-crosssdk-x86_64-pokysdk-linux -V 1.23.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-77b938f89d6a9bfdd692a4b4aa9d967948f420ad"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:77b938f89d6a9bfdd692a4b4aa9d967948f420ad"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1868 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-77b938f89d6a9bfdd692a4b4aa9d967948f420ad"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:77b938f89d6a9bfdd692a4b4aa9d967948f420ad"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-b2wzxzl4: the directory /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-tn9ckb_u/emptysrc (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-tn9ckb_u/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   3% |#                                   | ETA:  0:00:04
Adding changed files:   7% |##                                  | ETA:  0:00:03
Adding changed files:  10% |###                                 | ETA:  0:00:02
Adding changed files:  14% |#####                               | ETA:  0:00:02
Adding changed files:  17% |######                              | ETA:  0:00:02
Adding changed files:  21% |#######                             | ETA:  0:00:02
Adding changed files:  24% |########                            | ETA:  0:00:02
Adding changed files:  28% |##########                          | ETA:  0:00:02
Adding changed files:  32% |###########                         | ETA:  0:00:01
Adding changed files:  35% |############                        | ETA:  0:00:01
Adding changed files:  39% |##############                      | ETA:  0:00:01
Adding changed files:  42% |###############                     | ETA:  0:00:01
Adding changed files:  46% |################                    | ETA:  0:00:01
Adding changed files:  49% |#################                   | ETA:  0:00:01
Adding changed files:  53% |###################                 | ETA:  0:00:01
Adding changed files:  57% |####################                | ETA:  0:00:01
Adding changed files:  60% |#####################               | ETA:  0:00:01
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files:  67% |########################            | ETA:  0:00:00
Adding changed files:  71% |#########################           | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  78% |############################        | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:02

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://golang.org/dl/go1.23.0.src.tar.gz;name=main...
INFO: Rebasing devtool onto df68d4e2b912f645bc1fb579a9333b8d7f59b624
WARNING: Command 'git rebase df68d4e2b912f645bc1fb579a9333b8d7f59b624' failed:
Auto-merging src/make.bash
CONFLICT (content): Merge conflict in src/make.bash

You will need to resolve conflicts in order to complete the upgrade.
ERROR: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 91, in include_single_file
    bb.parse.handle(fn, data, True)
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py", line 119, in handle
    return h['handle'](fn, data, include, baseconfig)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 136, in handle
    abs_fn = resolve_file(fn, d)
             ^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py", line 139, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found in %s" % (fn, bbpath))
FileNotFoundError: [Errno 2] file go-64-pokysdk-linux.inc not found in /home/pokybuild/yocto-worker/auh/build/build/workspace:/home/pokybuild/yocto-worker/auh/build/meta-poky:/home/pokybuild/yocto-worker/auh/build/build:/home/pokybuild/yocto-worker/auh/build/meta:/home/pokybuild/yocto-worker/auh/build/meta-yocto-bsp

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/command.py", line 90, in runCommand
    result = command_method(self, commandline)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/command.py", line 580, in parseRecipeFile
    envdata = command.cooker.databuilder.parseRecipe(virtualfn, appendfiles, layername)
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/cookerdata.py", line 550, in parseRecipe
    datastores = self.parseRecipeVariants(virtualfn, appends, virtonly=True, layername=layername)
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/cookerdata.py", line 524, in parseRecipeVariants
    return self._parse_recipe(bb_data, bbfile, appends, mc, layername)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/cookerdata.py", line 512, in _parse_recipe
    return bb.parse.handle(bbfile, bb_data)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py", line 119, in handle
    return h['handle'](fn, data, include, baseconfig)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 146, in handle
    statements.eval(d)
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/ast.py", line 20, in eval
    statement.eval(data)
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/ast.py", line 42, in eval
    bb.parse.ConfHandler.include(self.filename, s, self.lineno, data, "include required")
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 68, in include
    include_single_file(parentfn, fn, lineno, data, error_out)
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 95, in include_single_file
    raise ParseError("Could not %s file %s" % (error_out, fn), parentfn, lineno)
bb.parse.ParseError: ParseError at /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/go-crosssdk-x86_64-pokysdk-linux/go-crosssdk-x86_64-pokysdk-linux_1.23.0.bb:2: Could not include required file go-64-pokysdk-linux.inc

ERROR: Parsing of upgraded recipe failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1197107043056246353==--

