Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9C9C5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 05:17:58 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9508.1787462275915580412
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 22:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Jh1K2XmE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0Dqn6qwG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a02d0dccd6-b1ae7cff-ddcc-42b6-bc42-d87fcdbc23f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787462275;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Qszi9eG1en4rxJSzX3C/eqMmFLY4YP83cODDAoNaxBY=;
	b=Jh1K2XmE36iHYWGBSxQorh6UaIZb1CYUJXwzZCdVyHCFkAFaVtGXrqJLfxQRS7HE
	D5EyZziyP2+2SJ276TKHa+NjxUHyq2x5M6lK9GRBspu0RwZuQsZvf5eCgpVBj9rSgmu
	f8f6If5i0feO7Qy2EEVWKgcE/mx6LAXBGW9Kx+3k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787462274;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Qszi9eG1en4rxJSzX3C/eqMmFLY4YP83cODDAoNaxBY=;
	b=0Dqn6qwG+OY4kUJAoZVExnZ7SSnsKRrtAfhix3QmABNg8Q+Rk9IQnclL5i5MoNHr
	VFxFUOSnNFWIDTCEr6ynV9a/HOqbNAnQrt5Dzb5UnhYpIrZfPgt2eoo5NjvDM654GrA
	kmGb+lsTuhewbBuDnemQqjXAccLGdTtevWAua+nU=
Content-Type: multipart/mixed; boundary="===============2660611144457205534=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.3.0 SUCCEEDED
Message-ID: <010101a02d0dccd6-b1ae7cff-ddcc-42b6-bc42-d87fcdbc23f9-000000@us-west-2.amazonses.com>
Date: Sun, 23 Aug 2026 05:17:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.23-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 05:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244008

--===============2660611144457205534==
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
From 11ce78ab83c6fa1c6762e7d35fbf6f417429750d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 23 Aug 2026 05:15:55 +0000
Subject: [PATCH] python3-cython: upgrade 3.2.9 -> 3.3.0

Source: CHANGES.rst

3.3.0 (2026-08-22)
==================

(Complete changelog for the 3.3.0 release, including pre-releases.)

Features added
--------------

* PEP-634 Pattern Matching is implemented.
  (Github issue :issue:`4029`)

* ``except *`` (PEP-654 exception groups) is implemented for Python 3.11 and later.
  (Github issue :issue:`4993`)

* Unpacking in comprehensions (PEP-798) is implemented for list/set/dict comprehensions.
  It is not yet available for generator expressions.
  Original patch by Morax.  (Github issue :issue:`7898`)

* Changes were made to adapt to Python 3.15 and its Limited API.
  This does not yet cover ``abi3t``.
  (Github issues :issue:`6405`, :issue:`7190`, :issue:`7347`, :issue:`7348`, :issue:`7358`)

* Cython now uses a new export/import naming scheme for fused C functions that
  increases the resilience against seemingly compatible user code changes.
  The original names are kept for backwards compatibility.
  (Github issue :issue:`7656`)

* Declared container item types (e.g. ``list[float]`` or ``tuple[atype, ...]``)
  are now used by the type system.
  (Github issues :issue:`7288`, :issue:`7798`)

* Type inference was improved for builtin Python types and their methods.
  (Github issues :issue:`7536`, :issue:`7644`, :issue:`7887`, :issue:`7888`)

* Exception base types are inferred for the target variable of multi-exception ``except``
  clauses and for collections of exceptions.  Properties like ``.args`` and ``.context``
  use direct C access in CPython.
  (Github issue :issue:`7783`)

* Annotations on global variables are now used by type inference.
  (Github issue :issue:`7877`)

* The feature set of the shared module can be selected at build time
  by listing named features to include or exclude.
  This is an experimental configuration, subject to further improvements.
  Failures to include used features will currently result in import failures.
  (Github issue :issue:`7759`)

* To control the generation of the shared module, the ``cython`` command gained
  a sub-command ``cython generate-shared pkg/modulename.c`` with additional options
  ``--only`` and ``--exclude``.
  Patch by Raza Khan.  (Github issue :issue:`7842`)

* Conditions in strongly predictable if-clauses or if-else expressions can be wrapped in
  ``cython.likely(condition)`` or ``cython.unlikely(condition)`` to help the C compiler
  optimise the branch.  Note that Cython automatically detects ``raise`` and ``assert``
  statements as terminators already and marks if-clauses that directly lead to them as
  ``unlikely()``, without user interaction.
  (Github issue :issue:`7667`)

* Extension types can declare themselves explicitly as sequence or mapping with
  ``@cython.collection_type("sequence")`` or ``@cython.collection_type("mapping")``.
  This has an effect on their behaviour in pattern matching and subscripting.
  (Github issue :issue:`5027`)

* Sequence types marked as ``@cython.collection_type("sequence")`` that use C integers
  in the

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...place-not-predictable-build-path-prefix-with-hardc.patch | 6 +++---
 .../{python3-cython_3.2.9.bb => python3-cython_3.3.0.bb}    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.9.bb => python3-cython_3.3.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index 573a53ee56..91afbea089 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From a3b9d4303b6aaf5ef2ce9ffd1ba42a93f9cc68e0 Mon Sep 17 00:00:00 2001
+From 07a9271f8d6e07d3eed92365ba1066ed40aee01b Mon Sep 17 00:00:00 2001
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


--===============2660611144457205534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.9.dist-info -> /usr/lib/python3.14/site-packages/cython-3.3.0.dist-info, removed "/usr/lib/python3.14/site-packages/Cython/__init__.pyi /usr/lib/python3.14/site-packages/Cython/Shadow.pyi /usr/lib/python3.14/site-packages/Cython/Utility/Printing.c", added "/usr/lib/python3.14/site-packages/Cython/Utility/Exceptions_Cy.pyx /usr/lib/python3.14/site-packages/Cython/Includes/cpython/sentinel.pxd /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase_Cy.pyx /usr/lib/python3.14/site-packages/Cython/LZSS.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/__pycache__/LZSS.cpython-314.pyc /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase.c /usr/lib/python3.14/site-packages/Cython/LZSS.py /usr/lib/python3.14/site-packages/Cython/Includes/cpython/frozendict.pxd /usr/lib/python3.14/site-packages/Cython/_shared.cpython-314-x86_64-
 linux-gnu.so /usr/lib/python3.14/site-packages/Cython/Compiler/StringEncoding.cpython-314-x86_64-linux-gnu.so"
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

