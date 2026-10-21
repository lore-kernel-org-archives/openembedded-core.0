Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5515.1792563747097886667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 23:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HqNxpThO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tOBQnB65;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a15d20150a-424aee9c-c7f9-48be-a69a-c2d94b0971c3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792563746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MUHcCa94uFV3r5PYoMCffuJu9m4kKbPoZZWrZHQNgeY=;
	b=HqNxpThOeS/L71jH89J2GmJHDm6vmC8DrZ2mFTB02lGP4fSuo6rZeDgGC40gtAIi
	B+5p+iAmktxlH0Xsa77PwX7vks2mqakbv3ISN5WFcYWZ8LjGydyA9agLjpuDzd4Enry
	0klqmS2o9OxuxqKLjt4/U4/HQwwYW8PkfplkNHOI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792563746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MUHcCa94uFV3r5PYoMCffuJu9m4kKbPoZZWrZHQNgeY=;
	b=tOBQnB658cR0GvQKHjZLn7S3rAxvfqzzDxPISa0vrkXMusHnm+rSZ2op3Opr2J2j
	8LDm64ob0BIfUoECLqDWLNuLuOtNZgzJZV2QNpjbG2BlXeF3n4apBLbTzW2gU5k5hF7
	IdLzKSQuPE3Tik+oFL4s4Zo440vUOuGBVO8T7rbw=
Content-Type: multipart/mixed; boundary="===============6466682013805450719=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 9.2.0 SUCCEEDED
Message-ID: <010101a15d20150a-424aee9c-c7f9-48be-a69a-c2d94b0971c3-000000@us-west-2.amazonses.com>
Date: Wed, 21 Oct 2026 06:22:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.21-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248356

--===============6466682013805450719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx* to *9.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-9.1.0-9.2.0.patch
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
From 7bc0e3dc0486fcc06fd23c179bf25de041370f86 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 21 Oct 2026 05:54:20 +0000
Subject: [PATCH] python3-sphinx: upgrade 9.1.0 -> 9.2.0

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
 ...phinx_9.1.0.bb => python3-sphinx_9.2.0.bb} | 26 +++++++++++++++++--
 2 files changed, 31 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_9.1.0.bb => python3-sphinx_9.2.0.bb} (51%)

diff --git a/meta/recipes-devtools/python/python3-sphinx/0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch b/meta/recipes-devtools/python/python3-sphinx/0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch
index 1adf82d7ef..6d36ecbe74 100644
--- a/meta/recipes-devtools/python/python3-sphinx/0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch
+++ b/meta/recipes-devtools/python/python3-sphinx/0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch
@@ -1,4 +1,4 @@
-From 323350c9c4df6be0935e7237ce20add8ccd1bb13 Mon Sep 17 00:00:00 2001
+From 1fba22d5be53dd6caf34b34021f54bc56684226a Mon Sep 17 00:00:00 2001
 From: James Addison <jay@jp-hosting.net>
 Date: Sun, 4 Jan 2026 20:51:55 +0000
 Subject: [PATCH] Revert "singlehtml: deprecate the 'fix_refuris' helper
@@ -19,10 +19,10 @@ Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
  1 file changed, 4 insertions(+), 9 deletions(-)
 
 diff --git a/sphinx/builders/singlehtml.py b/sphinx/builders/singlehtml.py
-index 1888f6679..f895077df 100644
+index 387776d..4fd5510 100644
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
diff --git a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb b/meta/recipes-devtools/python/python3-sphinx_9.2.0.bb
similarity index 51%
rename from meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
rename to meta/recipes-devtools/python/python3-sphinx_9.2.0.bb
index 44ed739fc9..b6a94f44d6 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.2.0.bb
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
+SRC_URI[sha256sum] = "90470459f3cab15d9dfed146c71cf77694b0445df17b2e0e69059cb9f7fc9ee4"
 
 SRC_URI += "file://0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch"
 
-- 
2.47.1


--===============6466682013805450719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-9.1.0.tar.gz file://0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch" to "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-9.2.0.tar.gz file://0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch"
packages/x86-64-v3-poky-linux/python3-sphinx: PKGV changed from 9.1.0 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx: PV changed from "9.1.0" to "9.2.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 9.1.0 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "9.1.0" to "9.2.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 9.1.0 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "9.1.0" to "9.2.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 9.1.0 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "9.1.0" to "9.2.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 9.1.0 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "9.1.0" to "9.2.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 9.1.0 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "9.1.0" to "9.2.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 9.1.0 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "9.1.0" to "9.2.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 9.1.0 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sphinx-9.1.0.dist-info -> /usr/lib/python3.14/site-packages/sphinx-9.2.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/sphinx-9.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/sphinx-9.2.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 19485327 to 19505174 (+0%)
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PV changed from "9.1.0" to "9.2.0"
Changes to packages/x86-64-v3-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.14/site-packages/sphinx-9.1.0.dist-info moved to /usr/lib/python3.14/site-packages/sphinx-9.2.0.dist-info

