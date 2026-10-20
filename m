Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1946.1792480406111515043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=I8Dxgpd/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hPJlFLZ9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a158286a0e-cf539857-dcf0-4c2d-bef1-a1301f13f43e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792480406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wM7HNerfQwCTsMNgsmsj+FofUc8vuwU0+s7vsP81W90=;
	b=I8Dxgpd/d872sTOp6SVGBf/Up0zz4Isbi0jpzzsWHf+0ShPCF6eCxxwcQ2g5no9r
	b5qKHutfiJ2eRIyow/CBNizDmjXEtQhG9ydPifc1RxFE6JFtHg6IBWL4MfpY7+2kRUx
	yRrGxM7Lfe4654GG37fC5l9u6YKn+49mFsLxQqfY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792480406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wM7HNerfQwCTsMNgsmsj+FofUc8vuwU0+s7vsP81W90=;
	b=hPJlFLZ9QDVANwBgHbBY6+I614hnIkALzR1sxBP2yVVRHPPBgUGbdVmiwSVlbKLV
	w8oVyi9t/0JFLS0QrfeX+WyRx7LDnCuccQWqvNnsdY8ntSK52yj/QhfjV5AfSH0fhAK
	LDBtP2/Xvg2d/jQxZ121EtnWaLE2j8eUGA8psSz8=
Content-Type: multipart/mixed; boundary="===============2128868136223797590=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 9.1.1 SUCCEEDED
Message-ID: <010101a158286a0e-cf539857-dcf0-4c2d-bef1-a1301f13f43e-000000@us-west-2.amazonses.com>
Date: Tue, 20 Oct 2026 07:13:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.20-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248234

--===============2128868136223797590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx* to *9.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-9.1.0-9.1.1.patch
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
From cd6c01a069050ef2780c93cd53cd4d477b885d1c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 20 Oct 2026 06:48:38 +0000
Subject: [PATCH] python3-sphinx: upgrade 9.1.0 -> 9.1.1

==========
Sphinx 8.2
==========

Release 8.2.3 (released Mar 02, 2025)
=====================================

Bugs fixed
----------

Release 8.2.2 (released Mar 02, 2025)
=====================================

Bugs fixed
----------

Release 8.2.1 (released Feb 21, 2025)
=====================================

Bugs fixed
----------

Release 8.2.0 (released Feb 18, 2025)
=====================================

Dependencies
------------

Incompatible changes
--------------------

Deprecated
----------

Features added
--------------

Bugs fixed
----------

Testing
-------

==========
Sphinx 9.0
==========

Release 9.0.4 (released Dec 04, 2025)
=====================================

Bugs fixed
----------

Release 9.0.3 (released Dec 04, 2025)
=====================================

Bugs fixed
----------

Release 9.0.2 (released Dec 03, 2025)
=====================================

Bugs fixed
----------

Release 9.0.1 (released Dec 01, 2025)
=====================================

Bugs fixed
----------

Release 9.0.0 (released Nov 30, 2025)
=====================================

Dependencies
------------

  .. _Docutils 0.22: https://docutils.sourceforge.io/RELEASE-
  NOTES.html#release-0-22-2026-07-29

Incompatible changes
--------------------

Deprecated
----------

Features added
--------------

Bugs fixed
----------
---
 ...l-deprecate-the-fix_refuris-helper-f.patch | 14 +++++-----
 ...phinx_9.1.0.bb => python3-sphinx_9.1.1.bb} | 26 +++++++++++++++++--
 2 files changed, 31 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_9.1.0.bb => python3-sphinx_9.1.1.bb} (51%)

diff --git a/meta/recipes-devtools/python/python3-sphinx/0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch b/meta/recipes-devtools/python/python3-sphinx/0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch
index 1adf82d7ef..2650051ad7 100644
--- a/meta/recipes-devtools/python/python3-sphinx/0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch
+++ b/meta/recipes-devtools/python/python3-sphinx/0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch
@@ -1,4 +1,4 @@
-From 323350c9c4df6be0935e7237ce20add8ccd1bb13 Mon Sep 17 00:00:00 2001
+From 3c5ccb998b9d610d853abc8d6f1bb870f6899e80 Mon Sep 17 00:00:00 2001
 From: James Addison <jay@jp-hosting.net>
 Date: Sun, 4 Jan 2026 20:51:55 +0000
 Subject: [PATCH] Revert "singlehtml: deprecate the 'fix_refuris' helper
@@ -19,10 +19,10 @@ Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
  1 file changed, 4 insertions(+), 9 deletions(-)
 
 diff --git a/sphinx/builders/singlehtml.py b/sphinx/builders/singlehtml.py
-index 1888f6679..f895077df 100644
+index 1888f66..f895077 100644
 --- a/sphinx/builders/singlehtml.py
 +++ b/sphinx/builders/singlehtml.py
-@@ -9,7 +9,6 @@
+@@ -9,7 +9,6 @@ from docutils import nodes
  
  from sphinx._cli.util.colour import darkgreen
  from sphinx.builders.html import StandaloneHTMLBuilder
@@ -30,7 +30,7 @@ index 1888f6679..f895077df 100644
  from sphinx.environment.adapters.toctree import global_toctree_for_doc
  from sphinx.locale import __
  from sphinx.util import logging
-@@ -52,14 +51,6 @@ def get_relative_uri(self, from_: str, to: str, typ: str | None = None) -> str:
+@@ -52,14 +51,6 @@ class SingleFileHTMLBuilder(StandaloneHTMLBuilder):
          return self.get_target_uri(to, typ)
  
      def fix_refuris(self, tree: Node) -> None:
@@ -45,7 +45,7 @@ index 1888f6679..f895077df 100644
          # fix refuris with double anchor
          for refnode in tree.findall(nodes.reference):
              if 'refuri' not in refnode:
