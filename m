Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6692.1793597017592205461
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 21:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=U8IMdjAE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nv1DVRF0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a19ab689fc-0770af31-37f3-4076-89d4-949c1093f747-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793597016;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WNF2igO/RRV+mritfqGXjCdTA7PFdLI1ZMMziSPYyrw=;
	b=U8IMdjAEaifnnkPHObRteCvszEjcFdMFAPKHSj8b6M+JyLFk9y+pbr8oBtZjdgCV
	2cfF6o5tS50YPLyaUxKmQNTxQFsO3yKYvpbEEOSPbbkuKlcrlxoNxh63TBY7y/fHBe4
	toGVjuoHm5kdMHOKe8QJ+X8cJBJtFgoV9to7Ekds=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793597016;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WNF2igO/RRV+mritfqGXjCdTA7PFdLI1ZMMziSPYyrw=;
	b=nv1DVRF0jgMtccfsM+ynWFGAz75CbqJG6dBGWaJ/QAitGCFAZXnYUas1h82jm97B
	6iakaaVbXQp33LaST9Y32QQfU0nJ6W8oY8oJafCjqRVczz/it/5evDx0xlUS1goDpwD
	tO3O/ocQEQSAn2WkgJOIyuozIfQZTyENP/c9b7XI=
Content-Type: multipart/mixed; boundary="===============0664266743878313557=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.3.1 SUCCEEDED
Message-ID: <010101a19ab689fc-0770af31-37f3-4076-89d4-949c1093f747-000000@us-west-2.amazonses.com>
Date: Mon, 2 Nov 2026 05:23:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 05:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249176

--===============0664266743878313557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cython* to *3.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.2.9-3.3.1.patch
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
From 0f9fbe3c4686f001433c8efc5966380d4fbbc526 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 2 Nov 2026 05:11:29 +0000
Subject: [PATCH] python3-cython: upgrade 3.2.9 -> 3.3.1

3.3.1 (2026-11-01)
==================

Most of the bugs fixed in this release were regressions in 3.3.0.

Features added
--------------

Bugs fixed
----------

Other changes
-------------

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
===================

Bugs fixed
----------

3.2.9 (2026-07-24)
---
 ...place-not-predictable-build-path-prefix-with-hardc.patch | 6 +++---
 .../{python3-cython_3.2.9.bb => python3-cython_3.3.1.bb}    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.9.bb => python3-cython_3.3.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index 573a53ee56..928b677c76 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From a3b9d4303b6aaf5ef2ce9ffd1ba42a93f9cc68e0 Mon Sep 17 00:00:00 2001
+From eed2f8ac8a9d63a3bc578fce89b42ec30118e072 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Sep 2025 01:42:08 -0700
 Subject: [PATCH] Replace not predictable build path prefix with hardcode
@@ -53,10 +53,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
-index 34f1b32..b09350b 100644
+index 72e14f2..0c681d2 100644
 --- a/Cython/Compiler/ModuleNode.py
 +++ b/Cython/Compiler/ModuleNode.py
-@@ -877,7 +877,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
+@@ -899,7 +899,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
          code.put_generated_by()
          if metadata:
              code.putln("/* BEGIN: Cython Metadata")
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.9.bb b/meta/recipes-devtools/python/python3-cython_3.3.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.2.9.bb
rename to meta/recipes-devtools/python/python3-cython_3.3.1.bb
index 3457a91490..49f1e83cb0 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.9.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.3.1.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "d249c9022ab13286b17bd66f30609e800c5f95efeecb06168990c7a66cecde6c"
+SRC_URI[sha256sum] = "e0e45989e821bef6aa9ae15c7d583ab5e055f7406c4b3624e49e06d24e90375a"
 
 inherit pypi setuptools3 cython
 
-- 
2.47.1