--===============2660611144457205534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.2.9.tar.gz;downloadfilename=cython-3.2.9.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.3.0.tar.gz;downloadfilename=cython-3.3.0.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch"
packages/x86-64-v3-poky-linux/python3-cython: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 27467952 to 27914992 (+2%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: FILELIST: added "/usr/lib/python3.14/site-packages/Cython/.debug/LZSS.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/.debug/_shared.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/Compiler/.debug/StringEncoding.cpython-314-x86_64-linux-gnu.so"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 23866107 to 26112107 (+9%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: FILELIST: directory renamed /usr/src/debug/python3-cython/3.2.9/Cython/Runtime -> /usr/src/debug/python3-cython/3.3.0/Cython/Runtime, directory renamed /usr/src/debug/python3-cython/3.2.9/Cython/Plex -> /usr/src/debug/python3-cython/3.3.0/Cython/Plex, directory renamed /usr/src/debug/python3-cython/3.2.9/Cython/Tempita -> /usr/src/debug/python3-cython/3.3.0/Cython/Tempita, removed "/usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Scanning.c /usr/src/debug/python3-cython/3.2.9/Cython/Utils.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/FusedNode.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Code.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/FlowControl.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/LineTable.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Visitor.c /usr/src/debug/python3-cython/3.2.9/Cython/StringIOTree.c /usr/src/debug/python3-cython/3.2.9/Cython/Compiler/Parsing.c
 ", added "/usr/src/debug/python3-cython/3.3.0/Cython/Compiler/Code.c /usr/src/debug/python3-cython/3.3.0/Cython/LZSS.c /usr/src/debug/python3-cython/3.3.0/Cython/Compiler/FusedNode.c /usr/src/debug/python3-cython/3.3.0/Cython/_shared.c /usr/src/debug/python3-cython/3.3.0/Cython/StringIOTree.c /usr/src/debug/python3-cython/3.3.0/Cython/Utils.c /usr/src/debug/python3-cython/3.3.0/Cython/Compiler/Parsing.c /usr/src/debug/python3-cython/3.3.0/Cython/Compiler/Visitor.c /usr/src/debug/python3-cython/3.3.0/Cython/Compiler/Scanning.c /usr/src/debug/python3-cython/3.3.0/Cython/Compiler/LineTable.c /usr/src/debug/python3-cython/3.3.0/Cython/Compiler/FlowControl.c /usr/src/debug/python3-cython/3.3.0/Cython/Compiler/StringEncoding.c"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.2.9" to "3.3.0"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 15370086 to 16167909 (+5%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.9.dist-info -> /usr/lib/python3.14/site-packages/cython-3.3.0.dist-info, removed "/usr/lib/python3.14/site-packages/Cython/Utility/Printing.c /usr/lib/python3.14/site-packages/Cython/Shadow.pyi /usr/lib/python3.14/site-packages/Cython/__init__.pyi", added "/usr/lib/python3.14/site-packages/Cython/LZSS.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/Includes/cpython/sentinel.pxd /usr/lib/python3.14/site-packages/Cython/LZSS.py /usr/lib/python3.14/site-packages/Cython/Utility/Exceptions_Cy.pyx /usr/lib/python3.14/site-packages/Cython/__pycache__/LZSS.cpython-314.pyc /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase_Cy.pyx /usr/lib/python3.14/site-packages/Cython/Utility/MatchCase.c /usr/lib/python3.14/site-packages/Cython/Compiler/StringEncoding.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/_sh
 ared.cpython-314-x86_64-linux-gnu.so /usr/lib/python3.14/site-packages/Cython/Includes/cpython/frozendict.pxd"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGV changed from 3.2.9 [default] to 3.3.0 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PV changed from "3.2.9" to "3.3.0"
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

--===============2660611144457205534==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.2.9-3.3.0.patch"

RnJvbSAxMWNlNzhhYjgzYzZmYTFjNjc2MmU3ZDM1ZmJmNmY0MTc0Mjk3NTBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjMgQXVnIDIwMjYgMDU6MTU6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAzLjIuOSAtPiAzLjMuMAoKU291cmNlOiBDSEFOR0VTLnJz
dAoKMy4zLjAgKDIwMjYtMDgtMjIpCj09PT09PT09PT09PT09PT09PQoKKENvbXBsZXRlIGNoYW5n
ZWxvZyBmb3IgdGhlIDMuMy4wIHJlbGVhc2UsIGluY2x1ZGluZyBwcmUtcmVsZWFzZXMuKQoKRmVh
dHVyZXMgYWRkZWQKLS0tLS0tLS0tLS0tLS0KCiogUEVQLTYzNCBQYXR0ZXJuIE1hdGNoaW5nIGlz
IGltcGxlbWVudGVkLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA0MDI5YCkKCiogYGBleGNlcHQg
KmBgIChQRVAtNjU0IGV4Y2VwdGlvbiBncm91cHMpIGlzIGltcGxlbWVudGVkIGZvciBQeXRob24g
My4xMSBhbmQgbGF0ZXIuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDQ5OTNgKQoKKiBVbnBhY2tp
bmcgaW4gY29tcHJlaGVuc2lvbnMgKFBFUC03OTgpIGlzIGltcGxlbWVudGVkIGZvciBsaXN0L3Nl
dC9kaWN0IGNvbXByZWhlbnNpb25zLgogIEl0IGlzIG5vdCB5ZXQgYXZhaWxhYmxlIGZvciBnZW5l
cmF0b3IgZXhwcmVzc2lvbnMuCiAgT3JpZ2luYWwgcGF0Y2ggYnkgTW9yYXguICAoR2l0aHViIGlz
c3VlIDppc3N1ZTpgNzg5OGApCgoqIENoYW5nZXMgd2VyZSBtYWRlIHRvIGFkYXB0IHRvIFB5dGhv
biAzLjE1IGFuZCBpdHMgTGltaXRlZCBBUEkuCiAgVGhpcyBkb2VzIG5vdCB5ZXQgY292ZXIgYGBh
YmkzdGBgLgogIChHaXRodWIgaXNzdWVzIDppc3N1ZTpgNjQwNWAsIDppc3N1ZTpgNzE5MGAsIDpp
c3N1ZTpgNzM0N2AsIDppc3N1ZTpgNzM0OGAsIDppc3N1ZTpgNzM1OGApCgoqIEN5dGhvbiBub3cg
dXNlcyBhIG5ldyBleHBvcnQvaW1wb3J0IG5hbWluZyBzY2hlbWUgZm9yIGZ1c2VkIEMgZnVuY3Rp
b25zIHRoYXQKICBpbmNyZWFzZXMgdGhlIHJlc2lsaWVuY2UgYWdhaW5zdCBzZWVtaW5nbHkgY29t
cGF0aWJsZSB1c2VyIGNvZGUgY2hhbmdlcy4KICBUaGUgb3JpZ2luYWwgbmFtZXMgYXJlIGtlcHQg
Zm9yIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5LgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3NjU2
YCkKCiogRGVjbGFyZWQgY29udGFpbmVyIGl0ZW0gdHlwZXMgKGUuZy4gYGBsaXN0W2Zsb2F0XWBg
IG9yIGBgdHVwbGVbYXR5cGUsIC4uLl1gYCkKICBhcmUgbm93IHVzZWQgYnkgdGhlIHR5cGUgc3lz
dGVtLgogIChHaXRodWIgaXNzdWVzIDppc3N1ZTpgNzI4OGAsIDppc3N1ZTpgNzc5OGApCgoqIFR5
cGUgaW5mZXJlbmNlIHdhcyBpbXByb3ZlZCBmb3IgYnVpbHRpbiBQeXRob24gdHlwZXMgYW5kIHRo
ZWlyIG1ldGhvZHMuCiAgKEdpdGh1YiBpc3N1ZXMgOmlzc3VlOmA3NTM2YCwgOmlzc3VlOmA3NjQ0
YCwgOmlzc3VlOmA3ODg3YCwgOmlzc3VlOmA3ODg4YCkKCiogRXhjZXB0aW9uIGJhc2UgdHlwZXMg
YXJlIGluZmVycmVkIGZvciB0aGUgdGFyZ2V0IHZhcmlhYmxlIG9mIG11bHRpLWV4Y2VwdGlvbiBg
YGV4Y2VwdGBgCiAgY2xhdXNlcyBhbmQgZm9yIGNvbGxlY3Rpb25zIG9mIGV4Y2VwdGlvbnMuICBQ
cm9wZXJ0aWVzIGxpa2UgYGAuYXJnc2BgIGFuZCBgYC5jb250ZXh0YGAKICB1c2UgZGlyZWN0IEMg
YWNjZXNzIGluIENQeXRob24uCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc3ODNgKQoKKiBBbm5v
dGF0aW9ucyBvbiBnbG9iYWwgdmFyaWFibGVzIGFyZSBub3cgdXNlZCBieSB0eXBlIGluZmVyZW5j
ZS4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzg3N2ApCgoqIFRoZSBmZWF0dXJlIHNldCBvZiB0
aGUgc2hhcmVkIG1vZHVsZSBjYW4gYmUgc2VsZWN0ZWQgYXQgYnVpbGQgdGltZQogIGJ5IGxpc3Rp
bmcgbmFtZWQgZmVhdHVyZXMgdG8gaW5jbHVkZSBvciBleGNsdWRlLgogIFRoaXMgaXMgYW4gZXhw
ZXJpbWVudGFsIGNvbmZpZ3VyYXRpb24sIHN1YmplY3QgdG8gZnVydGhlciBpbXByb3ZlbWVudHMu
CiAgRmFpbHVyZXMgdG8gaW5jbHVkZSB1c2VkIGZlYXR1cmVzIHdpbGwgY3VycmVudGx5IHJlc3Vs
dCBpbiBpbXBvcnQgZmFpbHVyZXMuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc3NTlgKQoKKiBU
byBjb250cm9sIHRoZSBnZW5lcmF0aW9uIG9mIHRoZSBzaGFyZWQgbW9kdWxlLCB0aGUgYGBjeXRo
b25gYCBjb21tYW5kIGdhaW5lZAogIGEgc3ViLWNvbW1hbmQgYGBjeXRob24gZ2VuZXJhdGUtc2hh
cmVkIHBrZy9tb2R1bGVuYW1lLmNgYCB3aXRoIGFkZGl0aW9uYWwgb3B0aW9ucwogIGBgLS1vbmx5
YGAgYW5kIGBgLS1leGNsdWRlYGAuCiAgUGF0Y2ggYnkgUmF6YSBLaGFuLiAgKEdpdGh1YiBpc3N1
ZSA6aXNzdWU6YDc4NDJgKQoKKiBDb25kaXRpb25zIGluIHN0cm9uZ2x5IHByZWRpY3RhYmxlIGlm
LWNsYXVzZXMgb3IgaWYtZWxzZSBleHByZXNzaW9ucyBjYW4gYmUgd3JhcHBlZCBpbgogIGBgY3l0
aG9uLmxpa2VseShjb25kaXRpb24pYGAgb3IgYGBjeXRob24udW5saWtlbHkoY29uZGl0aW9uKWBg
IHRvIGhlbHAgdGhlIEMgY29tcGlsZXIKICBvcHRpbWlzZSB0aGUgYnJhbmNoLiAgTm90ZSB0aGF0
IEN5dGhvbiBhdXRvbWF0aWNhbGx5IGRldGVjdHMgYGByYWlzZWBgIGFuZCBgYGFzc2VydGBgCiAg
c3RhdGVtZW50cyBhcyB0ZXJtaW5hdG9ycyBhbHJlYWR5IGFuZCBtYXJrcyBpZi1jbGF1c2VzIHRo
YXQgZGlyZWN0bHkgbGVhZCB0byB0aGVtIGFzCiAgYGB1bmxpa2VseSgpYGAsIHdpdGhvdXQgdXNl
ciBpbnRlcmFjdGlvbi4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzY2N2ApCgoqIEV4dGVuc2lv
biB0eXBlcyBjYW4gZGVjbGFyZSB0aGVtc2VsdmVzIGV4cGxpY2l0bHkgYXMgc2VxdWVuY2Ugb3Ig
bWFwcGluZyB3aXRoCiAgYGBAY3l0aG9uLmNvbGxlY3Rpb25fdHlwZSgic2VxdWVuY2UiKWBgIG9y
IGBgQGN5dGhvbi5jb2xsZWN0aW9uX3R5cGUoIm1hcHBpbmciKWBgLgogIFRoaXMgaGFzIGFuIGVm
ZmVjdCBvbiB0aGVpciBiZWhhdmlvdXIgaW4gcGF0dGVybiBtYXRjaGluZyBhbmQgc3Vic2NyaXB0
aW5nLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA1MDI3YCkKCiogU2VxdWVuY2UgdHlwZXMgbWFy
a2VkIGFzIGBgQGN5dGhvbi5jb2xsZWN0aW9uX3R5cGUoInNlcXVlbmNlIilgYCB0aGF0IHVzZSBD
IGludGVnZXJzCiAgaW4gdGhlCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMw
MDAgY2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRh
Y2htZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4ucGxhY2Utbm90LXByZWRpY3RhYmxlLWJ1
aWxkLXBhdGgtcHJlZml4LXdpdGgtaGFyZGMucGF0Y2ggfCA2ICsrKy0tLQogLi4uL3tweXRob24z
LWN5dGhvbl8zLjIuOS5iYiA9PiBweXRob24zLWN5dGhvbl8zLjMuMC5iYn0gICAgfCAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWN5dGhvbl8zLjIuOS5iYiA9PiBw
eXRob24zLWN5dGhvbl8zLjMuMC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtUmVwbGFjZS1ub3QtcHJlZGljdGFi
bGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1i
dWlsZC1wYXRoLXByZWZpeC13aXRoLWhhcmRjLnBhdGNoCmluZGV4IDU3M2E1M2VlNTYuLjkxYWZi
ZWEwODkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1j
eXRob24vMDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1wYXRoLXByZWZpeC13aXRo
LWhhcmRjLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1j
eXRob24vMDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1wYXRoLXByZWZpeC13aXRo
LWhhcmRjLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhM2I5ZDQzMDNiNmFhZjVlZjJjZTlm
ZmQxYmE0MmE5M2Y5Y2M2OGUwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwN2E5Mjcx
ZjhkNmUwN2QzZWVkOTIzNjViYTEwNjZlZDQwYWVlMDFiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2Vk
LCAxNyBTZXAgMjAyNSAwMTo0MjowOCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBSZXBsYWNlIG5v
dCBwcmVkaWN0YWJsZSBidWlsZCBwYXRoIHByZWZpeCB3aXRoIGhhcmRjb2RlCkBAIC01MywxMCAr
NTMsMTAgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAog
ZGlmZiAtLWdpdCBhL0N5dGhvbi9Db21waWxlci9Nb2R1bGVOb2RlLnB5IGIvQ3l0aG9uL0NvbXBp
bGVyL01vZHVsZU5vZGUucHkKLWluZGV4IDM0ZjFiMzIuLmIwOTM1MGIgMTAwNjQ0CitpbmRleCA2
ZTBhM2U1Li5jZTM1YjI1IDEwMDY0NAogLS0tIGEvQ3l0aG9uL0NvbXBpbGVyL01vZHVsZU5vZGUu
cHkKICsrKyBiL0N5dGhvbi9Db21waWxlci9Nb2R1bGVOb2RlLnB5Ci1AQCAtODc3LDcgKzg3Nyw5
IEBAIGNsYXNzIE1vZHVsZU5vZGUoTm9kZXMuTm9kZSwgTm9kZXMuQmxvY2tOb2RlKToKK0BAIC04
ODgsNyArODg4LDkgQEAgY2xhc3MgTW9kdWxlTm9kZShOb2Rlcy5Ob2RlLCBOb2Rlcy5CbG9ja05v
ZGUpOgogICAgICAgICAgY29kZS5wdXRfZ2VuZXJhdGVkX2J5KCkKICAgICAgICAgIGlmIG1ldGFk
YXRhOgogICAgICAgICAgICAgIGNvZGUucHV0bG4oIi8qIEJFR0lOOiBDeXRob24gTWV0YWRhdGEi
KQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhv
bl8zLjIuOS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob25f
My4zLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjIuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjMuMC5iYgppbmRleCAzNDU3YTkx
NDkwLi43OTkyODkyZTYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtY3l0aG9uXzMuMi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1jeXRob25fMy4zLjAuYmIKQEAgLTcsNyArNyw3IEBAIFNFQ1RJT04gPSAiZGV2
ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRS50eHQ7bWQ1PTYxYzNlZTg5NjE1NzU4NjFmYTg2YzdlNjJiYzlmNjljIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDI0OWM5MDIyYWIxMzI4NmIxN2JkNjZmMzA2MDllODAw
YzVmOTVlZmVlY2IwNjE2ODk5MGM3YTY2Y2VjZGU2YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJl
ZWQwZDkzZmJjYTcwODdmMTQzYjQyYzM0YjA1YTgyNTg0OWJkZjE3ZjEwMTU3MmMyMTA1YWNmYTQ5
YWE4OGI4IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMgY3l0aG9uCiAKLS0gCjIuNDcuMQoK

--===============2660611144457205534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="python3-cython-changelog.txt"

Q2hhbmdlbG9nIGZvciBweXRob24zLWN5dGhvbjogMy4yLjkgLT4gMy4zLjAKU291cmNlOiBDSEFO
R0VTLnJzdAoKMy4zLjAgKDIwMjYtMDgtMjIpCj09PT09PT09PT09PT09PT09PQoKKENvbXBsZXRl
IGNoYW5nZWxvZyBmb3IgdGhlIDMuMy4wIHJlbGVhc2UsIGluY2x1ZGluZyBwcmUtcmVsZWFzZXMu
KQoKRmVhdHVyZXMgYWRkZWQKLS0tLS0tLS0tLS0tLS0KCiogUEVQLTYzNCBQYXR0ZXJuIE1hdGNo
aW5nIGlzIGltcGxlbWVudGVkLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA0MDI5YCkKCiogYGBl
eGNlcHQgKmBgIChQRVAtNjU0IGV4Y2VwdGlvbiBncm91cHMpIGlzIGltcGxlbWVudGVkIGZvciBQ
eXRob24gMy4xMSBhbmQgbGF0ZXIuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDQ5OTNgKQoKKiBV
bnBhY2tpbmcgaW4gY29tcHJlaGVuc2lvbnMgKFBFUC03OTgpIGlzIGltcGxlbWVudGVkIGZvciBs
aXN0L3NldC9kaWN0IGNvbXByZWhlbnNpb25zLgogIEl0IGlzIG5vdCB5ZXQgYXZhaWxhYmxlIGZv
ciBnZW5lcmF0b3IgZXhwcmVzc2lvbnMuCiAgT3JpZ2luYWwgcGF0Y2ggYnkgTW9yYXguICAoR2l0
aHViIGlzc3VlIDppc3N1ZTpgNzg5OGApCgoqIENoYW5nZXMgd2VyZSBtYWRlIHRvIGFkYXB0IHRv
IFB5dGhvbiAzLjE1IGFuZCBpdHMgTGltaXRlZCBBUEkuCiAgVGhpcyBkb2VzIG5vdCB5ZXQgY292
ZXIgYGBhYmkzdGBgLgogIChHaXRodWIgaXNzdWVzIDppc3N1ZTpgNjQwNWAsIDppc3N1ZTpgNzE5
MGAsIDppc3N1ZTpgNzM0N2AsIDppc3N1ZTpgNzM0OGAsIDppc3N1ZTpgNzM1OGApCgoqIEN5dGhv
biBub3cgdXNlcyBhIG5ldyBleHBvcnQvaW1wb3J0IG5hbWluZyBzY2hlbWUgZm9yIGZ1c2VkIEMg
ZnVuY3Rpb25zIHRoYXQKICBpbmNyZWFzZXMgdGhlIHJlc2lsaWVuY2UgYWdhaW5zdCBzZWVtaW5n
bHkgY29tcGF0aWJsZSB1c2VyIGNvZGUgY2hhbmdlcy4KICBUaGUgb3JpZ2luYWwgbmFtZXMgYXJl
IGtlcHQgZm9yIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5LgogIChHaXRodWIgaXNzdWUgOmlzc3Vl
OmA3NjU2YCkKCiogRGVjbGFyZWQgY29udGFpbmVyIGl0ZW0gdHlwZXMgKGUuZy4gYGBsaXN0W2Zs
b2F0XWBgIG9yIGBgdHVwbGVbYXR5cGUsIC4uLl1gYCkKICBhcmUgbm93IHVzZWQgYnkgdGhlIHR5
cGUgc3lzdGVtLgogIChHaXRodWIgaXNzdWVzIDppc3N1ZTpgNzI4OGAsIDppc3N1ZTpgNzc5OGAp
CgoqIFR5cGUgaW5mZXJlbmNlIHdhcyBpbXByb3ZlZCBmb3IgYnVpbHRpbiBQeXRob24gdHlwZXMg
YW5kIHRoZWlyIG1ldGhvZHMuCiAgKEdpdGh1YiBpc3N1ZXMgOmlzc3VlOmA3NTM2YCwgOmlzc3Vl
OmA3NjQ0YCwgOmlzc3VlOmA3ODg3YCwgOmlzc3VlOmA3ODg4YCkKCiogRXhjZXB0aW9uIGJhc2Ug
dHlwZXMgYXJlIGluZmVycmVkIGZvciB0aGUgdGFyZ2V0IHZhcmlhYmxlIG9mIG11bHRpLWV4Y2Vw
dGlvbiBgYGV4Y2VwdGBgCiAgY2xhdXNlcyBhbmQgZm9yIGNvbGxlY3Rpb25zIG9mIGV4Y2VwdGlv
bnMuICBQcm9wZXJ0aWVzIGxpa2UgYGAuYXJnc2BgIGFuZCBgYC5jb250ZXh0YGAKICB1c2UgZGly
ZWN0IEMgYWNjZXNzIGluIENQeXRob24uCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc3ODNgKQoK
KiBBbm5vdGF0aW9ucyBvbiBnbG9iYWwgdmFyaWFibGVzIGFyZSBub3cgdXNlZCBieSB0eXBlIGlu
ZmVyZW5jZS4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzg3N2ApCgoqIFRoZSBmZWF0dXJlIHNl
dCBvZiB0aGUgc2hhcmVkIG1vZHVsZSBjYW4gYmUgc2VsZWN0ZWQgYXQgYnVpbGQgdGltZQogIGJ5
IGxpc3RpbmcgbmFtZWQgZmVhdHVyZXMgdG8gaW5jbHVkZSBvciBleGNsdWRlLgogIFRoaXMgaXMg
YW4gZXhwZXJpbWVudGFsIGNvbmZpZ3VyYXRpb24sIHN1YmplY3QgdG8gZnVydGhlciBpbXByb3Zl
bWVudHMuCiAgRmFpbHVyZXMgdG8gaW5jbHVkZSB1c2VkIGZlYXR1cmVzIHdpbGwgY3VycmVudGx5
IHJlc3VsdCBpbiBpbXBvcnQgZmFpbHVyZXMuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc3NTlg
KQoKKiBUbyBjb250cm9sIHRoZSBnZW5lcmF0aW9uIG9mIHRoZSBzaGFyZWQgbW9kdWxlLCB0aGUg
YGBjeXRob25gYCBjb21tYW5kIGdhaW5lZAogIGEgc3ViLWNvbW1hbmQgYGBjeXRob24gZ2VuZXJh
dGUtc2hhcmVkIHBrZy9tb2R1bGVuYW1lLmNgYCB3aXRoIGFkZGl0aW9uYWwgb3B0aW9ucwogIGBg
LS1vbmx5YGAgYW5kIGBgLS1leGNsdWRlYGAuCiAgUGF0Y2ggYnkgUmF6YSBLaGFuLiAgKEdpdGh1
YiBpc3N1ZSA6aXNzdWU6YDc4NDJgKQoKKiBDb25kaXRpb25zIGluIHN0cm9uZ2x5IHByZWRpY3Rh
YmxlIGlmLWNsYXVzZXMgb3IgaWYtZWxzZSBleHByZXNzaW9ucyBjYW4gYmUgd3JhcHBlZCBpbgog
IGBgY3l0aG9uLmxpa2VseShjb25kaXRpb24pYGAgb3IgYGBjeXRob24udW5saWtlbHkoY29uZGl0
aW9uKWBgIHRvIGhlbHAgdGhlIEMgY29tcGlsZXIKICBvcHRpbWlzZSB0aGUgYnJhbmNoLiAgTm90
ZSB0aGF0IEN5dGhvbiBhdXRvbWF0aWNhbGx5IGRldGVjdHMgYGByYWlzZWBgIGFuZCBgYGFzc2Vy
dGBgCiAgc3RhdGVtZW50cyBhcyB0ZXJtaW5hdG9ycyBhbHJlYWR5IGFuZCBtYXJrcyBpZi1jbGF1
c2VzIHRoYXQgZGlyZWN0bHkgbGVhZCB0byB0aGVtIGFzCiAgYGB1bmxpa2VseSgpYGAsIHdpdGhv
dXQgdXNlciBpbnRlcmFjdGlvbi4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzY2N2ApCgoqIEV4
dGVuc2lvbiB0eXBlcyBjYW4gZGVjbGFyZSB0aGVtc2VsdmVzIGV4cGxpY2l0bHkgYXMgc2VxdWVu
Y2Ugb3IgbWFwcGluZyB3aXRoCiAgYGBAY3l0aG9uLmNvbGxlY3Rpb25fdHlwZSgic2VxdWVuY2Ui
KWBgIG9yIGBgQGN5dGhvbi5jb2xsZWN0aW9uX3R5cGUoIm1hcHBpbmciKWBgLgogIFRoaXMgaGFz
IGFuIGVmZmVjdCBvbiB0aGVpciBiZWhhdmlvdXIgaW4gcGF0dGVybiBtYXRjaGluZyBhbmQgc3Vi
c2NyaXB0aW5nLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA1MDI3YCkKCiogU2VxdWVuY2UgdHlw
ZXMgbWFya2VkIGFzIGBgQGN5dGhvbi5jb2xsZWN0aW9uX3R5cGUoInNlcXVlbmNlIilgYCB0aGF0
IHVzZSBDIGludGVnZXJzCiAgaW4gdGhlIHN1YnNjcmlwdCBzcGVjaWFsIG1ldGhvZHMgbm93IGlt
cGxlbWVudCBvbmx5IHRoZSBzZXF1ZW5jZSBhbmQgbm90IHRoZSBtYXBwaW5nIHByb3RvY29sLgog
IFRoaXMgYWxsb3dzIHN1YnNjcmlwdGluZyBjb2RlIHRvIGF2b2lkIGNyZWF0aW5nIFB5dGhvbiBp
bmRleCBvYmplY3RzIHdoZW4gdGhlIGluZGV4CiAgaXMgYWxyZWFkeSBhdmFpbGFibGUgYXMgQyBp
bnRlZ2VyLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3NDM1YCkKCiogU2VxdWVuY2UgdHlwZXMg
dGhhdCBoYXZlIHRoZWlyIGBgUHlfVFBGTEFHU19TRVFVRU5DRWBgIHR5cGUgZmxhZyBzZXQgY2Fu
IGJlbmVmaXQgZnJvbQogIGZhc3RlciBzdWJzY3JpcHRpbmcgdmlhIHRoZSBzZXF1ZW5jZSBwcm90
b2NvbCBhcyBDeXRob24gbm93IGJ5cGFzc2VzIHRoZSBtYXBwaW5nIHByb3RvY29sCiAgZm9yIHRo
ZW0gaWYgYm90aCBwcm90b2NvbHMgYXJlIGltcGxlbWVudGVkLgogIChHaXRodWIgaXNzdWUgOmlz
c3VlOmA3NDMyYCkKCiogVGhlIFB5My4xNSBgYGZyb3plbmRpY3RgYCBidWlsdGluIHR5cGUgaXMg
c3VwcG9ydGVkIGFuZCBoYXMgYmVlbiBiYWNrcG9ydGVkIGFzIGFuIGFsaWFzCiAgZm9yIGBgZGlj
dGBgIGluIG9sZGVyIFB5dGhvbiB2ZXJzaW9ucy4KICBQYXRjaGVzIHRvIGFkYXB0IGV4aXN0aW5n
IGBgZGljdGBgIG9wdGltaXNhdGlvbnMgd2VyZSBjb250cmlidXRlZCBieSBPbWthciBLYWJkZS4K
ICAoR2l0aHViIGlzc3VlcyA6aXNzdWU6YDc1NDVgLCA6aXNzdWU6YDc2NDdgKQoKKiBUaGUgUHkz
LjE1IGBgc2VudGluZWxgYCBidWlsdGluIGlzIHN1cHBvcnRlZCBhbmQgaXRzIEMtQVBJIGRlY2xh
cmF0aW9ucyBhcmUgYXZhaWxhYmxlIGluCiAgYGBjcHl0aG9uLnNlbnRpbmVsYGAuCgoqIGBgY3l0
aG9uLnB5X2ludGBgIChhbmQgdGhlIHNhbWUgZm9yIGBgcHlfZmxvYXRgYCwgYGBweV9jb21wbGV4
YGAgYW5kIGBgcHlfYm9vbGBgKQogIGNhbiBiZSB1c2VkIHRvIHJlZmVyIHRvIFB5dGhvbidzIGJ1
aWx0aW4gdHlwZXMgaW4gYSBDIHR5cGUgY29udGV4dCwgZS5nLiBhZnRlciBgYGNkZWZgYCwKICB3
aGVyZSB0aGV5IGFyZSBub3JtYWxseSBzaGFkb3dlZCBieSB0aGUgQyB0eXBlcyBvZiB0aGUgc2Ft
ZSBuYW1lLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3ODQ0YCkKCiogVGhlIGJ1aWx0aW4gUHl0
aG9uIHR5cGVzIGBgaW50YGAsIGBgZmxvYXRgYCwgYGBzdHJgYCwgYGBieXRlc2BgIGFuZCBgYGJ5
dGVhcnJheWBgCiAgYXJlIHNwZWNpYWwgY2FzZWQgaW4gY29tcGFyaXNvbnMgdG8gc3BlZWQgdGhl
bSB1cC4KICAoR2l0aHViIGlzc3VlcyA6aXNzdWU6YDc0NTJgLCA6aXNzdWU6YDc0NzRgKQoKKiBU
aGUgYnVpbHRpbiBQeXRob24gdHlwZXMgYGBpbnRgYCBhbmQgYGBmbG9hdGBgIGFyZSBzcGVjaWFs
IGNhc2VkIGluIGBgK2BgLCBgYC1gYCBhbmQgYGAqYGAKICBvcGVyYXRpb25zIHdpdGggKGNvbXBp
bGUtdGltZSkgdW5rbm93biBQeXRob24gdHlwZXMgaW4gb3JkZXIgdG8gc3BlZWQgdGhlbSB1cC4K
ICBUaGUgYml0IG9wZXJhdGlvbnMgYGBeYGAsIGBgfGBgIGFuZCBgYCZgYCBhcmUgYWRkaXRpb25h
bGx5IHNwZWNpYWwgY2FzZWQgZm9yIGBgaW50YGAuCiAgKEdpdGh1YiBpc3N1ZXMgOmlzc3VlOmA3
NDg1YCwgOmlzc3VlOmA3NTQxYCkKCiogYGA8Ym9vbD5gYCBjYXN0cyBjYW4gYmUgdXNlZCB0byBj
b252ZXJ0IEMgdmFsdWVzIHRvIFB5dGhvbiBgYFRydWVgYCAvIGBgRmFsc2VgYC4KICAoR2l0aHVi
IGlzc3VlIDppc3N1ZTpgNzUxM2ApCgoqIGBgY2RlZmBgIHByb3BlcnR5IG1ldGhvZHMgc3VwcG9y
dCBzZXR0ZXJzLgogIChHaXRodWIgaXNzdWVzIDppc3N1ZTpgNzUwNWAsIDppc3N1ZTpgNzc5MWAp
CgoqIFRoZSBDIGBgcmVzdHJpY3RgYCBtb2RpZmllciBjYW4gYmUgdXNlZCBpbiBkZWNsYXJhdGlv
bnMuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc2MTdgKQoKKiBDIGFycmF5cyBtYXkgbm93IGJl
IGRlY2xhcmVkIHdpdGggKGBgZXh0ZXJuYGAgb3IgaW50ZXJuYWwpIGVudW0gdmFsdWVzIGFzIHRo
ZWlyIHNpemUuCiAgKEdpdGh1YiBpc3N1ZXMgOmlzc3VlOmA3NDAxYCwgOmlzc3VlOmA3NDA2YCkK
CiogYGBwcmFuZ2UobnVtX3RocmVhZHM9MClgYCBhdXRvbWF0aWNhbGx5IHNlbGVjdHMgdGhlIG1h
eGltdW0gbnVtYmVyIG9mIE9wZW5NUCB0aHJlYWRzLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3
NTg2YCkKCiogYGBwcmFuZ2UoKWBgIGFuZCBgYHBhcmFsbGVsKClgYCBzZWN0aW9ucyBjYW4gYmUg
dXNlZCB3aXRob3V0IHJlbGVhc2luZyB0aGUgR0lMLCB3aGljaAogIGhlbHBzIGluIGZyZWV0aHJl
YWRpbmcgYnVpbGRzLiAgV2hlbiByZWxlYXNpbmcgdGhlIEdJTCBhcyBwYXJ0IG9mIHRoZSBzZWN0
aW9uIGRlY2xhcmF0aW9uLAogIHJlLWFjcXVpcmluZyBpdCBpbW1lZGlhdGVseSBpbnNpZGUgaXMg
bm93IGZhc3RlciwgZS5nLiB0byBkbyBwZXItdGhyZWFkIFB5dGhvbiBpbml0aWFsaXNhdGlvbnMu
CiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDY1NjJgKQoKKiBgYGN5dGhvbi5weW11dGV4YGAgYW5k
IGBgY3l0aG9uLnB5dGhyZWFkX3R5cGVfbG9ja2BgIG5vdyBzdXBwb3J0IGEgYGAubG9ja2VkKClg
YCBtZXRob2QKICB0byBjaGVjayBpZiB0aGUgbG9jayBpcyBjdXJyZW50bHkgaGVsZCB3aXRob3V0
IGJsb2NraW5nLiBUaGUgbWV0aG9kIHdvcmtzIG9uIGFsbCBQeXRob24KICB2ZXJzaW9ucyB1c2lu
ZyBhdG9taWMgcmVhZHMgb24gUHl0aG9uIDMuMTMrIGFuZCBhIHRyeS1hY3F1aXJlIGFwcHJvYWNo
IG9uIG9sZGVyIHZlcnNpb25zLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3Mjc1YCkKCiogQSBz
aW1wbGVyIG1lY2hhbmlzbSB3YXMgYWRkZWQgZm9yIGltcGxlbWVudGluZyBDKysgZXhjZXB0aW9u
IGhhbmRsZXJzIGluIEN5dGhvbiBjb2RlLgogIChHaXRodWIgaXNzdWVzIDppc3N1ZTpgNzM4OGAs
IDppc3N1ZTpgNzM5MGApCgoqIFJlcGVhdGVkIG1lbW9yeXZpZXcgc2xpY2luZyBpbnNpZGUgb2Yg
bG9vcHMgbm93IGF2b2lkcyByZWR1bmRhbnQgcmVmZXJlbmNlIGNvdW50aW5nLAogIG1ha2luZyBp
dCBzdWJzdGFudGlhbGx5IGZhc3Rlci4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNTUwN2ApCgoq
IEluZGV4aW5nIGludG8gQ3l0aG9uIG1lbW9yeXZpZXcgb2JqZWN0cyBmcm9tIFB5dGhvbiBpcyBm
YXN0ZXIuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc1MjlgKQoKKiBTb21lIGludGVybmFsIGNh
bGwgb3ZlcmhlYWQgaW4gdGhlIG1lbW9yeXZpZXcgY29kZSB3YXMgcmVtb3ZlZC4KICAoR2l0aHVi
IGlzc3VlIDppc3N1ZTpgNzYwOWApCgoqIEV4dGVuc2lvbiB0eXBlcyB1c2UgdGhlIHZlY3RvcmNh
bGwgaW50ZXJmYWNlIGZvciB0aGVpciBpbnN0YW50aWF0aW9uIGluIG1hbnkgY2FzZXMuCiAgVGhp
cyBjYW4gYmUgY29uZmlndXJlZCB3aXRoIGEgbmV3IEMgZmVhdHVyZSBtYWNybyBgYENZVEhPTl9W
RUNUT1JDQUxMX1RQTkVXYGAuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc2OThgKQoKKiBDb3Jv
dXRpbmUgbWV0aG9kcyB1c2UgdGhlIGZhc3RlciB2ZWN0b3JjYWxsIGludGVyZmFjZS4KICAoR2l0
aHViIGlzc3VlIDppc3N1ZTpgNzY3OGApCgoqIFZlY3RvcmNhbGxzIHdpdGggbGl0ZXJhbCBrZXl3
b3JkIGFyZ3VtZW50cyB1c2UgY2FjaGVkIGNvbnN0YW50IGtleXdvcmQgbmFtZSB0dXBsZXMuCiAg
KEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc3MTNgKQoKKiBMaXN0IGNvbXByZWhlbnNpb25zIHRoYXQg
Z2VuZXJhdGUgbmV3IG9iamVjdHMgYXZvaWQgcmVmY291bnRpbmcgb3ZlcmhlYWQgZm9yIGFwcGVu
ZGluZy4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzc0OGApCgoqIE1ldGhvZCBjYWxscyBpbiBv
bGRlciBMaW1pdGVkIEFQSSB2ZXJzaW9ucyBhcmUgc2xpZ2h0bHkgZmFzdGVyLgogIChHaXRodWIg
aXNzdWUgOmlzc3VlOmA3NzA3YCkKCiogQ29uc3RhbnQgYGBmcm96ZW5zZXRgYCBvYmplY3RzIGFy
ZSBkZWR1cGxpY2F0ZWQgYW5kIGNhY2hlZCBhdCBtb2R1bGUgaW5pdCB0aW1lCiAgKHNpbWlsYXIg
dG8gY29uc3RhbnQgdHVwbGUgYW5kIHNsaWNlIG9iamVjdHMpLgogIE9yaWdpbmFsIFBhdGNoIGJ5
IFpoZW5ibyBMaS4gKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDI3NDFgKQoKKiBDIGFycmF5cyBhcmUg
c3Vic3RpdHV0ZWQgZm9yIHNlcXVlbmNlIGl0ZXJhdGlvbiBpbiBtb3JlIGNhc2VzLCBhbHNvIGlu
c2lkZSBvZiBnZW5lcmF0b3JzLgogIEFkLWhvYyBDIGFycmF5IHN0b3JhZ2Ugb24gdGhlIHN0YWNr
IGFuZCBpbiBjbG9zdXJlcyB3YXMgcmV3b3JrZWQgYWxvbmcgdGhlIHdheS4KICAoR2l0aHViIGlz
c3VlcyA6aXNzdWU6YDczMjNgLCA6aXNzdWU6YDczMzlgKQoKKiBTaW5nbGUgY2hhcmFjdGVyIGBp
bmAtdGVzdHMgb24gYGBzdHJgYCwgYGBieXRlc2BgIGFuZCBgYGJ5dGVhcnJheWBgIGFyZSBvcHRp
bWlzZWQuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDM4ODhgKQoKKiBVbmljb2RlIHN0cmluZyBj
b21wYXJpc29ucyB0byBzaW5nbGUgY2hhcmFjdGVyIGxpdGVyYWxzIGFyZSBmYXN0ZXIuCiAgKEdp
dGh1YiBpc3N1ZSA6aXNzdWU6YDc0MThgKQoKKiBGLXN0cmluZ3MgYXJlIGEgbGl0dGxlIGZhc3Rl
ciBpbiBzb21lIGNhc2VzLgogIChHaXRodWIgaXNzdWVzIDppc3N1ZTpgNzQ5NWAsIDppc3N1ZTpg
NzUyNmApCgoqIEZvcm1hdHRpbmcgQyBmbG9hdGluZyBwb2ludCB2YWx1ZXMgaW4gZi1zdHJpbmdz
IGF2b2lkcyBjcmVhdGluZyBQeXRob24gZmxvYXRzIGluIHNvbWUgY2FzZXMuCiAgUGF0Y2ggYnkg
VmxhZGltaXIgU2FyYWlraW4uICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzc5N2ApCgoqIGBgYnl0
ZWFycmF5LmV4dGVuZChieXRlcylgYCBpcyBmYXN0ZXIuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6
YDc3OTdgKQoKKiBgYGFzc2VydGBgIGNvbmRpdGlvbnMgYXJlIGNvbnN0YW50LWZvbGRlZC4KICAo
R2l0aHViIGlzc3VlIDppc3N1ZTpgNzgwOWApCgoqIFB5UHkgYW5kIEdyYWFsUHl0aG9uIHVzZSB0
aGUgdmVjdG9yY2FsbCBwcm90b2NvbCB0byBlbmFibGUgZmFzdGVyIFB5dGhvbiBjYWxscyBpbiBm
dXR1cmUgcmVsZWFzZXMuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc2MTRgKQoKKiBUaGUgcnVu
dGltZSBjb252ZXJzaW9uIGZyb20gYSBQeXRob24gbWFwcGluZyB0byBhIEMgc3RydWN0L3VuaW9u
IHVzZXMgbGVzcyBjb2RlLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3MzQzYCkKCiogVGhlIGVy
cm9yIGhhbmRsaW5nIG9mIG1lbW9yeXZpZXdzIHVzZXMgbGVzcyBjb2RlLgogIChHaXRodWIgaXNz
dWUgOmlzc3VlOmA3NTI1YCkKCiogVGhlIHJ1bnRpbWUgZGlzcGF0Y2ggY29kZSBvZiBmdXNlZCB0
eXBlcyB1c2VzIGxlc3MgY29kZS4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzUwMWApCgoqIE1v
cmUgY29kZSBpcyBleHRyYWN0ZWQgdG8gdGhlIHNoYXJlZCB1dGlsaXR5IGNvZGUgbW9kdWxlLgog
IChHaXRodWIgaXNzdWVzIDppc3N1ZTpgNzU1NmAsIDppc3N1ZTpgNzU3MGApCgoqIEFzeW5jIGdl
bmVyYXRvciBvYmplY3RzIGFyZSBzbGlnaHRseSBzbWFsbGVyLgogIChHaXRodWIgaXNzdWUgOmlz
c3VlOmA3Nzc2YCkKCiogQ3l0aG9uIGNvbXBpbGVkIGZ1bmN0aW9ucyBoYXZlIGEgbW9yZSBlZmZp
Y2llbnQgbWVtb3J5IGxheW91dCBpbiB0aGUgTGltaXRlZCBBUEkuCiAgKEdpdGh1YiBpc3N1ZSA6
aXNzdWU6YDc1MTlgKQoKKiBNb2R1bGUgc3RyaW5nIGNvbnRlbnQgaXMgbm93IGNvbXByZXNzZWQg
d2l0aCBMWlNTIGJ5IGRlZmF1bHQsIHdoaWNoIHJlZHVjZXMgdGhlIGZvb3RwcmludCBvZiB0aGUK
ICBkZWNvbXByZXNzb3IgY29kZSBjb21wYXJlZCB0byB0aGUgMy4yLnggZGVmYXVsdCBgYHpsaWJg
YC4gIFRoaXMgYWxzbyBhdm9pZHMgYSBydW50aW1lIGRlcGVuZGVuY3kKICBvbiB0aGUgYGB6bGli
YGAgbW9kdWxlIHNpbmNlIHRoZSB0aW55IExaU1MgZGVjb21wcmVzc29yIGNhbiBiZSBlbWJlZGRl
ZCBpbiB0aGUgbW9kdWxlLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3NTc3YCkKCiogVGhlIFB5
MiBgYHByaW50YGAgc3RhdGVtZW50IGlzIG5vdyBpbXBsZW1lbnRlZCBpbiBDeXRob24gaW5zdGVh
ZCBvZiBDIHRvIG1ha2UgaXQKICB0aHJlYWQtc2FmZSBhbmQgdXNlcyBhIHZlY3RvcmNhbGwgaW50
byBQeXRob24uCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc2NDJgKQoKKiBTZXZlcmFsIEMrKyBl
eGNlcHRpb24gZGVjbGFyYXRpb25zIHdlcmUgYWRkZWQgdG8gYGBsaWJjcHAuZXhjZXB0aW9uc2Bg
LgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3Mzg5YCkKCiogTWlzc2luZyBQeXRob24gdHlwZSBm
bGFnIGRlY2xhcmF0aW9ucyB3ZXJlIGFkZGVkIHRvIGBgY3B5dGhvbi5vYmplY3RgYC4KICAoR2l0
aHViIGlzc3VlIDppc3N1ZTpgNzQ0MWApCgoqIERlY2xhcmF0aW9ucyBmb3IgYGBQeVR5cGVfR2V0
U2xvdCgpYGAgYW5kIHRoZSBjb3JyZXNwb25kaW5nIHR5cGUgc2xvdCBJRHMgd2VyZSBhZGRlZAog
IHRvIGBgY3B5dGhvbi50eXBlYGAuCgoqIERlY2xhcmF0aW9ucyBmb3Igc3BlY2lhbGlzZWQgYnl0
ZS1jb252ZXJzaW9uIGZ1bmN0aW9ucyB3ZXJlIGFkZGVkIHRvIGBgY3B5dGhvbi5sb25nYGAgYW5k
IGBgY3B5dGhvbi5mbG9hdGBgLgogIFBhdGNoIGJ5IFZhbGVudGluIFZhbGxzLiAgKEdpdGh1YiBp
c3N1ZSA6aXNzdWU6YDc3MzhgKQoKKiBFcnJvciBkZXRlY3Rpb24gd2hlbiBhc3NpZ25pbmcgdG8g
YGBjb25zdGBgIHZhcmlhYmxlcyB3YXMgaW1wcm92ZWQuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6
YDczNTlgKQoKKiBTb21lIGNhc2VzIG9mIGxpa2VseSBtaXN1c2Ugb2YgYGBjcml0aWNhbF9zZWN0
aW9uYGAgbm93IGdlbmVyYXRlIHdhcm5pbmdzLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA2NzY2
YCkKCiogUHJvZ3JhbW1hdGljIHVzZSBvZiBDeXRob24gaGFzIGJlY29tZSBlYXNpZXIgYnkgYXZv
aWRpbmcgdGhlIG5lZWQgdG8gbWFudWFsbHkgc2V0IHVwCiAgdGhlIGVycm9yIHJlcG9ydGluZy4K
ICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzIzNWApCgoqIEF1dG9zY2FsaW5nIGluIGBgY3ltZWl0
YGAgaXMgYSBsaXR0bGUgZmFzdGVyLgoKKiBgYFRyZWVGcmFnbWVudC5wYXJzZV9mcm9tX3N0cmlu
Z3MoKWBgIG5vdyBzdXBwb3J0cyBmdWxsIG1vZHVsZXMgYW5kIGBgLnB4ZGBgIGZpbGVzLgogIFBh
dGNoIGJ5IEl0YW1hciBUdXJuZXItVHJhdXJpbmcuICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzgy
N2ApCgoqIFVuaWNvZGUgMTcuMC4wIGlzIHVzZWQgdG8gcGFyc2UgaWRlbnRpZmllcnMuCgpCdWdz
IGZpeGVkCi0tLS0tLS0tLS0KCiogU2V2ZXJhbCBpc3N1ZXMgd2l0aCBgYC5jbG9zZSgpYGAgb3Ig
YGAudGhyb3coKWBgIG9mIEFzeW5jIGdlbmVyYXRvciBhc2VuZC9hdGhyb3cKICBvYmplY3RzIHdl
cmUgcmVzb2x2ZWQsIGZvbGxvd2luZyBmaXhlcyBpbiBDUHl0aG9uLgogIChHaXRodWIgaXNzdWUg
Omlzc3VlOmA3Nzc3YCkKCiogVGhlIGBgX19jbGFzc19fYGAgbWV0aG9kIGNlbGwgbWlzYmVoYXZl
ZCB3aGVuIHVzZWQgdG9nZXRoZXIgd2l0aCBjbGFzcyBkZWNvcmF0b3JzCiAgYW5kIHBhc3NlZCB0
aGUgZGVjb3JhdGVkIGNsYXNzIChhbmQgdGh1cyBhbiBhcmJpdHJhcnkgb2JqZWN0KSBpbnRvIGBg
c3VwZXIoKWBgCiAgaW5zdGVhZCBvZiB0aGUgY2xhc3Mgb2JqZWN0LgogIChHaXRodWIgaXNzdWUg
Omlzc3VlOmA3NzIxYCkKCiogQSBgYHJldHVybiB2YWx1ZWBgIGZyb20gd2l0aGluIGEgYGBwcmFu
Z2UoKWBgIGxvb3AgY291bGQgc2lsZW50bHkgcmV0dXJuIHRoZQogIGRlZmF1bHQgdmFsdWUgb2Yg
dGhlIHJldHVybiB0eXBlIGluc3RlYWQgb2YgdGhlIHVzZXIgcHJvdmlkZWQgdmFsdWUuCiAgKEdp
dGh1YiBpc3N1ZSA6aXNzdWU6YDc1ODdgKQoKKiBBc3NpZ25pbmcgYSBQeXRob24gMy4xNCsgYGAu
X19hbm5vdGF0ZV9fYGAgZnVuY3Rpb24gdG8gYSBDeXRob24gY29tcGlsZWQgZnVuY3Rpb24gbm8K
ICBsb25nZXIgZXZhbHVhdGVzIGFubm90YXRpb25zIGVhZ2VybHkuCiAgKEdpdGh1YiBpc3N1ZSA6
aXNzdWU6YDc3NjdgKQoKKiBHZW5lcmF0ZWQgQ3l0aG9uIGxhbmd1YWdlIGZlYXR1cmVzIGxpa2Ug
cHJvcGVydGllcywgYXV0by1waWNrbGUgb3IgZGF0YWNsYXNzZXMKICBub3cgdXNlIGEgY3JpdGlj
YWwgc2VjdGlvbiAob24gdGhlIG9iamVjdCBpdHNlbGYpIGFzIGd1YXJkIGZvciBjb25jdXJyZW50
IGFjY2Vzcy4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNjYyMWApCgoqIFRoZSBzdGFyLWltcG9y
dCBpbXBsZW1lbnRhdGlvbiBuZWVkbGVzc2x5IHJlamVjdGVkIHNldmVyYWwgbmFtZXMgaW4gaW50
ZXJuYWwgdXNlLgogIFRoZXkgYXJlIG5vdyBhbGxvd2VkIGFuZCBiZWNvbWUgcmVndWxhciBQeXRo
b24gbW9kdWxlIGF0dHJpYnV0ZXMuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDQ5MzFgKQoKKiBN
aXhpbmcgZnVuY3Rpb24gc2lnbmF0dXJlIGRlY2xhcmF0aW9ucyBpbiBQeXRob24gbW9kdWxlcyBh
bmQgdGhlaXIgYGAucHhkYGAgbW9kdWxlcyBjb3VsZCBmYWlsLgogIChHaXRodWIgaXNzdWVzIDpp
c3N1ZTpgNTk3MGAsIDppc3N1ZTpgNDM4OGApCgoqIEMgYXJyYXkgZGVjbGFyYXRpb25zIHdpdGgg
dHlwZSBhbmQgc2l6ZSBjb3VsZCBmYWlsIHdpdGggYW4gZXhjZXB0aW9uIGluIHB1cmUgUHl0aG9u
IGNvZGUuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDczNzJgKQoKKiBBIGBgY29uc3RgYCBtb2Rp
ZmllciBpbiBDKysgdGVtcGxhdGUgdHlwZSBhcmd1bWVudHMgY291bGQgYmUgbWFwcGVkIGluY29y
cmVjdGx5LgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA2Mjk0YCkKCiogQysrIGBgdHlwZWlkKClg
YCBmYWlsZWQgdG8gY29tcGlsZSBvbiBtb3JlIGNvbXBsZXggZXhwcmVzc2lvbnMuCiAgKEdpdGh1
YiBpc3N1ZSA6aXNzdWU6YDcwNjlgKQoKKiBPcHRpbWlzZWQgUHl0aG9uIGBgaW50YGAgYW5kIGBg
ZmxvYXRgYCBvcGVyYXRpb25zIGRpZCBub3QgcmVtZW1iZXIgdGhlaXIgcmVzdWx0IHR5cGUsCiAg
bGVhZGluZyB0byBsZXNzIG9wdGltaXNlZCBjb2RlIGluIGxvbmdlciBleHByZXNzaW9ucy4KICAo
R2l0aHViIGlzc3VlcyA6aXNzdWU6YDczNjNgLCA6aXNzdWU6YDc1MDJgKQoKKiBTbGljZXMgYXMg
ZGljdGlvbmFyeSBrZXlzIGNvbmZ1c2VkIHRoZSB0eXBlIGluZmVyZW5jZSBvZiBpdGVtIGFjY2Vz
cy4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzcwMmApCgoqIEEgcmFjZSBjb25kaXRpb24gd2hl
biBgYHJldHVybmBgaW5nIGZyb20gYSBgYGN5dGhvbi5wYXJhbGxlbC5wYXJhbGxlbGBgIHNlY3Rp
b24gd2FzIGZpeGVkLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA2NTIxYCkKCiogQ3l0aG9uIHN0
aWxsIHVzZWQgYGAodHlwZSwgZXhjLCB0cmFjZWJhY2spYGAgZm9yIHNhdmluZyBhbmQgcmVzdG9y
aW5nIGV4Y2VwdGlvbiBzdGF0ZSwKICBldmVuIHRob3VnaCBtb2Rlcm4gQ1B5dGhvbiB2ZXJzaW9u
cyBvbmx5IHN0b3JlIHRoZSBleGNlcHRpb24gb2JqZWN0IGl0c2VsZiBpbnRlcm5hbGx5LgogIFRo
aXMgaXMgbm93IG1vZGVybmlzZWQgaW4gbWFueSBwbGFjZXMgdG8gcmVkdWNlIG92ZXJoZWFkLgog
IChHaXRodWIgaXNzdWUgOmlzc3VlOmA3NDgxYCkKCiogRXhjZXB0aW9ucyBvcmlnaW5hdGluZyBm
cm9tIHRoZSBgYFB5X1VOSUNPREVfSVMqKClgYCBjaGFyYWN0ZXIgY2xhc3NpZmljYXRpb24gbWFj
cm9zIGFuZAogIHRoZSBjb3JyZXNwb25kaW5nIGBgc3RyLmlzKigpYGAgbWV0aG9kcywgd2hpY2gg
dGhleSBhbGlhcywgd2VyZSBub3QgaGFuZGxlZCBidXQgaWdub3JlZCBpbgogIHRoZSBMaW1pdGVk
IEFQSS4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzYwMmApCgoqIEluIHRoZSBMaW1pdGVkIEFQ
SSwgaW1wb3J0IHRpbWUgZmFpbHVyZXMgdG8gY3JlYXRlIGNvZGUgb2JqZWN0cyBmb3IgY29tcGls
ZWQgZnVuY3Rpb25zLAogIGUuZy4gZHVlIHRvIGZ1dHVyZSBQeXRob24gQVBJIGNoYW5nZXMsIGFy
ZSBubyBsb25nZXIgZmF0YWwgYnV0IGdlbmVyYXRlIGEgd2FybmluZy4KICAoR2l0aHViIGlzc3Vl
IDppc3N1ZTpgNTcxOGApCgoqIFNldmVyYWwgaW50ZXJuYWwgY2FzZXMgd2hlcmUgZXhjZXB0aW9u
cyBhcmUgY2F1Z2h0IGFuZCBkaXNjYXJkZWQgbm93IHByb3BhZ2F0ZSB0aGUKICBgYEJhc2VFeGNl
cHRpb25gYCBlcnJvcnMgYW5kIG9ubHkgZGlzY2FyZCB0aGUgZXhwZWN0ZWQgZXhjZXB0aW9ucy4K
ICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzYwMGApCgoqIEVycm9yIGhhbmRsaW5nIHdhcyBpbXBy
b3ZlZCB3aGVuIHNldHRpbmcgdXAgdGhlIHRhYmxlIG9mIGBgY2RlZmBgIG1ldGhvZHMgZm9yIGV4
dGVuc2lvbiB0eXBlcwogIGFuZCB1bmV4cGVjdGVkIGVycm9ycyBhcmUgcHJvcGFnYXRlZC4KICAo
R2l0aHViIGlzc3VlIDppc3N1ZTpgNzYxM2ApCgoqIEV4Y2VwdGlvbnMgd2hpbGUgc2V0dGluZyB1
cCB0aGUgYXV0b21hdGljIHBpY2tsZSBzdXBwb3J0IGFyZSBub3cgcHJvcGFnYXRlZC4KICAoR2l0
aHViIGlzc3VlIDppc3N1ZTpgNzYxM2ApCgoqIEV4Y2VwdGlvbnMgdGhyb3duIGludG8gYXN5bmMg
Z2VuZXJhdG9ycyBjb3VsZCBsZWF2ZSB0aGUgZ2VuZXJhdG9yIGluIGFuIHVuY2xvc2VkIHN0YXRl
LgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3NjE4YCkKCiogSW4gdGhlIExpbWl0ZWQgQVBJLCBm
YWlsdXJlcyB3aGlsZSBmb3JtYXR0aW5nIHR5cGUgbmFtZXMgaW4gZXhjZXB0aW9ucyBhcmUgbm93
IHVuaWZvcm1seSBoYW5kbGVkLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3NjgwYCkKCiogQSBg
YGNwZGVmIGVudW1gYCB3aXRoIG5lZ2F0aXZlIHZhbHVlcyBjaGFuZ2VkIHRvIG5vbi1uZWdhdGl2
ZSBpbiBQeXRob24gMy4xNS4KICBJdCBub3cgdXNlcyBhIGRlZGljYXRlZCBlbnVtIGltcGxlbWVu
dGF0aW9uIGNsYXNzIHRvIGFsbG93IHRoaXMuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDcxODVg
KQoKKiBgYGNwZGVmIGZ1c2VkYGAgZnVuY3Rpb25zIGdlbmVyYXRlZCByZWR1bmRhbnQgY29kZS4K
ICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzc3OGApCgoqIEF1dG9tYXRpYyBDKysgU1RMIGNvbnZl
cnNpb25zIGluIGRpZmZlcmVudCBjb21waWxlciBkaXJlY3RpdmUgY29udGV4dHMgY291bGQgZ2Vu
ZXJhdGUKICBpbnZhbGlkIGNvZGUgZHVwbGljYXRpb25zIGluIEMrKyBjb2RlLgogIE9yaWdpbmFs
IFBhdGNoIGJ5IGJqb2RhaC4gIChHaXRodWIgaXNzdWUgOmlzc3VlOmA2OTgxYCkKCiogVGhlIGds
b2JhbCBtb2R1bGUgc3RhdGUgc3RydWN0IG5vdyBsaXZlcyBpbiBhbiBhbm9ueW1vdXMgbmFtZXNw
YWNlIGluIEMrKyBtb2RlIHRvCiAgYWxsb3cgbGlua2luZyBtdWx0aXBsZSBtb2R1bGVzIHRvZ2V0
aGVyIGluIG9uZSBzaGFyZWQgbGlicmFyeSBmaWxlLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3
MTU5YCkKCiogQ2FjaGVkIG1ldGhvZHMgb2YgYnVpbHRpbiB0eXBlcyB3ZXJlIG5vdCBHQy10cmF2
ZXJzZWQgYW5kIGNsZWFuZWQgdXAgYXMgcGFydCBvZiB0aGUgbW9kdWxlIHN0YXRlLgogIFBhdGNo
IGJ5IE1heHdlbGwgQmVybnN0ZWluLiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc0NjhgKQoKKiBE
aWN0IGl0ZXJhdGlvbiBnZW5lcmF0ZXMgc2FmZXIgY29kZSBpbiBQeVB5L0dyYWFsUHkvZnJlZS10
aHJlYWRpbmcuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc2MzdgKQoKKiBUaGUgZmxvYXRpbmcg
cG9pbnQgcGFyc2luZyBjb2RlIHJlbGllZCBvbiBDIGltcGxlbWVudGF0aW9uIHNwZWNpZmljICJw
b2ludGVyIGNvbXBhcmUgYWZ0ZXIgZnJlZSIgYmVoYXZpb3VyLgogIFBhdGNoIGJ5IHN0cmF0YWtp
cy4gIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3NDYzYCkKCiogV2hlbiBub24taGVhcCB0eXBlcyB3
ZXJlIHVzZWQgYXMgYmFzZSBjbGFzc2VzIG9mIGV4dGVuc2lvbiBoZWFwIHR5cGVzLCB0aGUgaGVh
cCB0eXBlcwogIHdlcmUgbm90IGNvcnJlY3RseSByZWZlcmVuY2UgY291bnRlZCBieSB0aGVpciBp
bnN0YW5jZXMuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc0ODNgKQoKKiBUaGUgYGAuX19zaWdu
YXR1cmVzX19gYCBkaWN0IG9mIGZ1c2VkIGZ1bmN0aW9ucyBpcyBubyBsb25nZXIgd3JpdGFibGUu
CiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDczODZgKQoKKiBBIG1pbmltYWwgaW1wbGVtZW50YXRp
b24gb2YgYGAuX19hbm5vdGF0ZV9fYGAgd2FzIGFkZGVkIHRvIEN5dGhvbiBjb21waWxlZCBmdW5j
dGlvbnMgdG8gbWFrZQogIGBgQGZ1bmN0b29scy53cmFwc2BgIHdvcmsgaW4gUHl0aG9uIDMuMTQr
LgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3Njc1YCkKCiogVGhlIGBgLS1lbWJlZC1wb3NpdGlv
bnNgYCBvcHRpb24gbm8gbG9uZ2VyIGluY2x1ZGVzIGFic29sdXRlIGZpbGUgcGF0aHMgaW4gdGhl
IEMgY29kZS4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNjc1NWApCgoqIENhc3RpbmcgdG8gYW4g
dW5yZXNvbHZlZCBgYHR5cGVvZigpYGAgdHlwZSAoZS5nLiBgYGN5dGhvbi5jYXN0KGN5dGhvbi50
eXBlb2YoeCksIC4uLilgYAogIHdoZXJlIHRoZSB0eXBlIGNvdWxkIG5vdCBiZSBpbmZlcnJlZCkg
Y3Jhc2hlZCB0aGUgY29tcGlsZXIgaW5zdGVhZCBvZiByZXBvcnRpbmcgYW4gZXJyb3IuCiAgUGF0
Y2ggYnkgVmxhZGltaXIgU2FyYWlraW4uICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzY4M2ApCgoq
IEVycm9yIHJlcG9ydGluZyBvbiBtaXNzaW5nIGJyYWNlcyBpbiBmLXN0cmluZ3Mgd2FzIG1pc2xl
YWRpbmcuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc0MzZgKQoKKiBEZWNsYXJpbmcgYSBgYF9f
ZGljdF9fYGAgYXR0cmlidXRlIGluIGEgY2xhc3MgYXMgYGBwdWJsaWNgYCBvciBgYHJlYWRvbmx5
YGAKICBnZW5lcmF0ZWQgaW5jb3JyZWN0IGNvZGUuICBJdCBpcyBub3cgZGV0ZWN0ZWQgYXMgYW4g
ZXJyb3IuCiAgUGF0Y2ggYnkgQW50aG9ueSBEb25sb24uICAoR2l0aHViIGlzc3VlIDppc3N1ZTpg
NzgyM2ApCgoqIGBgTm9uZWBgIGRlZmF1bHQgdmFsdWVzIGZvciBmdW5jdGlvbiBhcmd1bWVudHMg
ZGVjbGFyZWQgYXMgYGBub3QgTm9uZWBgIGFyZSBub3cgcmVqZWN0ZWQKICBhdCBjb21waWxlIHRp
bWUgcmF0aGVyIHRoYW4gbGVhZGluZyB0byBlcnJvcnMgYXQgcnVudGltZS4KICBQYXRjaCBieSBW
eWFzIFJhbWFzdWJyYW1hbmkuICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzc2MmApCgoqIEN5dGhv
biBkaWQgbm90IHJlamVjdCBjb2RlIHdpdGggbXVsdGlwbGUgY29udHJhZGljdGluZyB0eXBlIGFu
bm90YXRpb25zIG9uIHRoZSBzYW1lIHZhcmlhYmxlLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3
MjQ2YCkKCiogQ3l0aG9uIG5vIGxvbmdlciB3YXJucyBpZiBgYEBwcm9maWxlYGAgb3IgYGBAbGlu
ZXRyYWNlYGAgaXMgYXBwbGllZCB0byBhIGZ1bmN0aW9uCiAgd2l0aG91dCBjaGFuZ2luZyB0aGUg
Z2xvYmFsL291dGVyIHNldHRpbmcuICBUaGlzIGF2b2lkcyBhbm5veWFuY2Ugd2hlbiB1c2VycyBs
ZWF2ZQogIHN1Y2ggcmVkdW5kYW50IGRlY29yYXRvcnMgaW4gdGhlIGNvZGUgZm9yIG9jY2FzaW9u
YWwgdXNlLgoKKiBUaGUgdmlydHVhbGVudiBhY3RpdmF0aW9uIGluc2lkZSBvZiBgYGN5Z2RiYGAg
d2hlbiBpdCBpcyBydW4gZnJvbSBhIHZpcnR1YWxlbnYgd29ya3MgaW4gbW9yZSBjYXNlcy4KICBP
cmlnaW5hbCBwYXRjaCBieSBQaWVycmljayBLb2NoIGFuZCBBc2h1dG9zaCBWYXJtYS4gIChHaXRo
dWIgaXNzdWVzIDppc3N1ZTpgMTk2MWAsIDppc3N1ZTpgMzYyOWApCgoqIE1vZHVsZXMgd2l0aCBu
b24tQVNDSUkgbmFtZXMgY291bGQgZW5kIHVwIHdpdGggVVRGLTggY2hhcmFjdGVycyBpbiB0aGVp
ciBDIGNvZGUuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc1ODhgKQoKKiBNU1ZDIGNvdWxkIHNp
bGVudGx5IHRydW5jYXRlIGxvbmcgQyBzdHJpbmcgbGl0ZXJhbHMgKGluY2x1ZGluZyBpbnRlcm5h
bCBvbmVzKQogIGF0IGEgNjRrIGJ5dGVzIGJvcmRlci4gIFRoaXMgaXMgbm93IHdvcmtlZCBhcm91
bmQgdXNpbmcgQyBjaGFyIGFycmF5cy4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzgyNGApCgoq
IFNldmVyYWwgQyBjb21waWxlciB3YXJuaW5ncyByZWxhdGVkIHRvIG1peGVkIHNpZ25lZC91bnNp
Z25lZCBDIGludGVnZXIgdXNhZ2Ugd2VyZSByZXNvbHZlZC4KCiogU29tZSBjb21waWxlciBkaXJl
Y3RpdmVzIGZhaWxlZCB0byBhcHBseSB0byBDeXRob24ncyBidWlsZCwgd2hpY2ggbGVhZCB0bwog
IHVuaW50ZW50aW9uYWxseSAoc2xpZ2h0bHkpIGluY3JlYXNlZCB3aGVlbCBzaXplcy4KICAoR2l0
aHViIGlzc3VlIDppc3N1ZTpgNzgwMWApCgoqIEEgcmVncmVzc2lvbiBpbiAzLjMuMGIxIHRoYXQg
Z2VuZXJhdGVkIGludmFsaWQgQyBjb2RlIGZvciBleGNlcHRpb24gdHlwZSBjaGVja3Mgd2FzIGZp
eGVkLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3OTAyYCkKCiogSW5jbHVkZXMgYWxsIGZpeGVz
IGFzIG9mIEN5dGhvbiAzLjIuOS4KCk90aGVyIGNoYW5nZXMKLS0tLS0tLS0tLS0tLQoKKiBTdXBw
b3J0IGZvciBQeXRob24gMy44IGhhcyBiZWVuIHJlbW92ZWQuCiAgQXMgYSBzaWRlLWVmZmVrdCwg
c3VwcG9ydCBmb3IgU3RhY2tsZXNzUHl0aG9uIGFuZCBQeXN0b24gKGxhc3QgcmVsZWFzZSB3YXMg
My44KSB3YXMgYWxzbyByZW1vdmVkLgogIFB5dGhvbiAzLjkgaXMgcGxhbm5lZCB0byByZW1haW4g
c3VwcG9ydGVkIGZvciBzZXZlcmFsIHllYXJzIGR1ZSB0byBpdHMgdXNlIGluIExUUyBMaW51eCBk
aXN0cmlidXRpb25zLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3MjcxYCkKCiogVGhlIHZlY3Rv
cmNhbGwgZmVhdHVyZSBtYWNyb3Mgd2VyZSB1bmlmaWVkIHRvIG1ha2UgYGBDWVRIT05fVkVDVE9S
Q0FMTGBgIHRoZSBvbmx5IHdheSB0bwogIGRpc2FibGUgdGhpcyBmZWF0dXJlIChpZiBuZWVkIGFy
aXNlcykuICBQcmV2aW91c2x5IHRoZSBvcHRpb24gbWFjcm9zIGBgQ1lUSE9OX01FVEhfRkFTVENB
TExgYCwKICBgYENZVEhPTl9GQVNUX1BZQ0FMTGBgIGFuZCBgYENZVEhPTl9WRUNUT1JDQUxMYGAg
YWxsIGNvbnRyb2xsZWQgZGlmZmVyZW50IGFzcGVjdHMgb2YgdGhlCiAgaW1wbGVtZW50YXRpb24u
CiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc2MTZgKQoKKiBTZXR0aW5nIHRoZSBMaW1pdGVkIEFQ
SSB2ZXJzaW9uIG1hY3JvIGBgUHlfTElNSVRFRF9BUElgYCBpbiBQeVB5IG9yIEdyYWFsUHl0aG9u
CiAgbm93IGVuYWJsZXMgdGhlIExpbWl0ZWQgQVBJIHVzYWdlIGluIHRoZXNlIHJ1bnRpbWVzLiAg
VGhpcyB3aWxsIGN1cnJlbnRseSBmYWlsCiAgZHVlIHRvIGxhY2sgb2Ygc3VwcG9ydCBpbiB0aGUg
cnVudGltZXMsIGJ1dCBpcyBpbnRlbmRlZCBmb3IgaW5pdGlhbCB0ZXN0aW5nCiAgYW5kIGZ1dHVy
ZSBpbXByb3ZlbWVudHMuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc4MzFgKQoKKiBTZXR0aW5n
IGBgUHlfTElNSVRFRF9BUElgYCB0byBhIG5ld2VyIEFQSSB2ZXJzaW9uIHgueSB0aGFuIHRoZSBj
dXJyZW50IHJ1bnRpbWUKICAoYW5kIGl0cyBoZWFkZXIgZmlsZXMpIGlzIG5vdyBkZXRlY3RlZCBh
bmQgd2lsbCBleHBsaWNpdGx5IGZhaWwgdG8gY29tcGlsZSwKICByYXRoZXIgdGhhbiBydW5uaW5n
IGludG8gbGVzcyBvYnZpb3VzIEMgY29tcGlsZSBvciBydW50aW1lIGlzc3Vlcy4KICAoR2l0aHVi
IGlzc3VlIDppc3N1ZTpgNzE4NWApCgoqIENvcm91dGluZXMgbm8gbG9uZ2VyIHByb3ZpZGUgdGhl
IGxlZ2FjeSBgYF9pc19jb3JvdXRpbmVgYCBwcm9wZXJ0eS4KICAoR2l0aHViIGlzc3VlIDppc3N1
ZTpgNzcwOWApCgoqIFR3byBtb3JlIEN5dGhvbiBtb2R1bGVzIGFyZSBjb21waWxlZCBpbiB0aGUg
YmluYXJ5IHdoZWVscywgd2hpY2ggc2hvdWxkIGltcHJvdmUgdGhlCiAgdHJhbnNsYXRpb24gc3Bl
ZWQgZm9yIG1vZHVsZXMgd2l0aCBtYW55IHN0cmluZ3MuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6
YDc3OTVgKQoKKiBUaGUgZGlzdHJpYnV0ZWQgQ3l0aG9uIGJpbmFyeSB3aGVlbHMgbm93IHVzZSBh
IHNoYXJlZCB1dGlsaXR5IGNvZGUgbW9kdWxlIHRvIHJlZHVjZSB0aGVpciBzaXplLgogIChHaXRo
dWIgaXNzdWUgOmlzc3VlOmA3ODY1YCkKCiogYGBDeXRob24vU2hhZG93LnB5aWBgIGhhcyBiZWVu
IG1lcmdlZCBpbnRvIGBgQ3l0aG9uL1NoYWRvdy5weWBgLgogIChHaXRodWIgaXNzdWUgOmlzc3Vl
OmA3Mzc2YCkKCiogVGhlIGRvY3VtZW50YXRpb24gbm93IHVzZXMgdGhlICJDbGFyaXR5IiBTcGhp
bnggdGhlbWUuCiAgUGF0Y2ggYnkgTGlib3IgSmVsw61uZWsuICAoR2l0aHViIGlzc3VlIDppc3N1
ZTpgNzU2NGApCgozLjMuMGIxICgyMDI2LTA4LTE0KQo9PT09PT09PT09PT09PT09PT09PQoKRmVh
dHVyZXMgYWRkZWQKLS0tLS0tLS0tLS0tLS0KCiogQ3l0aG9uIG5vdyB1c2VzIGEgbmV3IGV4cG9y
dC9pbXBvcnQgbmFtaW5nIHNjaGVtZSBmb3IgZnVzZWQgQyBmdW5jdGlvbnMgdGhhdAogIGluY3Jl
YXNlcyB0aGUgcmVzaWxpZW5jZSBhZ2FpbnN0IHNlZW1pbmdseSBjb21wYXRpYmxlIHVzZXIgY29k
ZSBjaGFuZ2VzLgogIFRoZSBvcmlnaW5hbCBuYW1lcyBhcmUga2VwdCBmb3IgYmFja3dhcmRzIGNv
bXBhdGliaWxpdHkuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc2NTZgKQoKKiBgYGV4Y2VwdCAq
YGAgKFBFUC02NTQgZXhjZXB0aW9uIGdyb3VwcykgaXMgaW1wbGVtZW50ZWQgZm9yIFB5dGhvbiAz
LjExIGFuZCBsYXRlci4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNDk5M2ApCgoqIFVucGFja2lu
ZyBpbiBjb21wcmVoZW5zaW9ucyAoUEVQLTc5OCkgaXMgaW1wbGVtZW50ZWQgZm9yIGxpc3Qvc2V0
L2RpY3QgY29tcHJlaGVuc2lvbnMuCiAgSXQgaXMgbm90IHlldCBhdmFpbGFibGUgZm9yIGdlbmVy
YXRvciBleHByZXNzaW9ucy4KICBPcmlnaW5hbCBwYXRjaCBieSBNb3JheC4gIChHaXRodWIgaXNz
dWUgOmlzc3VlOmA3ODk4YCkKCiogVGhlIGZlYXR1cmUgc2V0IG9mIHRoZSBzaGFyZWQgbW9kdWxl
IGNhbiBiZSBzZWxlY3RlZCBhdCBidWlsZCB0aW1lCiAgYnkgbGlzdGluZyBuYW1lZCBmZWF0dXJl
cyB0byBpbmNsdWRlIG9yIGV4Y2x1ZGUuCiAgVGhpcyBpcyBhbiBleHBlcmltZW50YWwgY29uZmln
dXJhdGlvbiwgc3ViamVjdCB0byBmdXJ0aGVyIGltcHJvdmVtZW50cy4KICBGYWlsdXJlcyB0byBp
bmNsdWRlIHVzZWQgZmVhdHVyZXMgd2lsbCBjdXJyZW50bHkgcmVzdWx0IGluIGltcG9ydCBmYWls
dXJlcy4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzc1OWApCgoqIFRvIGNvbnRyb2wgdGhlIGdl
bmVyYXRpb24gb2YgdGhlIHNoYXJlZCBtb2R1bGUsIHRoZSBgYGN5dGhvbmBgIGNvbW1hbmQgZ2Fp
bmVkCiAgYSBzdWItY29tbWFuZCBgYGN5dGhvbiBnZW5lcmF0ZS1zaGFyZWQgcGtnL21vZHVsZW5h
bWUuY2BgIHdpdGggYWRkaXRpb25hbCBvcHRpb25zCiAgYGAtLW9ubHlgYCBhbmQgYGAtLWV4Y2x1
ZGVgYC4KICBQYXRjaCBieSBSYXphIEtoYW4uICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzg0MmAp
CgoqIEV4Y2VwdGlvbiBiYXNlIHR5cGVzIGFyZSBpbmZlcnJlZCBmb3IgdGhlIHRhcmdldCB2YXJp
YWJsZSBvZiBtdWx0aS1leGNlcHRpb24gYGBleGNlcHRgYAogIGNsYXVzZXMgYW5kIGZvciBjb2xs
ZWN0aW9ucyBvZiBleGNlcHRpb25zLiAgUHJvcGVydGllcyBsaWtlIGBgLmFyZ3NgYCBhbmQgYGAu
Y29udGV4dGBgCiAgdXNlIGRpcmVjdCBDIGFjY2VzcyBpbiBDUHl0aG9uLgogIChHaXRodWIgaXNz
dWUgOmlzc3VlOmA3NzgzYCkKCiogQW5ub3RhdGlvbnMgb24gZ2xvYmFsIHZhcmlhYmxlcyBhcmUg
bm93IHVzZWQgYnkgdHlwZSBpbmZlcmVuY2UuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc4Nzdg
KQoKKiBDIHByb3BlcnR5IHNldHRlcnMgY2FuIG5vdyBleHBsaWNpdGx5IHByb3BhZ2F0ZSBleGNl
cHRpb25zLCBpbnN0ZWFkIG9mIGFsd2F5cyB0cmlnZ2VyaW5nCiAgYSBjYWxsIHRvIGBgUHlFcnJf
T2NjdXJyZWQoKWBgIGJ5IHJldHVybmluZyBgYHZvaWRgYC4KICAoR2l0aHViIGlzc3VlIDppc3N1
ZTpgNzc5MWApCgoqIENvbmRpdGlvbnMgaW4gc3Ryb25nbHkgcHJlZGljdGFibGUgaWYtY2xhdXNl
cyBvciBpZi1lbHNlIGV4cHJlc3Npb25zIGNhbiBiZSB3cmFwcGVkIGluCiAgYGBjeXRob24ubGlr
ZWx5KGNvbmRpdGlvbilgYCBvciBgYGN5dGhvbi51bmxpa2VseShjb25kaXRpb24pYGAgdG8gaGVs
cCB0aGUgQyBjb21waWxlcgogIG9wdGltaXNlIHRoZSBicmFuY2guICBOb3RlIHRoYXQgQ3l0aG9u
IGF1dG9tYXRpY2FsbHkgZGV0ZWN0cyBgYHJhaXNlYGAgYW5kIGBgYXNzZXJ0YGAKICBzdGF0ZW1l
bnRzIGFzIHRlcm1pbmF0b3JzIGFscmVhZHkgYW5kIG1hcmtzIGlmLWNsYXVzZXMgdGhhdCBkaXJl
Y3RseSBsZWFkIHRvIHRoZW0gYXMKICBgYHVubGlrZWx5KClgYCwgd2l0aG91dCB1c2VyIGludGVy
YWN0aW9uLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3NjY3YCkKCiogVGhlIHR5cGVkIHR1cGxl
IHN5bnRheCBgYHR1cGxlW2F0eXBlLCAuLi5dYGAgZm9yIGhvbW9nZW5lb3VzIHR1cGxlcyBpcyBz
dXBwb3J0ZWQuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc3OThgKQoKKiBUaGUgcmV0dXJuIHR5
cGUgaW5mZXJlbmNlIGZvciBjYWxscyB0byBidWlsdGluIG1ldGhvZHMgd2FzIGltcHJvdmVkLCBp
bmNsdWRpbmcgZGljdCB2aWV3cy4KICAoR2l0aHViIGlzc3VlcyA6aXNzdWU6YDc4ODdgLCA6aXNz
dWU6YDc4ODhgKQoKKiBgYGN5dGhvbi5weV9pbnRgYCAoYW5kIHRoZSBzYW1lIGZvciBgYHB5X2Zs
b2F0YGAsIGBgcHlfY29tcGxleGBgIGFuZCBgYHB5X2Jvb2xgYCkKICBjYW4gYmUgdXNlZCB0byBy
ZWZlciB0byBQeXRob24ncyBidWlsdGluIHR5cGVzIGluIGEgQyB0eXBlIGNvbnRleHQsIGUuZy4g
YWZ0ZXIgYGBjZGVmYGAsCiAgd2hlcmUgdGhleSBhcmUgbm9ybWFsbHkgc2hhZG93ZWQgYnkgdGhl
IEMgdHlwZXMgb2YgdGhlIHNhbWUgbmFtZS4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzg0NGAp
CgoqIENvbnN0YW50IGBgZnJvemVuc2V0YGAgb2JqZWN0cyBhcmUgZGVkdXBsaWNhdGVkIGFuZCBj
YWNoZWQgYXQgbW9kdWxlIGluaXQgdGltZQogIChzaW1pbGFyIHRvIGNvbnN0YW50IHR1cGxlIGFu
ZCBzbGljZSBvYmplY3RzKS4KICBPcmlnaW5hbCBQYXRjaCBieSBaaGVuYm8gTGkuIChHaXRodWIg
aXNzdWUgOmlzc3VlOmAyNzQxYCkKCiogRm9ybWF0dGluZyBDIGZsb2F0aW5nIHBvaW50IHZhbHVl
cyBpbiBmLXN0cmluZ3MgaXMgZmFzdGVyLgogIFBhdGNoIGJ5IFZsYWRpbWlyIFNhcmFpa2luLiAg
KEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc3OTdgKQoKKiBgYGJ5dGVhcnJheS5leHRlbmQoYnl0ZXMp
YGAgaXMgZmFzdGVyLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3Nzk3YCkKCiogU2luZ2xlIGNo
YXJhY3RlciBgaW5gLXRlc3RzIG9uIGBgc3RyYGAsIGBgYnl0ZXNgYCBhbmQgYGBieXRlYXJyYXlg
YCBhcmUgb3B0aW1pc2VkLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmAzODg4YCkKCiogYGBhc3Nl
cnRgYCBjb25kaXRpb25zIGFyZSBjb25zdGFudC1mb2xkZWQuCiAgKEdpdGh1YiBpc3N1ZSA6aXNz
dWU6YDc4MDlgKQoKKiBBc3luYyBnZW5lcmF0b3Igb2JqZWN0cyBhcmUgc2xpZ2h0bHkgc21hbGxl
ci4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzc3NmApCgoqIFR3byBtb3JlIEN5dGhvbiBtb2R1
bGVzIGFyZSBjb21waWxlZCBpbiB0aGUgYmluYXJ5IHdoZWVscywgd2hpY2ggc2hvdWxkIGltcHJv
dmUgdGhlCiAgdHJhbnNsYXRpb24gc3BlZWQgZm9yIG1vZHVsZXMgd2l0aCBtYW55IHN0cmluZ3Mu
CiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc3OTVgKQoKKiBgYFRyZWVGcmFnbWVudC5wYXJzZV9m
cm9tX3N0cmluZ3MoKWBgIG5vdyBzdXBwb3J0cyBmdWxsIG1vZHVsZXMgYW5kIGBgLnB4ZGBgIGZp
bGVzLgogIFBhdGNoIGJ5IEl0YW1hciBUdXJuZXItVHJhdXJpbmcuICAoR2l0aHViIGlzc3VlIDpp
c3N1ZTpgNzgyN2ApCgpCdWdzIGZpeGVkCi0tLS0tLS0tLS0KCiogU2V2ZXJhbCBpc3N1ZXMgd2l0
aCBgYC5jbG9zZSgpYGAgb3IgYGAudGhyb3coKWBgIG9mIEFzeW5jIGdlbmVyYXRvciBhc2VuZC9h
dGhyb3cKICBvYmplY3RzIHdlcmUgcmVzb2x2ZWQsIGZvbGxvd2luZyBmaXhlcyBpbiBDUHl0aG9u
LgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3Nzc3YCkKCiogVGhlIGBgX19jbGFzc19fYGAgbWV0
aG9kIGNlbGwgbWlzYmVoYXZlZCB3aGVuIHVzZWQgdG9nZXRoZXIgd2l0aCBjbGFzcyBkZWNvcmF0
b3JzCiAgYW5kIHBhc3NlZCB0aGUgZGVjb3JhdGVkIGNsYXNzIChhbmQgdGh1cyBhbiBhcmJpdHJh
cnkgb2JqZWN0KSBpbnRvIGBgc3VwZXIoKWBgCiAgaW5zdGVhZCBvZiB0aGUgY2xhc3Mgb2JqZWN0
LgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3NzIxYCkKCiogRGVjbGFyaW5nIGEgYGBfX2RpY3Rf
X2BgIGF0dHJpYnV0ZSBpbiBhIGNsYXNzIGFzIGBgcHVibGljYGAgb3IgYGByZWFkb25seWBgCiAg
Z2VuZXJhdGVkIGluY29ycmVjdCBjb2RlLiAgSXQgaXMgbm93IGRldGVjdGVkIGFzIGFuIGVycm9y
LgogIFBhdGNoIGJ5IEFudGhvbnkgRG9ubG9uLiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc4MjNg
KQoKKiBBIGBgcmV0dXJuIHZhbHVlYGAgZnJvbSB3aXRoaW4gYSBgYHByYW5nZSgpYGAgbG9vcCBj
b3VsZCBzaWxlbnRseSByZXR1cm4gdGhlCiAgZGVmYXVsdCB2YWx1ZSBvZiB0aGUgcmV0dXJuIHR5
cGUgaW5zdGVhZCBvZiB0aGUgdXNlciBwcm92aWRlZCB2YWx1ZS4KICAoR2l0aHViIGlzc3VlIDpp
c3N1ZTpgNzU4N2ApCgoqIFNldHRpbmcgYGBQeV9MSU1JVEVEX0FQSWBgIHRvIGEgbmV3ZXIgQVBJ
IHZlcnNpb24geC55IHRoYW4gdGhlIGN1cnJlbnQgcnVudGltZQogIChhbmQgaXRzIGhlYWRlciBm
aWxlcykgaXMgbm93IGRldGVjdGVkIGFuZCB3aWxsIGV4cGxpY2l0bHkgZmFpbCB0byBjb21waWxl
LAogIHJhdGhlciB0aGFuIHJ1bm5pbmcgaW50byBhcmJpdHJhcnkgQyBjb21waWxlIG9yIHJ1bnRp
bWUgaXNzdWVzLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3MTg1YCkKCiogQSBgYGNwZGVmIGVu
dW1gYCB3aXRoIG5lZ2F0aXZlIHZhbHVlcyBjaGFuZ2VkIHRvIG5vbi1uZWdhdGl2ZSBpbiBQeXRo
b24gMy4xNS4KICBJdCBub3cgdXNlcyBhIGRlZGljYXRlZCBlbnVtIGltcGxlbWVudGF0aW9uIGNs
YXNzIHRvIGFsbG93IHRoaXMuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDcxODVgKQoKKiBDYXN0
aW5nIHRvIGFuIHVucmVzb2x2ZWQgYGB0eXBlb2YoKWBgIHR5cGUgKGUuZy4gYGBjeXRob24uY2Fz
dChjeXRob24udHlwZW9mKHgpLCAuLi4pYGAKICB3aGVyZSB0aGUgdHlwZSBjb3VsZCBub3QgYmUg
aW5mZXJyZWQpIGNyYXNoZWQgdGhlIGNvbXBpbGVyIGluc3RlYWQgb2YgcmVwb3J0aW5nIGFuIGVy
cm9yLgogIFBhdGNoIGJ5IFZsYWRpbWlyIFNhcmFpa2luLiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6
YDc2ODNgKQoKKiBgYGNwZGVmIGZ1c2VkYGAgZnVuY3Rpb25zIGdlbmVyYXRlZCByZWR1bmRhbnQg
Y29kZS4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzc3OGApCgoqIEF1dG9tYXRpYyBDKysgU1RM
IGNvbnZlcnNpb25zIGluIGRpZmZlcmVudCBjb21waWxlciBkaXJlY3RpdmUgY29udGV4dHMgY291
bGQgZ2VuZXJhdGUKICBpbnZhbGlkIGNvZGUgZHVwbGljYXRpb25zIGluIEMrKyBjb2RlLgogIE9y
aWdpbmFsIFBhdGNoIGJ5IGJqb2RhaC4gIChHaXRodWIgaXNzdWUgOmlzc3VlOmA2OTgxYCkKCiog
U3Vic2NyaXB0aW5nIGZyb3plbmRpY3RzIHdpdGggaW50ZWdlciBrZXlzIGNvdWxkIGZhaWwgaW4g
My4zLjBhMS4KCiogV2hlbiBjYWxsaW5nIGJ1aWx0aW4gdHlwZXMgdG8gY3JlYXRlIGFuIGluc3Rh
bmNlLCB0eXBlIGluZmVyZW5jZSBjb3VsZCBpbmNvcnJlY3RseQogIGFzc3VtZSBgYHR5cGVgYCBh
cyB0aGUgdHlwZSBvZiB0aGUgcmVzdWx0IHJhdGhlciB0aGUgY29uY3JldGUgYnVpbHRpbiB0eXBl
IGluIDMuMy4wYTEuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc4NDhgKQoKKiBUaGUgcmV0dXJu
IHR5cGUgb2Ygc29tZSBidWlsdGluIG1ldGhvZHMgd2VyZSBub3QgY29ycmVjdGx5IGluZmVycmVk
IGluIGNoYWluZWQgY2FsbHMgaW4gMy4zLjBhMS4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzY2
NGApCgoqIEl0ZXJhdGluZyBvdmVyIGEgY29udGFpbmVyIHdpdGggYW4gaW5jb3JyZWN0bHkgZGVj
bGFyZWQgaXRlbSB0eXBlIGNvdWxkIGdlbmVyYXRlCiAgaW5jb3JyZWN0IEMgY29kZSBpbiAzLjMu
MGExLgogIChHaXRodWIgaXNzdWVzIDppc3N1ZTpgNzc3NWAsIDppc3N1ZTpgNzg4OWApCgoqIGBg
TlVMTGBgIHBvaW50ZXIgY29tcGFyaXNvbnMgY291bGQgZmFpbCB0byBjb21waWxlIHdpdGggQysr
IGluIDMuMy4wYTEuCiAgUGF0Y2ggYnkgVnlhcyBSYW1hc3VicmFtYW5pLiAgKEdpdGh1YiBpc3N1
ZSA6aXNzdWU6YDc3NjZgKQoKKiBBIEMgaGVscGVyIGZ1bmN0aW9uIGZvciBtYXBwaW5nIGZ1bmN0
aW9uIGFyZ3VtZW50cyBjb3VsZCBiZSBtaXNzaW5nIGluIDMuMy4wYTEuCiAgKEdpdGh1YiBpc3N1
ZSA6aXNzdWU6YDc3ODVgKQoKKiBNU1ZDIGNvdWxkIHNpbGVudGx5IHRydW5jYXRlIGxvbmcgQyBz
dHJpbmcgbGl0ZXJhbHMgKGluY2x1ZGluZyBpbnRlcm5hbCBvbmVzKQogIGF0IGEgNjRrIGJ5dGVz
IGJvcmRlci4gIFRoaXMgaXMgbm93IHdvcmtlZCBhcm91bmQgdXNpbmcgQyBjaGFyIGFycmF5cy4K
ICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzgyNGApCgoqIFRoZSB2aXJ0dWFsZW52IGFjdGl2YXRp
b24gaW5zaWRlIG9mIGBgY3lnZGJgYCB3aGVuIGl0IGlzIHJ1biBmcm9tIGEgdmlydHVhbGVudiB3
b3JrcyBpbiBtb3JlIGNhc2VzLgogIE9yaWdpbmFsIHBhdGNoIGJ5IFBpZXJyaWNrIEtvY2ggYW5k
IEFzaHV0b3NoIFZhcm1hLiAgKEdpdGh1YiBpc3N1ZXMgOmlzc3VlOmAxOTYxYCwgOmlzc3VlOmAz
NjI5YCkKCiogU29tZSBjb21waWxlciBkaXJlY3RpdmVzIGZhaWxlZCB0byBhcHBseSB0byBDeXRo
b24ncyBidWlsZCwgd2hpY2ggbGVhZCB0bwogIHVuaW50ZW50aW9uYWxseSAoc2xpZ2h0bHkpIGlu
Y3JlYXNlZCB3aGVlbCBzaXplcy4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzgwMWApCgoqIElu
Y2x1ZGVzIGFsbCBmaXhlcyBhcyBvZiBDeXRob24gMy4yLjkuCgpPdGhlciBjaGFuZ2VzCi0tLS0t
LS0tLS0tLS0KCiogU2V0dGluZyB0aGUgTGltaXRlZCBBUEkgdmVyc2lvbiBtYWNybyBgYFB5X0xJ
TUlURURfQVBJYGAgaW4gUHlQeSBvciBHcmFhbFB5dGhvbgogIG5vdyBlbmFibGVzIHRoZSBMaW1p
dGVkIEFQSSB1c2FnZSBpbiB0aGVzZSBydW50aW1lcy4gIFRoaXMgd2lsbCBjdXJyZW50bHkgZmFp
bAogIGR1ZSB0byBsYWNrIG9mIHN1cHBvcnQgaW4gdGhlIHJ1bnRpbWVzLCBidXQgaXMgaW50ZW5k
ZWQgZm9yIGluaXRpYWwgdGVzdGluZwogIGFuZCBmdXR1cmUgaW1wcm92ZW1lbnRzLgogIChHaXRo
dWIgaXNzdWUgOmlzc3VlOmA3ODMxYCkKCiogQ3l0aG9uIHdoZWVscyBub3cgdXNlIGEgc2hhcmVk
IHV0aWxpdHkgY29kZSBtb2R1bGUgdG8gcmVkdWNlIHRoZWlyIHNpemUuCiAgKEdpdGh1YiBpc3N1
ZSA6aXNzdWU6YDc4NjVgKQoKMy4zLjBhMSAoMjAyNi0wNi0yNCkKPT09PT09PT09PT09PT09PT09
PT0KCkZlYXR1cmVzIGFkZGVkCi0tLS0tLS0tLS0tLS0tCgoqIENoYW5nZXMgd2VyZSBtYWRlIHRv
IGFkYXB0IHRvIFB5dGhvbiAzLjE1IGFuZCBpdHMgTGltaXRlZCBBUEkuCiAgKEdpdGh1YiBpc3N1
ZXMgOmlzc3VlOmA2NDA1YCwgOmlzc3VlOmA3MTkwYCwgOmlzc3VlOmA3MzQ3YCwgOmlzc3VlOmA3
MzQ4YCwgOmlzc3VlOmA3MzU4YCkKCiogUEVQLTYzNCBQYXR0ZXJuIE1hdGNoaW5nIGlzIGltcGxl
bWVudGVkLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA0MDI5YCkKCiogRGVjbGFyZWQgY29udGFp
bmVyIGl0ZW0gdHlwZXMgKGUuZy4gYGBsaXN0W2Zsb2F0XWBgKSBhcmUgbm93IHVzZWQgYnkgdGhl
IHR5cGUgc3lzdGVtLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3Mjg4YCkKCiogVHlwZSBpbmZl
cmVuY2Ugd2FzIGltcHJvdmVkIGZvciBidWlsdGluIFB5dGhvbiB0eXBlcy4KICAoR2l0aHViIGlz
c3VlcyA6aXNzdWU6YDc1MzZgLCA6aXNzdWU6YDc2NDRgKQoKKiBFeHRlbnNpb24gdHlwZXMgY2Fu
IGRlY2xhcmUgdGhlbXNlbHZlcyBleHBsaWNpdGx5IGFzIHNlcXVlbmNlIG9yIG1hcHBpbmcgd2l0
aAogIGBgQGN5dGhvbi5jb2xsZWN0aW9uX3R5cGUoInNlcXVlbmNlIilgYCBvciBgYEBjeXRob24u
Y29sbGVjdGlvbl90eXBlKCJtYXBwaW5nIilgYC4KICBUaGlzIGhhcyBhbiBlZmZlY3Qgb24gdGhl
aXIgYmVoYXZpb3VyIGluIHBhdHRlcm4gbWF0Y2hpbmcgYW5kIHN1YnNjcmlwdGluZy4KICAoR2l0
aHViIGlzc3VlIDppc3N1ZTpgNTAyN2ApCgoqIFNlcXVlbmNlIHR5cGVzIHRoYXQgaGF2ZSB0aGVp
ciBgYFB5X1RQRkxBR1NfU0VRVUVOQ0VgYCB0eXBlIGZsYWcgc2V0IGNhbiBiZW5lZml0IGZyb20K
ICBmYXN0ZXIgc3Vic2NyaXB0aW5nIHZpYSB0aGUgc2VxdWVuY2UgcHJvdG9jb2wgYXMgQ3l0aG9u
IG5vdyBieXBhc3NlcyB0aGUgbWFwcGluZyBwcm90b2NvbAogIGZvciB0aGVtIGlmIGJvdGggcHJv
dG9jb2xzIGFyZSBpbXBsZW1lbnRlZC4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzQzMmApCgoq
IFNlcXVlbmNlIHR5cGVzIG1hcmtlZCBhcyBgYEBjeXRob24uY29sbGVjdGlvbl90eXBlKCJzZXF1
ZW5jZSIpYGAgdGhhdCB1c2UgQyBpbnRlZ2VycwogIGluIHRoZSBzdWJzY3JpcHQgc3BlY2lhbCBt
ZXRob2RzIG5vdyBpbXBsZW1lbnQgb25seSB0aGUgc2VxdWVuY2UgYW5kIG5vdCB0aGUgbWFwcGlu
ZyBwcm90b2NvbC4KICBUaGlzIGFsbG93cyBzdWJzY3JpcHRpbmcgY29kZSB0byBhdm9pZCBjcmVh
dGluZyBQeXRob24gaW5kZXggb2JqZWN0cyB3aGVuIHRoZSBpbmRleAogIGlzIGFscmVhZHkgYXZh
aWxhYmxlIGFzIEMgaW50ZWdlci4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzQzNWApCgoqIFRo
ZSBQeTMuMTUgYGBmcm96ZW5kaWN0YGAgYnVpbHRpbiB0eXBlIGlzIHN1cHBvcnRlZCBhbmQgaGFz
IGJlZW4gYmFja3BvcnRlZCBhcyBhbiBhbGlhcwogIGZvciBgYGRpY3RgYCBpbiBvbGRlciBQeXRo
b24gdmVyc2lvbnMuCiAgUGF0Y2hlcyB0byBhZGFwdCBleGlzdGluZyBgYGRpY3RgYCBvcHRpbWlz
YXRpb25zIHdlcmUgY29udHJpYnV0ZWQgYnkgT21rYXIgS2FiZGUuCiAgKEdpdGh1YiBpc3N1ZXMg
Omlzc3VlOmA3NTQ1YCwgOmlzc3VlOmA3NjQ3YCkKCiogVGhlIFB5My4xNSBgYHNlbnRpbmVsYGAg
YnVpbHRpbiBpcyBzdXBwb3J0ZWQgYW5kIGl0cyBDLUFQSSBkZWNsYXJhdGlvbnMgYXJlIGF2YWls
YWJsZSBpbgogIGBgY3B5dGhvbi5zZW50aW5lbGBgLgoKKiBUaGUgYnVpbHRpbiBQeXRob24gdHlw
ZXMgYGBpbnRgYCwgYGBmbG9hdGBgLCBgYHN0cmBgLCBgYGJ5dGVzYGAgYW5kIGBgYnl0ZWFycmF5
YGAKICBhcmUgc3BlY2lhbCBjYXNlZCBpbiBjb21wYXJpc29ucyB0byBzcGVlZCB0aGVtIHVwLgog
IChHaXRodWIgaXNzdWVzIDppc3N1ZTpgNzQ1MmAsIDppc3N1ZTpgNzQ3NGApCgoqIFRoZSBidWls
dGluIFB5dGhvbiB0eXBlcyBgYGludGBgIGFuZCBgYGZsb2F0YGAgYXJlIHNwZWNpYWwgY2FzZWQg
aW4gYGArYGAsIGBgLWBgIGFuZCBgYCpgYAogIG9wZXJhdGlvbnMgd2l0aCAoY29tcGlsZS10aW1l
KSB1bmtub3duIFB5dGhvbiB0eXBlcyBpbiBvcmRlciB0byBzcGVlZCB0aGVtIHVwLgogIFRoZSBi
aXQgb3BlcmF0aW9ucyBgYF5gYCwgYGB8YGAgYW5kIGBgJmBgIGFyZSBhZGRpdGlvbmFsbHkgc3Bl
Y2lhbCBjYXNlZCBmb3IgYGBpbnRgYC4KICAoR2l0aHViIGlzc3VlcyA6aXNzdWU6YDc0ODVgLCA6
aXNzdWU6YDc1NDFgKQoKKiBgYDxib29sPmBgIGNhc3RzIGNhbiBiZSB1c2VkIHRvIGNvbnZlcnQg
QyB2YWx1ZXMgdG8gUHl0aG9uIGBgVHJ1ZWBgIC8gYGBGYWxzZWBgLgogIChHaXRodWIgaXNzdWUg
Omlzc3VlOmA3NTEzYCkKCiogYGBjZGVmYGAgcHJvcGVydHkgbWV0aG9kcyBzdXBwb3J0IHNldHRl
cnMuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc1MDVgKQoKKiBUaGUgQyBgYHJlc3RyaWN0YGAg
bW9kaWZpZXIgY2FuIGJlIHVzZWQgaW4gZGVjbGFyYXRpb25zLgogIChHaXRodWIgaXNzdWUgOmlz
c3VlOmA3NjE3YCkKCiogQyBhcnJheXMgbWF5IG5vdyBiZSBkZWNsYXJlZCB3aXRoIChgYGV4dGVy
bmBgIG9yIGludGVybmFsKSBlbnVtIHZhbHVlcyBhcyB0aGVpciBzaXplLgogIChHaXRodWIgaXNz
dWVzIDppc3N1ZTpgNzQwMWAsIDppc3N1ZTpgNzQwNmApCgoqIGBgcHJhbmdlKG51bV90aHJlYWRz
PTApYGAgYXV0b21hdGljYWxseSBzZWxlY3RzIHRoZSBtYXhpbXVtIG51bWJlciBvZiBPcGVuTVAg
dGhyZWFkcy4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzU4NmApCgoqIGBgcHJhbmdlKClgYCBh
bmQgYGBwYXJhbGxlbCgpYGAgc2VjdGlvbnMgY2FuIGJlIHVzZWQgd2l0aG91dCByZWxlYXNpbmcg
dGhlIEdJTCwgd2hpY2gKICBoZWxwcyBpbiBmcmVldGhyZWFkaW5nIGJ1aWxkcy4gIFdoZW4gcmVs
ZWFzaW5nIHRoZSBHSUwgYXMgcGFydCBvZiB0aGUgc2VjdGlvbiBkZWNsYXJhdGlvbiwKICByZS1h
Y3F1aXJpbmcgaXQgaW1tZWRpYXRlbHkgaW5zaWRlIGlzIG5vdyBmYXN0ZXIsIGUuZy4gdG8gZG8g
cGVyLXRocmVhZCBQeXRob24gaW5pdGlhbGlzYXRpb25zLgogIChHaXRodWIgaXNzdWUgOmlzc3Vl
OmA2NTYyYCkKCiogYGBjeXRob24ucHltdXRleGBgIGFuZCBgYGN5dGhvbi5weXRocmVhZF90eXBl
X2xvY2tgYCBub3cgc3VwcG9ydCBhIGBgLmxvY2tlZCgpYGAgbWV0aG9kCiAgdG8gY2hlY2sgaWYg
dGhlIGxvY2sgaXMgY3VycmVudGx5IGhlbGQgd2l0aG91dCBibG9ja2luZy4gVGhlIG1ldGhvZCB3
b3JrcyBvbiBhbGwgUHl0aG9uCiAgdmVyc2lvbnMgdXNpbmcgYXRvbWljIHJlYWRzIG9uIFB5dGhv
biAzLjEzKyBhbmQgYSB0cnktYWNxdWlyZSBhcHByb2FjaCBvbiBvbGRlciB2ZXJzaW9ucy4KICAo
R2l0aHViIGlzc3VlIDppc3N1ZTpgNzI3NWApCgoqIEEgc2ltcGxlciBtZWNoYW5pc20gd2FzIGFk
ZGVkIGZvciBpbXBsZW1lbnRpbmcgQysrIGV4Y2VwdGlvbiBoYW5kbGVycyBpbiBDeXRob24gY29k
ZS4KICAoR2l0aHViIGlzc3VlcyA6aXNzdWU6YDczODhgLCA6aXNzdWU6YDczOTBgKQoKKiBSZXBl
YXRlZCBtZW1vcnl2aWV3IHNsaWNpbmcgaW5zaWRlIG9mIGxvb3BzIG5vdyBhdm9pZHMgcmVkdW5k
YW50IHJlZmVyZW5jZSBjb3VudGluZywKICBtYWtpbmcgaXQgc3Vic3RhbnRpYWxseSBmYXN0ZXIu
CiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDU1MDdgKQoKKiBJbmRleGluZyBpbnRvIEN5dGhvbiBt
ZW1vcnl2aWV3IG9iamVjdHMgZnJvbSBQeXRob24gaXMgZmFzdGVyLgogIChHaXRodWIgaXNzdWUg
Omlzc3VlOmA3NTI5YCkKCiogU29tZSBpbnRlcm5hbCBjYWxsIG92ZXJoZWFkIGluIHRoZSBtZW1v
cnl2aWV3IGNvZGUgd2FzIHJlbW92ZWQuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc2MDlgKQoK
KiBFeHRlbnNpb24gdHlwZXMgdXNlIHRoZSB2ZWN0b3JjYWxsIGludGVyZmFjZSBmb3IgdGhlaXIg
aW5zdGFudGlhdGlvbiBpbiBtYW55IGNhc2VzLgogIFRoaXMgY2FuIGJlIGNvbmZpZ3VyZWQgd2l0
aCBhIG5ldyBDIGZlYXR1cmUgbWFjcm8gYGBDWVRIT05fVkVDVE9SQ0FMTF9UUE5FV2BgLgogIChH
aXRodWIgaXNzdWUgOmlzc3VlOmA3Njk4YCkKCiogQ29yb3V0aW5lIG1ldGhvZHMgdXNlIHRoZSBm
YXN0ZXIgdmVjdG9yY2FsbCBpbnRlcmZhY2UuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc2Nzhg
KQoKKiBWZWN0b3JjYWxscyB3aXRoIGxpdGVyYWwga2V5d29yZCBhcmd1bWVudHMgdXNlIGNhY2hl
ZCBjb25zdGFudCBrZXl3b3JkIG5hbWUgdHVwbGVzLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3
NzEzYCkKCiogTGlzdCBjb21wcmVoZW5zaW9ucyB0aGF0IGdlbmVyYXRlIG5ldyBvYmplY3RzIGF2
b2lkIHJlZmNvdW50aW5nIG92ZXJoZWFkIGZvciBhcHBlbmRpbmcuCiAgKEdpdGh1YiBpc3N1ZSA6
aXNzdWU6YDc3NDhgKQoKKiBNZXRob2QgY2FsbHMgaW4gb2xkZXIgTGltaXRlZCBBUEkgdmVyc2lv
bnMgYXJlIHNsaWdodGx5IGZhc3Rlci4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzcwN2ApCgoq
IEMgYXJyYXlzIGFyZSBzdWJzdGl0dXRlZCBmb3Igc2VxdWVuY2UgaXRlcmF0aW9uIGluIG1vcmUg
Y2FzZXMsIGFsc28gaW5zaWRlIG9mIGdlbmVyYXRvcnMuCiAgQWQtaG9jIEMgYXJyYXkgc3RvcmFn
ZSBvbiB0aGUgc3RhY2sgYW5kIGluIGNsb3N1cmVzIHdhcyByZXdvcmtlZCBhbG9uZyB0aGUgd2F5
LgogIChHaXRodWIgaXNzdWVzIDppc3N1ZTpgNzMyM2AsIDppc3N1ZTpgNzMzOWApCgoqIFVuaWNv
ZGUgc3RyaW5nIGNvbXBhcmlzb25zIHRvIHNpbmdsZSBjaGFyYWN0ZXIgbGl0ZXJhbHMgYXJlIGZh
c3Rlci4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzQxOGApCgoqIEYtc3RyaW5ncyBhcmUgYSBs
aXR0bGUgZmFzdGVyIGluIHNvbWUgY2FzZXMuCiAgKEdpdGh1YiBpc3N1ZXMgOmlzc3VlOmA3NDk1
YCwgOmlzc3VlOmA3NTI2YCkKCiogUHlQeSBhbmQgR3JhYWxQeXRob24gdXNlIHRoZSB2ZWN0b3Jj
YWxsIHByb3RvY29sIHRvIGVuYWJsZSBmYXN0ZXIgUHl0aG9uIGNhbGxzIGluIGZ1dHVyZSByZWxl
YXNlcy4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzYxNGApCgoqIFRoZSBydW50aW1lIGNvbnZl
cnNpb24gZnJvbSBhIFB5dGhvbiBtYXBwaW5nIHRvIGEgQyBzdHJ1Y3QvdW5pb24gdXNlcyBsZXNz
IGNvZGUuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDczNDNgKQoKKiBUaGUgZXJyb3IgaGFuZGxp
bmcgb2YgbWVtb3J5dmlld3MgdXNlcyBsZXNzIGNvZGUuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6
YDc1MjVgKQoKKiBUaGUgcnVudGltZSBkaXNwYXRjaCBjb2RlIG9mIGZ1c2VkIHR5cGVzIHVzZXMg
bGVzcyBjb2RlLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3NTAxYCkKCiogTW9yZSBjb2RlIGlz
IGV4dHJhY3RlZCB0byB0aGUgc2hhcmVkIHV0aWxpdHkgY29kZSBtb2R1bGUuCiAgKEdpdGh1YiBp
c3N1ZXMgOmlzc3VlOmA3NTU2YCwgOmlzc3VlOmA3NTcwYCkKCiogQ3l0aG9uIGNvbXBpbGVkIGZ1
bmN0aW9ucyBoYXZlIGEgbW9yZSBlZmZpY2llbnQgbWVtb3J5IGxheW91dCBpbiB0aGUgTGltaXRl
ZCBBUEkuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc1MTlgKQoKKiBNb2R1bGUgc3RyaW5nIGNv
bnRlbnQgaXMgbm93IGNvbXByZXNzZWQgd2l0aCBMWlNTIGJ5IGRlZmF1bHQsIHdoaWNoIHJlZHVj
ZXMgdGhlIGZvb3RwcmludCBvZiB0aGUKICBkZWNvbXByZXNzb3IgY29kZSBjb21wYXJlZCB0byB0
aGUgMy4yLnggZGVmYXVsdCBgYHpsaWJgYC4gIFRoaXMgYWxzbyBhdm9pZHMgYSBydW50aW1lIGRl
cGVuZGVuY3kKICBvbiB0aGUgYGB6bGliYGAgbW9kdWxlIHNpbmNlIHRoZSB0aW55IExaU1MgZGVj
b21wcmVzc29yIGNhbiBiZSBlbWJlZGRlZCBpbiB0aGUgbW9kdWxlLgogIChHaXRodWIgaXNzdWUg
Omlzc3VlOmA3NTc3YCkKCiogVGhlIFB5MiBgYHByaW50YGAgc3RhdGVtZW50IGlzIG5vdyBpbXBs
ZW1lbnRlZCBpbiBDeXRob24gaW5zdGVhZCBvZiBDIHRvIG1ha2UgaXQKICB0aHJlYWQtc2FmZSBh
bmQgdXNlcyBhIHZlY3RvcmNhbGwgaW50byBQeXRob24uCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6
YDc2NDJgKQoKKiBTZXZlcmFsIEMrKyBleGNlcHRpb24gZGVjbGFyYXRpb25zIHdlcmUgYWRkZWQg
dG8gYGBsaWJjcHAuZXhjZXB0aW9uc2BgLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3Mzg5YCkK
CiogTWlzc2luZyBQeXRob24gdHlwZSBmbGFnIGRlY2xhcmF0aW9ucyB3ZXJlIGFkZGVkIHRvIGBg
Y3B5dGhvbi5vYmplY3RgYC4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzQ0MWApCgoqIERlY2xh
cmF0aW9ucyBmb3IgYGBQeVR5cGVfR2V0U2xvdCgpYGAgYW5kIHRoZSBjb3JyZXNwb25kaW5nIHR5
cGUgc2xvdCBJRHMgd2VyZSBhZGRlZAogIHRvIGBgY3B5dGhvbi50eXBlYGAuCgoqIERlY2xhcmF0
aW9ucyBmb3Igc3BlY2lhbGlzZWQgYnl0ZS1jb252ZXJzaW9uIGZ1bmN0aW9ucyB3ZXJlIGFkZGVk
IHRvIGBgY3B5dGhvbi5sb25nYGAgYW5kIGBgY3B5dGhvbi5mbG9hdGBgLgogIFBhdGNoIGJ5IFZh
bGVudGluIFZhbGxzLiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc3MzhgKQoKKiBFcnJvciBkZXRl
Y3Rpb24gd2hlbiBhc3NpZ25pbmcgdG8gYGBjb25zdGBgIHZhcmlhYmxlcyB3YXMgaW1wcm92ZWQu
CiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDczNTlgKQoKKiBTb21lIGNhc2VzIG9mIGxpa2VseSBt
aXN1c2Ugb2YgYGBjcml0aWNhbF9zZWN0aW9uYGAgbm93IGdlbmVyYXRlIHdhcm5pbmdzLgogIChH
aXRodWIgaXNzdWUgOmlzc3VlOmA2NzY2YCkKCiogUHJvZ3JhbW1hdGljIHVzZSBvZiBDeXRob24g
aGFzIGJlY29tZSBlYXNpZXIgYnkgYXZvaWRpbmcgdGhlIG5lZWQgdG8gbWFudWFsbHkgc2V0IHVw
CiAgdGhlIGVycm9yIHJlcG9ydGluZy4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzIzNWApCgoq
IEF1dG9zY2FsaW5nIGluIGBgY3ltZWl0YGAgaXMgYSBsaXR0bGUgZmFzdGVyLgoKKiBVbmljb2Rl
IDE3LjAuMCBpcyB1c2VkIHRvIHBhcnNlIGlkZW50aWZpZXJzLgoKQnVncyBmaXhlZAotLS0tLS0t
LS0tCgoqIEFzc2lnbmluZyBhIFB5dGhvbiAzLjE0KyBgYC5fX2Fubm90YXRlX19gYCBmdW5jdGlv
biB0byBhIEN5dGhvbiBjb21waWxlZCBmdW5jdGlvbiBubwogIGxvbmdlciBldmFsdWF0ZXMgYW5u
b3RhdGlvbnMgZWFnZXJseS4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzc2N2ApCgoqIEdlbmVy
YXRlZCBDeXRob24gbGFuZ3VhZ2UgZmVhdHVyZXMgbGlrZSBwcm9wZXJ0aWVzLCBhdXRvLXBpY2ts
ZSBvciBkYXRhY2xhc3NlcwogIG5vdyB1c2UgYSBjcml0aWNhbCBzZWN0aW9uIChvbiB0aGUgb2Jq
ZWN0IGl0c2VsZikgYXMgZ3VhcmQgZm9yIGNvbmN1cnJlbnQgYWNjZXNzLgogIChHaXRodWIgaXNz
dWUgOmlzc3VlOmA2NjIxYCkKCiogVGhlIHN0YXItaW1wb3J0IGltcGxlbWVudGF0aW9uIG5lZWRs
ZXNzbHkgcmVqZWN0ZWQgc2V2ZXJhbCBuYW1lcyBpbiBpbnRlcm5hbCB1c2UuCiAgVGhleSBhcmUg
bm93IGFsbG93ZWQgYW5kIGJlY29tZSByZWd1bGFyIFB5dGhvbiBtb2R1bGUgYXR0cmlidXRlcy4K
ICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNDkzMWApCgoqIE1peGluZyBmdW5jdGlvbiBzaWduYXR1
cmUgZGVjbGFyYXRpb25zIGluIFB5dGhvbiBtb2R1bGVzIGFuZCB0aGVpciBgYC5weGRgYCBtb2R1
bGVzIGNvdWxkIGZhaWwuCiAgKEdpdGh1YiBpc3N1ZXMgOmlzc3VlOmA1OTcwYCwgOmlzc3VlOmA0
Mzg4YCkKCiogQyBhcnJheSBkZWNsYXJhdGlvbnMgd2l0aCB0eXBlIGFuZCBzaXplIGNvdWxkIGZh
aWwgd2l0aCBhbiBleGNlcHRpb24gaW4gcHVyZSBQeXRob24gY29kZS4KICAoR2l0aHViIGlzc3Vl
IDppc3N1ZTpgNzM3MmApCgoqIEEgYGBjb25zdGBgIG1vZGlmaWVyIGluIEMrKyB0ZW1wbGF0ZSB0
eXBlIGFyZ3VtZW50cyBjb3VsZCBiZSBtYXBwZWQgaW5jb3JyZWN0bHkuCiAgKEdpdGh1YiBpc3N1
ZSA6aXNzdWU6YDYyOTRgKQoKKiBDKysgYGB0eXBlaWQoKWBgIGZhaWxlZCB0byBjb21waWxlIG9u
IG1vcmUgY29tcGxleCBleHByZXNzaW9ucy4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzA2OWAp
CgoqIE9wdGltaXNlZCBQeXRob24gYGBpbnRgYCBhbmQgYGBmbG9hdGBgIG9wZXJhdGlvbnMgZGlk
IG5vdCByZW1lbWJlciB0aGVpciByZXN1bHQgdHlwZSwKICBsZWFkaW5nIHRvIGxlc3Mgb3B0aW1p
c2VkIGNvZGUgaW4gbG9uZ2VyIGV4cHJlc3Npb25zLgogIChHaXRodWIgaXNzdWVzIDppc3N1ZTpg
NzM2M2AsIDppc3N1ZTpgNzUwMmApCgoqIFNsaWNlcyBhcyBkaWN0aW9uYXJ5IGtleXMgY29uZnVz
ZWQgdGhlIHR5cGUgaW5mZXJlbmNlIG9mIGl0ZW0gYWNjZXNzLgogIChHaXRodWIgaXNzdWUgOmlz
c3VlOmA3NzAyYCkKCiogQSByYWNlIGNvbmRpdGlvbiB3aGVuIGBgcmV0dXJuYGBpbmcgZnJvbSBh
IGBgY3l0aG9uLnBhcmFsbGVsLnBhcmFsbGVsYGAgc2VjdGlvbiB3YXMgZml4ZWQuCiAgKEdpdGh1
YiBpc3N1ZSA6aXNzdWU6YDY1MjFgKQoKKiBDeXRob24gc3RpbGwgdXNlZCBgYCh0eXBlLCBleGMs
IHRyYWNlYmFjaylgYCBmb3Igc2F2aW5nIGFuZCByZXN0b3JpbmcgZXhjZXB0aW9uIHN0YXRlLAog
IGV2ZW4gdGhvdWdoIG1vZGVybiBDUHl0aG9uIHZlcnNpb25zIG9ubHkgc3RvcmUgdGhlIGV4Y2Vw
dGlvbiBvYmplY3QgaXRzZWxmIGludGVybmFsbHkuCiAgVGhpcyBpcyBub3cgbW9kZXJuaXNlZCBp
biBtYW55IHBsYWNlcyB0byByZWR1Y2Ugb3ZlcmhlYWQuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6
YDc0ODFgKQoKKiBFeGNlcHRpb25zIG9yaWdpbmF0aW5nIGZyb20gdGhlIGBgUHlfVU5JQ09ERV9J
UyooKWBgIGNoYXJhY3RlciBjbGFzc2lmaWNhdGlvbiBtYWNyb3MgYW5kCiAgdGhlIGNvcnJlc3Bv
bmRpbmcgYGBzdHIuaXMqKClgYCBtZXRob2RzLCB3aGljaCB0aGV5IGFsaWFzLCB3ZXJlIG5vdCBo
YW5kbGVkIGJ1dCBpZ25vcmVkIGluCiAgdGhlIExpbWl0ZWQgQVBJLgogIChHaXRodWIgaXNzdWUg
Omlzc3VlOmA3NjAyYCkKCiogSW4gdGhlIExpbWl0ZWQgQVBJLCBpbXBvcnQgdGltZSBmYWlsdXJl
cyB0byBjcmVhdGUgY29kZSBvYmplY3RzIGZvciBjb21waWxlZCBmdW5jdGlvbnMsCiAgZS5nLiBk
dWUgdG8gZnV0dXJlIFB5dGhvbiBBUEkgY2hhbmdlcywgYXJlIG5vIGxvbmdlciBmYXRhbCBidXQg
Z2VuZXJhdGUgYSB3YXJuaW5nLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA1NzE4YCkKCiogU2V2
ZXJhbCBpbnRlcm5hbCBjYXNlcyB3aGVyZSBleGNlcHRpb25zIGFyZSBjYXVnaHQgYW5kIGRpc2Nh
cmRlZCBub3cgcHJvcGFnYXRlIHRoZQogIGBgQmFzZUV4Y2VwdGlvbmBgIGVycm9ycyBhbmQgb25s
eSBkaXNjYXJkIHRoZSBleHBlY3RlZCBleGNlcHRpb25zLgogIChHaXRodWIgaXNzdWUgOmlzc3Vl
OmA3NjAwYCkKCiogRXJyb3IgaGFuZGxpbmcgd2FzIGltcHJvdmVkIHdoZW4gc2V0dGluZyB1cCB0
aGUgdGFibGUgb2YgYGBjZGVmYGAgbWV0aG9kcyBmb3IgZXh0ZW5zaW9uIHR5cGVzCiAgYW5kIHVu
ZXhwZWN0ZWQgZXJyb3JzIGFyZSBwcm9wYWdhdGVkLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3
NjEzYCkKCiogRXhjZXB0aW9ucyB3aGlsZSBzZXR0aW5nIHVwIHRoZSBhdXRvbWF0aWMgcGlja2xl
IHN1cHBvcnQgYXJlIG5vdyBwcm9wYWdhdGVkLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3NjEz
YCkKCiogRXhjZXB0aW9ucyB0aHJvd24gaW50byBhc3luYyBnZW5lcmF0b3JzIGNvdWxkIGxlYXZl
IHRoZSBnZW5lcmF0b3IgaW4gYW4gdW5jbG9zZWQgc3RhdGUuCiAgKEdpdGh1YiBpc3N1ZSA6aXNz
dWU6YDc2MThgKQoKKiBJbiB0aGUgTGltaXRlZCBBUEksIGZhaWx1cmVzIHdoaWxlIGZvcm1hdHRp
bmcgdHlwZSBuYW1lcyBpbiBleGNlcHRpb25zIGFyZSBub3cgdW5pZm9ybWx5IGhhbmRsZWQuCiAg
KEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc2ODBgKQoKKiBUaGUgZ2xvYmFsIG1vZHVsZSBzdGF0ZSBz
dHJ1Y3Qgbm93IGxpdmVzIGluIGFuIGFub255bW91cyBuYW1lc3BhY2UgaW4gQysrIG1vZGUgdG8K
ICBhbGxvdyBsaW5raW5nIG11bHRpcGxlIG1vZHVsZXMgdG9nZXRoZXIgaW4gb25lIHNoYXJlZCBs
aWJyYXJ5IGZpbGUuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDcxNTlgKQoKKiBEaWN0IGl0ZXJh
dGlvbiBnZW5lcmF0ZXMgc2FmZXIgY29kZSBpbiBQeVB5L0dyYWFsUHkvZnJlZS10aHJlYWRpbmcu
CiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc2MzdgKQoKKiBUaGUgZmxvYXRpbmcgcG9pbnQgcGFy
c2luZyBjb2RlIHJlbGllZCBvbiBDIGltcGxlbWVudGF0aW9uIHNwZWNpZmljICJwb2ludGVyIGNv
bXBhcmUgYWZ0ZXIgZnJlZSIgYmVoYXZpb3VyLgogIFBhdGNoIGJ5IHN0cmF0YWtpcy4gIChHaXRo
dWIgaXNzdWUgOmlzc3VlOmA3NDYzYCkKCiogV2hlbiBub24taGVhcCB0eXBlcyB3ZXJlIHVzZWQg
YXMgYmFzZSBjbGFzc2VzIG9mIGV4dGVuc2lvbiBoZWFwIHR5cGVzLCB0aGUgaGVhcCB0eXBlcwog
IHdlcmUgbm90IGNvcnJlY3RseSByZWZlcmVuY2UgY291bnRlZCBieSB0aGVpciBpbnN0YW5jZXMu
CiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc0ODNgKQoKKiBUaGUgYGAuX19zaWduYXR1cmVzX19g
YCBkaWN0IG9mIGZ1c2VkIGZ1bmN0aW9ucyBpcyBubyBsb25nZXIgd3JpdGFibGUuCiAgKEdpdGh1
YiBpc3N1ZSA6aXNzdWU6YDczODZgKQoKKiBBIG1pbmltYWwgaW1wbGVtZW50YXRpb24gb2YgYGAu
X19hbm5vdGF0ZV9fYGAgd2FzIGFkZGVkIHRvIEN5dGhvbiBjb21waWxlZCBmdW5jdGlvbnMgdG8g
bWFrZQogIGBgQGZ1bmN0b29scy53cmFwc2BgIHdvcmsgaW4gUHl0aG9uIDMuMTQrLgogIChHaXRo
dWIgaXNzdWUgOmlzc3VlOmA3Njc1YCkKCiogVGhlIGBgLS1lbWJlZC1wb3NpdGlvbnNgYCBvcHRp
b24gbm8gbG9uZ2VyIGluY2x1ZGVzIGFic29sdXRlIGZpbGUgcGF0aHMgaW4gdGhlIEMgY29kZS4K
ICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNjc1NWApCgoqIEVycm9yIHJlcG9ydGluZyBvbiBtaXNz
aW5nIGJyYWNlcyBpbiBmLXN0cmluZ3Mgd2FzIG1pc2xlYWRpbmcuCiAgKEdpdGh1YiBpc3N1ZSA6
aXNzdWU6YDc0MzZgKQoKKiBgYE5vbmVgYCBkZWZhdWx0IHZhbHVlcyBmb3IgZnVuY3Rpb24gYXJn
dW1lbnRzIGRlY2xhcmVkIGFzIGBgbm90IE5vbmVgYCBhcmUgbm93IHJlamVjdGVkIGF0IGNvbXBp
bGUgdGltZQogIHJhdGhlciB0aGFuIGxlYWRpbmcgdG8gZXJyb3JzIGF0IHJ1bnRpbWUuCiAgUGF0
Y2ggYnkgVnlhcyBSYW1hc3VicmFtYW5pLiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc3NjJgKQoK
KiBDeXRob24gZGlkIG5vdCByZWplY3QgY29kZSB3aXRoIG11bHRpcGxlIGNvbnRyYWRpY3Rpbmcg
dHlwZSBhbm5vdGF0aW9ucyBvbiB0aGUgc2FtZSB2YXJpYWJsZS4KICAoR2l0aHViIGlzc3VlIDpp
c3N1ZTpgNzI0NmApCgoqIEN5dGhvbiBubyBsb25nZXIgd2FybnMgaWYgYGBAcHJvZmlsZWBgIG9y
IGBgQGxpbmV0cmFjZWBgIGlzIGFwcGxpZWQgdG8gYSBmdW5jdGlvbgogIHdpdGhvdXQgY2hhbmdp
bmcgdGhlIGdsb2JhbC9vdXRlciBzZXR0aW5nLiAgVGhpcyBhdm9pZHMgYW5ub3lhbmNlIHdoZW4g
dXNlcnMgbGVhdmUKICBzdWNoIHJlZHVuZGFudCBkZWNvcmF0b3JzIGluIHRoZSBjb2RlIGZvciBv
Y2Nhc2lvbmFsIHVzZS4KCiogQ2FjaGVkIG1ldGhvZHMgb2YgYnVpbHRpbiB0eXBlcyB3ZXJlIG5v
dCBHQy10cmF2ZXJzZWQgYW5kIGNsZWFuZWQgdXAgYXMgcGFydCBvZiB0aGUgbW9kdWxlIHN0YXRl
LgogIFBhdGNoIGJ5IE1heHdlbGwgQmVybnN0ZWluLiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc0
NjhgKQoKKiBNb2R1bGVzIHdpdGggbm9uLUFTQ0lJIG5hbWVzIGNvdWxkIGVuZCB1cCB3aXRoIFVU
Ri04IGNoYXJhY3RlcnMgaW4gdGhlaXIgQyBjb2RlLgogIChHaXRodWIgaXNzdWUgOmlzc3VlOmA3
NTg4YCkKCiogU2V2ZXJhbCBDIGNvbXBpbGVyIHdhcm5pbmdzIHJlbGF0ZWQgdG8gbWl4ZWQgc2ln
bmVkL3Vuc2lnbmVkIEMgaW50ZWdlciB1c2FnZSB3ZXJlIHJlc29sdmVkLgoKKiBJbmNsdWRlcyBh
bGwgZml4ZXMgYXMgb2YgQ3l0aG9uIDMuMi42LgoKT3RoZXIgY2hhbmdlcwotLS0tLS0tLS0tLS0t
CgoqIFN1cHBvcnQgZm9yIFB5dGhvbiAzLjggaGFzIGJlZW4gcmVtb3ZlZC4KICBBcyBhIHNpZGUt
ZWZmZWt0LCBzdXBwb3J0IGZvciBTdGFja2xlc3NQeXRob24gYW5kIFB5c3RvbiAobGFzdCByZWxl
YXNlIHdhcyAzLjgpIHdhcyBhbHNvIHJlbW92ZWQuCiAgUHl0aG9uIDMuOSBpcyBwbGFubmVkIHRv
IHJlbWFpbiBzdXBwb3J0ZWQgZm9yIHNldmVyYWwgeWVhcnMgZHVlIHRvIGl0cyB1c2UgaW4gTFRT
IExpbnV4IGRpc3RyaWJ1dGlvbnMuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDcyNzFgKQoKKiBU
aGUgdmVjdG9yY2FsbCBmZWF0dXJlIG1hY3JvcyB3ZXJlIHVuaWZpZWQgdG8gbWFrZSBgYENZVEhP
Tl9WRUNUT1JDQUxMYGAgdGhlIG9ubHkgd2F5IHRvCiAgZGlzYWJsZSB0aGlzIGZlYXR1cmUgKGlm
IG5lZWQgYXJpc2VzKS4gIFByZXZpb3VzbHkgdGhlIG9wdGlvbiBtYWNyb3MgYGBDWVRIT05fTUVU
SF9GQVNUQ0FMTGBgLAogIGBgQ1lUSE9OX0ZBU1RfUFlDQUxMYGAgYW5kIGBgQ1lUSE9OX1ZFQ1RP
UkNBTExgYCBhbGwgY29udHJvbGxlZCBkaWZmZXJlbnQgYXNwZWN0cyBvZiB0aGUKICBpbXBsZW1l
bnRhdGlvbi4KICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzYxNmApCgoqIENvcm91dGluZXMgbm8g
bG9uZ2VyIHByb3ZpZGUgdGhlIGxlZ2FjeSBgYF9pc19jb3JvdXRpbmVgYCBwcm9wZXJ0eS4KICAo
R2l0aHViIGlzc3VlIDppc3N1ZTpgNzcwOWApCgoqIGBgQ3l0aG9uL1NoYWRvdy5weWlgYCBoYXMg
YmVlbiBtZXJnZWQgaW50byBgYEN5dGhvbi9TaGFkb3cucHlgYC4KICAoR2l0aHViIGlzc3VlIDpp
c3N1ZTpgNzM3NmApCgoqIFRoZSBkb2N1bWVudGF0aW9uIG5vdyB1c2VzIHRoZSAiQ2xhcml0eSIg
U3BoaW54IHRoZW1lLgogIFBhdGNoIGJ5IExpYm9yIEplbMOtbmVrLiAgKEdpdGh1YiBpc3N1ZSA6
aXNzdWU6YDc1NjRgKQoKMy4yLjEwICgyMDI2LTA/LT8/KQo9PT09PT09PT09PT09PT09PT0KCkJ1
Z3MgZml4ZWQKLS0tLS0tLS0tLQoKKiBVbnBpY2tsaW5nIHdyYXBwZXJzIG9mIGNvbXBpbGVkIGZ1
bmN0aW9ucyBmYWlsZWQuCiAgKEdpdGh1YiBpc3N1ZSA6aXNzdWU6YDc4NDZgKQoKKiBBIGNvbXBp
bGVyIGNyYXNoIHdhcyBmaXhlZCB3aGVuIHVzaW5nIGNvbXByZWhlbnNpb24gcmVzdWx0cyBkaXJl
Y3RseSBpbiBpbi1wbGFjZSBhc3NpZ25tZW50cy4KICBQYXRjaCBieSBBYmhpbmF2TWlyLiAgKEdp
dGh1YiBpc3N1ZSA6aXNzdWU6YDc4NDZgKQoKKiBBIGNvbXBpbGVyIGNyYXNoIHdhcyBmaXhlZCB3
aGVuIGtleXdvcmQgYXJndW1lbnRzIHdlcmUgdXNlZCBpbiBDKysgY2xhc3MgY2FsbHMuCiAgUGF0
Y2ggYnkgVmxhZGltaXIgU2FyYWlraW4uICAoR2l0aHViIGlzc3VlIDppc3N1ZTpgNzIwNmApCgoz
LjIuOSAoMjAyNi0wNy0yNCkK

--===============2660611144457205534==--