-@@ -86,6 +77,8 @@ def _get_local_toctree(
+@@ -86,6 +77,8 @@ class SingleFileHTMLBuilder(StandaloneHTMLBuilder):
          toctree = global_toctree_for_doc(
              self.env, docname, self, tags=self.tags, collapse=collapse, **kwargs
          )
@@ -54,7 +54,7 @@ index 1888f6679..f895077df 100644
          return self.render_partial(toctree)['fragment']
  
      def assemble_doctree(self) -> nodes.document:
-@@ -95,6 +88,7 @@ def assemble_doctree(self) -> nodes.document:
+@@ -95,6 +88,7 @@ class SingleFileHTMLBuilder(StandaloneHTMLBuilder):
          tree = inline_all_toctrees(self, set(), master, tree, darkgreen, [master])
          tree['docname'] = master
          self.env.resolve_references(tree, master, self)
@@ -62,7 +62,7 @@ index 1888f6679..f895077df 100644
          return tree
  
      def assemble_toc_secnumbers(self) -> dict[str, dict[str, tuple[int, ...]]]:
-@@ -145,6 +139,7 @@ def get_doc_context(self, docname: str, body: str, metatags: str) -> dict[str, A
+@@ -145,6 +139,7 @@ class SingleFileHTMLBuilder(StandaloneHTMLBuilder):
          )
          # if there is no toctree, toc is None
          if toctree:
diff --git a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb b/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb
similarity index 51%
rename from meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
rename to meta/recipes-devtools/python/python3-sphinx_9.1.1.bb
index 44ed739fc9..49e2c2fa13 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb
@@ -1,10 +1,32 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.rst
+# +++ LICENSE.rst
+# @@ -4,7 +4,7 @@
+#  Unless otherwise indicated, all code in the Sphinx project is licenced under the
+#  two clause BSD licence below.
+#  
+# -Copyright (c) 2007-2025 by the Sphinx team (see AUTHORS file).
+# +Copyright (c) 2007-2026 by the Sphinx team (see AUTHORS file).
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause AND MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=00d5910f77dc7db0f754b71c3c11317b"
 
-SRC_URI[sha256sum] = "7741722357dd75f8190766926071fed3bdc211c74dd2d7d4df5404da95930ddb"
+SRC_URI[sha256sum] = "48b627f02908f22c601b3ba9c7b17265b4f315dd05c8bc64cd4da41183f44fbc"
 
 SRC_URI += "file://0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch"
 
-- 
2.47.1


--===============2128868136223797590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1993 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-34b34bef83361e9468c01da60ecdd07ee078baba"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:34b34bef83361e9468c01da60ecdd07ee078baba"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 747 Local 536 Mirrors 0 Missed 211 Current 300 (71% match, 79% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 321 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 428 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 431 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 435 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 463 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 534 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 1047 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 584 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 625 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.99.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 646 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 651 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.99.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinx-9.1.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.99.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.99.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinx-9.1.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 671 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 684 of 1047 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_setscene)
NOTE: recipe libstd-rs-1.99.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 693 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 698 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package_setscene)
NOTE: Running setscene task 709 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libcxx-23.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 711 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-23.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 720 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.99.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 723 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.99.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 725 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 741 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe compiler-rt-23.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcxx-23.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 744 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.99.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 754 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.99.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe compiler-rt-23.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 853 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_fetch)
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_packagedata_setscene)
NOTE: Running task 874 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb:do_fetch)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 902 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_recipe_qa)
NOTE: Running setscene task 781 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running task 903 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_recipe_qa)
NOTE: Running task 905 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_fetch)
NOTE: recipe python3-pygments-2.21.0-r0: task do_package_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 927 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_recipe_qa)
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 934 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_recipe_qa)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_fetch: Started
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.20-r0: task do_recipe_qa: Started
NOTE: recipe python3-certifi-2026.7.22-r0: task do_recipe_qa: Started
NOTE: Running task 935 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 805 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe libcxx-23.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1022 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb:do_unpack)
NOTE: Running task 1024 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1027 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_unpack)
NOTE: Running setscene task 809 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1050 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_recipe_qa)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1051 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_patch)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcxx-23.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-23.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_unpack: Started
NOTE: Running setscene task 820 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 821 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2026.7.22-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 822 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 829 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 830 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.20-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 831 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 833 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_patch: Started
NOTE: recipe libcxx-23.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1063 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_fetch)
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1064 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_fetch)
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 840 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-23.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 841 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.20-r0: task do_fetch: Started
NOTE: Running task 1082 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2026.7.22-r0: task do_fetch: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-idna-3.20-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2026.7.22-r0: task do_fetch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1099 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1100 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1101 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_unpack)
NOTE: Running task 1102 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_unpack)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe compiler-rt-23.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 869 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-9.1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 870 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1137 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_patch)
NOTE: Running task 1140 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_fetch)
NOTE: recipe python3-pygments-2.21.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_fetch: Started
NOTE: recipe compiler-rt-23.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: Running setscene task 875 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 876 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.20-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2026.7.22-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 877 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2026.7.22-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.20-r0: task do_unpack: Succeeded
NOTE: Running task 1143 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_patch)
NOTE: Running task 1144 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_patch)
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_fetch: Started
NOTE: Running task 1145 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb:do_patch)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinx-9.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1150 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_recipe_qa)
NOTE: recipe python3-babel-2.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1151 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_recipe_qa)
NOTE: recipe python3-packaging-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1153 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_fetch)
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2026.7.22-r0: task do_patch: Started
NOTE: Running setscene task 881 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.20-r0: task do_patch: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 884 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_deploy_source_date_epoch unihash changed to 2a89b2d38551293dc78db34ab7add77ae8a0b4a0f22f7dfe722a13bc361d2736
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_patch: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_recipe_qa: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_fetch: Started
NOTE: Running setscene task 889 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2026.7.22-r0: task do_patch: Succeeded
NOTE: Running setscene task 896 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 898 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.20-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1173 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_unpack)
NOTE: Running task 1175 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_recipe_qa)
NOTE: Running task 1176 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_recipe_qa)
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_patch: Succeeded
NOTE: Running task 1177 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_recipe_qa)
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1184 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_recipe_qa)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1190 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_recipe_qa)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-packaging-26.3-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 913 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1206 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_recipe_qa)
NOTE: Running task 1207 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_recipe_qa)
NOTE: recipe python3-packaging-26.3-r0: task do_unpack: Succeeded
NOTE: Running task 1209 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_patch)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1210 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_recipe_qa)
NOTE: Running task 1216 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_recipe_qa)
NOTE: recipe python3-docutils-0.23-r0: task do_recipe_qa: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 920 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 921 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 922 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_recipe_qa: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_recipe_qa: Started
NOTE: Running setscene task 923 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_patch: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_recipe_qa: Started
NOTE: Running setscene task 925 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 926 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 927 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 929 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 930 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-docutils-0.23-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 931 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 932 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 933 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 935 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 936 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 937 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 938 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 940 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 941 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 942 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 945 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 946 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 947 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 951 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 958 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 963 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 969 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 974 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 975 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 977 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 980 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 982 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 984 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 986 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 988 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 991 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 993 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1375 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1381 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_fetch)
NOTE: Running task 1387 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_fetch)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1403 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_fetch)
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1404 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_fetch)
NOTE: Running task 1405 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1002 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1411 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_fetch)
NOTE: recipe expat-2.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1423 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_fetch)
NOTE: Running task 1424 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_fetch)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1430 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_fetch)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_fetch: Started
NOTE: Running task 1436 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_fetch)
NOTE: Running task 1437 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_fetch)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1004 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1007 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1009 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1448 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_unpack)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.23-r0: task do_fetch: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1454 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1456 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_fetch: Started
NOTE: Running task 1464 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_unpack)
NOTE: Running task 1492 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_unpack)
NOTE: Running task 1493 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.23-r0: task do_fetch: Succeeded
NOTE: Running task 1494 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_fetch: Started
NOTE: Running task 1495 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1496 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_unpack)
NOTE: recipe python3-requests-2.34.2-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1497 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1498 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_unpack)
NOTE: recipe python3-requests-2.34.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_unpack: Started
NOTE: Running task 1504 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_unpack)
NOTE: Running task 1505 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-9.1.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1506 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_unpack: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_unpack: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1512 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_unpack)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1012 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_unpack: Started
NOTE: Running task 1513 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_unpack)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1514 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_unpack)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.23-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1535 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1541 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_unpack: Started
NOTE: Running task 1542 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_patch)
NOTE: Running setscene task 1014 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1015 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: Running task 1543 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_patch)
NOTE: Running task 1544 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.23-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_unpack: Started
NOTE: Running task 1545 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_patch)
NOTE: recipe python3-requests-2.34.2-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_unpack: Succeeded
NOTE: Running task 1546 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_patch)
NOTE: Running task 1547 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_patch)
NOTE: Running task 1548 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_patch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_patch: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1549 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_patch)
NOTE: recipe python3-babel-2.18.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1550 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_patch)
NOTE: Running task 1551 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1557 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.23-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1558 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_patch: Started
NOTE: Running task 1566 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb:do_rust_gen_targets)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1567 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1568 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1569 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.21.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_patch: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1570 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_patch)
NOTE: Running setscene task 1017 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-9.1.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_patch: Started
NOTE: Running task 1571 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.34.2-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.23-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1589 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1593 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1594 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.20-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1595 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1596 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1597 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2026.7.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1598 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.34.2-r0: task do_patch: Succeeded
NOTE: Running task 1599 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-9.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1600 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1601 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-pygments-2.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1603 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1018 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 1019 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-docutils-0.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-9.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_deploy_source_date_epoch unihash changed to 4a53e06757b23067957c0a8d0686617dd1bd9091d0b116897af8efe052a7dfa4
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-idna-3.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_deploy_source_date_epoch unihash changed to 651fc2f7b0aa696af5259d5273856e2584171e6222c0bac56a679a61f868b263
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb:do_deploy_source_date_epoch unihash changed to 5368415035576b5fd68a5073983e67ce9970e641289652e2c8446a26ef802a7b
NOTE: recipe python3-certifi-2026.7.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1014 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1024 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1025 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-9.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1606 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1607 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1608 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1609 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1610 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1611 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1624 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_recipe_qa)
NOTE: Running task 1628 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: recipe python3-babel-2.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1638 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_check_backend)
NOTE: Running task 1639 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_check_backend)
NOTE: Running task 1642 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_recipe_qa)
NOTE: Running task 1643 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb:do_recipe_qa)
NOTE: Running task 1721 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_create_recipe_spdx)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_check_backend: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_check_backend: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_recipe_qa: Started
NOTE: recipe python3-urllib3-2.8.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_check_backend: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_check_backend: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1730 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: Running task 1733 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_create_recipe_spdx)
NOTE: Running task 1734 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1735 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_create_recipe_spdx)
NOTE: recipe python3-sphinx-9.1.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1738 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_create_recipe_spdx)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1027 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 1028 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1029 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.21.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 1030 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 1031 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1032 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-requests-2.34.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1037 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1750 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1751 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_fetch)
NOTE: Running task 1752 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb:do_fetch)
NOTE: Running task 1753 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: Running task 1755 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_create_recipe_spdx)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1756 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_create_recipe_spdx)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1757 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_create_recipe_spdx)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1758 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_create_recipe_spdx)
NOTE: Running task 1759 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_create_recipe_spdx)
NOTE: Running task 1760 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_recipe_spdx)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_fetch: Started
NOTE: Running task 1761 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-urllib3-2.8.0-r0: task do_fetch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1762 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: recipe python3-urllib3-2.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1763 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1043 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1769 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_recipe_spdx)
NOTE: recipe python3-docutils-0.23-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 1045 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1770 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_check_backend)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.8.0-r0: task do_unpack: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1771 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_unpack)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1772 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-urllib3-2.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1774 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1775 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_check_backend: Started
NOTE: Running setscene task 1047 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_check_backend: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1776 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1790 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_create_recipe_spdx)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_unpack: Started
NOTE: Running task 1791 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.8.0-r0: task do_patch: Started
NOTE: Running task 1797 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-docutils-0.23-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1798 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_create_recipe_spdx)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1799 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_create_recipe_spdx)
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1801 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_check_backend)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1802 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-urllib3-2.8.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_check_backend: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2099 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_check_backend: Succeeded
NOTE: Running task 2100 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2147 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2160 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2161 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2162 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2207 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2208 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_unpack: Succeeded
NOTE: Running task 2209 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch unihash changed to 3b649f485624df111cb2b1c6ec2abe3b7bca98292d7fb0f1fc7e17f05cc801f1
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 2210 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2026.7.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2211 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2212 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2213 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2214 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2215 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2216 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2217 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_configure)
NOTE: recipe python3-idna-3.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2218 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_configure)
NOTE: recipe python3-certifi-2026.7.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2219 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_configure)
NOTE: recipe python3-sphinx-9.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2220 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2221 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_configure)
NOTE: recipe python3-packaging-26.3-r0: task do_configure: Started
NOTE: Running task 2222 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure: Started
NOTE: Running task 2223 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure: Started
NOTE: Running task 2224 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2225 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.20-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2226 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2026.7.22-r0: task do_configure: Started
NOTE: recipe python3-sphinx-9.1.1-r0: task do_configure: Started
NOTE: Running task 2227 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_configure_ptest_base)
NOTE: Running task 2228 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-babel-2.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2229 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_configure)
NOTE: Running task 2230 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_configure)
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2231 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.20-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2232 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2233 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_configure_ptest_base)
NOTE: recipe python3-packaging-26.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-certifi-2026.7.22-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-sphinx-9.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_configure: Started
NOTE: Running task 2234 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_compile)
NOTE: Running task 2235 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_configure_ptest_base)
NOTE: recipe python3-packaging-26.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2236 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-idna-3.20-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_compile: Started
NOTE: Running task 2237 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-idna-3.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2238 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_compile)
NOTE: recipe python3-certifi-2026.7.22-r0: task do_configure_ptest_base: Started
NOTE: Running task 2239 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_compile)
NOTE: Running task 2240 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_configure)
NOTE: recipe python3-packaging-26.3-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2241 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_configure)
NOTE: Running task 2242 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile)
NOTE: recipe python3-certifi-2026.7.22-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2243 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile: Started
NOTE: recipe python3-idna-3.20-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile: Started
NOTE: recipe python3-certifi-2026.7.22-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_configure: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2244 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb:do_configure)
NOTE: recipe python3-requests-2.34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2245 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_configure)
NOTE: Running task 2246 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_configure)
NOTE: Running task 2247 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_configure)
NOTE: Running task 2248 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_configure)
NOTE: Running task 2249 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_configure)
NOTE: Running task 2250 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_configure)
NOTE: Running task 2251 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_configure)
NOTE: Running task 2252 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_configure)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.23-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_configure: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2253 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: Running task 2254 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_configure)
NOTE: recipe python3-docutils-0.23-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2255 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_compile)
NOTE: recipe python3-babel-2.18.0-r0: task do_configure: Succeeded
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2256 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2257 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2258 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_configure: Succeeded
NOTE: Running task 2259 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_compile)
NOTE: Running task 2260 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: Running task 2261 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb:do_configure_ptest_base)
NOTE: recipe python3-requests-2.34.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_compile: Started
NOTE: Running task 2262 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_compile: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_configure: Succeeded
NOTE: Running task 2263 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_compile)
NOTE: Running task 2264 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-docutils-0.23-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2265 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb:do_compile)
NOTE: recipe python3-packaging-26.3-r0: task do_compile: Succeeded
NOTE: Running task 2266 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2267 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_compile_ptest_base)
NOTE: recipe python3-idna-3.20-r0: task do_compile: Succeeded
NOTE: Running task 2268 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_compile)
NOTE: recipe python3-packaging-26.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_compile: Started
NOTE: recipe python3-packaging-26.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2269 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_install)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2270 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_install)
NOTE: recipe python3-packaging-26.3-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install: Started
NOTE: recipe python3-sphinx-9.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2271 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_install)
NOTE: recipe python3-sphinx-9.1.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2272 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_compile)
NOTE: Running task 2273 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_compile)
NOTE: recipe python3-certifi-2026.7.22-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2274 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: Running task 2275 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2276 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: Running task 2277 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_install)
NOTE: recipe python3-requests-2.34.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-packaging-26.3-r0: task do_install: Succeeded
NOTE: Running task 2278 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_install)
NOTE: Running task 2279 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_install)
NOTE: recipe python3-docutils-0.23-r0: task do_compile: Succeeded
NOTE: Running task 2280 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_install)
NOTE: recipe python3-pygments-2.21.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2281 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_install)
NOTE: Running task 2282 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_install)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_install: Started
NOTE: recipe python3-docutils-0.23-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2283 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_install)
NOTE: Running task 2284 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_install_ptest_base)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 2285 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_install_ptest_base)
NOTE: Running task 2286 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_install: Started
NOTE: recipe python3-packaging-26.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package: Started
NOTE: Running task 2287 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2288 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package)
NOTE: recipe python3-packaging-26.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_package: Started
NOTE: Running task 2289 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package)
NOTE: Running task 2290 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package)
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2291 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_install)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package: Started
NOTE: Running task 2292 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package: Started
NOTE: Running task 2293 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_install: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2294 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: Running task 2295 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_package: Started
NOTE: recipe python3-docutils-0.23-r0: task do_install: Succeeded
NOTE: Running task 2296 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_package)
NOTE: recipe python3-docutils-0.23-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2298 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2299 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 2300 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package)
NOTE: recipe python3-sphinx-9.1.1-r0: task do_install: Succeeded
NOTE: Running task 2301 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-requests-2.34.2-r0: task do_compile: Succeeded
NOTE: Running task 2302 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_install)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_install: Succeeded
NOTE: Running task 2303 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_install: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_install: Succeeded
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_package: Started
NOTE: Running task 2306 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_package)
NOTE: recipe python3-sphinx-9.1.1-r0: task do_package: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_package: Succeeded
NOTE: Running task 2319 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 2328 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_packagedata)
NOTE: recipe python3-requests-2.34.2-r0: task do_install: Succeeded
NOTE: Running task 2329 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_package)
NOTE: recipe python3-babel-2.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2330 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_install)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_install: Started
NOTE: Running task 2331 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_packagedata)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_package: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: Running task 2334 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_packagedata)
NOTE: Running task 2335 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata: Started
NOTE: Running task 2338 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_patch)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_patch: Started
NOTE: Running task 2339 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package: Succeeded
NOTE: Running task 2340 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_packagedata)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_patch: Succeeded
NOTE: Running task 2345 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata: Started
NOTE: Running task 2346 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_compile_ptest_base)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata: Started
NOTE: Running task 2347 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_compile_ptest_base)
NOTE: Running task 2390 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-idna-3.20-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-certifi-2026.7.22-r0: task do_compile_ptest_base: Started
NOTE: Running task 2391 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_install)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.20-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2392 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_install)
NOTE: recipe python3-certifi-2026.7.22-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2393 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 2394 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-idna-3.20-r0: task do_install: Started
NOTE: Running task 2395 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2026.7.22-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2396 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package: Succeeded
NOTE: Running task 2397 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_packagedata)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata: Started
NOTE: Running task 2398 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 2399 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2400 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2401 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install: Succeeded
NOTE: Running task 2402 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2414 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2026.7.22-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_packagedata unihash changed to 2e4ca9571e9c6edd35cfc691e8a3f96999d781051ed5ef3db2a7ff8cd346fc9d
NOTE: Setscene tasks completed
NOTE: Running task 2415 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_packagedata)
NOTE: Running task 2429 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_install_ptest_base)
NOTE: recipe python3-urllib3-2.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2430 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_install_ptest_base)
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-idna-3.20-r0: task do_install: Succeeded
NOTE: recipe python3-docutils-0.23-r0: task do_package: Succeeded
NOTE: Running task 2431 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_install_ptest_base)
NOTE: Running task 2432 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_packagedata)
NOTE: recipe python3-requests-2.34.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2433 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_packagedata)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2026.7.22-r0: task do_install_ptest_base: Started
NOTE: Running task 2458 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_populate_sysroot)
NOTE: recipe python3-babel-2.18.0-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-idna-3.20-r0: task do_install_ptest_base: Started
NOTE: Running task 2460 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_package)
NOTE: recipe python3-docutils-0.23-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2461 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb:do_deploy_source_date_epoch unihash changed to 321351a3b0a571a4117da52b589a825b0bacb074c11f3c068aa1906a9af889d6
NOTE: recipe python3-requests-2.34.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-9.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2462 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2026.7.22-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2463 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_package)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: Running task 2464 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_package)
NOTE: recipe python3-babel-2.18.0-r0: task do_package: Started
NOTE: Running task 2465 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-idna-3.20-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_configure: Started
NOTE: Running task 2466 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-certifi-2026.7.22-r0: task do_package: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2467 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_configure: Succeeded
NOTE: Running task 2468 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_compile)
NOTE: recipe python3-idna-3.20-r0: task do_package: Started
NOTE: recipe python3-docutils-0.23-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-2.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2469 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_populate_sysroot)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 2470 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb:do_configure)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2471 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-pygments-2.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-2.8.0-r0: task do_configure: Started
NOTE: Running task 2472 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2473 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb:do_compile)
NOTE: recipe python3-requests-2.34.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.8.0-r0: task do_compile: Started
NOTE: Running task 2475 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2476 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_populate_sysroot)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-docutils-0.23-r0: task do_populate_sysroot: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2477 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_populate_sysroot)
NOTE: Running task 2478 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-packaging-26.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2479 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_populate_sysroot)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2480 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_populate_sysroot)
NOTE: recipe python3-babel-2.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2481 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_populate_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_populate_sysroot: Started
NOTE: Running task 2482 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-docutils-0.23-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2483 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2484 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_populate_sysroot)
NOTE: Running task 2485 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_compile: Succeeded
NOTE: Running task 2486 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2487 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_populate_sysroot)
NOTE: recipe python3-certifi-2026.7.22-r0: task do_package: Succeeded
NOTE: Running task 2488 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_packagedata)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_install: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2489 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_packagedata)
NOTE: Running task 2490 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: recipe python3-certifi-2026.7.22-r0: task do_packagedata: Started
NOTE: Running task 2491 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_create_spdx)
NOTE: recipe python3-idna-3.20-r0: task do_package: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: Running task 2492 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: Running task 2493 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_packagedata: Started
NOTE: Running task 2494 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: recipe python3-idna-3.20-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2495 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_create_spdx)
NOTE: recipe python3-babel-2.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.8.0-r0: task do_install: Started
NOTE: Running task 2496 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2497 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_create_spdx)
NOTE: Running task 2498 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_create_spdx)
NOTE: recipe python3-requests-2.34.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_create_spdx: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2499 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_packagedata unihash changed to 8d018d53e4963224503f572dfe4893c1cf14de544f791e2ccb78272d8aeece2f
NOTE: recipe python3-pygments-2.21.0-r0: task do_create_spdx: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_create_spdx: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_spdx: Started
NOTE: Running task 2500 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2501 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_create_spdx)
NOTE: recipe python3-idna-3.20-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.20.bb:do_packagedata unihash changed to f5890bb13178f00b49eedbe16f5aea5382a81cbd1dffbfe1b72ee1387692f450
NOTE: Setscene tasks completed
NOTE: Running task 2502 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx)
NOTE: recipe python3-docutils-0.23-r0: task do_create_spdx: Started
NOTE: Running task 2503 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_packagedata)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2504 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2505 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: Running task 2506 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_create_spdx)
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinx-9.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2507 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_create_spdx)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_create_spdx: Started
NOTE: Running task 2508 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-urllib3-2.8.0-r0: task do_install: Succeeded
NOTE: Running task 2509 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2510 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_create_spdx)
NOTE: recipe python3-urllib3-2.8.0-r0: task do_package: Started
NOTE: recipe python3-sphinx-9.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2511 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_create_spdx)
NOTE: recipe python3-docutils-0.23-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2512 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2513 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_ipk)
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2514 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_deb)
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2515 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_rpm)
NOTE: Running task 2516 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_qa)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_create_spdx: Started
NOTE: Running task 2517 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_package_write_ipk)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_create_spdx: Started
NOTE: Running task 2518 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_package_write_deb)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2519 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_package_write_rpm: Started
NOTE: Running task 2520 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: recipe python3-requests-2.34.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2521 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb:do_package_qa)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-imagesize-2.0.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2522 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package_write_ipk)
NOTE: Running task 2523 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package_write_deb)
NOTE: Running task 2524 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package_write_rpm)
NOTE: recipe python3-imagesize-2.0.1-r0: task do_package_write_deb: Succeeded
NOTE: Running task 2525 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package_qa)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata unihash changed to 1d09c042c9bf1d15449a309c16cc0300288c14f61f76eb2252f9bbc41e8d757f
NOTE: recipe python3-imagesize-2.0.1-r0: task do_package_qa: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2526 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_package_write_ipk)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2527 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_package_write_deb)
NOTE: recipe python3-sphinx-9.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2528 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_package_write_rpm)
NOTE: Running task 2529 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_package_qa)
NOTE: recipe python3-pygments-2.21.0-r0: task do_package_qa: Started
NOTE: recipe python3-imagesize-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2530 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_ipk)
NOTE: recipe python3-babel-2.18.0-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 2531 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_deb)
NOTE: Running task 2532 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_packagedata)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_package_write_deb: Started
NOTE: Running task 2533 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_package_qa: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_install: Succeeded
NOTE: Running task 2534 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_package)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_package: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2535 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_create_spdx)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2536 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-2.8.0-r0: task do_package: Succeeded
NOTE: Running task 2537 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb:do_packagedata)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_create_spdx: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_package_qa: Succeeded
NOTE: Running task 2538 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_qa)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2539 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_ipk)
NOTE: recipe python3-pygments-2.21.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2540 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_deb)
NOTE: recipe python3-urllib3-2.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2541 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_rpm)
NOTE: Running task 2542 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_qa)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2543 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_package_write_ipk)
NOTE: Running task 2544 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_package_write_deb)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-2.8.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.8.0.bb:do_packagedata unihash changed to 254af9dc7d63a14aa9c66939f7a7820ecc06b87e368eece4706f996ab97a68ee
NOTE: Setscene tasks completed
NOTE: Running task 2545 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_package_write_rpm)
NOTE: recipe python3-docutils-0.23-r0: task do_package_write_ipk: Started
NOTE: recipe python3-docutils-0.23-r0: task do_package_write_deb: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_qa: Succeeded
NOTE: Running task 2546 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.23.bb:do_package_qa)
NOTE: recipe python3-pygments-2.21.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-docutils-0.23-r0: task do_package_write_rpm: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package_qa unihash changed to 813e51de261c299301a564ca366e396ae1d9390097b0b1983417d404f40cec48
NOTE: Running task 2547 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_ipk)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2548 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_deb)
NOTE: recipe python3-docutils-0.23-r0: task do_package_qa: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2549 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_rpm)
NOTE: Running task 2550 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_qa)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_deb: Succeeded
NOTE: Running task 2551 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_package_write_ipk)
NOTE: recipe python3-babel-2.18.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2552 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_package_write_deb)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-docutils-0.23-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2553 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_package_write_rpm)
NOTE: recipe python3-babel-2.18.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_package_write_deb: Started
NOTE: Running task 2554 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_package_qa)
NOTE: recipe python3-babel-2.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_package_qa: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2555 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_ipk)
NOTE: recipe python3-docutils-0.23-r0: task do_package_qa: Succeeded
NOTE: Running task 2556 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_deb)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2557 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_ipk: Started
NOTE: Running task 2558 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_qa)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_rpm: Started
NOTE: Running task 2559 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_package_write_ipk)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_qa: Started
NOTE: recipe python3-docutils-0.23-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_package_write_ipk: Started
NOTE: Running task 2560 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_package_write_deb)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2561 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_package: Succeeded
NOTE: Running task 2562 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2563 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb:do_package_qa)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_ipk unihash changed to d29a8a59edc9aac1f92a9aa5fd5ddbf703e28b9a63c61f7cefa48432c8db14d0
NOTE: Running task 2564 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_ipk)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_qa unihash changed to 6887c565c43ae9ae43295ebe5e0f95ecf73b4579fa241ed0dd34d5285b2da03a
NOTE: Running task 2565 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_deb)
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_package_qa: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2566 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_packagedata: Succeeded
NOTE: Running task 2567 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_qa)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_rpm unihash changed to f8282c9fe6759e432d1d1cb5f0c72dd149aa8a600e84d0d4b7dd51dc4cc5abe1
NOTE: Running task 2568 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_ipk)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_deb unihash changed to bb3fc2d1134c7a8d9ec7678041fbc7079381b943bd2ca845566441c1c8fd5914
NOTE: Running task 2569 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_deb)
NOTE: recipe python3-babel-2.18.0-r0: task do_package_qa: Succeeded
NOTE: Running task 2570 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-docutils-0.23-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_package_qa: Succeeded
NOTE: Running task 2571 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_qa)
NOTE: Running task 2572 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_ipk)
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_deb: Started
NOTE: Running task 2573 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_deb)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-snowballstemmer-3.1.1-r0: task do_package_write_deb: Succeeded
NOTE: Running task 2574 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2575 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_qa)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: Running task 2580 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_create_package_spdx)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_qa: Started
NOTE: Running task 2581 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_package_write_ipk)
NOTE: recipe python3-pygments-2.21.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_create_package_spdx: Started
NOTE: Running task 2582 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_package_write_deb)
NOTE: recipe python3-sphinx-9.1.1-r0: task do_package_write_ipk: Started
NOTE: Running task 2583 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2584 of 2598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb:do_package_qa)
NOTE: recipe python3-sphinx-9.1.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_package_qa: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-certifi-2026.7.22-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinx-9.1.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-sphinx-9.1.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-hypothesis-6.169.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2584 tasks of which 2181 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261020064805.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261020064805.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-certifi/2026.7.22/temp/log.do_packagedata.3223841
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2026.7.22-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2026.10.19-r0 to 0:2026.7.22-r0) [version-going-backwards]
ERROR: python3-certifi-2026.7.22-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2026.10.19-r0 to 0:2026.7.22-r0) [version-going-backwards]
ERROR: python3-certifi-2026.7.22-r0 do_packagedata: QA Issue: Package version for package python3-certifi-ptest went backwards which would break package feeds (from 0:2026.10.19-r0 to 0:2026.7.22-r0) [version-going-backwards]
ERROR: python3-certifi-2026.7.22-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2026.10.19-r0 to 0:2026.7.22-r0) [version-going-backwards]
ERROR: python3-certifi-2026.7.22-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2026.10.19-r0 to 0:2026.7.22-r0) [version-going-backwards]
ERROR: python3-certifi-2026.7.22-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2026.10.19-r0 to 0:2026.7.22-r0) [version-going-backwards]
ERROR: python3-certifi-2026.7.22-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2026.10.19-r0 to 0:2026.7.22-r0) [version-going-backwards]
ERROR: python3-certifi-2026.7.22-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2026.10.19-r0 to 0:2026.7.22-r0) [version-going-backwards]
ERROR: python3-certifi-2026.7.22-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-certifi/2026.7.22/temp/log.do_packagedata.3223841
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb:do_packagedata) failed with exit code '1'

