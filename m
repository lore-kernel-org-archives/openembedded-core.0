Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313DFC27C5E
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1233.1715794337377341999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Xm6cnz9R;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fnYy4X63;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f7d4fdb35-859ee9a5-c9ef-444b-96f2-afde6d8f68dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eTgrqa2vb1GKesIaRQLzWAKoiK+WQYApkP+oDZC3hfI=;
	b=Xm6cnz9R+HBwVMtgL2gVag3UtCaHpgF4hlcGVVRPSazongjJ9olma6bwG4wJSX8A
	rRHmBRzomLTNYcAEqEx4kka7LbCskl4Vi9UfnfAB5S/MEvZXrvtItIjbV1YniftY7w0
	VLrZ1C5gDVb2Hki2sH6OzJwxTPUV8k/kcHUsctHU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794336;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eTgrqa2vb1GKesIaRQLzWAKoiK+WQYApkP+oDZC3hfI=;
	b=fnYy4X63Mbf8a61jFe/Z2rpnnem0wTy8B5ziQxsPB9NWArxhuu+NVbewLU7a8rBU
	VnSOLqNoE28dQIjmxNZmBz/1X/0dhym7CKCNa0YoQ5kyMlGf2n1YVmkHMTsAFOOELYt
	A4Rcqk/M/prQx+EGtjW0Tl17vu5w1sb2TQ4Sj06M=
Content-Type: multipart/mixed; boundary="===============7033300511865100457=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0-initial: upgrading to 2.80.2 FAILED
Message-ID: <0101018f7d4fdb35-859ee9a5-c9ef-444b-96f2-afde6d8f68dd-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199302

--===============7033300511865100457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0-initial* to *2.80.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f glib-2.0-initial /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1882 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.

INFO: Handling main branch (devtool)...
ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py", line 141, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/conf/layer.conf not found
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/cookerdata.py", line 162, in wrapped
    return func(fn, *args)
           ^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/cookerdata.py", line 179, in parse_config_file
    return bb.parse.handle(fn, data, include, baseconfig=True)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py", line 115, in handle
    return h['handle'](fn, data, include, baseconfig)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 119, in handle
    abs_fn = resolve_file(fn, data)
             ^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py", line 141, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/conf/layer.conf not found

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/scripts/devtool", line 350, in <module>
    ret = main()
          ^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/devtool", line 337, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/standard.py", line 2250, in finish
    updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/standard.py", line 1946, in _update_recipe
    updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/standard.py", line 1779, in _update_recipe_patch
    appendfile, destpath = oe.recipeutils.bbappend_recipe(
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/meta/lib/oe/recipeutils.py", line 721, in bbappend_recipe
    appendpath, pathok = get_bbappend_path(rd, destlayerdir, wildcardver)
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/meta/lib/oe/recipeutils.py", line 630, in get_bbappend_path
    confdata = bb.cookerdata.parse_config_file(destlayerconf, confdata)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/cookerdata.py", line 174, in wrapped
    raise bb.BBHandledException()
bb.BBHandledException


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7033300511865100457==--

