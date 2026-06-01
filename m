Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AB6CD6E7E
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:43 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1559.1780328132630584587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EuUyDtVy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nQRMgo5L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e83d36d24-e25d1ce3-a6a1-416b-9a98-10217fa89031-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328132;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZIJ0TQbklvsttX8SPfdFRT87ipocc/jLM9eG8Cs5nx0=;
	b=EuUyDtVyletBU1Nq+xFwwpt6/dVff9AT4bDIFGmzXVr+KW2JU/662W3COOQtV8LN
	4Dc15min5n5hzb+b/OIwoWaZ7DdWooSz1M20PmS1qH5DJY507DW/NAS8ztlfbmvgoOr
	Qum2zZiKaQVNVnTzH9hbnjlmBcvVbcoeX8c2lIDU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328132;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZIJ0TQbklvsttX8SPfdFRT87ipocc/jLM9eG8Cs5nx0=;
	b=nQRMgo5LdUQgxUsXSQENWIMU+zaBcmSr/Eo4qJ9zIFGfJWpoECvn5Tk5O6QRcFna
	u+6LnM8neQbU1TI+Y1tFoXajKZ1WkBvJ1Ul6fmJfz/SU/hN4XELuFsWTvZrRK19tH17
	LgtFbsyScRs+uP6XT3civ7GTyCzjt88Fw1wxUHTQ=
Content-Type: multipart/mixed; boundary="===============4924607238271929370=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>, 
	Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap,systemtap-native: upgrading to 5.5,5.5 FAILED
Message-ID: <0101019e83d36d24-e25d1ce3-a6a1-416b-9a98-10217fa89031-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237856

--===============4924607238271929370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemtap,systemtap-native* to *5.5,5.5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade systemtap-native -V 5.5 -S 90b164cf106ef16f873ab58c8c6f653718bb6e17
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1975 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (950 cached, 1 parsed). 1977 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-9c2d4eb57341fb18cb05c2e849483e262a0e3c59"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9c2d4eb57341fb18cb05c2e849483e262a0e3c59"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 90b164cf106ef16f873ab58c8c6f653718bb6e17
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
FileNotFoundError: [Errno 2] file systemtap_5.5.bb not found in /srv/pokybuild/yocto-worker/auh/build/build/workspace:/srv/pokybuild/yocto-worker/auh/build/layers/meta-yocto/meta-poky:/srv/pokybuild/yocto-worker/auh/build/build:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta:/srv/pokybuild/yocto-worker/auh/build/layers/meta-yocto/meta-yocto-bsp

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/command.py", line 91, in runCommand
    result = command_method(self, commandline)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/command.py", line 596, in parseRecipeFile
    envdata = command.cooker.databuilder.parseRecipe(virtualfn, appendfiles, layername)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 561, in parseRecipe
    datastores = self.parseRecipeVariants(virtualfn, appends, virtonly=True, layername=layername)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 535, in parseRecipeVariants
    return self._parse_recipe(bb_data, bbfile, appends, mc, layername)
           ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 523, in _parse_recipe
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
bb.parse.ParseError: ParseError at /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemtap-native/systemtap-native_5.5.bb:1: Could not include required file systemtap_5.5.bb

ERROR: Parsing of upgraded recipe failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4924607238271929370==--

