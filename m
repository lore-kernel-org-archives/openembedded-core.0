Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C42CC9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 06:27:48 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1225.1790144867054484954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YcJlkCBE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GXnqgsb/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a0ccf2e7a6-76d49bc4-d5f4-430b-8271-f8d5f28421d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790144866;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YfHa1avB976Aa+ZkaH6NhGQqOJLm6g5XzS2kTVfrPS4=;
	b=YcJlkCBE81l2qU46a7TYROx9SGMthvV2K9555mMf0FepRQ8EqL8WCFEyRUJ8opsr
	Bgs2q64BrLPWpBt8rhtNsCBm03TqY1L9mo5Vey6y7IMShijO6qDJ2WMYrXu7FmZpNDH
	Z5crAlEvm6xZhWfDFFQLHyoq0o6jsLhFb4OJiVBg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790144866;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YfHa1avB976Aa+ZkaH6NhGQqOJLm6g5XzS2kTVfrPS4=;
	b=GXnqgsb/XfvJExhQSnltP+u0pDntX2qlx5m0ikiZAdb8EW/jkF0hPJIVylzpULgf
	alUeGtDLOsn0/U2xg48mxHKRqb2M5ob6hz0Vp4O+dgczrPCM2mvHPe1oQKxO9sWXOKT
	FsQeGnlXvufzd+lFwZaDkbiuHE6UtExYVbGejz7U=
Content-Type: multipart/mixed; boundary="===============7368173412871829246=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.3.0 SUCCEEDED
Message-ID: <010101a0ccf2e7a6-76d49bc4-d5f4-430b-8271-f8d5f28421d4-000000@us-west-2.amazonses.com>
Date: Wed, 23 Sep 2026 06:27:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.23-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246442

--===============7368173412871829246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cython* to *3.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.2.9-3.3.0.patch
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
From e9f12a7aa91251966d7882e4bd5a7ee4f953b7e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 23 Sep 2026 06:01:36 +0000
Subject: [PATCH] python3-cython: upgrade 3.2.9 -> 3.3.0

3.3.0 (2026-08-22)
==================

(Complete changelog for the 3.3.0 release, including pre-releases.)

Features added
--------------

Bugs fixed
----------

Other changes
-------------

3.3.0b1 (2026-08-14)
====================

Features added
--------------

Bugs fixed
----------

Other changes
-------------

3.3.0a1 (2026-06-24)
====================

Features added
--------------

Bugs fixed
----------

Other changes
-------------

3.2.10 (2026-0?-??)
==================

Bugs fixed
----------

3.2.9 (2026-07-24)
---
 ...place-not-predictable-build-path-prefix-with-hardc.patch | 6 +++---
 .../{python3-cython_3.2.9.bb => python3-cython_3.3.0.bb}    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.9.bb => python3-cython_3.3.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index 573a53ee56..6a5cbb71b2 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From a3b9d4303b6aaf5ef2ce9ffd1ba42a93f9cc68e0 Mon Sep 17 00:00:00 2001
+From ee8270605f00e90465e18a375c55e825b2a3584b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Sep 2025 01:42:08 -0700
 Subject: [PATCH] Replace not predictable build path prefix with hardcode
@@ -53,10 +53,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
-index 34f1b32..b09350b 100644
+index 6e0a3e5..ce35b25 100644
 --- a/Cython/Compiler/ModuleNode.py
 +++ b/Cython/Compiler/ModuleNode.py
-@@ -877,7 +877,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
+@@ -888,7 +888,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
          code.put_generated_by()
          if metadata:
              code.putln("/* BEGIN: Cython Metadata")
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.9.bb b/meta/recipes-devtools/python/python3-cython_3.3.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.2.9.bb
rename to meta/recipes-devtools/python/python3-cython_3.3.0.bb
index 3457a91490..7992892e60 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.9.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.3.0.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "d249c9022ab13286b17bd66f30609e800c5f95efeecb06168990c7a66cecde6c"
+SRC_URI[sha256sum] = "eed0d93fbca7087f143b42c34b05a825849bdf17f101572c2105acfa49aa88b8"
 
 inherit pypi setuptools3 cython
 
-- 
2.47.1


