Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CDCCFD2EC
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:54 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.53350.1728588940637321485
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CcYgxb3d;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=MCWkJ1AZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019277ee1a4c-1f0d7b29-c8cb-431c-a93b-a7990e6230ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588946;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ch88YZJblPcWN0vZu3PX7uhUYq1gvBfoxqzrjwo+iMg=;
	b=CcYgxb3dArDzrKAgwbPLyl1EI9dwdJgtWrMnoJkuGZsxrPf7b7Qr7UliKnRGQbrd
	XHstMQuUvkxq9H7JJ12Hd/SUgCWK8YGAaEG+MFchkCsKcjeWElYvGeLDSG4ezDvsE/G
	AaZWuI84mLpg97yamVR6VSlcleOlhfoGWRHjnsfg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588946;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ch88YZJblPcWN0vZu3PX7uhUYq1gvBfoxqzrjwo+iMg=;
	b=MCWkJ1AZ15j2sDgm4potrWO5E7OkB21CyncsDIJXRvvEqRLexdw/wZd/YZ8DsDNT
	JDd2Sbo3y1LC1xvpiGLnutqZW458nYpvWobtxU1UMFvUKE7zd28Tmhh2n+xt7c9cyce
	VMR9NBONHcSuzWS5YMz5N+jUBtMFfuhUTziiIp78=
Content-Type: multipart/mixed; boundary="===============7766684365425889584=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 go-crosssdk-x86_64-pokysdk-linux,go-cross-canadian-x86-64,go-cross-core2-64,go-runtime,go:
 upgrading to 1.23.2,1.23.2,1.23.2,1.23.2,1.23.2 FAILED
Message-ID: <0101019277ee1a4c-1f0d7b29-c8cb-431c-a93b-a7990e6230ab-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205447

--===============7766684365425889584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go-crosssdk-x86_64-pokysdk-linux,go-cross-canadian-x86-64,go-cross-core2-64,go-runtime,go* to *1.23.2,1.23.2,1.23.2,1.23.2,1.23.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-crosssdk-x86_64-pokysdk-linux -V 1.23.2
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:724cb0ed2a003d8abfa0d92ec4c791f95348261f"

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
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1872 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:724cb0ed2a003d8abfa0d92ec4c791f95348261f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-znjk76ss: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-y_9_tvku/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-y_9_tvku/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   3% |#                                   | ETA:  0:00:03
Adding changed files:   7% |##                                  | ETA:  0:00:02
Adding changed files:  10% |###                                 | ETA:  0:00:02
Adding changed files:  14% |#####                               | ETA:  0:00:02
Adding changed files:  17% |######                              | ETA:  0:00:01
Adding changed files:  21% |#######                             | ETA:  0:00:01
Adding changed files:  24% |########                            | ETA:  0:00:01
Adding changed files:  28% |##########                          | ETA:  0:00:01
Adding changed files:  31% |###########                         | ETA:  0:00:01
Adding changed files:  35% |############                        | ETA:  0:00:01
Adding changed files:  38% |##############                      | ETA:  0:00:01
Adding changed files:  42% |###############                     | ETA:  0:00:01
Adding changed files:  46% |################                    | ETA:  0:00:01
Adding changed files:  49% |#################                   | ETA:  0:00:01
Adding changed files:  53% |###################                 | ETA:  0:00:01
Adding changed files:  56% |####################                | ETA:  0:00:01
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  63% |######################              | ETA:  0:00:00
Adding changed files:  67% |########################            | ETA:  0:00:00
Adding changed files:  70% |#########################           | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  77% |############################        | ETA:  0:00:00
Adding changed files:  81% |#############################       | ETA:  0:00:00
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  92% |#################################   | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:02

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://golang.org/dl/go1.23.2.src.tar.gz;name=main...
INFO: Rebasing devtool onto 90e1099a68180030c76da2ccb0099f66ab21a1da
WARNING: Command 'git rebase 90e1099a68180030c76da2ccb0099f66ab21a1da' failed:
Auto-merging src/make.bash
CONFLICT (content): Merge conflict in src/make.bash

You will need to resolve conflicts in order to complete the upgrade.
ERROR: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 91, in include_single_file
    bb.parse.handle(fn, data, True)
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py", line 119, in handle
    return h['handle'](fn, data, include, baseconfig)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 136, in handle
    abs_fn = resolve_file(fn, d)
             ^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py", line 139, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found in %s" % (fn, bbpath))
FileNotFoundError: [Errno 2] file go-64-pokysdk-linux.inc not found in /srv/pokybuild/yocto-worker/auh/build/build/workspace:/srv/pokybuild/yocto-worker/auh/build/meta-poky:/srv/pokybuild/yocto-worker/auh/build/build:/srv/pokybuild/yocto-worker/auh/build/meta:/srv/pokybuild/yocto-worker/auh/build/meta-yocto-bsp

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/command.py", line 90, in runCommand
    result = command_method(self, commandline)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/command.py", line 580, in parseRecipeFile
    envdata = command.cooker.databuilder.parseRecipe(virtualfn, appendfiles, layername)
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/cookerdata.py", line 551, in parseRecipe
    datastores = self.parseRecipeVariants(virtualfn, appends, virtonly=True, layername=layername)
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/cookerdata.py", line 525, in parseRecipeVariants
    return self._parse_recipe(bb_data, bbfile, appends, mc, layername)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/cookerdata.py", line 513, in _parse_recipe
    return bb.parse.handle(bbfile, bb_data)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py", line 119, in handle
    return h['handle'](fn, data, include, baseconfig)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 146, in handle
    statements.eval(d)
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/ast.py", line 20, in eval
    statement.eval(data)
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/ast.py", line 42, in eval
    bb.parse.ConfHandler.include(self.filename, s, self.lineno, data, "include required")
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 68, in include
    include_single_file(parentfn, fn, lineno, data, error_out)
  File "/srv/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 95, in include_single_file
    raise ParseError("Could not %s file %s" % (error_out, fn), parentfn, lineno)
bb.parse.ParseError: ParseError at /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/go-crosssdk-x86_64-pokysdk-linux/go-crosssdk-x86_64-pokysdk-linux_1.23.2.bb:2: Could not include required file go-64-pokysdk-linux.inc

ERROR: Parsing of upgraded recipe failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7766684365425889584==--

