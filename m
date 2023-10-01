Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95D3E7490C
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.65017.1696183990731563320
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OLtHVnAp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cwMjZ2Pd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018aec71b6e4-92380d85-cd9e-4511-94d2-c14f4f53e80e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xeOgJIjfUjHH+bQpVjj44RYOJmlvZLdarjH/T3mLsf4=;
	b=OLtHVnApYnkg0o3JPTELq3NHK/Y3+gopDBFavbHwcy3hRKKjeqFvuKcpQKOYfjEH
	K9x7Q7B0i59gTym4jQvNvnk4D0ZEPj+KGCxcN7vfMMW8yEkoBYMLgWiXOtTB1Jiehf+
	fCsqnOlnpCRP+oYMkBQMKzUW0kWRXcdLDtvEmGPs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xeOgJIjfUjHH+bQpVjj44RYOJmlvZLdarjH/T3mLsf4=;
	b=cwMjZ2PdA74EwBNepO89dp4Pd/c5jwNg10fI+44Qnk5wGh/o1oLj5RPiRWNOCii3
	lF9dAvEifAUhgtGRjABveK81uYD3Brhij0V4VxfUQGpIkfnzGdVK+Ez2hXMUUS1SseW
	3bB8pgmKitF8VqN7REf+1CIPfrUzfr63kwil1VOk=
Content-Type: multipart/mixed; boundary="===============8817499344218287051=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.0.2 SUCCEEDED
Message-ID: <0101018aec71b6e4-92380d85-cd9e-4511-94d2-c14f4f53e80e-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188527

--===============8817499344218287051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cython* to *3.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-0.29.36-3.0.2.patch
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
From 61b227e9255d88d9420e44611bdd15450be57f65 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 09:37:46 +0000
Subject: [PATCH] python3-cython: upgrade 0.29.36 -> 3.0.2