--===============2128868136223797590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-9.1.0.tar.gz file://0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch" to "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-9.1.1.tar.gz file://0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch"
packages/x86-64-v3-poky-linux/python3-sphinx: PV changed from "9.1.0" to "9.1.1"
packages/x86-64-v3-poky-linux/python3-sphinx: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "9.1.0" to "9.1.1"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "9.1.0" to "9.1.1"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "9.1.0" to "9.1.1"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "9.1.0" to "9.1.1"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "9.1.0" to "9.1.1"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "9.1.0" to "9.1.1"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PV changed from "9.1.0" to "9.1.1"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 9.1.0 [default] to 9.1.1 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 19485327 to 19494297 (+0%)
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sphinx-9.1.0.dist-info -> /usr/lib/python3.14/site-packages/sphinx-9.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/sphinx-9.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/sphinx-9.1.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.14/site-packages/sphinx-9.1.0.dist-info moved to /usr/lib/python3.14/site-packages/sphinx-9.1.1.dist-info

--===============2128868136223797590==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-9.1.0-9.1.1.patch"

RnJvbSBjZDZjMDFhMDY5MDUwZWYyNzgwYzkzY2Q1M2NkNGQ0NzdiODg1ZDFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjAgT2N0IDIwMjYgMDY6NDg6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueDogdXBncmFkZSA5LjEuMCAtPiA5LjEuMQoKPT09PT09PT09PQpTcGhpbngg
OC4yCj09PT09PT09PT0KClJlbGVhc2UgOC4yLjMgKHJlbGVhc2VkIE1hciAwMiwgMjAyNSkKPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKQnVncyBmaXhlZAotLS0tLS0tLS0t
CgpSZWxlYXNlIDguMi4yIChyZWxlYXNlZCBNYXIgMDIsIDIwMjUpCj09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KCkJ1Z3MgZml4ZWQKLS0tLS0tLS0tLQoKUmVsZWFzZSA4LjIu
MSAocmVsZWFzZWQgRmViIDIxLCAyMDI1KQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09CgpCdWdzIGZpeGVkCi0tLS0tLS0tLS0KClJlbGVhc2UgOC4yLjAgKHJlbGVhc2VkIEZl
YiAxOCwgMjAyNSkKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKRGVwZW5k
ZW5jaWVzCi0tLS0tLS0tLS0tLQoKSW5jb21wYXRpYmxlIGNoYW5nZXMKLS0tLS0tLS0tLS0tLS0t
LS0tLS0KCkRlcHJlY2F0ZWQKLS0tLS0tLS0tLQoKRmVhdHVyZXMgYWRkZWQKLS0tLS0tLS0tLS0t
LS0KCkJ1Z3MgZml4ZWQKLS0tLS0tLS0tLQoKVGVzdGluZwotLS0tLS0tCgo9PT09PT09PT09ClNw
aGlueCA5LjAKPT09PT09PT09PQoKUmVsZWFzZSA5LjAuNCAocmVsZWFzZWQgRGVjIDA0LCAyMDI1
KQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpCdWdzIGZpeGVkCi0tLS0t
LS0tLS0KClJlbGVhc2UgOS4wLjMgKHJlbGVhc2VkIERlYyAwNCwgMjAyNSkKPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQoKQnVncyBmaXhlZAotLS0tLS0tLS0tCgpSZWxlYXNl
IDkuMC4yIChyZWxlYXNlZCBEZWMgMDMsIDIwMjUpCj09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KCkJ1Z3MgZml4ZWQKLS0tLS0tLS0tLQoKUmVsZWFzZSA5LjAuMSAocmVsZWFz
ZWQgRGVjIDAxLCAyMDI1KQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpC
dWdzIGZpeGVkCi0tLS0tLS0tLS0KClJlbGVhc2UgOS4wLjAgKHJlbGVhc2VkIE5vdiAzMCwgMjAy
NSkKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKRGVwZW5kZW5jaWVzCi0t
LS0tLS0tLS0tLQoKICAuLiBfRG9jdXRpbHMgMC4yMjogaHR0cHM6Ly9kb2N1dGlscy5zb3VyY2Vm
b3JnZS5pby9SRUxFQVNFLQogIE5PVEVTLmh0bWwjcmVsZWFzZS0wLTIyLTIwMjYtMDctMjkKCklu
Y29tcGF0aWJsZSBjaGFuZ2VzCi0tLS0tLS0tLS0tLS0tLS0tLS0tCgpEZXByZWNhdGVkCi0tLS0t
LS0tLS0KCkZlYXR1cmVzIGFkZGVkCi0tLS0tLS0tLS0tLS0tCgpCdWdzIGZpeGVkCi0tLS0tLS0t
LS0KLS0tCiAuLi5sLWRlcHJlY2F0ZS10aGUtZml4X3JlZnVyaXMtaGVscGVyLWYucGF0Y2ggfCAx
NCArKysrKy0tLS0tCiAuLi5waGlueF85LjEuMC5iYiA9PiBweXRob24zLXNwaGlueF85LjEuMS5i
Yn0gfCAyNiArKysrKysrKysrKysrKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi97cHl0aG9uMy1zcGhpbnhfOS4xLjAuYmIgPT4gcHl0aG9uMy1zcGhpbnhfOS4xLjEuYmJ9ICg1
MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNw
aGlueC8wMDAxLVJldmVydC1zaW5nbGVodG1sLWRlcHJlY2F0ZS10aGUtZml4X3JlZnVyaXMtaGVs
cGVyLWYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54
LzAwMDEtUmV2ZXJ0LXNpbmdsZWh0bWwtZGVwcmVjYXRlLXRoZS1maXhfcmVmdXJpcy1oZWxwZXIt
Zi5wYXRjaAppbmRleCAxYWRmODJkN2VmLi4yNjUwMDUxYWQ3IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54LzAwMDEtUmV2ZXJ0LXNpbmdsZWh0
bWwtZGVwcmVjYXRlLXRoZS1maXhfcmVmdXJpcy1oZWxwZXItZi5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54LzAwMDEtUmV2ZXJ0LXNpbmdsZWh0
bWwtZGVwcmVjYXRlLXRoZS1maXhfcmVmdXJpcy1oZWxwZXItZi5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMzIzMzUwYzljNGRmNmJlMDkzNWU3MjM3Y2UyMGFkZDhjY2QxYmIxMyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2M1Y2NiOTk4YjlkNjEwZDg1M2FiYzhkNmYxYmI4NzBm
Njg5OWU4MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEphbWVzIEFkZGlzb24gPGph
eUBqcC1ob3N0aW5nLm5ldD4KIERhdGU6IFN1biwgNCBKYW4gMjAyNiAyMDo1MTo1NSArMDAwMAog
U3ViamVjdDogW1BBVENIXSBSZXZlcnQgInNpbmdsZWh0bWw6IGRlcHJlY2F0ZSB0aGUgJ2ZpeF9y
ZWZ1cmlzJyBoZWxwZXIKQEAgLTE5LDEwICsxOSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlu
IEdvZGFyZCA8YW50b25pbi5nb2RhcmRAYm9vdGxpbi5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3NwaGlueC9idWls
ZGVycy9zaW5nbGVodG1sLnB5IGIvc3BoaW54L2J1aWxkZXJzL3NpbmdsZWh0bWwucHkKLWluZGV4
IDE4ODhmNjY3OS4uZjg5NTA3N2RmIDEwMDY0NAoraW5kZXggMTg4OGY2Ni4uZjg5NTA3NyAxMDA2
NDQKIC0tLSBhL3NwaGlueC9idWlsZGVycy9zaW5nbGVodG1sLnB5CiArKysgYi9zcGhpbngvYnVp
bGRlcnMvc2luZ2xlaHRtbC5weQotQEAgLTksNyArOSw2IEBACitAQCAtOSw3ICs5LDYgQEAgZnJv
bSBkb2N1dGlscyBpbXBvcnQgbm9kZXMKICAKICBmcm9tIHNwaGlueC5fY2xpLnV0aWwuY29sb3Vy
IGltcG9ydCBkYXJrZ3JlZW4KICBmcm9tIHNwaGlueC5idWlsZGVycy5odG1sIGltcG9ydCBTdGFu
ZGFsb25lSFRNTEJ1aWxkZXIKQEAgLTMwLDcgKzMwLDcgQEAgaW5kZXggMTg4OGY2Njc5Li5mODk1
MDc3ZGYgMTAwNjQ0CiAgZnJvbSBzcGhpbnguZW52aXJvbm1lbnQuYWRhcHRlcnMudG9jdHJlZSBp
bXBvcnQgZ2xvYmFsX3RvY3RyZWVfZm9yX2RvYwogIGZyb20gc3BoaW54LmxvY2FsZSBpbXBvcnQg
X18KICBmcm9tIHNwaGlueC51dGlsIGltcG9ydCBsb2dnaW5nCi1AQCAtNTIsMTQgKzUxLDYgQEAg
ZGVmIGdldF9yZWxhdGl2ZV91cmkoc2VsZiwgZnJvbV86IHN0ciwgdG86IHN0ciwgdHlwOiBzdHIg
fCBOb25lID0gTm9uZSkgLT4gc3RyOgorQEAgLTUyLDE0ICs1MSw2IEBAIGNsYXNzIFNpbmdsZUZp
bGVIVE1MQnVpbGRlcihTdGFuZGFsb25lSFRNTEJ1aWxkZXIpOgogICAgICAgICAgcmV0dXJuIHNl
bGYuZ2V0X3RhcmdldF91cmkodG8sIHR5cCkKICAKICAgICAgZGVmIGZpeF9yZWZ1cmlzKHNlbGYs
IHRyZWU6IE5vZGUpIC0+IE5vbmU6CkBAIC00NSw3ICs0NSw3IEBAIGluZGV4IDE4ODhmNjY3OS4u
Zjg5NTA3N2RmIDEwMDY0NAogICAgICAgICAgIyBmaXggcmVmdXJpcyB3aXRoIGRvdWJsZSBhbmNo
b3IKICAgICAgICAgIGZvciByZWZub2RlIGluIHRyZWUuZmluZGFsbChub2Rlcy5yZWZlcmVuY2Up
OgogICAgICAgICAgICAgIGlmICdyZWZ1cmknIG5vdCBpbiByZWZub2RlOgotQEAgLTg2LDYgKzc3
LDggQEAgZGVmIF9nZXRfbG9jYWxfdG9jdHJlZSgKK0BAIC04Niw2ICs3Nyw4IEBAIGNsYXNzIFNp
bmdsZUZpbGVIVE1MQnVpbGRlcihTdGFuZGFsb25lSFRNTEJ1aWxkZXIpOgogICAgICAgICAgdG9j
dHJlZSA9IGdsb2JhbF90b2N0cmVlX2Zvcl9kb2MoCiAgICAgICAgICAgICAgc2VsZi5lbnYsIGRv
Y25hbWUsIHNlbGYsIHRhZ3M9c2VsZi50YWdzLCBjb2xsYXBzZT1jb2xsYXBzZSwgKiprd2FyZ3MK
ICAgICAgICAgICkKQEAgLTU0LDcgKzU0LDcgQEAgaW5kZXggMTg4OGY2Njc5Li5mODk1MDc3ZGYg
MTAwNjQ0CiAgICAgICAgICByZXR1cm4gc2VsZi5yZW5kZXJfcGFydGlhbCh0b2N0cmVlKVsnZnJh
Z21lbnQnXQogIAogICAgICBkZWYgYXNzZW1ibGVfZG9jdHJlZShzZWxmKSAtPiBub2Rlcy5kb2N1
bWVudDoKLUBAIC05NSw2ICs4OCw3IEBAIGRlZiBhc3NlbWJsZV9kb2N0cmVlKHNlbGYpIC0+IG5v
ZGVzLmRvY3VtZW50OgorQEAgLTk1LDYgKzg4LDcgQEAgY2xhc3MgU2luZ2xlRmlsZUhUTUxCdWls
ZGVyKFN0YW5kYWxvbmVIVE1MQnVpbGRlcik6CiAgICAgICAgICB0cmVlID0gaW5saW5lX2FsbF90
b2N0cmVlcyhzZWxmLCBzZXQoKSwgbWFzdGVyLCB0cmVlLCBkYXJrZ3JlZW4sIFttYXN0ZXJdKQog
ICAgICAgICAgdHJlZVsnZG9jbmFtZSddID0gbWFzdGVyCiAgICAgICAgICBzZWxmLmVudi5yZXNv
bHZlX3JlZmVyZW5jZXModHJlZSwgbWFzdGVyLCBzZWxmKQpAQCAtNjIsNyArNjIsNyBAQCBpbmRl
eCAxODg4ZjY2NzkuLmY4OTUwNzdkZiAxMDA2NDQKICAgICAgICAgIHJldHVybiB0cmVlCiAgCiAg
ICAgIGRlZiBhc3NlbWJsZV90b2Nfc2VjbnVtYmVycyhzZWxmKSAtPiBkaWN0W3N0ciwgZGljdFtz
dHIsIHR1cGxlW2ludCwgLi4uXV1dOgotQEAgLTE0NSw2ICsxMzksNyBAQCBkZWYgZ2V0X2RvY19j
b250ZXh0KHNlbGYsIGRvY25hbWU6IHN0ciwgYm9keTogc3RyLCBtZXRhdGFnczogc3RyKSAtPiBk
aWN0W3N0ciwgQQorQEAgLTE0NSw2ICsxMzksNyBAQCBjbGFzcyBTaW5nbGVGaWxlSFRNTEJ1aWxk
ZXIoU3RhbmRhbG9uZUhUTUxCdWlsZGVyKToKICAgICAgICAgICkKICAgICAgICAgICMgaWYgdGhl
cmUgaXMgbm8gdG9jdHJlZSwgdG9jIGlzIE5vbmUKICAgICAgICAgIGlmIHRvY3RyZWU6CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzkuMS4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF85LjEuMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDUxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc3BoaW54XzkuMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzkuMS4xLmJiCmluZGV4IDQ0ZWQ3MzlmYzkuLjQ5
ZTJjMmZhMTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zcGhpbnhfOS4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNwaGlueF85LjEuMS5iYgpAQCAtMSwxMCArMSwzMiBAQAorIyBGSVhNRTogdGhlIExJQ19G
SUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUn
LgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQg
dGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUg
aWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVz
c2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBk
YXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMg
LS0tIExJQ0VOU0UucnN0CisjICsrKyBMSUNFTlNFLnJzdAorIyBAQCAtNCw3ICs0LDcgQEAKKyMg
IFVubGVzcyBvdGhlcndpc2UgaW5kaWNhdGVkLCBhbGwgY29kZSBpbiB0aGUgU3BoaW54IHByb2pl
Y3QgaXMgbGljZW5jZWQgdW5kZXIgdGhlCisjICB0d28gY2xhdXNlIEJTRCBsaWNlbmNlIGJlbG93
LgorIyAgCisjIC1Db3B5cmlnaHQgKGMpIDIwMDctMjAyNSBieSB0aGUgU3BoaW54IHRlYW0gKHNl
ZSBBVVRIT1JTIGZpbGUpLgorIyArQ29weXJpZ2h0IChjKSAyMDA3LTIwMjYgYnkgdGhlIFNwaGlu
eCB0ZWFtIChzZWUgQVVUSE9SUyBmaWxlKS4KKyMgIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICAK
KyMgIFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdp
dGggb3Igd2l0aG91dAorIyAKKyMKKwogU1VNTUFSWSA9ICJQeXRob24gZG9jdW1lbnRhdGlvbiBn
ZW5lcmF0b3IiCiBIT01FUEFHRSA9ICJodHRwOi8vc3BoaW54LWRvYy5vcmcvIgogU0VDVElPTiA9
ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSBBTkQgTUlUIgotTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1PWUzMGMzN2EyYjdmYjBhZmEzYWRj
MGQ3MmI4NWU4YjA0IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1
PTAwZDU5MTBmNzdkYzdkYjBmNzU0YjcxYzNjMTEzMTdiIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNzc0MTcyMjM1N2RkNzVmODE5MDc2NjkyNjA3MWZlZDNiZGMyMTFjNzRkZDJkN2Q0ZGY1NDA0
ZGE5NTkzMGRkYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0OGI2MjdmMDI5MDhmMjJjNjAxYjNi
YTljN2IxNzI2NWI0ZjMxNWRkMDVjOGJjNjRjZDRkYTQxMTgzZjQ0ZmJjIgogCiBTUkNfVVJJICs9
ICJmaWxlOi8vMDAwMS1SZXZlcnQtc2luZ2xlaHRtbC1kZXByZWNhdGUtdGhlLWZpeF9yZWZ1cmlz
LWhlbHBlci1mLnBhdGNoIgogCi0tIAoyLjQ3LjEKCg==

