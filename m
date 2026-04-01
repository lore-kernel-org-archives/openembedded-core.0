Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42A810F3DCD
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:04 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14644.1775054155743588537
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KyMl73ru;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pmRg4R7H;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019d4978eccb-071abb63-13af-4c26-b255-7b1334a0f963-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SXlaKQp6Y5YcwzO6wrZ3bes95vFzlA+cDXhqHWgNfUI=;
	b=KyMl73ru9u+kHp9rS3L0NmJm0v+0XS8YOEStQjOGFw68+xXhFE0RdXfN5LM6vrr7
	BAapklJjWE3utuyiLXOsKAk013/z8UQjVrPD2eU9Iv6ZfuCMh+b9h7WZ2o81mfdmzxs
	O1kE4g6EbXbAR58UeLnwd+xssGTmL91idsc2vup0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SXlaKQp6Y5YcwzO6wrZ3bes95vFzlA+cDXhqHWgNfUI=;
	b=pmRg4R7H7UEvBbHmC2jYJtaukv/WH8FLv+5z121IIyxu5Fdw/8TZ/vMkoKTcV+so
	0I3yO0wIDOcM++h6aQdAbeYha/FqgS6wiYAN0Vc6aWZmIcTUz/dyHQ6suo3NErMCT8G
	GVBecK79pj1S4L+JKKQhL0uW6EGJLfuln+O8bH00=
Content-Type: multipart/mixed; boundary="===============4185749507915027137=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libstd-rs,rust,cargo: upgrading to 1.94.1,1.94.1,1.94.1 FAILED
Message-ID: <0101019d4978eccb-071abb63-13af-4c26-b255-7b1334a0f963-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:35:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234358

--===============4185749507915027137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libstd-rs,rust,cargo* to *1.94.1,1.94.1,1.94.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f libstd-rs /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1973 entries from dependency cache.
Parsing recipes...done.
Parsing of 954 .bb files complete (951 cached, 3 parsed). 1978 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86-64-v3 sysroot...done.

ERROR: Unable to parse /srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py", line 145, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/conf/layer.conf not found
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 164, in wrapped
    return func(fn, *args)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 181, in parse_config_file
    return bb.parse.handle(fn, data, include, baseconfig=True)
           ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py", line 119, in handle
    return h['handle'](fn, data, include, baseconfig)
           ~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 121, in handle
    abs_fn = resolve_file(fn, data)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py", line 145, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/conf/layer.conf not found

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 352, in <module>
    ret = main()
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/standard.py", line 2183, in finish
    updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
                                   ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/standard.py", line 1880, in _update_recipe
    updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
                                ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/standard.py", line 1709, in _update_recipe_patch
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
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 176, in wrapped
    raise bb.BBHandledException()
bb.BBHandledException


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4185749507915027137==--