--===============6466682013805450719==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-9.1.0-9.2.0.patch"

RnJvbSA3YmMwZTNkYzA0ODZmY2MwNmZkMjNjMTc5YmYyNWRlMDQxMzcwZjg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjEgT2N0IDIwMjYgMDU6NTQ6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueDogdXBncmFkZSA5LjEuMCAtPiA5LjIuMAoKPT09PT09PT09PQpTcGhpbngg
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
NCArKysrKy0tLS0tCiAuLi5waGlueF85LjEuMC5iYiA9PiBweXRob24zLXNwaGlueF85LjIuMC5i
Yn0gfCAyNiArKysrKysrKysrKysrKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi97cHl0aG9uMy1zcGhpbnhfOS4xLjAuYmIgPT4gcHl0aG9uMy1zcGhpbnhfOS4yLjAuYmJ9ICg1
MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNw
aGlueC8wMDAxLVJldmVydC1zaW5nbGVodG1sLWRlcHJlY2F0ZS10aGUtZml4X3JlZnVyaXMtaGVs
cGVyLWYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54
LzAwMDEtUmV2ZXJ0LXNpbmdsZWh0bWwtZGVwcmVjYXRlLXRoZS1maXhfcmVmdXJpcy1oZWxwZXIt
Zi5wYXRjaAppbmRleCAxYWRmODJkN2VmLi42ZDM2ZWNiZTc0IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54LzAwMDEtUmV2ZXJ0LXNpbmdsZWh0
bWwtZGVwcmVjYXRlLXRoZS1maXhfcmVmdXJpcy1oZWxwZXItZi5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54LzAwMDEtUmV2ZXJ0LXNpbmdsZWh0
bWwtZGVwcmVjYXRlLXRoZS1maXhfcmVmdXJpcy1oZWxwZXItZi5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMzIzMzUwYzljNGRmNmJlMDkzNWU3MjM3Y2UyMGFkZDhjY2QxYmIxMyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWZiYTIyZDViZTUzZGQ2Y2FmMzRiMzQwMjFmNTRiYzU2
Njg0MjI2YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEphbWVzIEFkZGlzb24gPGph
eUBqcC1ob3N0aW5nLm5ldD4KIERhdGU6IFN1biwgNCBKYW4gMjAyNiAyMDo1MTo1NSArMDAwMAog
U3ViamVjdDogW1BBVENIXSBSZXZlcnQgInNpbmdsZWh0bWw6IGRlcHJlY2F0ZSB0aGUgJ2ZpeF9y
ZWZ1cmlzJyBoZWxwZXIKQEAgLTE5LDEwICsxOSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlu
IEdvZGFyZCA8YW50b25pbi5nb2RhcmRAYm9vdGxpbi5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3NwaGlueC9idWls
ZGVycy9zaW5nbGVodG1sLnB5IGIvc3BoaW54L2J1aWxkZXJzL3NpbmdsZWh0bWwucHkKLWluZGV4
IDE4ODhmNjY3OS4uZjg5NTA3N2RmIDEwMDY0NAoraW5kZXggMzg3Nzc2ZC4uNGZkNTUxMCAxMDA2
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
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF85LjIuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDUxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc3BoaW54XzkuMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzkuMi4wLmJiCmluZGV4IDQ0ZWQ3MzlmYzkuLmI2
YTk0ZjQ0ZDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zcGhpbnhfOS4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNwaGlueF85LjIuMC5iYgpAQCAtMSwxMCArMSwzMiBAQAorIyBGSVhNRTogdGhlIExJQ19G
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
ZGE5NTkzMGRkYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5MDQ3MDQ1OWYzY2FiMTVkOWRmZWQx
NDZjNzFjZjc3Njk0YjA0NDVkZjE3YjJlMGU2OTA1OWNiOWY3ZmM5ZWU0IgogCiBTUkNfVVJJICs9
ICJmaWxlOi8vMDAwMS1SZXZlcnQtc2luZ2xlaHRtbC1kZXByZWNhdGUtdGhlLWZpeF9yZWZ1cmlz
LWhlbHBlci1mLnBhdGNoIgogCi0tIAoyLjQ3LjEKCg==

--===============6466682013805450719==
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

--===============6466682013805450719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sphinx-9.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/sphinx-9.2.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/sphinx-9.1.0.dist-info -> /usr/lib/python3.14/site-packages/sphinx-9.2.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.14/site-packages/sphinx-9.1.0.dist-info moved to /usr/lib/python3.14/site-packages/sphinx-9.2.0.dist-info

--===============6466682013805450719==--