--===============7368173412871829246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.2.9.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.3.0.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch"
packages/x86-64-v3-poky-linux/python3-cython: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 27467952 to 27921880 (+2%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: FILELIST: added "/usr/lib/python3.14/site-packages/Cython/.debug/_shared.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/Compiler/.debug/StringEncoding.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/.debug/LZSS.cpython-314-x86_64-linux-gnu.so"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 23866107 to 26115366 (+9%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: FILELIST: directory renamed /usr/src/debug/python3-cython/3.2.9/Cython/Tempita -> /usr/src/debug/python3-cython/3.3.0/Cython/Tempita, directory renamed /usr/src/debug/python3-cython/3.2.9/Cython/Runtime -> /usr/src/debug/python3-cython/3.3.0/Cython/Runtime, directory renamed /usr/src/debug/python3-cython/3.2.9/Cython/Plex -> /usr/src/debug/python3-cython/3.3.0/Cython/Plex, removed "/usr/src/debug/python3-cython/3.2.9/Cython/Compiler/LineTable.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Code.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Scanning.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Visitor.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/FlowControl.c /usr/src/debug/python3-cython/3.2.9/Cython/Utils.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Parsing.c /usr/src/debug/python3-cython/3.2.9/Cython/StringIOTree.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/FusedNode.c
 ", added "/usr/src/debug/python3-cython/3.3.0/Cython/Compiler/LineTable.c /usr/src/debug/python3-cython/3.3.0/Cython/Compiler/Code.c /usr/src/debug/python3-cython/3.3.0/Cython/Compiler/Visitor.c /usr/src/debug/python3-cython/3.3.0/Cython/Compiler/Scanning.c /usr/src/debug/python3-cython/3.3.0/Cython/Utils.c /usr/src/debug/python3-cython/3.3.0/Cython/StringIOTree.c /usr/src/debug/python3-cython/3.3.0/Cython/LZSS.c /usr/src/debug/python3-cython/3.3.0/Cython/Compiler/FusedNode.c /usr/src/debug/python3-cython/3.3.0/Cython/Compiler/StringEncoding.c /usr/src/debug/python3-cython/3.3.0/Cython/Compiler/FlowControl.c /usr/src/debug/python3-cython/3.3.0/Cython/Compiler/Parsing.c /usr/src/debug/python3-cython/3.3.0/Cython/_shared.c"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 15370086 to 16167909 (+5%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.9.dist-info -> /usr/lib/python3.14/site-packages/cython-3.3.0.dist-info, removed "/usr/lib/python3.14/site-packages/Cython/Shadow.pyi /usr/lib/python3.14/site-packages/Cython/__init__.pyi /usr/lib/python3.14/site-packages/Cython/Utility/Printing.c", added "/usr/lib/python3.14/site-packages/Cython/__pycache__/LZSS.cpython-314.pyc /usr/lib/python3.14/site-packages/Cython/_shared.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase_Cy.pyx /usr/lib/python3.14/site-packages/Cython/Includes/cpython/sentinel.pxd /usr/lib/python3.14/site-packages/Cython/LZSS.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/Utility/Exceptions_Cy.pyx /usr/lib/python3.14/site-packages/Cython/Includes/cpython/frozendict.pxd /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase.c /usr/lib/python3.14/site-packages/Cy
 thon/LZSS.py /usr/lib/python3.14/site-packages/Cython/Compiler/StringEncoding.cpython-314-x86_64-linux-gnu.so"
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.14/site-packages/cython-3.2.9.dist-info moved to /usr/lib/python3.14/site-packages/cython-3.3.0.dist-info
  /usr/lib/python3.14/site-packages/Cython/Compiler/StringEncoding.cpython-314-x86_64-linux-gnu.so was added
  /usr/lib/python3.14/site-packages/Cython/Includes/cpython/frozendict.pxd was added
  /usr/lib/python3.14/site-packages/Cython/Includes/cpython/sentinel.pxd was added
  /usr/lib/python3.14/site-packages/Cython/LZSS.cpython-314-x86_64-linux-gnu.so was added
  /usr/lib/python3.14/site-packages/Cython/LZSS.py was added
  /usr/lib/python3.14/site-packages/Cython/__pycache__/LZSS.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Cython/_shared.cpython-314-x86_64-linux-gnu.so was added
  /usr/lib/python3.14/site-packages/Cython/Utility/Exceptions_Cy.pyx was added
  /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase.c was added
  /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase_Cy.pyx was added
  /usr/lib/python3.14/site-packages/Cython/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Cython/Shadow.pyi was removed
  /usr/lib/python3.14/site-packages/Cython/Utility/Printing.c was removed

--===============7368173412871829246==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.2.9-3.3.0.patch"

RnJvbSBlOWYxMmE3YWE5MTI1MTk2NmQ3ODgyZTRiZDVhN2VlNGY5NTNiN2UzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjMgU2VwIDIwMjYgMDY6MDE6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAzLjIuOSAtPiAzLjMuMAoKMy4zLjAgKDIwMjYtMDgtMjIp
Cj09PT09PT09PT09PT09PT09PQoKKENvbXBsZXRlIGNoYW5nZWxvZyBmb3IgdGhlIDMuMy4wIHJl
bGVhc2UsIGluY2x1ZGluZyBwcmUtcmVsZWFzZXMuKQoKRmVhdHVyZXMgYWRkZWQKLS0tLS0tLS0t
LS0tLS0KCkJ1Z3MgZml4ZWQKLS0tLS0tLS0tLQoKT3RoZXIgY2hhbmdlcwotLS0tLS0tLS0tLS0t
CgozLjMuMGIxICgyMDI2LTA4LTE0KQo9PT09PT09PT09PT09PT09PT09PQoKRmVhdHVyZXMgYWRk
ZWQKLS0tLS0tLS0tLS0tLS0KCkJ1Z3MgZml4ZWQKLS0tLS0tLS0tLQoKT3RoZXIgY2hhbmdlcwot
LS0tLS0tLS0tLS0tCgozLjMuMGExICgyMDI2LTA2LTI0KQo9PT09PT09PT09PT09PT09PT09PQoK
RmVhdHVyZXMgYWRkZWQKLS0tLS0tLS0tLS0tLS0KCkJ1Z3MgZml4ZWQKLS0tLS0tLS0tLQoKT3Ro
ZXIgY2hhbmdlcwotLS0tLS0tLS0tLS0tCgozLjIuMTAgKDIwMjYtMD8tPz8pCj09PT09PT09PT09
PT09PT09PQoKQnVncyBmaXhlZAotLS0tLS0tLS0tCgozLjIuOSAoMjAyNi0wNy0yNCkKLS0tCiAu
Li5wbGFjZS1ub3QtcHJlZGljdGFibGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRj
aCB8IDYgKysrLS0tCiAuLi4ve3B5dGhvbjMtY3l0aG9uXzMuMi45LmJiID0+IHB5dGhvbjMtY3l0
aG9uXzMuMy4wLmJifSAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5
dGhvbjMtY3l0aG9uXzMuMi45LmJiID0+IHB5dGhvbjMtY3l0aG9uXzMuMy4wLmJifSAoOTMlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob24v
MDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1wYXRoLXByZWZpeC13aXRoLWhhcmRj
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbi8wMDAx
LVJlcGxhY2Utbm90LXByZWRpY3RhYmxlLWJ1aWxkLXBhdGgtcHJlZml4LXdpdGgtaGFyZGMucGF0
Y2gKaW5kZXggNTczYTUzZWU1Ni4uNmE1Y2JiNzFiMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbi8wMDAxLVJlcGxhY2Utbm90LXByZWRpY3Rh
YmxlLWJ1aWxkLXBhdGgtcHJlZml4LXdpdGgtaGFyZGMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbi8wMDAxLVJlcGxhY2Utbm90LXByZWRpY3Rh
YmxlLWJ1aWxkLXBhdGgtcHJlZml4LXdpdGgtaGFyZGMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGEzYjlkNDMwM2I2YWFmNWVmMmNlOWZmZDFiYTQyYTkzZjljYzY4ZTAgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGVlODI3MDYwNWYwMGU5MDQ2NWUxOGEzNzVjNTVlODI1YjJhMzU4
NGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlh
QHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDE3IFNlcCAyMDI1IDAxOjQyOjA4IC0wNzAwCiBT
dWJqZWN0OiBbUEFUQ0hdIFJlcGxhY2Ugbm90IHByZWRpY3RhYmxlIGJ1aWxkIHBhdGggcHJlZml4
IHdpdGggaGFyZGNvZGUKQEAgLTUzLDEwICs1MywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUg
SmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvQ3l0aG9uL0NvbXBpbGVyL01v
ZHVsZU5vZGUucHkgYi9DeXRob24vQ29tcGlsZXIvTW9kdWxlTm9kZS5weQotaW5kZXggMzRmMWIz
Mi4uYjA5MzUwYiAxMDA2NDQKK2luZGV4IDZlMGEzZTUuLmNlMzViMjUgMTAwNjQ0CiAtLS0gYS9D
eXRob24vQ29tcGlsZXIvTW9kdWxlTm9kZS5weQogKysrIGIvQ3l0aG9uL0NvbXBpbGVyL01vZHVs
ZU5vZGUucHkKLUBAIC04NzcsNyArODc3LDkgQEAgY2xhc3MgTW9kdWxlTm9kZShOb2Rlcy5Ob2Rl
LCBOb2Rlcy5CbG9ja05vZGUpOgorQEAgLTg4OCw3ICs4ODgsOSBAQCBjbGFzcyBNb2R1bGVOb2Rl
KE5vZGVzLk5vZGUsIE5vZGVzLkJsb2NrTm9kZSk6CiAgICAgICAgICBjb2RlLnB1dF9nZW5lcmF0
ZWRfYnkoKQogICAgICAgICAgaWYgbWV0YWRhdGE6CiAgICAgICAgICAgICAgY29kZS5wdXRsbigi
LyogQkVHSU46IEN5dGhvbiBNZXRhZGF0YSIpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMi45LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMu
Mi45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0
aG9uXzMuMy4wLmJiCmluZGV4IDM0NTdhOTE0OTAuLjc5OTI4OTJlNjAgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob25fMy4yLjkuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjMuMC5iYgpAQCAt
Nyw3ICs3LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkFwYWNoZS0y
LjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9NjFjM2VlODk2
MTU3NTg2MWZhODZjN2U2MmJjOWY2OWMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkMjQ5Yzkw
MjJhYjEzMjg2YjE3YmQ2NmYzMDYwOWU4MDBjNWY5NWVmZWVjYjA2MTY4OTkwYzdhNjZjZWNkZTZj
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImVlZDBkOTNmYmNhNzA4N2YxNDNiNDJjMzRiMDVhODI1
ODQ5YmRmMTdmMTAxNTcyYzIxMDVhY2ZhNDlhYTg4YjgiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRv
b2xzMyBjeXRob24KIAotLSAKMi40Ny4xCgo=

--===============7368173412871829246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-cython-changelog.txt"

3.3.0 (2026-08-22)
==================

(Complete changelog for the 3.3.0 release, including pre-releases.)

Features added
--------------

Bugs fixed
----------

Other changes
-------------

3.3.0b1 (2026-08-14)
====================

Features added
--------------

Bugs fixed
----------

Other changes
-------------

3.3.0a1 (2026-06-24)
====================

Features added
--------------

Bugs fixed
----------

Other changes
-------------

3.2.10 (2026-0?-??)
==================

Bugs fixed
----------

3.2.9 (2026-07-24)

--===============7368173412871829246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.9.dist-info -> /usr/lib/python3.14/site-packages/cython-3.3.0.dist-info, removed "/usr/lib/python3.14/site-packages/Cython/Shadow.pyi /usr/lib/python3.14/site-packages/Cython/__init__.pyi /usr/lib/python3.14/site-packages/Cython/Utility/Printing.c", added "/usr/lib/python3.14/site-packages/Cython/_shared.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/LZSS.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/Utility/Exceptions_Cy.pyx /usr/lib/python3.14/site-packages/Cython/__pycache__/LZSS.cpython-314.pyc /usr/lib/python3.14/site-packages/Cython/Includes/cpython/frozendict.pxd /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase_Cy.pyx /usr/lib/python3.14/site-packages/Cython/LZSS.py /usr/lib/python3.14/site-packages/Cython/Includes/cpython/sentinel.pxd /usr/lib/python3.14/site-packages/Cython/Compile
 r/StringEncoding.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase.c"
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.14/site-packages/cython-3.2.9.dist-info moved to /usr/lib/python3.14/site-packages/cython-3.3.0.dist-info
  /usr/lib/python3.14/site-packages/Cython/Compiler/StringEncoding.cpython-314-x86_64-linux-gnu.so was added
  /usr/lib/python3.14/site-packages/Cython/Includes/cpython/frozendict.pxd was added
  /usr/lib/python3.14/site-packages/Cython/Includes/cpython/sentinel.pxd was added
  /usr/lib/python3.14/site-packages/Cython/LZSS.cpython-314-x86_64-linux-gnu.so was added
  /usr/lib/python3.14/site-packages/Cython/LZSS.py was added
  /usr/lib/python3.14/site-packages/Cython/__pycache__/LZSS.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Cython/_shared.cpython-314-x86_64-linux-gnu.so was added
  /usr/lib/python3.14/site-packages/Cython/Utility/Exceptions_Cy.pyx was added
  /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase.c was added
  /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase_Cy.pyx was added
  /usr/lib/python3.14/site-packages/Cython/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Cython/Shadow.pyi was removed
  /usr/lib/python3.14/site-packages/Cython/Utility/Printing.c was removed

--===============7368173412871829246==--