--===============0664266743878313557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cython: PV changed from "3.2.9" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.2.9.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.3.1.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch"
packages/x86-64-v3-poky-linux/python3-cython: PKGV changed from 3.2.9 [default] to 3.3.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 27468000 to 27929448 (+2%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: FILELIST: added "/usr/lib/python3.14/site-packages/Cython/.debug/_shared.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/.debug/LZSS.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/Compiler/.debug/StringEncoding.cpython-314-x86_64-linux-gnu.so"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.2.9" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.2.9 [default] to 3.3.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.2.9" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.2.9 [default] to 3.3.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.2.9" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.2.9 [default] to 3.3.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.2.9" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.2.9 [default] to 3.3.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 23866107 to 26234607 (+10%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: FILELIST: directory renamed /usr/src/debug/python3-cython/3.2.9/Cython/Plex -> /usr/src/debug/python3-cython/3.3.1/Cython/Plex, directory renamed /usr/src/debug/python3-cython/3.2.9/Cython/Runtime -> /usr/src/debug/python3-cython/3.3.1/Cython/Runtime, directory renamed /usr/src/debug/python3-cython/3.2.9/Cython/Tempita -> /usr/src/debug/python3-cython/3.3.1/Cython/Tempita, removed "/usr/src/debug/python3-cython/3.2.9/Cython/Compiler/FlowControl.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Visitor.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/LineTable.c /usr/src/debug/python3-cython/3.2.9/Cython/Utils.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Code.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Parsing.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Scanning.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/FusedNode.c /usr/src/debug/python3-cython/3.2.9/Cython/StringIOTree.c
 ", added "/usr/src/debug/python3-cython/3.3.1/Cython/_shared.c /usr/src/debug/python3-cython/3.3.1/Cython/Compiler/Visitor.c /usr/src/debug/python3-cython/3.3.1/Cython/Compiler/LineTable.c /usr/src/debug/python3-cython/3.3.1/Cython/Utils.c /usr/src/debug/python3-cython/3.3.1/Cython/Compiler/Parsing.c /usr/src/debug/python3-cython/3.3.1/Cython/LZSS.c /usr/src/debug/python3-cython/3.3.1/Cython/Compiler/StringEncoding.c /usr/src/debug/python3-cython/3.3.1/Cython/Compiler/Scanning.c /usr/src/debug/python3-cython/3.3.1/Cython/Compiler/Code.c /usr/src/debug/python3-cython/3.3.1/Cython/StringIOTree.c /usr/src/debug/python3-cython/3.3.1/Cython/Compiler/FlowControl.c /usr/src/debug/python3-cython/3.3.1/Cython/Compiler/FusedNode.c"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PV changed from "3.2.9" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.2.9 [default] to 3.3.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.2.9" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.2.9 [default] to 3.3.1 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 15370086 to 16207828 (+5%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.9.dist-info -> /usr/lib/python3.14/site-packages/cython-3.3.1.dist-info, removed "/usr/lib/python3.14/site-packages/Cython/Shadow.pyi /usr/lib/python3.14/site-packages/Cython/__init__.pyi /usr/lib/python3.14/site-packages/Cython/Utility/Printing.c", added "/usr/lib/python3.14/site-packages/Cython/Includes/libc/stdbool.pxd /usr/lib/python3.14/site-packages/Cython/Includes/cpython/sentinel.pxd /usr/lib/python3.14/site-packages/Cython/Compiler/StringEncoding.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase.c /usr/lib/python3.14/site-packages/Cython/_shared.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase_Cy.pyx /usr/lib/python3.14/site-packages/Cython/Utility/Exceptions_Cy.pyx /usr/lib/python3.14/site-packages/Cython/LZSS.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14
 /site-packages/Cython/__pycache__/LZSS.cpython-314.pyc /usr/lib/python3.14/site-packages/Cython/Includes/cpython/frozendict.pxd /usr/lib/python3.14/site-packages/Cython/LZSS.py"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PV changed from "3.2.9" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGV changed from 3.2.9 [default] to 3.3.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.14/site-packages/cython-3.2.9.dist-info moved to /usr/lib/python3.14/site-packages/cython-3.3.1.dist-info
  /usr/lib/python3.14/site-packages/Cython/Compiler/StringEncoding.cpython-314-x86_64-linux-gnu.so was added
  /usr/lib/python3.14/site-packages/Cython/Includes/cpython/frozendict.pxd was added
  /usr/lib/python3.14/site-packages/Cython/Includes/cpython/sentinel.pxd was added
  /usr/lib/python3.14/site-packages/Cython/Includes/libc/stdbool.pxd was added
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

--===============0664266743878313557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.9.dist-info -> /usr/lib/python3.14/site-packages/cython-3.3.1.dist-info, removed "/usr/lib/python3.14/site-packages/Cython/__init__.pyi /usr/lib/python3.14/site-packages/Cython/Utility/Printing.c /usr/lib/python3.14/site-packages/Cython/Shadow.pyi", added "/usr/lib/python3.14/site-packages/Cython/Includes/cpython/sentinel.pxd /usr/lib/python3.14/site-packages/Cython/Includes/cpython/frozendict.pxd /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase_Cy.pyx /usr/lib/python3.14/site-packages/Cython/Utility/Exceptions_Cy.pyx /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase.c /usr/lib/python3.14/site-packages/Cython/_shared.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/__pycache__/LZSS.cpython-314.pyc /usr/lib/python3.14/site-packages/Cython/Compiler/StringEncoding.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.
 14/site-packages/Cython/LZSS.py /usr/lib/python3.14/site-packages/Cython/LZSS.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/Includes/libc/stdbool.pxd"
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.14/site-packages/cython-3.2.9.dist-info moved to /usr/lib/python3.14/site-packages/cython-3.3.1.dist-info
  /usr/lib/python3.14/site-packages/Cython/Compiler/StringEncoding.cpython-314-x86_64-linux-gnu.so was added
  /usr/lib/python3.14/site-packages/Cython/Includes/cpython/frozendict.pxd was added
  /usr/lib/python3.14/site-packages/Cython/Includes/cpython/sentinel.pxd was added
  /usr/lib/python3.14/site-packages/Cython/Includes/libc/stdbool.pxd was added
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

--===============0664266743878313557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-cython-changelog.txt"

3.3.1 (2026-11-01)
==================

Most of the bugs fixed in this release were regressions in 3.3.0.

Features added
--------------

Bugs fixed
----------

Other changes
-------------

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
===================

Bugs fixed
----------

3.2.9 (2026-07-24)

--===============0664266743878313557==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.2.9-3.3.1.patch"

RnJvbSAwZjlmYmUzYzQ2ODZmMDAxNDMzYzhlZmM1OTY2MzgwZDRmYmJjNTI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMiBOb3YgMjAyNiAwNToxMToyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3l0aG9uOiB1cGdyYWRlIDMuMi45IC0+IDMuMy4xCgozLjMuMSAoMjAyNi0xMS0wMSkK
PT09PT09PT09PT09PT09PT09CgpNb3N0IG9mIHRoZSBidWdzIGZpeGVkIGluIHRoaXMgcmVsZWFz
ZSB3ZXJlIHJlZ3Jlc3Npb25zIGluIDMuMy4wLgoKRmVhdHVyZXMgYWRkZWQKLS0tLS0tLS0tLS0t
LS0KCkJ1Z3MgZml4ZWQKLS0tLS0tLS0tLQoKT3RoZXIgY2hhbmdlcwotLS0tLS0tLS0tLS0tCgoz
LjMuMCAoMjAyNi0wOC0yMikKPT09PT09PT09PT09PT09PT09CgooQ29tcGxldGUgY2hhbmdlbG9n
IGZvciB0aGUgMy4zLjAgcmVsZWFzZSwgaW5jbHVkaW5nIHByZS1yZWxlYXNlcy4pCgpGZWF0dXJl
cyBhZGRlZAotLS0tLS0tLS0tLS0tLQoKQnVncyBmaXhlZAotLS0tLS0tLS0tCgpPdGhlciBjaGFu
Z2VzCi0tLS0tLS0tLS0tLS0KCjMuMy4wYjEgKDIwMjYtMDgtMTQpCj09PT09PT09PT09PT09PT09
PT09CgpGZWF0dXJlcyBhZGRlZAotLS0tLS0tLS0tLS0tLQoKQnVncyBmaXhlZAotLS0tLS0tLS0t
CgpPdGhlciBjaGFuZ2VzCi0tLS0tLS0tLS0tLS0KCjMuMy4wYTEgKDIwMjYtMDYtMjQpCj09PT09
PT09PT09PT09PT09PT09CgpGZWF0dXJlcyBhZGRlZAotLS0tLS0tLS0tLS0tLQoKQnVncyBmaXhl
ZAotLS0tLS0tLS0tCgpPdGhlciBjaGFuZ2VzCi0tLS0tLS0tLS0tLS0KCjMuMi4xMCAoMjAyNi0w
Py0/PykKPT09PT09PT09PT09PT09PT09PQoKQnVncyBmaXhlZAotLS0tLS0tLS0tCgozLjIuOSAo
MjAyNi0wNy0yNCkKLS0tCiAuLi5wbGFjZS1ub3QtcHJlZGljdGFibGUtYnVpbGQtcGF0aC1wcmVm
aXgtd2l0aC1oYXJkYy5wYXRjaCB8IDYgKysrLS0tCiAuLi4ve3B5dGhvbjMtY3l0aG9uXzMuMi45
LmJiID0+IHB5dGhvbjMtY3l0aG9uXzMuMy4xLmJifSAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24ve3B5dGhvbjMtY3l0aG9uXzMuMi45LmJiID0+IHB5dGhvbjMtY3l0aG9u
XzMuMy4xLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1wYXRo
LXByZWZpeC13aXRoLWhhcmRjLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWN5dGhvbi8wMDAxLVJlcGxhY2Utbm90LXByZWRpY3RhYmxlLWJ1aWxkLXBhdGgtcHJl
Zml4LXdpdGgtaGFyZGMucGF0Y2gKaW5kZXggNTczYTUzZWU1Ni4uOTI4YjY3N2M3NiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbi8wMDAxLVJl
cGxhY2Utbm90LXByZWRpY3RhYmxlLWJ1aWxkLXBhdGgtcHJlZml4LXdpdGgtaGFyZGMucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbi8wMDAxLVJl
cGxhY2Utbm90LXByZWRpY3RhYmxlLWJ1aWxkLXBhdGgtcHJlZml4LXdpdGgtaGFyZGMucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGEzYjlkNDMwM2I2YWFmNWVmMmNlOWZmZDFiYTQyYTkzZjlj
YzY4ZTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGVlZDJmOGFjOGE5ZDYzYTNiYzU3
OGZjZTg5YjQyZWMzMDExOGUwNzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25n
eHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDE3IFNlcCAyMDI1
IDAxOjQyOjA4IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlcGxhY2Ugbm90IHByZWRpY3RhYmxl
IGJ1aWxkIHBhdGggcHJlZml4IHdpdGggaGFyZGNvZGUKQEAgLTUzLDEwICs1MywxMCBAQCBTaWdu
ZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
Q3l0aG9uL0NvbXBpbGVyL01vZHVsZU5vZGUucHkgYi9DeXRob24vQ29tcGlsZXIvTW9kdWxlTm9k
ZS5weQotaW5kZXggMzRmMWIzMi4uYjA5MzUwYiAxMDA2NDQKK2luZGV4IDcyZTE0ZjIuLjBjNjgx
ZDIgMTAwNjQ0CiAtLS0gYS9DeXRob24vQ29tcGlsZXIvTW9kdWxlTm9kZS5weQogKysrIGIvQ3l0
aG9uL0NvbXBpbGVyL01vZHVsZU5vZGUucHkKLUBAIC04NzcsNyArODc3LDkgQEAgY2xhc3MgTW9k
dWxlTm9kZShOb2Rlcy5Ob2RlLCBOb2Rlcy5CbG9ja05vZGUpOgorQEAgLTg5OSw3ICs4OTksOSBA
QCBjbGFzcyBNb2R1bGVOb2RlKE5vZGVzLk5vZGUsIE5vZGVzLkJsb2NrTm9kZSk6CiAgICAgICAg
ICBjb2RlLnB1dF9nZW5lcmF0ZWRfYnkoKQogICAgICAgICAgaWYgbWV0YWRhdGE6CiAgICAgICAg
ICAgICAgY29kZS5wdXRsbigiLyogQkVHSU46IEN5dGhvbiBNZXRhZGF0YSIpCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMi45LmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjMuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtY3l0aG9uXzMuMi45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMy4xLmJiCmluZGV4IDM0NTdhOTE0OTAuLjQ5ZjFlODNj
YjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRo
b25fMy4yLjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5
dGhvbl8zLjMuMS5iYgpAQCAtNyw3ICs3LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBM
SUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
LnR4dDttZDU9NjFjM2VlODk2MTU3NTg2MWZhODZjN2U2MmJjOWY2OWMiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJkMjQ5YzkwMjJhYjEzMjg2YjE3YmQ2NmYzMDYwOWU4MDBjNWY5NWVmZWVjYjA2
MTY4OTkwYzdhNjZjZWNkZTZjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImUwZTQ1OTg5ZTgyMWJl
ZjZhYTlhZTE1YzdkNTgzYWI1ZTA1NWY3NDA2YzRiMzYyNGU0OWUwNmQyNGU5MDM3NWEiCiAKIGlu
aGVyaXQgcHlwaSBzZXR1cHRvb2xzMyBjeXRob24KIAotLSAKMi40Ny4xCgo=

--===============0664266743878313557==--