--===============2128868136223797590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-sphinx-changelog.txt"

==========
Sphinx 8.2
==========

Release 8.2.3 (released Mar 02, 2025)
=====================================

Bugs fixed
----------

Release 8.2.2 (released Mar 02, 2025)
=====================================

Bugs fixed
----------

Release 8.2.1 (released Feb 21, 2025)
=====================================

Bugs fixed
----------

Release 8.2.0 (released Feb 18, 2025)
=====================================

Dependencies
------------

Incompatible changes
--------------------

Deprecated
----------

Features added
--------------

Bugs fixed
----------

Testing
-------

==========
Sphinx 9.0
==========

Release 9.0.4 (released Dec 04, 2025)
=====================================

Bugs fixed
----------

Release 9.0.3 (released Dec 04, 2025)
=====================================

Bugs fixed
----------

Release 9.0.2 (released Dec 03, 2025)
=====================================

Bugs fixed
----------

Release 9.0.1 (released Dec 01, 2025)
=====================================

Bugs fixed
----------

Release 9.0.0 (released Nov 30, 2025)
=====================================

Dependencies
------------

  .. _Docutils 0.22: https://docutils.sourceforge.io/RELEASE-
  NOTES.html#release-0-22-2026-07-29

Incompatible changes
--------------------

Deprecated
----------

Features added
--------------

Bugs fixed
----------

--===============2128868136223797590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sphinx-9.1.0.dist-info -> /usr/lib/python3.14/site-packages/sphinx-9.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/sphinx-9.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/sphinx-9.1.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.14/site-packages/sphinx-9.1.0.dist-info moved to /usr/lib/python3.14/site-packages/sphinx-9.1.1.dist-info

--===============2128868136223797590==--
