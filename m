Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E60CC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:47:41 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34046.1785908854766267934
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dxf8yBK0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fAqAeITF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019fd0767c62-9467413b-e5ff-4fcf-b992-51f901d63ce3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785908854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dbaCmXrtCIyE7DR0Sdbua2tOUnSQmdegqgqciw4yeeo=;
	b=dxf8yBK0XxU53miFr3F10UMgHwidCQZqodlSQCprOlu6S/wHhEscC8eHdNkBkZhT
	PLCsopdUtftAXsTRLP4VQ4W+pI74M8CuHK3iwXObV0ZXiSOhokqMwnkA6RVuVSTq5yd
	rtzGQIRaAO9ZCMejoUJ/lvZ2ZwGNUdQ28UosRwNI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785908854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dbaCmXrtCIyE7DR0Sdbua2tOUnSQmdegqgqciw4yeeo=;
	b=fAqAeITFVCtaALTLk81Br8n9O4jgDnY7FOeDaB4bz4jJq4ybz4oQp8HdvOAPye8L
	7XI7bWUVYJ33FtNjUan0MTz3PInobiPGhLKOJ1VUVF/xYrAlEZHDbxzB2/CS+I+h3cM
	z82NcybjJd9j0NXa1NEXcCJRNIjWxopG8L+lj8Uc=
Content-Type: multipart/mixed; boundary="===============8373764880802233771=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 26.2.1 SUCCEEDED
Message-ID: <0101019fd0767c62-9467413b-e5ff-4fcf-b992-51f901d63ce3-000000@us-west-2.amazonses.com>
Date: Wed, 5 Aug 2026 05:47:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 05:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242819

--===============8373764880802233771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pip* to *26.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-26.1.2-26.2.1.patch
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

-- >8 --
From 7313e7a584da2d115a396b25d83b5087e736fae3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Aug 2026 05:41:16 +0000
Subject: [PATCH] python3-pip: upgrade 26.1.2 -> 26.2.1

Source: NEWS.rst

26.2.1 (2026-08-04)
===================

Bug Fixes
---------

- Reallow keyring installed in a (non-activated) virtual environment to be be used
  via the ``import`` provider method while installing build dependencies. (`#14227 <https://github.com/pypa/pip/issues/14227>`_)

26.2 (2026-07-29)
=================

Deprecations and Removals
-------------------------

- Newly published packages will no longer be immediately visible to pip
  if the index uses caching. To install a newly published package, use
  ``--refresh-package``. (`#13680 <https://github.com/pypa/pip/issues/13680>`_)
- Drop support for detecting legacy, non-:pep:`405`, ``virtualenv`` (< 20)
  environments. (`#14062 <https://github.com/pypa/pip/issues/14062>`_)
- Constraints files, including ``PIP_CONSTRAINT``, no longer affect isolated
  build environments. Use ``--build-constraint`` or the ``PIP_BUILD_CONSTRAINT``
  environment variable to constrain build dependencies instead.

  The ``--use-feature=build-constraint`` flag is now always enabled and has no
  effect. (`#14094 <https://github.com/pypa/pip/issues/14094>`_)

Features
--------

- Declare support for Python 3.15 (`#14208 <https://github.com/pypa/pip/issues/14208>`_)
- Support self-referential extras officially. pip has supported this by accident since version 21.2. (`#11296 <https://github.com/pypa/pip/issues/11296>`_)
- Add ``--only-deps`` flag to instruct pip to select only the dependencies
  of supplied packages. It cannot be used with ``--no-deps``, ``-r``, ``--group``,
  or ``--requirements-from-script``. (`#11440 <https://github.com/pypa/pip/issues/11440>`_)
- Cache simple responses in accordance to their ``Cache-Control`` header
  instead of always revalidating on every request. To refresh cached package index responses
  and ensure newly published packages are found, use ``--refresh-package <package>``. (`#13680 <https://github.com/pypa/pip/issues/13680>`_)
- Add ``--no-require-hashes`` to disable automatic enablement of
  ``--require-hashes`` when encountering a requirement with hashes. (`#14169 <https://github.com/pypa/pip/issues/14169>`_)
- Honor ``--only-final`` when sourcing requirements with ``-r pylock.toml``. (`#13950 <https://github.com/pypa/pip/issues/13950>`_)
- Add support for ``pylock.toml`` ``upload-time`` field, so ``--uploaded-prior-to`` works with ``-r pylock.toml``. (`#14168 <https://github.com/pypa/pip/issues/14168>`_)
- Better error messages in case of conflicts with requirements from ``-r pylock.toml``. (`#13963 <https://github.com/pypa/pip/issues/13963>`_)
- Add experimental support for isolating build subprocesses by creating standard
  virtual environments. This will fix most (if not all) subtle isolation issues
  that can lead to broken builds exclusive to pip. The feature can be enabled
  via ``--use-feature=venv-isolation`` and will be enabled by default in a future
  release.

  Note that the feature has limited compatibility with ``--use-feature=inprocess-build-deps``

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../python3-pip/no_shebang_mangling.patch     |  8 +++---
 ...n3-pip_26.1.2.bb => python3-pip_26.2.1.bb} | 25 +++++++++++++++++--
 2 files changed, 27 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.1.2.bb => python3-pip_26.2.1.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index e8b2982b2a..4b61e94835 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From e4e1fed9f8e3ff3e04467699f36599f76caa9487 Mon Sep 17 00:00:00 2001
