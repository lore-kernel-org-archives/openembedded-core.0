Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5DEC55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:47:41 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34098.1785908854766809136
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UdsT/GiN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FeFJhZax;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019fd0767c83-c177e143-1ce9-4243-8a3b-df65c936b7c3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785908854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JT0bktxAUAtOoCIdIONbXyioO4uUp3FNLbPQRnHGteo=;
	b=UdsT/GiN3hRiaVowodCUkBuhfdko0Yhzng7qTwZwa2uCIiNPij2VWQZq8cOr90mr
	O8ASsj0YLQyTE2v1AkyBIoRNmIxJ3eS1PTyl0NqCSkQ0osAxhehywI8J7olLGN9vp7i
	VzyaXCAbaRkF7WxCuE/tfFS1Z1XiGqaGOxAMyx30=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785908854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JT0bktxAUAtOoCIdIONbXyioO4uUp3FNLbPQRnHGteo=;
	b=FeFJhZax4HVBN/yTJ94tjIpeEo2A64Qpr2UYSNJVGTSvrlyg9VL6EEQI0T1FjS4U
	7R5/a3pefSAAj/EnFJExmKBV9BNW9w9isuWFXxa78HxkA63G7NP8nmorFyjUM23TYoe
	rLgtKBY2pZZ/hNldIzodQ67MP+z+cYxOzZT0iWDk=
Content-Type: multipart/mixed; boundary="===============3808975106657188274=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.4.0 SUCCEEDED
Message-ID: <0101019fd0767c83-c177e143-1ce9-4243-8a3b-df65c936b7c3-000000@us-west-2.amazonses.com>
Date: Wed, 5 Aug 2026 05:47:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 05:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242818

--===============3808975106657188274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-mako* to *1.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.3.12-1.4.0.patch
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
From b35f8eb58c4e4afd954fbd1e76d875bcf95e01ab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Aug 2026 05:17:48 +0000
Subject: [PATCH] python3-mako: upgrade 1.3.12 -> 1.4.0

Source: doc/build/changelog.rst

1.4
===

