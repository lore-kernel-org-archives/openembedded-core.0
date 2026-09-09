Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4519C79FAD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 05:42:33 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5153.1788932545211665751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 22:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=T1yhoHJB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GSIVsAu3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a084b05557-929a07ec-29f5-46ae-be72-e4763bbafabf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788932544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xSUSHZAUhjAC0fD939UA9s1To1lf0Xw7IYerD/MXi6I=;
	b=T1yhoHJBNR4cniPzMDxZ6Q/ZML1SDW3Uy50OLm/bNThDtmzzVQSY6ZxtP2eDyUPe
	kOkkxw1no7dFORdDykpXJIYhG338dSgFLakuh1w9msIwjujwiM5tStYQzp/k+CGSwFR
	txllmbWklwBwoL2fDzGRMbIM02NsKhk7swSaDhvI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788932544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xSUSHZAUhjAC0fD939UA9s1To1lf0Xw7IYerD/MXi6I=;
	b=GSIVsAu3ulBpOa1uDQ6Lj/yuPZn8Zn9pL1ezAYAhuD12Bi8Ka96AZXOCgAmBNgJ8
	5CPUph2G+JvlRpZKd1Z6UQ1dwvdX9UqmLUvJtbvJ1647NtxrhfhSDQX1s3k6AYYITI9
	asMtAUoLhgmed63qaploJQODODUySNtWrLLNY4YU=
Content-Type: multipart/mixed; boundary="===============7769724934876288695=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm-project-source-23.1.0: upgrading to 23.1.1 FAILED
Message-ID: <010101a084b05557-929a07ec-29f5-46ae-be72-e4763bbafabf-000000@us-west-2.amazonses.com>
Date: Wed, 9 Sep 2026 05:42:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.09-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 05:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245394

--===============7769724934876288695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm-project-source-23.1.0* to *23.1.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f llvm-project-source-23.1.0 /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1990 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (957 cached, 2 parsed). 1991 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86-64-v3 sysroot...done.

ERROR: Unable to parse /srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py", line 145, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/conf/layer.conf not found
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 170, in wrapped
    return func(fn, *args)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 187, in parse_config_file
    return bb.parse.handle(fn, data, include, baseconfig=True)
           ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py", line 119, in handle
    return h['handle'](fn, data, include, baseconfig)
           ~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 121, in handle
    abs_fn = resolve_file(fn, data)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py", line 145, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/conf/layer.conf not found

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 352, in <module>
    ret = main()
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/standard.py", line 2217, in finish
    updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
                                   ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/standard.py", line 1906, in _update_recipe
    updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
                                ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/standard.py", line 1728, in _update_recipe_patch
    appendfile, destpath = oe.recipeutils.bbappend_recipe(
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
                    rd, appendlayerdir, files,
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^
    ...<2 lines>...
                    redirect_output=dry_run_outdir,
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                    params=params)
                    ^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/lib/oe/recipeutils.py", line 721, in bbappend_recipe
    appendpath, pathok = get_bbappend_path(rd, destlayerdir, wildcardver)
                         ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/lib/oe/recipeutils.py", line 630, in get_bbappend_path
    confdata = bb.cookerdata.parse_config_file(destlayerconf, confdata)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 182, in wrapped
    raise bb.BBHandledException()
bb.BBHandledException


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7769724934876288695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="llvm-project-source-23.1.0-changelog.txt"

Changelog for llvm-project-source-23.1.0: 23.1.0 -> 23.1.1
Source: clang/docs/ReleaseNotes.md

- Fixed `-Wunused-parameter` to diagnose coroutine parameters that are only
  considered during allocation function lookup or promise object
  initialization, while not diagnosing parameters passed to the selected
  allocation function or promise constructor. (#GH217501)

--===============7769724934876288695==--

