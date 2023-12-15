Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223D9C4828D
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.63610.1702649863489767398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ah00OrIf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pM630Ji6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018c6dd719ce-db98cc6b-7893-4399-825b-7c3628e03382-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cd4RquJEhObbvRHUHem/tTm4XQzZZUe0PNcK/aCNOwI=;
	b=ah00OrIfmzLljx6/kH5bqE+mwU0y+8f8nzWveZ7K9IqiL6/MJYeZ/gv8AMRKN+1+
	xzbg5BcUcE/w1YSKZEAmR6rNoi298QikhtallCQwGlilnK2Rni3/zhl4dgzis8wAZvI
	Sa0c2nXkyIgtQwySemEtFWYzabHbgoN50qt0jHNg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cd4RquJEhObbvRHUHem/tTm4XQzZZUe0PNcK/aCNOwI=;
	b=pM630Ji6km9NJ67wB+9KqT/xBdWTY/5iL/O/pE2ZoBh8klAUMDz/A4Av8NBU3GkX
	D9mS+VZ2ne9aP+hKF22HScOaYZ4UBo+07TsmhLcBOoEwRRcrGj4hO10ih2d8x1JdcqU
	4s0zqn/rdns1hf1G6qnCJeexIzgifBaOzwmvsm8I=
Content-Type: multipart/mixed; boundary="===============1418990272077510392=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdb: upgrading to 14.1 FAILED
Message-ID: <0101018c6dd719ce-db98cc6b-7893-4399-825b-7c3628e03382-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:42 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192455

--===============1418990272077510392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gdb* to *14.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f gdb /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.

ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/bitbake/lib/bb/parse/__init__.py", line 141, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/conf/layer.conf not found
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
FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/conf/layer.conf not found

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/scripts/devtool", line 349, in <module>
    ret = main()
          ^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/devtool", line 336, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/standard.py", line 2217, in finish
    updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/standard.py", line 1913, in _update_recipe
    updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/standard.py", line 1749, in _update_recipe_patch
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
--===============1418990272077510392==--

