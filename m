Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF0EC32765
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web12.6338.1660589821134962404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OEltK/Aa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010182a2ddca11-e5ef3851-5a7a-46eb-929d-89b3c58dd3e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZFpsu1rtgHJL5mV0UxrXicEi9lt08WCDpvvwlD05nc8=;
	b=OEltK/Aa7ML30rsmR6+SlufUD1y5CG8hwSm2Jg/YVP8KY+n0f+WYV2ZdwrB0BFs8
	8kWCcs5ieAh5F6/Ejs6xTfDzCoojw/2x9h+GUJd71Z27Eg/5RBlR/Qa+8C6dkUA3epR
	llrqleSiaFk2PPbZMjFie+KXuMwuJtHytiXbWpHA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZFpsu1rtgHJL5mV0UxrXicEi9lt08WCDpvvwlD05nc8=;
	b=DKbWdIyRCWCSJRPGMi8yl+sr1sYkVwS2H4qLZ2I09M3d9B6cNCMNisXM7hfLEjXw
	wWCDkUxMUdm/xBSA69Lhm2pHqW9lukTGqseuTHjCbljDT3AsOTx5+gmix4FIo2ZOh7S
	jWNsOmwghtq3tvkXqE9Fv2Vrep1Vuq8CVoh9Ftvo=
Content-Type: multipart/mixed; boundary="===============6958065218533294098=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust: upgrading to 1.63.0 FAILED
Message-ID: 
 <01010182a2ddca11-e5ef3851-5a7a-46eb-929d-89b3c58dd3e9-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:00 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169380

--===============6958065218533294098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rust* to *1.63.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f rust /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.

INFO: Handling main branch (devtool)...
INFO: No patches or local source files needed updating
INFO: Handling branch devtool-override-class-nativesdk...
ERROR: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 162, in wrapped
    return func(fn, *args)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 187, in parse_config_file
    return bb.parse.handle(fn, data, include)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 107, in handle
    return h['handle'](fn, data, include)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 118, in handle
    abs_fn = resolve_file(fn, data)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 133, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found

ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 162, in wrapped
    return func(fn, *args)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 187, in parse_config_file
    return bb.parse.handle(fn, data, include)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 107, in handle
    return h['handle'](fn, data, include)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 118, in handle
    abs_fn = resolve_file(fn, data)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 133, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 338, in <module>
    ret = main()
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 325, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 2123, in finish
    updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1829, in _update_recipe
    updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1686, in _update_recipe_patch
    params=[patchdir_params] * len(files))
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/recipeutils.py", line 708, in bbappend_recipe
    appendpath, pathok = get_bbappend_path(rd, destlayerdir, wildcardver)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/recipeutils.py", line 632, in get_bbappend_path
    confdata = bb.cookerdata.parse_config_file(destlayerconf, confdata)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 167, in wrapped
    raise bb.BBHandledException()
bb.BBHandledException


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6958065218533294098==--