+From 545460879e2fbcb30b48b893a3efadb6f652e238 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific config]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/pip/_vendor/distlib/scripts.py b/src/pip/_vendor/distlib/scripts.py
-index 195dc3f..a0e0d61 100644
+index ac9e909..1faa5b6 100644
 --- a/src/pip/_vendor/distlib/scripts.py
 +++ b/src/pip/_vendor/distlib/scripts.py
-@@ -155,6 +155,8 @@ class ScriptMaker(object):
+@@ -157,6 +157,8 @@ class ScriptMaker(object):
          See also: http://www.in-ulm.de/~mascheck/various/shebang/#length
                    https://hg.mozilla.org/mozilla-central/file/tip/mach
          """
@@ -25,7 +25,7 @@ index 195dc3f..a0e0d61 100644
          if os.name != 'posix':
              simple_shebang = True
          elif getattr(sys, "cross_compiling", False):
-@@ -363,7 +365,7 @@ class ScriptMaker(object):
+@@ -367,7 +369,7 @@ class ScriptMaker(object):
                  return
  
              match = FIRST_LINE_RE.match(first_line.replace(b'\r\n', b'\n'))
diff --git a/meta/recipes-devtools/python/python3-pip_26.1.2.bb b/meta/recipes-devtools/python/python3-pip_26.2.1.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-pip_26.1.2.bb
rename to meta/recipes-devtools/python/python3-pip_26.2.1.bb
index 945aad1834..d2658c941e 100644
--- a/meta/recipes-devtools/python/python3-pip_26.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.2.1.bb
@@ -1,3 +1,24 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- src/pip/_vendor/idna/LICENSE.md
+# +++ src/pip/_vendor/idna/LICENSE.md
+# @@ -1,6 +1,6 @@
+#  BSD 3-Clause License
+#  
+# -Copyright (c) 2013-2025, Kim Davies and contributors.
+# +Copyright (c) 2013-2026, Kim Davies and contributors.
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "The PyPA recommended tool for installing Python packages"
 HOMEPAGE = "https://pypi.org/project/pip"
 SECTION = "devel/python"
@@ -7,7 +28,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
                     file://src/pip/_vendor/certifi/LICENSE;md5=11618cb6a975948679286b1211bd573c \
                     file://src/pip/_vendor/distlib/LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc \
                     file://src/pip/_vendor/distro/LICENSE;md5=d2794c0df5b907fdace235a619d80314 \
-                    file://src/pip/_vendor/idna/LICENSE.md;md5=18a4795c19833413a7e2f1cb3cd3b143 \
+                    file://src/pip/_vendor/idna/LICENSE.md;md5=9a6c29079fc90c29d80332f44d2625f2 \
                     file://src/pip/_vendor/msgpack/COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751 \
                     file://src/pip/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
                     file://src/pip/_vendor/pkg_resources/LICENSE;md5=141643e11c48898150daa83802dbc65f \
@@ -26,7 +47,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "f49cd134c61cf2fd75e0ce2676db03e4054504a5a4986d00f8299ae632dc4605"
+SRC_URI[sha256sum] = "f6ad667e89a1fe78046c8f13232b247200f5258d7828f3f7883d660878e0813f"
 
 CVE_PRODUCT = "pypa:pip"
 
-- 
2.47.1


--===============8373764880802233771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/si
 te-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_
 vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses, directory renamed /usr/lib/python
 3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/pygments, removed "/usr/lib/python3.14
 /site-packages/pip/_internal/__pycache__/build_env.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/build_env.py", added "/usr/lib/python3.14/site-packages/pip/_internal/build_env/installer.py /usr/lib/python3.14/site-packages/pip/_internal/build_env/base.py /usr/lib/python3.14/site-packages/pip/_internal/build_env/noop.py /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/_xdg.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/venv.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/idna/cli.py /usr/lib/python3.14/site-packages/pip/_internal/build_env/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/requests/__pycache__/_types.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/base.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/noop.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/virt
 ual.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/bom.cdx.json /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/build_env/virtual.py /usr/lib/python3.14/site-packages/pip/_vendor/idna/__pycache__/cli.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/requests/_types.py /usr/lib/python3.14/site-packages/pip/_vendor/idna/__main__.py /usr/lib/python3.14/site-packages/pip/_vendor/idna/__pycache__/__main__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/installer.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/requests/py.typed /usr/lib/python3.14/site-packages/pip/_internal/build_env/venv.py /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/_xdg.py"
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info moved to /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info
  /usr/lib/python3.14/site-packages/pip/_internal/build_env was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/base.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__init__.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/installer.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/noop.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__ was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/base.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/installer.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/noop.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/venv.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/virtual.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/venv.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/virtual.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/bom.cdx.json was added
  /usr/lib/python3.14/site-packages/pip/_vendor/idna/cli.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/idna/__main__.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/idna/__pycache__/cli.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/idna/__pycache__/__main__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/_xdg.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/_xdg.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/requests/__pycache__/_types.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/requests/py.typed was added
  /usr/lib/python3.14/site-packages/pip/_vendor/requests/_types.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env.py was removed
  /usr/lib/python3.14/site-packages/pip/_internal/__pycache__/build_env.cpython-314.pyc was removed
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.3.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.2.dist-info
  /usr/lib/python3.14/site-packages/packaging/__pycache__/_ranges.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/ranges.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/_ranges.py was removed
  /usr/lib/python3.14/site-packages/packaging/ranges.py was removed

--===============8373764880802233771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pip: PV changed from "26.1.2" to "26.2.1"
packages/x86-64-v3-poky-linux/python3-pip: PKGV changed from 26.1.2 [default] to 26.2.1 [default]
packages/x86-64-v3-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-26.1.2.tar.gz;downloadfilename=pip-26.1.2.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-26.2.1.tar.gz;downloadfilename=pip-26.2.1.tar.gz file://no_shebang_mangling.patch"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PV changed from "26.1.2" to "26.2.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 26.1.2 [default] to 26.2.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PV changed from "26.1.2" to "26.2.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 26.1.2 [default] to 26.2.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PV changed from "26.1.2" to "26.2.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 26.1.2 [default] to 26.2.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PV changed from "26.1.2" to "26.2.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 26.1.2 [default] to 26.2.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PV changed from "26.1.2" to "26.2.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PKGV changed from 26.1.2 [default] to 26.2.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "26.1.2" to "26.2.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 26.1.2 [default] to 26.2.1 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/pyproj
 ect_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/
 truststore, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/pyth
 on3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info/licenses/src/pip/_vendor/requests, removed "/usr/lib/python3.14
 /site-packages/pip/_internal/build_env.py /usr/lib/python3.14/site-packages/pip/_internal/__pycache__/build_env.cpython-314.pyc", added "/usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/virtual.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/build_env/__init__.py /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/noop.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/build_env/virtual.py /usr/lib/python3.14/site-packages/pip/_vendor/idna/__pycache__/__main__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/idna/__pycache__/cli.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/requests/__pycache__/_types.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/_xdg.py /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/_xdg.cpython-314.pyc /usr/lib/python3.14/s
 ite-packages/pip/_internal/build_env/__pycache__/base.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/idna/__main__.py /usr/lib/python3.14/site-packages/pip/_vendor/requests/py.typed /usr/lib/python3.14/site-packages/pip/_vendor/bom.cdx.json /usr/lib/python3.14/site-packages/pip/_internal/build_env/base.py /usr/lib/python3.14/site-packages/pip/_internal/build_env/noop.py /usr/lib/python3.14/site-packages/pip/_internal/build_env/venv.py /usr/lib/python3.14/site-packages/pip/_vendor/requests/_types.py /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/installer.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/venv.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/idna/cli.py /usr/lib/python3.14/site-packages/pip/_internal/build_env/installer.py"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PV changed from "26.1.2" to "26.2.1"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 10676842 to 10653168 (-0%)
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGV changed from 26.1.2 [default] to 26.2.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.1.2.dist-info moved to /usr/lib/python3.14/site-packages/pip-26.2.1.dist-info
  /usr/lib/python3.14/site-packages/pip/_internal/build_env was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/base.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__init__.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/installer.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/noop.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__ was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/base.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/installer.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/noop.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/venv.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/__pycache__/virtual.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/venv.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env/virtual.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/bom.cdx.json was added
  /usr/lib/python3.14/site-packages/pip/_vendor/idna/cli.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/idna/__main__.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/idna/__pycache__/cli.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/idna/__pycache__/__main__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/_xdg.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/_xdg.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/requests/__pycache__/_types.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/requests/py.typed was added
  /usr/lib/python3.14/site-packages/pip/_vendor/requests/_types.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/build_env.py was removed
  /usr/lib/python3.14/site-packages/pip/_internal/__pycache__/build_env.cpython-314.pyc was removed
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.3.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.2.dist-info
  /usr/lib/python3.14/site-packages/packaging/__pycache__/_ranges.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/ranges.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/_ranges.py was removed
  /usr/lib/python3.14/site-packages/packaging/ranges.py was removed

--===============8373764880802233771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pip-changelog.txt"

Changelog for python3-pip: 26.1.2 -> 26.2.1
Source: NEWS.rst

26.2.1 (2026-08-04)
===================

Bug Fixes
---------

- Reallow keyring installed in a (non-activated) virtual environment to be be used
  via the ``import`` provider method while installing build dependencies. (`#14227 <https://github.com/pypa/pip/issues/14227>`_)

26.2 (2026-07-29)
=================

Deprecations and Removals
-------------------------

- Newly published packages will no longer be immediately visible to pip
  if the index uses caching. To install a newly published package, use
  ``--refresh-package``. (`#13680 <https://github.com/pypa/pip/issues/13680>`_)
- Drop support for detecting legacy, non-:pep:`405`, ``virtualenv`` (< 20)
  environments. (`#14062 <https://github.com/pypa/pip/issues/14062>`_)
- Constraints files, including ``PIP_CONSTRAINT``, no longer affect isolated
  build environments. Use ``--build-constraint`` or the ``PIP_BUILD_CONSTRAINT``
  environment variable to constrain build dependencies instead.

  The ``--use-feature=build-constraint`` flag is now always enabled and has no
  effect. (`#14094 <https://github.com/pypa/pip/issues/14094>`_)

Features
--------

- Declare support for Python 3.15 (`#14208 <https://github.com/pypa/pip/issues/14208>`_)
- Support self-referential extras officially. pip has supported this by accident since version 21.2. (`#11296 <https://github.com/pypa/pip/issues/11296>`_)
- Add ``--only-deps`` flag to instruct pip to select only the dependencies
  of supplied packages. It cannot be used with ``--no-deps``, ``-r``, ``--group``,
  or ``--requirements-from-script``. (`#11440 <https://github.com/pypa/pip/issues/11440>`_)
- Cache simple responses in accordance to their ``Cache-Control`` header
  instead of always revalidating on every request. To refresh cached package index responses
  and ensure newly published packages are found, use ``--refresh-package <package>``. (`#13680 <https://github.com/pypa/pip/issues/13680>`_)
- Add ``--no-require-hashes`` to disable automatic enablement of
  ``--require-hashes`` when encountering a requirement with hashes. (`#14169 <https://github.com/pypa/pip/issues/14169>`_)
- Honor ``--only-final`` when sourcing requirements with ``-r pylock.toml``. (`#13950 <https://github.com/pypa/pip/issues/13950>`_)
- Add support for ``pylock.toml`` ``upload-time`` field, so ``--uploaded-prior-to`` works with ``-r pylock.toml``. (`#14168 <https://github.com/pypa/pip/issues/14168>`_)
- Better error messages in case of conflicts with requirements from ``-r pylock.toml``. (`#13963 <https://github.com/pypa/pip/issues/13963>`_)
- Add experimental support for isolating build subprocesses by creating standard
  virtual environments. This will fix most (if not all) subtle isolation issues
  that can lead to broken builds exclusive to pip. The feature can be enabled
  via ``--use-feature=venv-isolation`` and will be enabled by default in a future
  release.

  Note that the feature has limited compatibility with ``--use-feature=inprocess-build-deps``.
  While most builds should work with both features enabled, there are known edge cases.
  ``inprocess-build-deps`` will not be enabled by default until they are fixed. (`#14070 <https://github.com/pypa/pip/issues/14070>`_)
- Present more informative diagnostic errors on uncaught network errors. (`#14115 <https://github.com/pypa/pip/issues/14115>`_)
- Allow opting out of Git partial clones with ``PIP_NO_PARTIAL_CLONE_FOR_BROKEN_GIT_SERVER``. (`#11043 <https://github.com/pypa/pip/issues/11043>`_)
- Add a ``--no-proxy-env`` (or ``--proxy ""``) option to ignore proxies
  configured via non-pip environment variables or configuration files.
  A proxy set with ``--proxy`` is still used. (`#5378 <https://github.com/pypa/pip/issues/5378>`_)
- Add support for pulling username from keyring subprocess provider (`#12543 <https://github.com/pypa/pip/issues/12543>`_)
- Speedup tab autocompletion by lazy-importing certain modules. (`#4768 <https://github.com/pypa/pip/issues/4768>`_)
- Improve cached wheel lookup performance when many cached wheels are checked
  for compatibility. (`#14122 <https://github.com/pypa/pip/issues/14122>`_)
- Speed up path compaction when displaying uninstall changes. (`#14107 <https://github.com/pypa/pip/issues/14107>`_)

Bug Fixes
---------

- Only emit the invalid-metadata warning once per location per run, instead of repeating it during the same command. (`#11436 <https://github.com/pypa/pip/issues/11436>`_)
- Handle ``BrokenPipeError`` when pip output is piped to a command that closes early. (`#11608 <https://github.com/pypa/pip/issues/11608>`_)
- Follow symlinks while checking if installed scripts are on PATH. (`#11953 <https://github.com/pypa/pip/issues/11953>`_)
- Stop dropping extras from messages about candidates with inconsistent metadata. (`#12023 <https://github.com/pypa/pip/issues/12023>`_)
- Stop animating progress bars and status spinners when running on CI, even
  if ``FORCE_COLOR`` is set. (`#13354 <https://github.com/pypa/pip/issues/13354>`_)
- Ensure truststore feature remains active while initially connecting to
  a HTTPS proxy. (`#13465 <https://github.com/pypa/pip/issues/13465>`_)
- Address encoding warnings emitted when Python's UTF-8 Mode is enabled by
  continuing to use the configured locale. (`#13922 <https://github.com/pypa/pip/issues/13922>`_)
- Raise an error when the :pep:`658` ``.metadata`` file used during dependency
  resolution disagrees with the downloaded wheel's ``METADATA`` on ``Name``,
  ``Version``, ``Requires-Dist``, ``Requires-Python`` or ``Provides-Extra``. (`#13983 <https://github.com/pypa/pip/issues/13983>`_)
- Prevent system packages from leaking into isolated build environments on Python 3.15 (`#14033 <https://github.com/pypa/pip/issues/14033>`_)
- Never use persistent wheel cache for local directory requirements even if there
  is a matching entry. (`#14044 <https://github.com/pypa/pip/issues/14044>`_)
- Avoid re-fetching a pinned Git commit that is already present locally. (`#14055 <https://github.com/pypa/pip/issues/14055>`_)
- Report the correct configuration level for ``cert`` in ``pip debug`` output. (`#14056 <https://github.com/pypa/pip/issues/14056>`_)
- Fix ``pip show`` crash when a distribution has no ``Metadata-Version``. (`#14057 <https://github.com/pypa/pip/issues/14057>`_)
- Remove empty ``http-v2`` cache directories when running ``pip cache purge``. (`#14058 <https://github.com/pypa/pip/issues/14058>`_)
- Report a copy failure in ``pip wheel`` instead of a misleading build failure. (`#14059 <https://github.com/pypa/pip/issues/14059>`_)
- Make ``pip install`` conflict checks independent of installed distribution iteration order. (`#14074 <https://github.com/pypa/pip/issues/14074>`_)
- Fix ``ProtocolError`` exceptions raised after an incomplete download from bypassing
  download resume logic and leading to a crash. (`#14079 <https://github.com/pypa/pip/issues/14079>`_)
- Fix caching bug where local directory requirements would be cached if the
  directory name contains a dash. (`#14080 <https://github.com/pypa/pip/issues/14080>`_)
- Avoid reparsing distribution metadata when formatting the default ``pip list``
  columns output with the importlib backend. (`#14089 <https://github.com/pypa/pip/issues/14089>`_)
- Fix decoding the URL path twice while determining a link filename (CVE-2026-13346). (`#14110 <https://github.com/pypa/pip/issues/14110>`_)
- Avoid reading installed file lists in ``pip show`` unless ``--files`` is used. (`#14117 <https://github.com/pypa/pip/issues/14117>`_)
- Additional rejection of tar archives that write outside the target
  directory through symlink traversal when extracting on Python
  versions pre-PEP 706. (`#14127 <https://github.com/pypa/pip/issues/14127>`_)
- Fix ``pip list --not-required`` listing dependencies of packages excluded with ``--exclude``. (`#14129 <https://github.com/pypa/pip/issues/14129>`_)
- Fail an interrupted download instead of corrupting the saved file when the
  server resumes a range request from a different offset than was requested. (`#14131 <https://github.com/pypa/pip/issues/14131>`_)
- Fix option errors printing the usage message with raw Rich markup. (`#14136 <https://github.com/pypa/pip/issues/14136>`_)
- platformdirs 4.6.0+ adds support for ``XDG_*`` environment variables on macOS, so
  some directory locations may change if any of these are set:

  - ``XDG_CACHE_HOME``: The `pip cache directory <https://pip.pypa.io/en/stable/cli/pip_cache/>`_
    will be at ``$XDG_CACHE_HOME/pip``.
  - ``XDG_DATA_DIRS``: The `global configuration file <https://pip.pypa.io/en/stable/topics/configuration/#config-file>`_
    will be inside ``$XDG_DATA_DIRS/pip``
  - ``XDG_DATA_HOME``: The `user configuration file <https://pip.pypa.io/en/stable/topics/configuration/#config-file>`_
    will be inside ``$XDG_DATA_HOME/pip``, if the directory exists (`#14142 <https://github.com/pypa/pip/issues/14142>`_)
- Recover credentials embedded in a redirect ``Location`` URL when handling a
  ``401`` response, even under ``--no-input``. Previously this extraction was
  gated behind keyring being enabled, so ``--no-input`` (with the default keyring
  provider) caused downloads that rely on a cross-origin redirect with embedded
  credentials to fail with ``401``. (`#14182 <https://github.com/pypa/pip/issues/14182>`_)
- Reject a package ``path`` in a ``pylock.toml`` fetched from a URL when it
  resolves outside the lock file's own location, so a remote lock file can no
  longer point at the local filesystem or another host. (`#14159 <https://github.com/pypa/pip/issues/14159>`_)
- Respect ``--uploaded-prior-to``, ``--no-binary``, ``--only-binary``,
  and ``--prefer-binary`` in ``pip list --outdated`` and
  ``pip list --uptodate`` when determining the latest available version. (`#14190 <https://github.com/pypa/pip/issues/14190>`_)
- Show a clear error instead of a traceback for an invalid requirement marker. (`#6385 <https://github.com/pypa/pip/issues/6385>`_)

Vendored Libraries
------------------

- Upgrade certifi to 2026.6.17
- Upgrade distlib to 0.4.2
- Upgrade idna to 3.18
- Upgrade platformdirs to 4.10.0
- Upgrade pygments to 2.20.0
- Upgrade requests to 2.34.2
- Upgrade tomli to 2.4.1
- Upgrade urllib3 to 2.7.0

Process
-------

- Include a CycloneDX SBOM (Software Bill of Materials) file alongside vendored libraries.

--===============8373764880802233771==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-26.1.2-26.2.1.patch"

RnJvbSA3MzEzZTdhNTg0ZGEyZDExNWEzOTZiMjVkODNiNTA4N2U3MzZmYWUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBBdWcgMjAyNiAwNTo0MToxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGlwOiB1cGdyYWRlIDI2LjEuMiAtPiAyNi4yLjEKClNvdXJjZTogTkVXUy5yc3QKCjI2
LjIuMSAoMjAyNi0wOC0wNCkKPT09PT09PT09PT09PT09PT09PQoKQnVnIEZpeGVzCi0tLS0tLS0t
LQoKLSBSZWFsbG93IGtleXJpbmcgaW5zdGFsbGVkIGluIGEgKG5vbi1hY3RpdmF0ZWQpIHZpcnR1
YWwgZW52aXJvbm1lbnQgdG8gYmUgYmUgdXNlZAogIHZpYSB0aGUgYGBpbXBvcnRgYCBwcm92aWRl
ciBtZXRob2Qgd2hpbGUgaW5zdGFsbGluZyBidWlsZCBkZXBlbmRlbmNpZXMuIChgIzE0MjI3IDxo
dHRwczovL2dpdGh1Yi5jb20vcHlwYS9waXAvaXNzdWVzLzE0MjI3PmBfKQoKMjYuMiAoMjAyNi0w
Ny0yOSkKPT09PT09PT09PT09PT09PT0KCkRlcHJlY2F0aW9ucyBhbmQgUmVtb3ZhbHMKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQoKLSBOZXdseSBwdWJsaXNoZWQgcGFja2FnZXMgd2lsbCBubyBs
b25nZXIgYmUgaW1tZWRpYXRlbHkgdmlzaWJsZSB0byBwaXAKICBpZiB0aGUgaW5kZXggdXNlcyBj
YWNoaW5nLiBUbyBpbnN0YWxsIGEgbmV3bHkgcHVibGlzaGVkIHBhY2thZ2UsIHVzZQogIGBgLS1y
ZWZyZXNoLXBhY2thZ2VgYC4gKGAjMTM2ODAgPGh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3BpcC9p
c3N1ZXMvMTM2ODA+YF8pCi0gRHJvcCBzdXBwb3J0IGZvciBkZXRlY3RpbmcgbGVnYWN5LCBub24t
OnBlcDpgNDA1YCwgYGB2aXJ0dWFsZW52YGAgKDwgMjApCiAgZW52aXJvbm1lbnRzLiAoYCMxNDA2
MiA8aHR0cHM6Ly9naXRodWIuY29tL3B5cGEvcGlwL2lzc3Vlcy8xNDA2Mj5gXykKLSBDb25zdHJh
aW50cyBmaWxlcywgaW5jbHVkaW5nIGBgUElQX0NPTlNUUkFJTlRgYCwgbm8gbG9uZ2VyIGFmZmVj
dCBpc29sYXRlZAogIGJ1aWxkIGVudmlyb25tZW50cy4gVXNlIGBgLS1idWlsZC1jb25zdHJhaW50
YGAgb3IgdGhlIGBgUElQX0JVSUxEX0NPTlNUUkFJTlRgYAogIGVudmlyb25tZW50IHZhcmlhYmxl
IHRvIGNvbnN0cmFpbiBidWlsZCBkZXBlbmRlbmNpZXMgaW5zdGVhZC4KCiAgVGhlIGBgLS11c2Ut
ZmVhdHVyZT1idWlsZC1jb25zdHJhaW50YGAgZmxhZyBpcyBub3cgYWx3YXlzIGVuYWJsZWQgYW5k
IGhhcyBubwogIGVmZmVjdC4gKGAjMTQwOTQgPGh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3BpcC9p
c3N1ZXMvMTQwOTQ+YF8pCgpGZWF0dXJlcwotLS0tLS0tLQoKLSBEZWNsYXJlIHN1cHBvcnQgZm9y
IFB5dGhvbiAzLjE1IChgIzE0MjA4IDxodHRwczovL2dpdGh1Yi5jb20vcHlwYS9waXAvaXNzdWVz
LzE0MjA4PmBfKQotIFN1cHBvcnQgc2VsZi1yZWZlcmVudGlhbCBleHRyYXMgb2ZmaWNpYWxseS4g
cGlwIGhhcyBzdXBwb3J0ZWQgdGhpcyBieSBhY2NpZGVudCBzaW5jZSB2ZXJzaW9uIDIxLjIuIChg
IzExMjk2IDxodHRwczovL2dpdGh1Yi5jb20vcHlwYS9waXAvaXNzdWVzLzExMjk2PmBfKQotIEFk
ZCBgYC0tb25seS1kZXBzYGAgZmxhZyB0byBpbnN0cnVjdCBwaXAgdG8gc2VsZWN0IG9ubHkgdGhl
IGRlcGVuZGVuY2llcwogIG9mIHN1cHBsaWVkIHBhY2thZ2VzLiBJdCBjYW5ub3QgYmUgdXNlZCB3
aXRoIGBgLS1uby1kZXBzYGAsIGBgLXJgYCwgYGAtLWdyb3VwYGAsCiAgb3IgYGAtLXJlcXVpcmVt
ZW50cy1mcm9tLXNjcmlwdGBgLiAoYCMxMTQ0MCA8aHR0cHM6Ly9naXRodWIuY29tL3B5cGEvcGlw
L2lzc3Vlcy8xMTQ0MD5gXykKLSBDYWNoZSBzaW1wbGUgcmVzcG9uc2VzIGluIGFjY29yZGFuY2Ug
dG8gdGhlaXIgYGBDYWNoZS1Db250cm9sYGAgaGVhZGVyCiAgaW5zdGVhZCBvZiBhbHdheXMgcmV2
YWxpZGF0aW5nIG9uIGV2ZXJ5IHJlcXVlc3QuIFRvIHJlZnJlc2ggY2FjaGVkIHBhY2thZ2UgaW5k
ZXggcmVzcG9uc2VzCiAgYW5kIGVuc3VyZSBuZXdseSBwdWJsaXNoZWQgcGFja2FnZXMgYXJlIGZv
dW5kLCB1c2UgYGAtLXJlZnJlc2gtcGFja2FnZSA8cGFja2FnZT5gYC4gKGAjMTM2ODAgPGh0dHBz
Oi8vZ2l0aHViLmNvbS9weXBhL3BpcC9pc3N1ZXMvMTM2ODA+YF8pCi0gQWRkIGBgLS1uby1yZXF1
aXJlLWhhc2hlc2BgIHRvIGRpc2FibGUgYXV0b21hdGljIGVuYWJsZW1lbnQgb2YKICBgYC0tcmVx
dWlyZS1oYXNoZXNgYCB3aGVuIGVuY291bnRlcmluZyBhIHJlcXVpcmVtZW50IHdpdGggaGFzaGVz
LiAoYCMxNDE2OSA8aHR0cHM6Ly9naXRodWIuY29tL3B5cGEvcGlwL2lzc3Vlcy8xNDE2OT5gXykK
LSBIb25vciBgYC0tb25seS1maW5hbGBgIHdoZW4gc291cmNpbmcgcmVxdWlyZW1lbnRzIHdpdGgg
YGAtciBweWxvY2sudG9tbGBgLiAoYCMxMzk1MCA8aHR0cHM6Ly9naXRodWIuY29tL3B5cGEvcGlw
L2lzc3Vlcy8xMzk1MD5gXykKLSBBZGQgc3VwcG9ydCBmb3IgYGBweWxvY2sudG9tbGBgIGBgdXBs
b2FkLXRpbWVgYCBmaWVsZCwgc28gYGAtLXVwbG9hZGVkLXByaW9yLXRvYGAgd29ya3Mgd2l0aCBg
YC1yIHB5bG9jay50b21sYGAuIChgIzE0MTY4IDxodHRwczovL2dpdGh1Yi5jb20vcHlwYS9waXAv
aXNzdWVzLzE0MTY4PmBfKQotIEJldHRlciBlcnJvciBtZXNzYWdlcyBpbiBjYXNlIG9mIGNvbmZs
aWN0cyB3aXRoIHJlcXVpcmVtZW50cyBmcm9tIGBgLXIgcHlsb2NrLnRvbWxgYC4gKGAjMTM5NjMg
PGh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3BpcC9pc3N1ZXMvMTM5NjM+YF8pCi0gQWRkIGV4cGVy
aW1lbnRhbCBzdXBwb3J0IGZvciBpc29sYXRpbmcgYnVpbGQgc3VicHJvY2Vzc2VzIGJ5IGNyZWF0
aW5nIHN0YW5kYXJkCiAgdmlydHVhbCBlbnZpcm9ubWVudHMuIFRoaXMgd2lsbCBmaXggbW9zdCAo
aWYgbm90IGFsbCkgc3VidGxlIGlzb2xhdGlvbiBpc3N1ZXMKICB0aGF0IGNhbiBsZWFkIHRvIGJy
b2tlbiBidWlsZHMgZXhjbHVzaXZlIHRvIHBpcC4gVGhlIGZlYXR1cmUgY2FuIGJlIGVuYWJsZWQK
ICB2aWEgYGAtLXVzZS1mZWF0dXJlPXZlbnYtaXNvbGF0aW9uYGAgYW5kIHdpbGwgYmUgZW5hYmxl
ZCBieSBkZWZhdWx0IGluIGEgZnV0dXJlCiAgcmVsZWFzZS4KCiAgTm90ZSB0aGF0IHRoZSBmZWF0
dXJlIGhhcyBsaW1pdGVkIGNvbXBhdGliaWxpdHkgd2l0aCBgYC0tdXNlLWZlYXR1cmU9aW5wcm9j
ZXNzLWJ1aWxkLWRlcHNgYAoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAw
IGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNo
bWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi9weXRob24zLXBpcC9ub19zaGViYW5nX21h
bmdsaW5nLnBhdGNoICAgICB8ICA4ICsrKy0tLQogLi4ubjMtcGlwXzI2LjEuMi5iYiA9PiBweXRo
b24zLXBpcF8yNi4yLjEuYmJ9IHwgMjUgKysrKysrKysrKysrKysrKystLQogMiBmaWxlcyBjaGFu
Z2VkLCAyNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGlwXzI2LjEuMi5iYiA9PiBweXRob24zLXBpcF8y
Ni4yLjEuYmJ9ICg3NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBpcC9ub19zaGViYW5nX21hbmdsaW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBpcC9ub19zaGViYW5nX21hbmdsaW5nLnBhdGNoCmluZGV4
IGU4YjI5ODJiMmEuLjRiNjFlOTQ4MzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1waXAvbm9fc2hlYmFuZ19tYW5nbGluZy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xpbmcu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGU0ZTFmZWQ5ZjhlM2ZmM2UwNDQ2NzY5OWYzNjU5
OWY3NmNhYTk0ODcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU0NTQ2MDg3OWUyZmJj
YjMwYjQ4Yjg5M2EzZWZhZGI2ZjY1MmUyMzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERh
dGU6IFdlZCwgMjMgRmViIDIwMjIgMTI6Mjc6MDYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gcHl0
aG9uMy1waXA6IERvbid0IGNoYW5nZSBzaGViYW5nCkBAIC0xMywxMCArMTMsMTAgQEAgVXBzdHJl
YW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtPRSBzcGVjaWZpYyBjb25maWddCiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3Jj
L3BpcC9fdmVuZG9yL2Rpc3RsaWIvc2NyaXB0cy5weSBiL3NyYy9waXAvX3ZlbmRvci9kaXN0bGli
L3NjcmlwdHMucHkKLWluZGV4IDE5NWRjM2YuLmEwZTBkNjEgMTAwNjQ0CitpbmRleCBhYzllOTA5
Li4xZmFhNWI2IDEwMDY0NAogLS0tIGEvc3JjL3BpcC9fdmVuZG9yL2Rpc3RsaWIvc2NyaXB0cy5w
eQogKysrIGIvc3JjL3BpcC9fdmVuZG9yL2Rpc3RsaWIvc2NyaXB0cy5weQotQEAgLTE1NSw2ICsx
NTUsOCBAQCBjbGFzcyBTY3JpcHRNYWtlcihvYmplY3QpOgorQEAgLTE1Nyw2ICsxNTcsOCBAQCBj
bGFzcyBTY3JpcHRNYWtlcihvYmplY3QpOgogICAgICAgICAgU2VlIGFsc286IGh0dHA6Ly93d3cu
aW4tdWxtLmRlL35tYXNjaGVjay92YXJpb3VzL3NoZWJhbmcvI2xlbmd0aAogICAgICAgICAgICAg
ICAgICAgIGh0dHBzOi8vaGcubW96aWxsYS5vcmcvbW96aWxsYS1jZW50cmFsL2ZpbGUvdGlwL21h
Y2gKICAgICAgICAgICIiIgpAQCAtMjUsNyArMjUsNyBAQCBpbmRleCAxOTVkYzNmLi5hMGUwZDYx
IDEwMDY0NAogICAgICAgICAgaWYgb3MubmFtZSAhPSAncG9zaXgnOgogICAgICAgICAgICAgIHNp
bXBsZV9zaGViYW5nID0gVHJ1ZQogICAgICAgICAgZWxpZiBnZXRhdHRyKHN5cywgImNyb3NzX2Nv
bXBpbGluZyIsIEZhbHNlKToKLUBAIC0zNjMsNyArMzY1LDcgQEAgY2xhc3MgU2NyaXB0TWFrZXIo
b2JqZWN0KToKK0BAIC0zNjcsNyArMzY5LDcgQEAgY2xhc3MgU2NyaXB0TWFrZXIob2JqZWN0KToK
ICAgICAgICAgICAgICAgICAgcmV0dXJuCiAgCiAgICAgICAgICAgICAgbWF0Y2ggPSBGSVJTVF9M
SU5FX1JFLm1hdGNoKGZpcnN0X2xpbmUucmVwbGFjZShiJ1xyXG4nLCBiJ1xuJykpCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI2LjEuMi5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMi4xLmJiCnNpbWls
YXJpdHkgaW5kZXggNzYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1waXBfMjYuMS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcGlwXzI2LjIuMS5iYgppbmRleCA5NDVhYWQxODM0Li5kMjY1OGM5NDFlIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI2LjEu
Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI2LjIu
MS5iYgpAQCAtMSwzICsxLDI0IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1
ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dp
bmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2Ug
dGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBz
dW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5z
ZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5
ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gc3JjL3BpcC9fdmVu
ZG9yL2lkbmEvTElDRU5TRS5tZAorIyArKysgc3JjL3BpcC9fdmVuZG9yL2lkbmEvTElDRU5TRS5t
ZAorIyBAQCAtMSw2ICsxLDYgQEAKKyMgIEJTRCAzLUNsYXVzZSBMaWNlbnNlCisjICAKKyMgLUNv
cHlyaWdodCAoYykgMjAxMy0yMDI1LCBLaW0gRGF2aWVzIGFuZCBjb250cmlidXRvcnMuCisjICtD
b3B5cmlnaHQgKGMpIDIwMTMtMjAyNiwgS2ltIERhdmllcyBhbmQgY29udHJpYnV0b3JzLgorIyAg
QWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAorIyAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBz
b3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjIAorIworCiBTVU1NQVJZ
ID0gIlRoZSBQeVBBIHJlY29tbWVuZGVkIHRvb2wgZm9yIGluc3RhbGxpbmcgUHl0aG9uIHBhY2th
Z2VzIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3BpcCIKIFNFQ1RJT04g
PSAiZGV2ZWwvcHl0aG9uIgpAQCAtNyw3ICsyOCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0UudHh0O21kNT02M2VjNTJiYWY5NTE2M2I1OTcwMDhiYjQ2ZGI2ODAzMCBcCiAg
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvY2VydGlmaS9MSUNFTlNF
O21kNT0xMTYxOGNiNmE5NzU5NDg2NzkyODZiMTIxMWJkNTczYyBcCiAgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvZGlzdGxpYi9MSUNFTlNFLnR4dDttZDU9ZjZhMTE0
MzBkNWNkNmUyY2QzODMyZWU5NGYyMmRkZmMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
c3JjL3BpcC9fdmVuZG9yL2Rpc3Ryby9MSUNFTlNFO21kNT1kMjc5NGMwZGY1YjkwN2ZkYWNlMjM1
YTYxOWQ4MDMxNCBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3Iv
aWRuYS9MSUNFTlNFLm1kO21kNT0xOGE0Nzk1YzE5ODMzNDEzYTdlMmYxY2IzY2QzYjE0MyBcCisg
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvaWRuYS9MSUNFTlNFLm1k
O21kNT05YTZjMjkwNzlmYzkwYzI5ZDgwMzMyZjQ0ZDI2MjVmMiBcCiAgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9zcmMvcGlwL192ZW5kb3IvbXNncGFjay9DT1BZSU5HO21kNT1jZDk1MjMxODFk
OWQ0ZmJmN2ZmY2E1MmVhYTJhNTc1MSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMv
cGlwL192ZW5kb3IvcGFja2FnaW5nL0xJQ0VOU0U7bWQ1PWZhYWRhZWRjYTkyNTFhOTBiMjA1Yzkx
Njc1NzhjZTkxIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9waXAvX3ZlbmRvci9w
a2dfcmVzb3VyY2VzL0xJQ0VOU0U7bWQ1PTE0MTY0M2UxMWM0ODg5ODE1MGRhYTgzODAyZGJjNjVm
IFwKQEAgLTI2LDcgKzQ3LDcgQEAgaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxk
X21ldGEKIAogU1JDX1VSSSArPSAiZmlsZTovL25vX3NoZWJhbmdfbWFuZ2xpbmcucGF0Y2giCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmNDljZDEzNGM2MWNmMmZkNzVlMGNlMjY3NmRiMDNlNDA1
NDUwNGE1YTQ5ODZkMDBmODI5OWFlNjMyZGM0NjA1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY2
YWQ2NjdlODlhMWZlNzgwNDZjOGYxMzIzMmIyNDcyMDBmNTI1OGQ3ODI4ZjNmNzg4M2Q2NjA4Nzhl
MDgxM2YiCiAKIENWRV9QUk9EVUNUID0gInB5cGE6cGlwIgogCi0tIAoyLjQ3LjEKCg==

--===============8373764880802233771==--

