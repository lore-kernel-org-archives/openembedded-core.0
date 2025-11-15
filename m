Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2EDCEB2DF
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:39 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12107.1763224710738897339
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RedgoDWM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LYfFVIyR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a8861eb80-ed5e5643-a8bf-4ad2-a0e9-ccc42d32b43a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224710;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aea78dN0jE+3emgNi5p6he7Ee7f/Z0mac4ZTbIUZxGg=;
	b=RedgoDWMRmJQ/TNNdd8QpMJ1Hor243P0aDabV2rAVZX/RpQs9YCNEnptY8vIRhWO
	5uu3yGe6LLQxDTKhwZ9Q7viYvUagBLlqy6RDKy2hOylSl2tIs5yaS9yni+iMk/hbGVx
	kwxLX6ZMEQqsHOHAONgr8xNfhcoR9xQVs5kzbJmc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224710;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aea78dN0jE+3emgNi5p6he7Ee7f/Z0mac4ZTbIUZxGg=;
	b=LYfFVIyRAYj30kHb0ND64rZdz9xOdzfAKkGmvN9a5z35HQfyIKItibYgZBuUqY2v
	56q3WKpY2v89GlaIc6o/1zhsRyXvgeC6MNYuDWj8XO/ycmwoF9yZRQsnhX5oTD0eSQI
	fFJt4VLkKvWWgtVQAZ73yKHWIaLXB0dgjNTxYaqw=
Content-Type: multipart/mixed; boundary="===============1770512275509160786=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 go,go-runtime,go-cross-canadian-x86-64,go-crosssdk-x86_64-pokysdk-linux,go-cross-x86-64-v3:
 upgrading to 1.25.4,1.25.4,1.25.4,1.25.4,1.25.4 FAILED
Message-ID: <0101019a8861eb80-ed5e5643-a8bf-4ad2-a0e9-ccc42d32b43a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226307

--===============1770512275509160786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *go,go-runtime,go-cross-canadian-x86-64,go-crosssdk-x86_64-pokysdk-linux,go-cross-x86-64-v3* to *1.25.4,1.25.4,1.25.4,1.25.4,1.25.4* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-crosssdk-x86_64-pokysdk-linux -V 1.25.4
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1946 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (947 cached, 3 parsed). 1949 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-9e94d2fd8ca152596febf8637797608fa44a7634"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:9e94d2fd8ca152596febf8637797608fa44a7634"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-9e94d2fd8ca152596febf8637797608fa44a7634"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:9e94d2fd8ca152596febf8637797608fa44a7634"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://golang.org/dl/go1.25.4.src.tar.gz;name=main...
INFO: Rebasing devtool onto 3c2911349abcdcb10ce111e1aff671bd98a363e5
ERROR: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 93, in include_single_file
    bb.parse.handle(fn, data, True)
    ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py", line 119, in handle
    return h['handle'](fn, data, include, baseconfig)
           ~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 146, in handle
    abs_fn = resolve_file(fn, d)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py", line 139, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found in %s" % (fn, bbpath))
FileNotFoundError: [Errno 2] file go-64-pokysdk-linux.inc not found in /srv/pokybuild/yocto-worker/auh/build/build/workspace:/srv/pokybuild/yocto-worker/auh/build/layers/meta-yocto/meta-poky:/srv/pokybuild/yocto-worker/auh/build/build:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta:/srv/pokybuild/yocto-worker/auh/build/layers/meta-yocto/meta-yocto-bsp

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/command.py", line 91, in runCommand
    result = command_method(self, commandline)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/command.py", line 596, in parseRecipeFile
    envdata = command.cooker.databuilder.parseRecipe(virtualfn, appendfiles, layername)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 551, in parseRecipe
    datastores = self.parseRecipeVariants(virtualfn, appends, virtonly=True, layername=layername)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 525, in parseRecipeVariants
    return self._parse_recipe(bb_data, bbfile, appends, mc, layername)
           ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 513, in _parse_recipe
    return bb.parse.handle(bbfile, bb_data)
           ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py", line 119, in handle
    return h['handle'](fn, data, include, baseconfig)
           ~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 156, in handle
    statements.eval(d)
    ~~~~~~~~~~~~~~~^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/ast.py", line 20, in eval
    statement.eval(data)
    ~~~~~~~~~~~~~~^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/ast.py", line 42, in eval
    bb.parse.ConfHandler.include(self.filename, s, self.lineno, data, "include required")
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 70, in include
    include_single_file(parentfn, fn, lineno, data, error_out)
    ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 97, in include_single_file
    raise ParseError("Could not %s file %s" % (error_out, fn), parentfn, lineno)
bb.parse.ParseError: ParseError at /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/go-crosssdk-x86_64-pokysdk-linux/go-crosssdk-x86_64-pokysdk-linux_1.25.4.bb:2: Could not include required file go-64-pokysdk-linux.inc

ERROR: Parsing of upgraded recipe failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1770512275509160786==--