---
 .../recipes-devtools/python/python-cython.inc |  4 ++--
 ...hon_0.29.36.bb => python3-cython_3.0.2.bb} | 21 +++++++++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb => python3-cython_3.0.2.bb} (67%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 6aec6b012f..15fdb72baa 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -5,11 +5,11 @@ It's designed to bridge the gap between the nice, high-level, easy-to-use world
 and the messy, low-level world of C."
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
+SRC_URI[sha256sum] = "9594818dca8bb22ae6580c5222da2bc5cc32334350bd2d294a00d8669bcc61b5"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-devtools/python/python3-cython_3.0.2.bb
similarity index 67%
rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.2.bb
index 78be2b94ed..c1e8bec81c 100644
--- a/meta/recipes-devtools/python/python3-cython_0.29.36.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.2.bb
@@ -1,3 +1,24 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.txt
+# +++ LICENSE.txt
+# @@ -1,6 +1,6 @@
+#                                   Apache License
+#                             Version 2.0, January 2004
+# -                        http://www.apache.org/licenses/
+# +                        https://www.apache.org/licenses/
+#  
+#     TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
+#  
+# 
+#
+
 inherit setuptools3
 require python-cython.inc
 
-- 
2.39.2


--===============8817499344218287051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cython: PKGV changed from 0.29.36 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/C/Cython/Cython-0.29.36.tar.gz;downloadfilename=Cython-0.29.36.tar.gz" to "https://files.pythonhosted.org/packages/source/C/Cython/Cython-3.0.2.tar.gz;downloadfilename=Cython-3.0.2.tar.gz"
packages/core2-32-poky-linux/python3-cython: PV changed from "0.29.36" to "3.0.2"
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 0.29.36 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: FILELIST: added "/usr/lib/python3.11/site-packages/Cython/Compiler/.debug/Parsing.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Compiler/.debug/Code.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/.debug/StringIOTree.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/.debug/Utils.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Plex/.debug/Transitions.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Plex/.debug/Machines.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Plex/.debug/DFA.cpython-311-i386-linux-gnu.so"
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PV changed from "0.29.36" to "3.0.2"
packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 7739668 to 20481720 (+165%)
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 0.29.36 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-dev: PV changed from "0.29.36" to "3.0.2"
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 0.29.36 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-doc: PV changed from "0.29.36" to "3.0.2"
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 0.29.36 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-locale: PV changed from "0.29.36" to "3.0.2"
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGV changed from 0.29.36 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-src: FILELIST: directory renamed /usr/src/debug/python3-cython/0.29.36-r0/Cython/Tempita -> /usr/src/debug/python3-cython/3.0.2-r0/Cython/Tempita, directory renamed /usr/src/debug/python3-cython/0.29.36-r0/Cython/Runtime -> /usr/src/debug/python3-cython/3.0.2-r0/Cython/Runtime, removed "/usr/src/debug/python3-cython/0.29.36-r0/Cython/Compiler/FlowControl.c /usr/src/debug/python3-cython/0.29.36-r0/Cython/Compiler/Scanning.c /usr/src/debug/python3-cython/0.29.36-r0/Cython/Plex/Actions.c /usr/src/debug/python3-cython/0.29.36-r0/Cython/Compiler/Visitor.c /usr/src/debug/python3-cython/0.29.36-r0/Cython/Compiler/FusedNode.c /usr/src/debug/python3-cython/0.29.36-r0/Cython/Plex/Scanners.c", added "/usr/src/debug/python3-cython/3.0.2-r0/Cython/Compiler/Code.c /usr/src/debug/python3-cython/3.0.2-r0/Cython/Compiler/Visitor.c /usr/src/debug/python3-cython/3.0.2-r0/Cython/Plex/Machines.c /usr/src/debug/python3-cython/3.0.2-r0/Cython/Utils
 .c /usr/src/debug/python3-cython/3.0.2-r0/Cython/Compiler/FlowControl.c /usr/src/debug/python3-cython/3.0.2-r0/Cython/Plex/Scanners.c /usr/src/debug/python3-cython/3.0.2-r0/Cython/StringIOTree.c /usr/src/debug/python3-cython/3.0.2-r0/Cython/Plex/Transitions.c /usr/src/debug/python3-cython/3.0.2-r0/Cython/Compiler/Parsing.c /usr/src/debug/python3-cython/3.0.2-r0/Cython/Compiler/FusedNode.c /usr/src/debug/python3-cython/3.0.2-r0/Cython/Plex/DFA.c /usr/src/debug/python3-cython/3.0.2-r0/Cython/Plex/Actions.c /usr/src/debug/python3-cython/3.0.2-r0/Cython/Compiler/Scanning.c"
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PV changed from "0.29.36" to "3.0.2"
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 8490406 to 22703304 (+167%)
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 0.29.36 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "0.29.36" to "3.0.2"
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGV changed from 0.29.36 [default] to 3.0.2 [default]
packages/core2-32-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info -> /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info, removed "/usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_bytes.pxd /usr/lib/python3.11/site-packages/Cython/Utility/Capsule.c /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_buffer.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_number.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_object.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_unicode.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_oldbuffer.pxd /usr/lib/python3.11/site-packages/Cython/Plex/__pycache__/Timing.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/stl.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_method.pxd /usr/lib/python3
 .11/site-packages/Cython/Includes/Deprecated/stdio.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_function.pxd /usr/lib/python3.11/site-packages/Cython/Plex/Traditional.py /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_weakref.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_cobject.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_iterator.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_complex.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/stdlib.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_pycapsule.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_mapping.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_getargs.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_sequence.pxd /usr/lib/pyt
 hon3.11/site-packages/Cython/Includes/Deprecated/python_version.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_string.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_float.pxd /usr/lib/python3.11/site-packages/Cython/Plex/__pycache__/Traditional.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_module.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_exc.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_int.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_mem.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_tuple.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_ref.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_set.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_bool.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_dict
 .pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_list.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_long.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_type.pxd /usr/lib/python3.11/site-packages/Cython/Plex/Timing.py /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_instance.pxd", added "/usr/lib/python3.11/site-packages/Cython/Includes/libcpp/random.pxd /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/atomic.pxd /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/__pycache__/TestScanning.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Includes/cpython/time.pxd /usr/lib/python3.11/site-packages/Cython/Plex/DFA.pxd /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/optional.pxd /usr/lib/python3.11/site-packages/Cython/Utility/__pycache__/Dataclasses.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Build/Tests/__pycache__/TestDependencies.cpython-311.pyc /usr
 /lib/python3.11/site-packages/Cython/Includes/libcpp/bit.pxd /usr/lib/python3.11/site-packages/pyximport/_pyximport2.py /usr/lib/python3.11/site-packages/pyximport/_pyximport3.py /usr/lib/python3.11/site-packages/Cython/Includes/cpython/fileobject.pxd /usr/lib/python3.11/site-packages/Cython/Compiler/UFuncs.py /usr/lib/python3.11/site-packages/Cython/Build/Tests/__pycache__/TestRecythonize.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Plex/Transitions.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Includes/posix/uio.pxd /usr/lib/python3.11/site-packages/Cython/Includes/cpython/marshal.pxd /usr/lib/python3.11/site-packages/Cython/Utils.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Utility/UFuncs_C.c /usr/lib/python3.11/site-packages/Cython/Utility/Dataclasses.c /usr/lib/python3.11/site-packages/Cython/Plex/DFA.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Tests/__pycache__/TestTestUtils.cpython-311.p
 yc /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/numbers.pxd /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/numeric.pxd /usr/lib/python3.11/site-packages/Cython/Compiler/Dataclass.py /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/TestScanning.py /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/cmath.pxd /usr/lib/python3.11/site-packages/Cython/StringIOTree.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/__pycache__/Utils.cpython-311.pyc /usr/lib/python3.11/site-packages/pyximport/__pycache__/_pyximport2.cpython-311.pyc /usr/lib/python3.11/site-packages/pyximport/__pycache__/_pyximport3.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Compiler/__pycache__/Dataclass.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Build/Tests/__pycache__/TestCythonizeArgsParser.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Includes/cpython/pyport.pxd /usr/lib/python3.11/site-packages/Cython/Utility/D
 ataclasses.py /usr/lib/python3.11/site-packages/Cython/Compiler/__pycache__/UFuncs.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Compiler/Parsing.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Utility/UFuncs.pyx /usr/lib/python3.11/site-packages/Cython/Build/Tests/TestDependencies.py /usr/lib/python3.11/site-packages/Cython/Plex/Transitions.pxd /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/Utils.py /usr/lib/python3.11/site-packages/Cython/Build/Tests/TestRecythonize.py /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/any.pxd /usr/lib/python3.11/site-packages/Cython/Build/Tests/TestCythonizeArgsParser.py /usr/lib/python3.11/site-packages/Cython/Plex/Machines.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Compiler/Code.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Includes/libc/complex.pxd /usr/lib/python3.11/site-packages/Cython/Includes/cpython/contextvars.pxd /usr/lib/python3.11/si
 te-packages/Cython/Plex/Machines.pxd /usr/lib/python3.11/site-packages/Cython/Includes/cpython/descr.pxd /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/execution.pxd /usr/lib/python3.11/site-packages/Cython/Utility/NumpyImportArray.c /usr/lib/python3.11/site-packages/Cython/Tests/TestTestUtils.py"
packages/core2-32-poky-linux/python3-cython/python3-cython: PV changed from "0.29.36" to "3.0.2"
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 10285835 to 14801444 (+44%)
Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info was added
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info/COPYING.txt was added
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/Cython/Build/Tests/__pycache__/TestCythonizeArgsParser.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Build/Tests/__pycache__/TestDependencies.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Build/Tests/__pycache__/TestRecythonize.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Build/Tests/TestCythonizeArgsParser.py was added
  /usr/lib/python3.11/site-packages/Cython/Build/Tests/TestDependencies.py was added
  /usr/lib/python3.11/site-packages/Cython/Build/Tests/TestRecythonize.py was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/Code.cpython-311-i386-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/Dataclass.py was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/Parsing.cpython-311-i386-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/__pycache__/Dataclass.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/__pycache__/UFuncs.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/__pycache__/TestScanning.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/__pycache__/Utils.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/TestScanning.py was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/Utils.py was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/UFuncs.py was added
  /usr/lib/python3.11/site-packages/Cython/Includes/cpython/contextvars.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/cpython/descr.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/cpython/fileobject.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/cpython/marshal.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/cpython/pyport.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/cpython/time.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libc/complex.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/any.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/atomic.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/bit.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/cmath.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/execution.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/numbers.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/numeric.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/optional.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/random.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/posix/uio.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Plex/DFA.cpython-311-i386-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/Cython/Plex/DFA.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Plex/Machines.cpython-311-i386-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/Cython/Plex/Machines.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Plex/Transitions.cpython-311-i386-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/Cython/Plex/Transitions.pxd was added
  /usr/lib/python3.11/site-packages/Cython/StringIOTree.cpython-311-i386-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/Cython/Tests/__pycache__/TestTestUtils.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Tests/TestTestUtils.py was added
  /usr/lib/python3.11/site-packages/Cython/Utility/Dataclasses.c was added
  /usr/lib/python3.11/site-packages/Cython/Utility/Dataclasses.py was added
  /usr/lib/python3.11/site-packages/Cython/Utility/NumpyImportArray.c was added
  /usr/lib/python3.11/site-packages/Cython/Utility/__pycache__/Dataclasses.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Utility/UFuncs_C.c was added
  /usr/lib/python3.11/site-packages/Cython/Utility/UFuncs.pyx was added
  /usr/lib/python3.11/site-packages/Cython/Utils.cpython-311-i386-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/pyximport/__pycache__/_pyximport2.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pyximport/__pycache__/_pyximport3.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pyximport/_pyximport2.py was added
  /usr/lib/python3.11/site-packages/pyximport/_pyximport3.py was added
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info was removed
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info/COPYING.txt was removed
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_bool.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_buffer.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_bytes.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_cobject.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_complex.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_dict.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_exc.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_float.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_function.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_getargs.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_instance.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_int.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_iterator.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_list.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_long.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_mapping.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_mem.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_method.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_module.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_number.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_object.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_oldbuffer.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_pycapsule.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_ref.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_sequence.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_set.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_string.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_tuple.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_type.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_unicode.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_version.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_weakref.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/stdio.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/stdlib.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/stl.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Plex/__pycache__/Timing.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/Cython/Plex/__pycache__/Traditional.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/Cython/Plex/Timing.py was removed
  /usr/lib/python3.11/site-packages/Cython/Plex/Traditional.py was removed
  /usr/lib/python3.11/site-packages/Cython/Utility/Capsule.c was removed

--===============8817499344218287051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 7739668 to 20481720 (+165%)
packages/core2-32-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 8490406 to 22703304 (+167%)
packages/core2-32-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info -> /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info, removed "/usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_bool.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_dict.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_list.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_long.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/stdio.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_type.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_sequence.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_getargs.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_pycapsule.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_buffer.pxd /us
 r/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_number.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_complex.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_bytes.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_object.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_tuple.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_version.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_function.pxd /usr/lib/python3.11/site-packages/Cython/Plex/__pycache__/Traditional.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Utility/Capsule.c /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_method.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_weakref.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_iterator.pxd /usr/lib/python3.11/site-packages/Cython/Plex/Timing.py /usr
 /lib/python3.11/site-packages/Cython/Includes/Deprecated/stdlib.pxd /usr/lib/python3.11/site-packages/Cython/Plex/__pycache__/Timing.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_mapping.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_unicode.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/stl.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_module.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_cobject.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_oldbuffer.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_exc.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_int.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_instance.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_mem.p
 xd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_ref.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_set.pxd /usr/lib/python3.11/site-packages/Cython/Plex/Traditional.py /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_float.pxd /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_string.pxd", added "/usr/lib/python3.11/site-packages/Cython/Compiler/Code.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Plex/DFA.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Includes/cpython/fileobject.pxd /usr/lib/python3.11/site-packages/Cython/Build/Tests/__pycache__/TestRecythonize.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Utility/UFuncs_C.c /usr/lib/python3.11/site-packages/Cython/Utility/Dataclasses.c /usr/lib/python3.11/site-packages/Cython/Build/Tests/TestRecythonize.py /usr/lib/python3.11/site-packages/Cython/Utils.cpython-311-i386-linux-gnu.so /usr/lib
 /python3.11/site-packages/Cython/Build/Tests/TestDependencies.py /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/cmath.pxd /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/bit.pxd /usr/lib/python3.11/site-packages/Cython/Compiler/__pycache__/Dataclass.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Build/Tests/__pycache__/TestCythonizeArgsParser.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/__pycache__/Utils.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Compiler/Dataclass.py /usr/lib/python3.11/site-packages/Cython/Tests/__pycache__/TestTestUtils.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Compiler/UFuncs.py /usr/lib/python3.11/site-packages/Cython/Plex/Machines.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/pyximport/__pycache__/_pyximport2.cpython-311.pyc /usr/lib/python3.11/site-packages/pyximport/__pycache__/_pyximport3.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Compiler/__
 pycache__/UFuncs.cpython-311.pyc /usr/lib/python3.11/site-packages/pyximport/_pyximport2.py /usr/lib/python3.11/site-packages/pyximport/_pyximport3.py /usr/lib/python3.11/site-packages/Cython/Includes/cpython/contextvars.pxd /usr/lib/python3.11/site-packages/Cython/Build/Tests/TestCythonizeArgsParser.py /usr/lib/python3.11/site-packages/Cython/Utility/__pycache__/Dataclasses.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/__pycache__/TestScanning.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/random.pxd /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/atomic.pxd /usr/lib/python3.11/site-packages/Cython/Plex/Transitions.pxd /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/any.pxd /usr/lib/python3.11/site-packages/Cython/Includes/cpython/marshal.pxd /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/numbers.pxd /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/numeric.pxd /usr/lib/python3.11/site-packages/C
 ython/Compiler/Parsing.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/Utils.py /usr/lib/python3.11/site-packages/Cython/Plex/Machines.pxd /usr/lib/python3.11/site-packages/Cython/Build/Tests/__pycache__/TestDependencies.cpython-311.pyc /usr/lib/python3.11/site-packages/Cython/Plex/DFA.pxd /usr/lib/python3.11/site-packages/Cython/Utility/UFuncs.pyx /usr/lib/python3.11/site-packages/Cython/Includes/libc/complex.pxd /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/TestScanning.py /usr/lib/python3.11/site-packages/Cython/Includes/posix/uio.pxd /usr/lib/python3.11/site-packages/Cython/Includes/cpython/pyport.pxd /usr/lib/python3.11/site-packages/Cython/Plex/Transitions.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-packages/Cython/Includes/cpython/time.pxd /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/execution.pxd /usr/lib/python3.11/site-packages/Cython/StringIOTree.cpython-311-i386-linux-gnu.so /usr/lib/python3.11/site-p
 ackages/Cython/Includes/libcpp/optional.pxd /usr/lib/python3.11/site-packages/Cython/Includes/cpython/descr.pxd /usr/lib/python3.11/site-packages/Cython/Tests/TestTestUtils.py /usr/lib/python3.11/site-packages/Cython/Utility/NumpyImportArray.c /usr/lib/python3.11/site-packages/Cython/Utility/Dataclasses.py"
packages/core2-32-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 10285835 to 14801444 (+44%)
Changes to packages/core2-32-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info was added
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info/COPYING.txt was added
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/Cython-3.0.2.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/Cython/Build/Tests/__pycache__/TestCythonizeArgsParser.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Build/Tests/__pycache__/TestDependencies.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Build/Tests/__pycache__/TestRecythonize.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Build/Tests/TestCythonizeArgsParser.py was added
  /usr/lib/python3.11/site-packages/Cython/Build/Tests/TestDependencies.py was added
  /usr/lib/python3.11/site-packages/Cython/Build/Tests/TestRecythonize.py was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/Code.cpython-311-i386-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/Dataclass.py was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/Parsing.cpython-311-i386-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/__pycache__/Dataclass.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/__pycache__/UFuncs.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/__pycache__/TestScanning.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/__pycache__/Utils.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/TestScanning.py was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/Tests/Utils.py was added
  /usr/lib/python3.11/site-packages/Cython/Compiler/UFuncs.py was added
  /usr/lib/python3.11/site-packages/Cython/Includes/cpython/contextvars.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/cpython/descr.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/cpython/fileobject.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/cpython/marshal.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/cpython/pyport.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/cpython/time.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libc/complex.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/any.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/atomic.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/bit.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/cmath.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/execution.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/numbers.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/numeric.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/optional.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/libcpp/random.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Includes/posix/uio.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Plex/DFA.cpython-311-i386-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/Cython/Plex/DFA.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Plex/Machines.cpython-311-i386-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/Cython/Plex/Machines.pxd was added
  /usr/lib/python3.11/site-packages/Cython/Plex/Transitions.cpython-311-i386-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/Cython/Plex/Transitions.pxd was added
  /usr/lib/python3.11/site-packages/Cython/StringIOTree.cpython-311-i386-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/Cython/Tests/__pycache__/TestTestUtils.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Tests/TestTestUtils.py was added
  /usr/lib/python3.11/site-packages/Cython/Utility/Dataclasses.c was added
  /usr/lib/python3.11/site-packages/Cython/Utility/Dataclasses.py was added
  /usr/lib/python3.11/site-packages/Cython/Utility/NumpyImportArray.c was added
  /usr/lib/python3.11/site-packages/Cython/Utility/__pycache__/Dataclasses.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cython/Utility/UFuncs_C.c was added
  /usr/lib/python3.11/site-packages/Cython/Utility/UFuncs.pyx was added
  /usr/lib/python3.11/site-packages/Cython/Utils.cpython-311-i386-linux-gnu.so was added
  /usr/lib/python3.11/site-packages/pyximport/__pycache__/_pyximport2.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pyximport/__pycache__/_pyximport3.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pyximport/_pyximport2.py was added
  /usr/lib/python3.11/site-packages/pyximport/_pyximport3.py was added
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info was removed
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info/COPYING.txt was removed
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/Cython-0.29.36.dist-info/WHEEL was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_bool.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_buffer.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_bytes.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_cobject.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_complex.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_dict.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_exc.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_float.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_function.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_getargs.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_instance.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_int.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_iterator.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_list.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_long.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_mapping.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_mem.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_method.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_module.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_number.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_object.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_oldbuffer.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_pycapsule.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_ref.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_sequence.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_set.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_string.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_tuple.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_type.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_unicode.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_version.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/python_weakref.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/stdio.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/stdlib.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Includes/Deprecated/stl.pxd was removed
  /usr/lib/python3.11/site-packages/Cython/Plex/__pycache__/Timing.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/Cython/Plex/__pycache__/Traditional.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/Cython/Plex/Timing.py was removed
  /usr/lib/python3.11/site-packages/Cython/Plex/Traditional.py was removed
  /usr/lib/python3.11/site-packages/Cython/Utility/Capsule.c was removed

--===============8817499344218287051==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-0.29.36-3.0.2.patch"

RnJvbSA2MWIyMjdlOTI1NWQ4OGQ5NDIwZTQ0NjExYmRkMTU0NTBiZTU3ZjY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAwOTozNzo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3l0aG9uOiB1cGdyYWRlIDAuMjkuMzYgLT4gMy4wLjIKCi0tLQogLi4uL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jeXRob24uaW5jIHwgIDQgKystLQogLi4uaG9uXzAuMjku
MzYuYmIgPT4gcHl0aG9uMy1jeXRob25fMy4wLjIuYmJ9IHwgMjEgKysrKysrKysrKysrKysrKysr
KwogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY3l0aG9uXzAuMjkuMzYu
YmIgPT4gcHl0aG9uMy1jeXRob25fMy4wLjIuYmJ9ICg2NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tY3l0aG9uLmluYyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uLWN5dGhvbi5pbmMKaW5kZXggNmFlYzZiMDEyZi4uMTVmZGI3
MmJhYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tY3l0
aG9uLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jeXRob24u
aW5jCkBAIC01LDExICs1LDExIEBAIEl0J3MgZGVzaWduZWQgdG8gYnJpZGdlIHRoZSBnYXAgYmV0
d2VlbiB0aGUgbmljZSwgaGlnaC1sZXZlbCwgZWFzeS10by11c2Ugd29ybGQKIGFuZCB0aGUgbWVz
c3ksIGxvdy1sZXZlbCB3b3JsZCBvZiBDLiIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElD
RU5TRSA9ICJBcGFjaGUtMi4wIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50
eHQ7bWQ1PWUyM2ZhZGQ2Y2VlZjhjNjE4ZmMxYzY1MTkxZDg0NmZhIgorTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTYxYzNlZTg5NjE1NzU4NjFmYTg2YzdlNjJiYzlm
NjljIgogUFlQSV9QQUNLQUdFID0gIkN5dGhvbiIKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5h
dGl2ZXNkayIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQxYzBjZmQyZDc1NGUzODNjOWVlYjk1
ZWZmYzlhYTRhYjg0N2QwYzk3NDcwNzdkZGQ3YzBkY2I2OGMzYmMwMWYiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiOTU5NDgxOGRjYThiYjIyYWU2NTgwYzUyMjJkYTJiYzVjYzMyMzM0MzUwYmQyZDI5
NGEwMGQ4NjY5YmNjNjFiNSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIkN5dGhvbi0oP1A8cHZl
cj4uKilcLnRhciIKIAogaW5oZXJpdCBweXBpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzAuMjkuMzYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggNjcl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob25f
MC4yOS4zNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWN5dGhvbl8zLjAuMi5iYgppbmRleCA3OGJlMmI5NGVkLi5jMWU4YmVjODFjIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzAuMjkuMzYuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjAuMi5i
YgpAQCAtMSwzICsxLDI0IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMg
aGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcg
aXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4
dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1t
YXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1V
cGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFy
cyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS50eHQKKyMg
KysrIExJQ0VOU0UudHh0CisjIEBAIC0xLDYgKzEsNiBAQAorIyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgQXBhY2hlIExpY2Vuc2UKKyMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFZlcnNpb24gMi4wLCBKYW51YXJ5IDIwMDQKKyMgLSAgICAgICAgICAgICAgICAgICAgICAg
IGh0dHA6Ly93d3cuYXBhY2hlLm9yZy9saWNlbnNlcy8KKyMgKyAgICAgICAgICAgICAgICAgICAg
ICAgIGh0dHBzOi8vd3d3LmFwYWNoZS5vcmcvbGljZW5zZXMvCisjICAKKyMgICAgIFRFUk1TIEFO
RCBDT05ESVRJT05TIEZPUiBVU0UsIFJFUFJPRFVDVElPTiwgQU5EIERJU1RSSUJVVElPTgorIyAg
CisjIAorIworCiBpbmhlcml0IHNldHVwdG9vbHMzCiByZXF1aXJlIHB5dGhvbi1jeXRob24uaW5j
CiAKLS0gCjIuMzkuMgoK

--===============8817499344218287051==--