.. changelog::
    :version: 1.4.0
    :released: Tue Aug 4 2026

    .. change::
        :tags: bug, ext
        :tickets: 393

        The minimum Lingua version supported by :class:`.LinguaMakoExtractor` is
        now 4.16.  The test suite had continued to pin Lingua below 4 long after
        the extractor itself was repaired to work with Lingua 4 in version 1.2.0,
        with the result that the plugin was no longer covered by tests at all; the
        pinned version additionally imports ``pkg_resources`` at startup, which is
        not present in current setuptools releases and left the package
        unimportable.  Lingua 4.16 resolves entry points using
        ``importlib.metadata``, so no deprecated ``pkg_resources`` usage remains.

    .. change::
        :tags: bug, exceptions
        :tickets: 437

        Fixed issue where formatting a traceback for an exception raised inside a
        template compiled from a string would emit ``DeprecationWarning: Module
        globals is missing a __spec__.loader`` on Python 3.15.  Modules for such
        templates were created without a module spec, which Python's
        :mod:`linecache` module consults for every frame while a traceback is
        being built; the warning was raised from within traceback formatting
        itself, disrupting the error report for applications that configure
        warnings as errors.  These modules are now given a spec with a loader that
        provides the generated module source, which additionally allows the
        generated source lines to be displayed in tracebacks produced by the
        standard library where previously no source was available.

    .. change::
        :tags: changed, examples

        The ``examples/bench`` folder has been removed as it used mostly
        long-obsolete template engines.  The ``examples/wsgi/run_wsgi.py`` example
        has been updated to remove the use of the removed-in-Python-3.13 ``cgi``
        module, and to be runnable as a module from the project root.

    .. change::
        :tags: bug, exceptions
        :tickets: 430, 245, 428

        A series of fixes involving syntax warnings and exceptions found
        during template lexing / compilation:

        * Warnings raised while a template is compiled, which in practice means
          ``SyntaxWarning``, now report the filename and line number of the
          template rather than a line within the generated module, and are no
          longer reported twice.  This applies equally to templates compiled from a
          string, from a file, and to a module file in a
          :paramref:`.Template.module_directory`, as does a warning raised while
          the module level code of a ``<%! %>`` block runs.  Warnings raised while
          a template renders continue to report the location within the generated
          module.

          To do this, Mako replaces ``warnings.showwarning`` while a template is

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...3-mako_1.3.12.bb => python3-mako_1.4.0.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.12.bb => python3-mako_1.4.0.bb} (39%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.12.bb b/meta/recipes-devtools/python/python3-mako_1.4.0.bb
similarity index 39%
rename from meta/recipes-devtools/python/python3-mako_1.3.12.bb
rename to meta/recipes-devtools/python/python3-mako_1.4.0.bb
index b2c1a8dad8..bb20342170 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.12.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.4.0.bb
@@ -1,14 +1,33 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright 2006-2025 the Mako authors and contributors <see AUTHORS file>.
+# +Copyright 2006-2026 the Mako authors and contributors <see AUTHORS file>.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy of
+#  this software and associated documentation files (the "Software"), to deal in
+# 
+#
+
 SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=73026b50800163bd3c75cfdc121d9eb5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c79ceff89df0a72f29bb0e1b6f0e36ed"
 
 PYPI_PACKAGE = "mako"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "9f778e93289bd410bb35daadeb4fc66d95a746f0b75777b942088b7fd7af550a"
+SRC_URI[sha256sum] = "61aac9619e1325fa6e7be2f8dd463caef61247b3cd32a41a8692684548269ce3"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.47.1


--===============3808975106657188274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-mako/python3-mako: FILELIST: directory renamed /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info -> /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/licenses -> /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/tools/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/tools/__pycache__/toxnox.cpython-314.pyc /usr/lib/python3.14/site-packages/tools/__init__.py /usr/lib/python3.14/site-packages/tools/__pycache__/warn_tox.cpython-314.pyc /usr/lib/python3.14/site-packages/tools/warn_tox.py /usr/lib/python3.14/site-packages/tools/toxnox.py"
Changes to packages/x86-64-v3-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info was added
  /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/tools was added
  /usr/lib/python3.14/site-packages/tools/__init__.py was added
  /usr/lib/python3.14/site-packages/tools/__pycache__ was added
  /usr/lib/python3.14/site-packages/tools/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/tools/__pycache__/toxnox.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/tools/__pycache__/warn_tox.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/tools/toxnox.py was added
  /usr/lib/python3.14/site-packages/tools/warn_tox.py was added
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/WHEEL was removed

--===============3808975106657188274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/mako/mako-1.3.12.tar.gz;downloadfilename=mako-1.3.12.tar.gz" to "https://files.pythonhosted.org/packages/source/m/mako/mako-1.4.0.tar.gz;downloadfilename=mako-1.4.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-mako: PKGV changed from 1.3.12 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-mako: PV changed from "1.3.12" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.3.12 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.3.12" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.3.12 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.3.12" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.3.12 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.3.12" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.3.12 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.3.12" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PKGSIZE changed from 355474 to 365339 (+3%)
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PKGV changed from 1.3.12 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PV changed from "1.3.12" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.3.12 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-src: PV changed from "1.3.12" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.3.12 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.3.12" to "1.4.0"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 648756 to 675433 (+4%)
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PKGV changed from 1.3.12 [default] to 1.4.0 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: FILELIST: directory renamed /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info -> /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/licenses -> /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/tools/toxnox.py /usr/lib/python3.14/site-packages/tools/__init__.py /usr/lib/python3.14/site-packages/tools/__pycache__/warn_tox.cpython-314.pyc /usr/lib/python3.14/site-packages/tools/warn_tox.py /usr/lib/python3.14/site-packages/tools/__pycache__/toxnox.cpython-314.pyc /usr/lib/python3.14/site-packages/tools/__pycache__/__init__.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PV changed from "1.3.12" to "1.4.0"
Changes to packages/x86-64-v3-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info was added
  /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/mako-1.4.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/tools was added
  /usr/lib/python3.14/site-packages/tools/__init__.py was added
  /usr/lib/python3.14/site-packages/tools/__pycache__ was added
  /usr/lib/python3.14/site-packages/tools/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/tools/__pycache__/toxnox.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/tools/__pycache__/warn_tox.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/tools/toxnox.py was added
  /usr/lib/python3.14/site-packages/tools/warn_tox.py was added
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/WHEEL was removed

--===============3808975106657188274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-mako-changelog.txt"

Changelog for python3-mako: 1.3.12 -> 1.4.0
Source: doc/build/changelog.rst

1.4
===

.. changelog::
    :version: 1.4.0
    :released: Tue Aug 4 2026

    .. change::
        :tags: bug, ext
        :tickets: 393

        The minimum Lingua version supported by :class:`.LinguaMakoExtractor` is
        now 4.16.  The test suite had continued to pin Lingua below 4 long after
        the extractor itself was repaired to work with Lingua 4 in version 1.2.0,
        with the result that the plugin was no longer covered by tests at all; the
        pinned version additionally imports ``pkg_resources`` at startup, which is
        not present in current setuptools releases and left the package
        unimportable.  Lingua 4.16 resolves entry points using
        ``importlib.metadata``, so no deprecated ``pkg_resources`` usage remains.

    .. change::
        :tags: bug, exceptions
        :tickets: 437

        Fixed issue where formatting a traceback for an exception raised inside a
        template compiled from a string would emit ``DeprecationWarning: Module
        globals is missing a __spec__.loader`` on Python 3.15.  Modules for such
        templates were created without a module spec, which Python's
        :mod:`linecache` module consults for every frame while a traceback is
        being built; the warning was raised from within traceback formatting
        itself, disrupting the error report for applications that configure
        warnings as errors.  These modules are now given a spec with a loader that
        provides the generated module source, which additionally allows the
        generated source lines to be displayed in tracebacks produced by the
        standard library where previously no source was available.

    .. change::
        :tags: changed, examples

        The ``examples/bench`` folder has been removed as it used mostly
        long-obsolete template engines.  The ``examples/wsgi/run_wsgi.py`` example
        has been updated to remove the use of the removed-in-Python-3.13 ``cgi``
        module, and to be runnable as a module from the project root.

    .. change::
        :tags: bug, exceptions
        :tickets: 430, 245, 428

        A series of fixes involving syntax warnings and exceptions found
        during template lexing / compilation:

        * Warnings raised while a template is compiled, which in practice means
          ``SyntaxWarning``, now report the filename and line number of the
          template rather than a line within the generated module, and are no
          longer reported twice.  This applies equally to templates compiled from a
          string, from a file, and to a module file in a
          :paramref:`.Template.module_directory`, as does a warning raised while
          the module level code of a ``<%! %>`` block runs.  Warnings raised while
          a template renders continue to report the location within the generated
          module.

          To do this, Mako replaces ``warnings.showwarning`` while a template is
          compiled.  As that name is global to the process, an unrelated warning
          displayed by another thread during that window may also be passed through
          Mako's hook, which shows any warning it does not recognize unchanged.
          (:ticket:`430`)

        * The ``SyntaxException`` raised for a syntax error in Python code spanning
          several lines of a template, such as that within a ``<% %>`` or ``<%! %>``
          block, is now reported against the line the error is on, rather than
          against the line on which the block begins.  The line reported for code
          that occupies a single line, such as an expression or a control line, is
          unchanged. (:ticket:`245`)

        * The ``SyntaxException`` raised for a tag or expression that is never
          closed is now reported against the line the construct begins on, rather
          than the point at which the search for the closing token gave up, which
          for an unclosed construct is the end of the template.  The message of the
          exception is amended to indicate that the position given is where the
          unterminated construct begins. (:ticket:`428`)

    .. change::
        :tags: changed, installation

        Minimum MarkupSafe dependency version bumped from 0.9.2 to 2.0.

    .. change::
        :tags: changed, tests

        The test suite now runs via nox.  The old tox.ini remains however nox will
        be the only system that's maintained.

    .. change::
        :tags: changed, installation

        Project metadata has been migrated to :pep:`621` ``pyproject.toml``-based
        configuration.  ``setup.cfg`` remains only for the ``[mako_testing]``
        section used by Mako's own test suite.   The build requirements
        now set the minimum setuptools version at 77.0.0 in order to build Mako
        from source.

    .. change::
        :tags: changed, installation

        Minimum Python version is now 3.10.  Mako 1.4.0 has been tested up through
        Python 3.15.0b4.

--===============3808975106657188274==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.3.12-1.4.0.patch"

RnJvbSBiMzVmOGViNThjNGU0YWZkOTU0ZmJkMWU3NmQ4NzViY2Y5NWUwMWFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBBdWcgMjAyNiAwNToxNzo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFrbzogdXBncmFkZSAxLjMuMTIgLT4gMS40LjAKClNvdXJjZTogZG9jL2J1aWxkL2No
YW5nZWxvZy5yc3QKCjEuNAo9PT0KCi4uIGNoYW5nZWxvZzo6CiAgICA6dmVyc2lvbjogMS40LjAK
ICAgIDpyZWxlYXNlZDogVHVlIEF1ZyA0IDIwMjYKCiAgICAuLiBjaGFuZ2U6OgogICAgICAgIDp0
YWdzOiBidWcsIGV4dAogICAgICAgIDp0aWNrZXRzOiAzOTMKCiAgICAgICAgVGhlIG1pbmltdW0g
TGluZ3VhIHZlcnNpb24gc3VwcG9ydGVkIGJ5IDpjbGFzczpgLkxpbmd1YU1ha29FeHRyYWN0b3Jg
IGlzCiAgICAgICAgbm93IDQuMTYuICBUaGUgdGVzdCBzdWl0ZSBoYWQgY29udGludWVkIHRvIHBp
biBMaW5ndWEgYmVsb3cgNCBsb25nIGFmdGVyCiAgICAgICAgdGhlIGV4dHJhY3RvciBpdHNlbGYg
d2FzIHJlcGFpcmVkIHRvIHdvcmsgd2l0aCBMaW5ndWEgNCBpbiB2ZXJzaW9uIDEuMi4wLAogICAg
ICAgIHdpdGggdGhlIHJlc3VsdCB0aGF0IHRoZSBwbHVnaW4gd2FzIG5vIGxvbmdlciBjb3ZlcmVk
IGJ5IHRlc3RzIGF0IGFsbDsgdGhlCiAgICAgICAgcGlubmVkIHZlcnNpb24gYWRkaXRpb25hbGx5
IGltcG9ydHMgYGBwa2dfcmVzb3VyY2VzYGAgYXQgc3RhcnR1cCwgd2hpY2ggaXMKICAgICAgICBu
b3QgcHJlc2VudCBpbiBjdXJyZW50IHNldHVwdG9vbHMgcmVsZWFzZXMgYW5kIGxlZnQgdGhlIHBh
Y2thZ2UKICAgICAgICB1bmltcG9ydGFibGUuICBMaW5ndWEgNC4xNiByZXNvbHZlcyBlbnRyeSBw
b2ludHMgdXNpbmcKICAgICAgICBgYGltcG9ydGxpYi5tZXRhZGF0YWBgLCBzbyBubyBkZXByZWNh
dGVkIGBgcGtnX3Jlc291cmNlc2BgIHVzYWdlIHJlbWFpbnMuCgogICAgLi4gY2hhbmdlOjoKICAg
ICAgICA6dGFnczogYnVnLCBleGNlcHRpb25zCiAgICAgICAgOnRpY2tldHM6IDQzNwoKICAgICAg
ICBGaXhlZCBpc3N1ZSB3aGVyZSBmb3JtYXR0aW5nIGEgdHJhY2ViYWNrIGZvciBhbiBleGNlcHRp
b24gcmFpc2VkIGluc2lkZSBhCiAgICAgICAgdGVtcGxhdGUgY29tcGlsZWQgZnJvbSBhIHN0cmlu
ZyB3b3VsZCBlbWl0IGBgRGVwcmVjYXRpb25XYXJuaW5nOiBNb2R1bGUKICAgICAgICBnbG9iYWxz
IGlzIG1pc3NpbmcgYSBfX3NwZWNfXy5sb2FkZXJgYCBvbiBQeXRob24gMy4xNS4gIE1vZHVsZXMg
Zm9yIHN1Y2gKICAgICAgICB0ZW1wbGF0ZXMgd2VyZSBjcmVhdGVkIHdpdGhvdXQgYSBtb2R1bGUg
c3BlYywgd2hpY2ggUHl0aG9uJ3MKICAgICAgICA6bW9kOmBsaW5lY2FjaGVgIG1vZHVsZSBjb25z
dWx0cyBmb3IgZXZlcnkgZnJhbWUgd2hpbGUgYSB0cmFjZWJhY2sgaXMKICAgICAgICBiZWluZyBi
dWlsdDsgdGhlIHdhcm5pbmcgd2FzIHJhaXNlZCBmcm9tIHdpdGhpbiB0cmFjZWJhY2sgZm9ybWF0
dGluZwogICAgICAgIGl0c2VsZiwgZGlzcnVwdGluZyB0aGUgZXJyb3IgcmVwb3J0IGZvciBhcHBs
aWNhdGlvbnMgdGhhdCBjb25maWd1cmUKICAgICAgICB3YXJuaW5ncyBhcyBlcnJvcnMuICBUaGVz
ZSBtb2R1bGVzIGFyZSBub3cgZ2l2ZW4gYSBzcGVjIHdpdGggYSBsb2FkZXIgdGhhdAogICAgICAg
IHByb3ZpZGVzIHRoZSBnZW5lcmF0ZWQgbW9kdWxlIHNvdXJjZSwgd2hpY2ggYWRkaXRpb25hbGx5
IGFsbG93cyB0aGUKICAgICAgICBnZW5lcmF0ZWQgc291cmNlIGxpbmVzIHRvIGJlIGRpc3BsYXll
ZCBpbiB0cmFjZWJhY2tzIHByb2R1Y2VkIGJ5IHRoZQogICAgICAgIHN0YW5kYXJkIGxpYnJhcnkg
d2hlcmUgcHJldmlvdXNseSBubyBzb3VyY2Ugd2FzIGF2YWlsYWJsZS4KCiAgICAuLiBjaGFuZ2U6
OgogICAgICAgIDp0YWdzOiBjaGFuZ2VkLCBleGFtcGxlcwoKICAgICAgICBUaGUgYGBleGFtcGxl
cy9iZW5jaGBgIGZvbGRlciBoYXMgYmVlbiByZW1vdmVkIGFzIGl0IHVzZWQgbW9zdGx5CiAgICAg
ICAgbG9uZy1vYnNvbGV0ZSB0ZW1wbGF0ZSBlbmdpbmVzLiAgVGhlIGBgZXhhbXBsZXMvd3NnaS9y
dW5fd3NnaS5weWBgIGV4YW1wbGUKICAgICAgICBoYXMgYmVlbiB1cGRhdGVkIHRvIHJlbW92ZSB0
aGUgdXNlIG9mIHRoZSByZW1vdmVkLWluLVB5dGhvbi0zLjEzIGBgY2dpYGAKICAgICAgICBtb2R1
bGUsIGFuZCB0byBiZSBydW5uYWJsZSBhcyBhIG1vZHVsZSBmcm9tIHRoZSBwcm9qZWN0IHJvb3Qu
CgogICAgLi4gY2hhbmdlOjoKICAgICAgICA6dGFnczogYnVnLCBleGNlcHRpb25zCiAgICAgICAg
OnRpY2tldHM6IDQzMCwgMjQ1LCA0MjgKCiAgICAgICAgQSBzZXJpZXMgb2YgZml4ZXMgaW52b2x2
aW5nIHN5bnRheCB3YXJuaW5ncyBhbmQgZXhjZXB0aW9ucyBmb3VuZAogICAgICAgIGR1cmluZyB0
ZW1wbGF0ZSBsZXhpbmcgLyBjb21waWxhdGlvbjoKCiAgICAgICAgKiBXYXJuaW5ncyByYWlzZWQg
d2hpbGUgYSB0ZW1wbGF0ZSBpcyBjb21waWxlZCwgd2hpY2ggaW4gcHJhY3RpY2UgbWVhbnMKICAg
ICAgICAgIGBgU3ludGF4V2FybmluZ2BgLCBub3cgcmVwb3J0IHRoZSBmaWxlbmFtZSBhbmQgbGlu
ZSBudW1iZXIgb2YgdGhlCiAgICAgICAgICB0ZW1wbGF0ZSByYXRoZXIgdGhhbiBhIGxpbmUgd2l0
aGluIHRoZSBnZW5lcmF0ZWQgbW9kdWxlLCBhbmQgYXJlIG5vCiAgICAgICAgICBsb25nZXIgcmVw
b3J0ZWQgdHdpY2UuICBUaGlzIGFwcGxpZXMgZXF1YWxseSB0byB0ZW1wbGF0ZXMgY29tcGlsZWQg
ZnJvbSBhCiAgICAgICAgICBzdHJpbmcsIGZyb20gYSBmaWxlLCBhbmQgdG8gYSBtb2R1bGUgZmls
ZSBpbiBhCiAgICAgICAgICA6cGFyYW1yZWY6YC5UZW1wbGF0ZS5tb2R1bGVfZGlyZWN0b3J5YCwg
YXMgZG9lcyBhIHdhcm5pbmcgcmFpc2VkIHdoaWxlCiAgICAgICAgICB0aGUgbW9kdWxlIGxldmVs
IGNvZGUgb2YgYSBgYDwlISAlPmBgIGJsb2NrIHJ1bnMuICBXYXJuaW5ncyByYWlzZWQgd2hpbGUK
ICAgICAgICAgIGEgdGVtcGxhdGUgcmVuZGVycyBjb250aW51ZSB0byByZXBvcnQgdGhlIGxvY2F0
aW9uIHdpdGhpbiB0aGUgZ2VuZXJhdGVkCiAgICAgICAgICBtb2R1bGUuCgogICAgICAgICAgVG8g
ZG8gdGhpcywgTWFrbyByZXBsYWNlcyBgYHdhcm5pbmdzLnNob3d3YXJuaW5nYGAgd2hpbGUgYSB0
ZW1wbGF0ZSBpcwoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNoYXJh
Y3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVudCB0
byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLjMtbWFrb18xLjMuMTIuYmIgPT4gcHl0aG9uMy1tYWtv
XzEuNC4wLmJifSB8IDIzICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24ve3B5dGhvbjMtbWFrb18xLjMuMTIuYmIgPT4gcHl0aG9uMy1tYWtvXzEuNC4wLmJi
fSAoMzklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1tYWtvXzEuMy4xMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1t
YWtvXzEuNC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggMzklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy4xMi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29fMS40LjAuYmIKaW5kZXggYjJjMWE4
ZGFkOC4uYmIyMDM0MjE3MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLW1ha29fMS4zLjEyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1tYWtvXzEuNC4wLmJiCkBAIC0xLDE0ICsxLDMzIEBACisjIEZJWE1FOiB0aGUg
TElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBn
cmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xk
IGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2
YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1p
dCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5z
ZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgor
IworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSw0ICsxLDQgQEAKKyMgLUNv
cHlyaWdodCAyMDA2LTIwMjUgdGhlIE1ha28gYXV0aG9ycyBhbmQgY29udHJpYnV0b3JzIDxzZWUg
QVVUSE9SUyBmaWxlPi4KKyMgK0NvcHlyaWdodCAyMDA2LTIwMjYgdGhlIE1ha28gYXV0aG9ycyBh
bmQgY29udHJpYnV0b3JzIDxzZWUgQVVUSE9SUyBmaWxlPi4KKyMgIAorIyAgUGVybWlzc2lvbiBp
cyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5n
IGEgY29weSBvZgorIyAgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9u
IGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwgaW4KKyMgCisjCisKIFNVTU1BUlkgPSAi
VGVtcGxhdGluZyBsaWJyYXJ5IGZvciBQeXRob24iCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3Lm1h
a290ZW1wbGF0ZXMub3JnLyIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJN
SVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03MzAyNmI1MDgwMDE2
M2JkM2M3NWNmZGMxMjFkOWViNSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PWM3OWNlZmY4OWRmMGE3MmYyOWJiMGUxYjZmMGUzNmVkIgogCiBQWVBJX1BBQ0tBR0UgPSAi
bWFrbyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgcHRlc3Qt
cHl0aG9uLXB5dGVzdAogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWY3NzhlOTMyODliZDQxMGJi
MzVkYWFkZWI0ZmM2NmQ5NWE3NDZmMGI3NTc3N2I5NDIwODhiN2ZkN2FmNTUwYSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI2MWFhYzk2MTllMTMyNWZhNmU3YmUyZjhkZDQ2M2NhZWY2MTI0N2IzY2Qz
MmE0MWE4NjkyNjg0NTQ4MjY5Y2UzIgogCiBSREVQRU5EUzoke1BOfSA9ICJweXRob24zLWh0bWwg
XAogICAgICAgICAgICAgICAgICAgcHl0aG9uMy1tYXJrdXBzYWZlIFwKLS0gCjIuNDcuMQoK

--===============3808975106657188274==--

