Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D48D5C0CC
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17179.1765872132136240971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Rffnss9t;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=qgzOu1W4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262e5cfe-d10d6f6b-dd78-4467-9499-21232ed1f24b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872131;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lK5MocGKZXAD++Y5bXeTbw4k90628XFqawgmF4Uw8HE=;
	b=Rffnss9tUiabNqU5dW4+YMBx4sg9w8F9idNs7JbnqhLfj3m8DkbITsQGvlxweHqU
	i3FIAqkfh9fbQD61T1I826NoK5+R3qlV4CPuvEAFcaoubag7E2v0dkX4PuH90E/3KEm
	CdOb3WWxXfTBuweoOZQQNW55bEeQS5/52U1cog5I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872131;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lK5MocGKZXAD++Y5bXeTbw4k90628XFqawgmF4Uw8HE=;
	b=qgzOu1W4EiDEE/frqtl8cvO6pgKfZrpFqjKen+T6X5Y6WkGoI1U/8mTlmmBwSC1e
	OvKsc4ECULIHmIDNcePnb6ol4fDbTRKM93CdMy13A0/y4phLxAxxrZv4LHqHPUtlbaE
	rQLRKUJuoPDatqz6f9w7/H8g+1eqeqPXS6pWKTqo=
Content-Type: multipart/mixed; boundary="===============7877456464837458262=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust,cargo,libstd-rs: upgrading to 1.92.0,1.92.0,1.92.0 FAILED
Message-ID: <0101019b262e5cfe-d10d6f6b-dd78-4467-9499-21232ed1f24b-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227768

--===============7877456464837458262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rust,cargo,libstd-rs* to *1.92.0,1.92.0,1.92.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f rust /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1954 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (949 cached, 3 parsed). 1958 targets, 47 skipped, 0 masked, 0 errors.
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
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/standard.py", line 2177, in finish
    updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
                                   ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/standard.py", line 1874, in _update_recipe
    updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
                                ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/standard.py", line 1703, in _update_recipe_patch
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
--===============7877456464837458262==--

