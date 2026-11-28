Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2773.1795845422084491375
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 21:57:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y1Mu60zj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Hmrvw+K+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a220ba7814-583d2dd0-74b9-4181-82f5-dbb2e0d24748-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795845421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cI+NymPbomQS1CBBr8bXKs1uSf6wBQvOUaymw0XnlIM=;
	b=Y1Mu60zjtk+IekogI/OsuxJd7q9M9eLuRwQwLsFMMZNqU3hUSz/Xfo3rI8XZfawL
	SC5r7Vrn9tt2CWGSGz2L1mx95livbsO5EexYqJAbWAm7Dz2F9nY/0RFxqMGJcC4Vxsn
	EpjMolWtQV0qFquw3C3Xsx8Q5nxCx7Plz5weJoeg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795845421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cI+NymPbomQS1CBBr8bXKs1uSf6wBQvOUaymw0XnlIM=;
	b=Hmrvw+K+rMtLfso8+SwGX0dhb8gWOcKKShjN6KObla3B7RyOelqz7QcHzRd+2+t2
	ytkjWzWfosNKw8kKCAR/Mc6tPa+5+XHpq+9Zu5bH80VpKdSpI9JF2YmunEGkBDG8nfi
	EnIaWq/+s0aG/v0uY8A/eGcSxxhT8scjrd+pHnlA=
Content-Type: multipart/mixed; boundary="===============5806850457388670898=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust-source-1.100.0: upgrading to 1.100.1 FAILED
Message-ID: <010101a220ba7814-583d2dd0-74b9-4181-82f5-dbb2e0d24748-000000@us-west-2.amazonses.com>
Date: Sat, 28 Nov 2026 05:57:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.28-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 05:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251476

--===============5806850457388670898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rust-source-1.100.0* to *1.100.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f rust-source-1.100.0 /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 2014 entries from dependency cache.
Parsing recipes...done.
Parsing of 964 .bb files complete (963 cached, 1 parsed). 2015 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the x86-64-v3 sysroot...done.

ERROR: Unable to parse /srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py", line 149, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/conf/layer.conf not found
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 170, in wrapped
    return func(fn, *args)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/cookerdata.py", line 187, in parse_config_file
    return bb.parse.handle(fn, data, include, baseconfig=True)
           ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py", line 123, in handle
    return h['handle'](fn, data, include, baseconfig)
           ~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 121, in handle
    abs_fn = resolve_file(fn, data)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/parse/__init__.py", line 149, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/conf/layer.conf not found

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 352, in <module>
    ret = main()
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/standard.py", line 2220, in finish
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
--===============5806850457388670898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="rust-source-1.100.0-changelog.txt"

Version 1.100.1 (2026-11-27)
==========================

<a id="1.100.1"></a>

- [library: fix regression where some types were not inferred as having
  `Iterator` impls]( )
  - This backports a change to the unstable `const` version of `Iterator`, which
    unintentionally caused existing code to not be seen as implementing
    `Iterator`
    when a valid implementation was present.

- [`Box::into_raw_with_allocator`](https://doc.rust-
  lang.org/stable/std/boxed/struct.Box.html#method.into_raw_with_allocator)
- [`Vec::from_parts_in`](https://doc.rust-
  lang.org/stable/std/vec/struct.Vec.html#method.from_parts_in)

--===============5806850457388670898==--
