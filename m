Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82820C79F84
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 05:38:24 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7599.1788500295386713235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 22:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HBWG8e26;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TtHCDKJ3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a06aecbb2f-9220a113-93ae-4b6b-abc6-ddea1e196874-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788500294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r/Q0bcHxMVlUbNR54JvhimPp7mHxbml7eVyiBVc8R4w=;
	b=HBWG8e26cNFw2vxF4czUu47Jicpmnm/9Q7Mef2FKgGIN64X6m+hsuH0ssW8Gm6Tp
	L8COlcogi3U6Ro1C05L/6SHzAdGVxM56ldo9XyOfO85MNb6vYD/yZjgQsgolEcOVGpG
	sHVZyNYrAz90OYcFaRte2aKidAd9w9vM6kNXBVJw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788500294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r/Q0bcHxMVlUbNR54JvhimPp7mHxbml7eVyiBVc8R4w=;
	b=TtHCDKJ32ji2D84Gk0AD9Mfnz1sHZ0bzH9utQzmcHtgezGck2oenZPPh+5UrMqwg
	rqouok64uZ7fdb5+E3Pqyptu3jKC8vssD4zjPaTaGuNtJ+o3Sqxdkf7z4tL3ylc6SOP
	0E54xUX+smpP09nNVDi+bdLmmjd1SrZvmllveLhg=
Content-Type: multipart/mixed; boundary="===============1443765523469493737=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust-source-1.98.0: upgrading to 1.98.1 FAILED
Message-ID: <010101a06aecbb2f-9220a113-93ae-4b6b-abc6-ddea1e196874-000000@us-west-2.amazonses.com>
Date: Fri, 4 Sep 2026 05:38:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.04-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 05:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245055

--===============1443765523469493737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rust-source-1.98.0* to *1.98.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f rust-source-1.98.0 /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1988 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (958 cached, 1 parsed). 1989 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86-64-v3 sysroot...done.

ERROR: Unable to parse /srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py", line 145, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/conf/layer.conf not found
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
FileNotFoundError: [Errno 2] file /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/conf/layer.conf not found

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
--===============1443765523469493737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="rust-source-1.98.0-changelog.txt"

Changelog for rust-source-1.98.0: 1.98.0 -> 1.98.1
Source: RELEASES.md

Version 1.98.1 (2026-09-03)
===========================

<a id="1.98.1"></a>

* [rustc: fix miscompilation in generating vtables](https://github.com/rust-lang/rust/issues/161441)

--===============1443765523469493737==--

