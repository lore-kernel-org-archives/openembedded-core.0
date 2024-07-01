Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5FAC3814E
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:57:58 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.2101.1719853075369659737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HskgNhG6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VdZ23wER;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101906f3b4704-b8462755-ba07-40d7-bb28-98972aa25ebd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853074;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=acIYvK9jxRJoGt6S67lvbGI20cMedqFTiZG2ATZiV2s=;
	b=HskgNhG6OdAo7aB8VbS0XZypW2wjlVGWsECVgGLc3jbvWQ7Kd4ib3XrtrGdk0VdK
	qpCpFMldmAzbiXxOjv43MI9/mOFYHGFl4ey0sIoNCv4Iht4uuuA8sXDTu+yRlj+KROi
	6ki28jxzcfZvor1gCoSTRRkJQYvttNMmIRc60Y14=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853074;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=acIYvK9jxRJoGt6S67lvbGI20cMedqFTiZG2ATZiV2s=;
	b=VdZ23wERvyQ0J3H1oBkiyzEj7R2jTg21IPZ9qYfR+Wa1WZdSW+fNHj9jpxUjDm43
	dBwUP81hMWBo4LF98QBZNSUoTSIRBm24YiGOsKty+1VLA6V97oaFWzb717MYU7Yvan0
	lSfW6i1nhCsOVj6jiwTLhmsCKAtdkDdPsxgiTDh0=
Content-Type: multipart/mixed; boundary="===============4938887646613470404=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0-initial: upgrading to 2.80.3 FAILED
Message-ID: <010101906f3b4704-b8462755-ba07-40d7-bb28-98972aa25ebd-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201315

--===============4938887646613470404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0-initial* to *2.80.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f glib-2.0-initial /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1881 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.

INFO: Handling main branch (devtool)...
ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py", line 145, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/conf/layer.conf not found
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/cookerdata.py", line 162, in wrapped
    return func(fn, *args)
           ^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/cookerdata.py", line 179, in parse_config_file
    return bb.parse.handle(fn, data, include, baseconfig=True)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py", line 119, in handle
    return h['handle'](fn, data, include, baseconfig)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 119, in handle
    abs_fn = resolve_file(fn, data)
             ^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py", line 145, in resolve_file
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
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/standard.py", line 2177, in finish
    updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/standard.py", line 1873, in _update_recipe
    updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/standard.py", line 1706, in _update_recipe_patch
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
--===============4938887646613470404==--

