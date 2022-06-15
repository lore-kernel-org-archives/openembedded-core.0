Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A2ECCA495
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.4418.1655298221249506284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VKrxy0Bj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101018167766164-801a0ad2-878a-4227-8a83-56edb97227ce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iPP8FB5XjKvZyVEBobG2I7rZaZAh+KMXIZtjfI/SgVw=;
	b=VKrxy0BjFe369YIj3hYm2Tjods4F2bZrzsjJ7asDOoLfFN7ykNhVnZcdu4q+yNqN
	qmZ5dtvwBHidr1NZ1besCnf4BaMlFR83iqvuAL9FhjNkzNiNQ6aNkZgXqjxMymW0mEd
	AGAf3r5bJjjhARMUd8hCHYajTWjEcPXUVLIyDxsQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iPP8FB5XjKvZyVEBobG2I7rZaZAh+KMXIZtjfI/SgVw=;
	b=kHA9cGkXtGglkjJNLTdbyerlDIksg70/OhxnUud2JnXhJ/TDrcxUO45TgaiJb0cW
	hIbMS2wx22230csKt0wUUMsMMN4S1ZXpg/1edpZPxUcZeABvQK85b78qBiBYABRTZt/
	I8PdEsGKI/jTzPErM0STo61seiS2LPMPL1AB9iv8=
Content-Type: multipart/mixed; boundary="===============1309289334729653423=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.6.0 FAILED
Message-ID: 
 <0101018167766164-801a0ad2-878a-4227-8a83-56edb97227ce-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166956

--===============1309289334729653423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.6.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.5.1-4.6.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1309289334729653423==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.5.1-4.6.0.patch"

From 8bd0126a8599e150e9c19c8e3d58e6a42981a9b4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 07:55:45 +0000
Subject: [PATCH] python3-jsonschema: upgrade 4.5.1 -> 4.6.0

---
 ...{python3-jsonschema_4.5.1.bb => python3-jsonschema_4.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.5.1.bb => python3-jsonschema_4.6.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.5.1.bb b/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.5.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb
index 9f8719870c..58bcbd4280 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.5.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "7c6d882619340c3347a1bf7315e147e6d3dae439033ae6383d6acb908c101dfc"
+SRC_URI[sha256sum] = "9d6397ba4a6c0bf0300736057f649e3e12ecbc07d3e81a0dacb72de4e9801957"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.31.1


--===============1309289334729653423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1642 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-fc4e91f17bb1ed6d20fa56f0664ff41f1e81ef03"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fc4e91f17bb1ed6d20fa56f0664ff41f1e81ef03"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 100 Local 93 Mirrors 0 Missed 7 Current 267 (93% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 992 of 1355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1342 of 1355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb:do_unpack)
NOTE: Running task 1343 of 1355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_unpack: Started
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1344 of 1355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb:do_patch)
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1345 of 1355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1346 of 1355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb:do_populate_lic)
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_populate_lic: Started
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1347 of 1355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb:do_configure)
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1348 of 1355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb:do_compile)
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.6.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/config/pyprojecttoml.py:102: _ExperimentalProjectMetadata: Support for project metadata in `pyproject.toml` is still experimental and may be removed (or change) in future releases.
|   warnings.warn(msg, _ExperimentalProjectMetadata)
| error: Multiple top-level packages discovered in a flat-layout: ['json', 'jsonschema'].
| 
| To avoid accidental inclusion of unwanted files or directories,
| setuptools will not proceed with this build.
| 
| If you are trying to create a single distribution with multiple packages
| on purpose, you should not rely on automatic discovery.
| Instead, consider the following options:
| 
| 1. set up custom discovery (`find` directive with `include` or `exclude`)
| 2. use a `src-layout`
| 3. explicitly set `py_modules` or `packages` with a list of names
| 
| To find more information, look for "package discovery" on setuptools docs.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.6.0-r0/temp/run.do_compile.4125957:159 exit 1 from 'nativepython3 -c "import setuptools.build_meta as api; api.build_wheel('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.6.0-r0/dist')"'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.6.0-r0/temp/run.do_compile.4125957, line 159
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.6.0-r0/temp/run.do_compile.4125957, line 153
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.6.0-r0/temp/run.do_compile.4125957, line 163
NOTE: recipe python3-jsonschema-4.6.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1348 tasks of which 1340 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-jsonschema-4.6.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.6.0-r0/temp/run.do_compile.4125957', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.6.0-r0/temp/log.do_compile.4125957
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb:do_compile) failed with exit code '1'

--===============1309289334729653423==--

