Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.1306.1618510599802092869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id C66D138C13C3
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] adwaita-icon-theme: upgrading to 3.38.0 FAILED
Message-ID: <MADEUP.16761AD14AB53793.25572@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============5271671685575561888=="

--===============5271671685575561888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *adwaita-icon-theme* to *3.38.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f adwaita-icon-theme /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...done.
Parsing of 815 .bb files complete (813 cached, 2 parsed). 1441 targets, 31 skipped, 0 masked, 0 errors.
ERROR: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 162, in wrapped
    return func(fn, *args)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 187, in parse_config_file
    return bb.parse.handle(fn, data, include)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 107, in handle
    return h['handle'](fn, data, include)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 121, in handle
    abs_fn = resolve_file(fn, data)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 131, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/conf/layer.conf not found

ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/conf/layer.conf: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/conf/layer.conf not found
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 162, in wrapped
    return func(fn, *args)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 187, in parse_config_file
    return bb.parse.handle(fn, data, include)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 107, in handle
    return h['handle'](fn, data, include)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 121, in handle
    abs_fn = resolve_file(fn, data)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 131, in resolve_file
    raise IOError(errno.ENOENT, "file %s not found" % fn)
FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/conf/layer.conf not found

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 334, in <module>
    ret = main()
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 321, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 2112, in finish
    updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1818, in _update_recipe
    updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1675, in _update_recipe_patch
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

--===============5271671685575561888==--
