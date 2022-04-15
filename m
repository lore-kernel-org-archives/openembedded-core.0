Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D6BC38A2E
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web09.11571.1650052688488168978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NOaSs6+H;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 010101802ecde710-c254df7b-694b-4dcd-94eb-89f93b15602a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lIYNOvlCZAeyNG/dWZXABOieKErsa8AmxqqOJ73ECVM=;
	b=NOaSs6+HEdc3UEvioHmWrstfxNSRhIzWSjOoqWeHpceurfyGddIvDShkGR4b1fRP
	qhPYX/LXznF3wB2PBtr538lsU9/C2xNGMYlmlkliT/7MB4n4IQ4wEZtBQUML9M2Bzwm
	vdUgnyabNwXWZoUtHpijQVJCj+l113X8XBCqF8J8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lIYNOvlCZAeyNG/dWZXABOieKErsa8AmxqqOJ73ECVM=;
	b=U/b8l2NyWXtMG/hHtEakonOvvfD8LIIGtIbCOcbVKm75X38+iL/K9YtPSYKpfDQY
	psAomI7/HA69PgRtrgmLi+/9Q11z0o7Qe9isdSml1W/di91qGPnrT4nf2Kc5m33/hkz
	V2080AKVOakVaHHukPMWi0YzhWjARoboufoqBIDU=
Content-Type: multipart/mixed; boundary="===============2092971625908097254=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust-llvm: upgrading to 1.60.0 FAILED
Message-ID: 
 <010101802ecde710-c254df7b-694b-4dcd-94eb-89f93b15602a-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:07 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164479

--===============2092971625908097254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rust-llvm* to *1.60.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f rust-llvm /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (882 cached, 1 parsed). 1642 targets, 34 skipped, 0 masked, 0 errors.

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
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 334, in <module>
    ret = main()
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 321, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 2108, in finish
    updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1814, in _update_recipe
    updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1671, in _update_recipe_patch
    redirect_output=dry_run_outdir)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/recipeutils.py", line 705, in bbappend_recipe
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
--===============2092971625908097254==--

