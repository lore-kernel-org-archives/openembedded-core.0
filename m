Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D50D5C0EB
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:26 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17388.1765872134050108079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2aLLM+t1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FNbof561;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262e648b-34bff0ab-e17e-44b5-a95a-e7af16922f7e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872133;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TS6+Gylswaco74yRw0h8mhfo3ED1etulEUW8bJbtz+g=;
	b=2aLLM+t1IZNEhtVYKTqP9xSLSAWq4sN0RCZaPwsbVMUzO0nEMBlcGdOoz8fMAuH2
	Irt0rTLaZ9cxf54p48VfQqpS7GueBYb/mnDcgAa6CMVIkoPXgT90G7Sn9Lgg/eYYNjD
	U7rHQrrfY34kmvQlw1HgYASNe8xoDElrYvwE4378=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872133;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TS6+Gylswaco74yRw0h8mhfo3ED1etulEUW8bJbtz+g=;
	b=FNbof561beN/SCET1LMY0UFhfTz6i2skNeGHat7Oz7p2+zogn5ihimSoPo/peOA4
	kSnS5oCpsUPNoqbHUyBUc940J0iM7WVG3lnl39ICcpXIjDTITodv2uTu9YUf45OCj2j
	6pT5C/+MZfMigkLfxoCeaJ4PtWG6m9gdkpeF9cwA=
Content-Type: multipart/mixed; boundary="===============0930385114331338267=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>, 
	Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap-native,systemtap: upgrading to 5.4,5.4 FAILED
Message-ID: <0101019b262e648b-34bff0ab-e17e-44b5-a95a-e7af16922f7e-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227772

--===============0930385114331338267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemtap-native,systemtap* to *5.4,5.4* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade systemtap-native -V 5.4 -S 911a1354aac264651fda932061e7f20d2ecc2471
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-8692659cb1dcec87f4e54d45648aa2d496c36303"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:8692659cb1dcec87f4e54d45648aa2d496c36303"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
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
INFO: Rebasing devtool onto 911a1354aac264651fda932061e7f20d2ecc2471
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
FileNotFoundError: [Errno 2] file systemtap_5.4.bb not found in /srv/pokybuild/yocto-worker/auh/build/build/workspace:/srv/pokybuild/yocto-worker/auh/build/layers/meta-yocto/meta-poky:/srv/pokybuild/yocto-worker/auh/build/build:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta:/srv/pokybuild/yocto-worker/auh/build/layers/meta-yocto/meta-yocto-bsp

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/command.py", line 91, in runCommand
    result = command_method(self, commandline)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/command.py", line 596, in parseRecipeFile
    envdata = command.cooker.databuilder.parseRecipe(virtualfn, appendfiles, layername)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 559, in parseRecipe
    datastores = self.parseRecipeVariants(virtualfn, appends, virtonly=True, layername=layername)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 533, in parseRecipeVariants
    return self._parse_recipe(bb_data, bbfile, appends, mc, layername)
           ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 521, in _parse_recipe
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
bb.parse.ParseError: ParseError at /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemtap-native/systemtap-native_5.4.bb:1: Could not include required file systemtap_5.4.bb

ERROR: Parsing of upgraded recipe failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0930385114331338267==--

