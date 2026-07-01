Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F61EC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 06:34:30 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39119.1782887651507933789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 23:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nBb3+nwV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=W//wSfUs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f1c629532-d134a9c2-f64c-40a8-8a19-c8d61bf7e88c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782887650;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xFI5dEiABknanOpB3jlP+jXH+RwZXfdcEVzgITJBQfQ=;
	b=nBb3+nwVb6W6eehoJ7F1gMqcTsOR5YwzzsjlmgcxvedosEX6JheQOas5YnWguWOg
	MZUrYIaf8hAfkr4eok5sxj+rE2CJxUMUOCDM9NcqoD+mqbKqn7jZ2MMxePfIr+JbYlr
	vvRK+YVo+7SzO+SYEexCfFrrDoRY+T/g+VL684GM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782887650;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xFI5dEiABknanOpB3jlP+jXH+RwZXfdcEVzgITJBQfQ=;
	b=W//wSfUsHrsvajGVQ5HpDeYzTAiPoJvByDtgikwQRxdSNwGT//qyqCUm1fWJ/r9j
	KHt9GxoxWysSLvPaPX7hGL0s03moZuW4U3eDrKw3rKETA9F6hUTapzQhstjBBjMEQye
	9nWe5TEjxwpvKdq/tO1F0mwk7/RfEJuMpnGHplWA=
Content-Type: multipart/mixed; boundary="===============8969663770299840450=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.2.8 SUCCEEDED
Message-ID: <0101019f1c629532-d134a9c2-f64c-40a8-8a19-c8d61bf7e88c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jul 2026 06:34:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 06:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239933

--===============8969663770299840450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cython* to *3.2.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.2.5-3.2.8.patch
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
From c3cda2336b37f2c3bcd2646012d5f2ceef6be20f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jul 2026 05:55:14 +0000
Subject: [PATCH] python3-cython: upgrade 3.2.5 -> 3.2.8

---
 ...ule-Use-SharedUtilitySourceDescripto.patch | 94 -------------------
 ...ictable-build-path-prefix-with-hardc.patch |  4 +-
 ...ython_3.2.5.bb => python3-cython_3.2.8.bb} |  7 +-
 3 files changed, 4 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-cython/0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch
 rename meta/recipes-devtools/python/{python3-cython_3.2.5.bb => python3-cython_3.2.8.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch b/meta/recipes-devtools/python/python3-cython/0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch
deleted file mode 100644
index b57acb6969..0000000000
--- a/meta/recipes-devtools/python/python3-cython/0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From f3cfdebd75374a29a930687c1f126282c51b7a92 Mon Sep 17 00:00:00 2001
-From: mv-python <matusvalo@users.noreply.github.com>
-Date: Fri, 12 Jun 2026 10:32:42 +0200
-Subject: [PATCH] [3.2.x] Shared module: Use `SharedUtilitySourceDescriptor`
- instead of temporary directory (#7723) (GH-7739)
-
-This PR uses `SharedUtilitySourceDescriptor` instead of an empty pyx
-file in the temp dir. This simplifies the logic and also assures that
-`__pyx_f` is unchanged across builds.
-
-Backport of https://github.com/cython/cython/pull/7723
-Alternative to https://github.com/cython/cython/pull/7634
-
-Upstream-Status: Backport [https://github.com/cython/cython/commit/f3cfdebd75374a29a930687c1f126282c51b7a92]
-
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- Cython/Build/SharedModule.py | 25 ++++++++-----------------
- Cython/Compiler/Scanning.py  |  9 +++++++++
- 2 files changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/Cython/Build/SharedModule.py b/Cython/Build/SharedModule.py
-index fed6263cd..45da4b462 100644
---- a/Cython/Build/SharedModule.py
-+++ b/Cython/Build/SharedModule.py
-@@ -1,13 +1,10 @@
- import os
--import re
--import shutil
--import tempfile
- 
- from Cython.Compiler import (
-     MemoryView, Code, Options, Pipeline, Errors, Main, Symtab
- )
- from Cython.Compiler.StringEncoding import EncodedString
--from Cython.Compiler.Scanning import FileSourceDescriptor
-+from Cython.Compiler.Scanning import SharedUtilitySourceDescriptor
- 
- 
- def create_shared_library_pipeline(context, scope, options, result):
-@@ -72,23 +69,17 @@ def generate_shared_module(options):
-     Errors.open_listing_file(None)
- 
-     dest_c_file = options.shared_c_file_path
-+    pyx_file = os.path.splitext(dest_c_file)[0] + '.pyx'
-     module_name = os.path.splitext(os.path.basename(dest_c_file))[0]
- 
-     context = Main.Context.from_options(options)
-     scope = Symtab.ModuleScope('MemoryView', parent_module = None, context = context, is_package=False)
- 
--    with tempfile.TemporaryDirectory() as tmpdirname:
--        pyx_file = os.path.join(tmpdirname, f'{module_name}.pyx')
--        c_file = os.path.join(tmpdirname, f'{module_name}.c')
--        with open(pyx_file, 'w'):
--            pass
--        source_desc = FileSourceDescriptor(pyx_file)
--        comp_src = Main.CompilationSource(source_desc, EncodedString(module_name), os.getcwd())
--        result = Main.create_default_resultobj(comp_src, options)
--
--        pipeline = create_shared_library_pipeline(context, scope, options, result)
--        err, enddata = Pipeline.run_pipeline(pipeline, comp_src)
--        if err is None:
--            shutil.copy(c_file, dest_c_file)
-+    source_desc = SharedUtilitySourceDescriptor(pyx_file)
-+    comp_src = Main.CompilationSource(source_desc, EncodedString(module_name), os.getcwd())
-+    result = Main.create_default_resultobj(comp_src, options)
-+
-+    pipeline = create_shared_library_pipeline(context, scope, options, result)
-+    err, enddata = Pipeline.run_pipeline(pipeline, comp_src)
- 
-     return err, enddata
-diff --git a/Cython/Compiler/Scanning.py b/Cython/Compiler/Scanning.py
-index 2a8cb5a93..4cec7d1ed 100644
---- a/Cython/Compiler/Scanning.py
-+++ b/Cython/Compiler/Scanning.py
-@@ -281,6 +281,15 @@ class StringSourceDescriptor(SourceDescriptor):
-         return "<StringSourceDescriptor:%s>" % self.name
- 
- 
-+class SharedUtilitySourceDescriptor(FileSourceDescriptor):
-+    """
-+    A specialized source descriptor for shared utility code only. Not part of public API.
-+    """
-+
-+    def get_file_object(self, encoding=None, error_handling=None):
-+        from io import StringIO
-+        return StringIO('')
-+
- #------------------------------------------------------------------
- 
- class PyrexScanner(Scanner):
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index fad7f28a60..573a53ee56 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From 949e3c185719c37b3a3e4c11664db16533f51dc8 Mon Sep 17 00:00:00 2001
+From a3b9d4303b6aaf5ef2ce9ffd1ba42a93f9cc68e0 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Sep 2025 01:42:08 -0700
 Subject: [PATCH] Replace not predictable build path prefix with hardcode
@@ -53,7 +53,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
-index 30e67aa..ade6a7f 100644
+index 34f1b32..b09350b 100644
 --- a/Cython/Compiler/ModuleNode.py
 +++ b/Cython/Compiler/ModuleNode.py
 @@ -877,7 +877,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.5.bb b/meta/recipes-devtools/python/python3-cython_3.2.8.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-cython_3.2.5.bb
rename to meta/recipes-devtools/python/python3-cython_3.2.8.bb
index 8bd68bd4df..e899fc411f 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.5.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.8.bb
@@ -7,14 +7,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "3dd42e4cf36ad15f265bdfec2337cc00c688c8eb6d374ffd13bb19437c27bba1"
+SRC_URI[sha256sum] = "f4f23a56b25221a06f91817fe8f3114ab8b48a4fac73187dbb64bc2c4a87961f"
 
 inherit pypi setuptools3 cython
 
-SRC_URI += " \
-    file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch \
-    file://0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch \
-"
+SRC_URI += "file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch"
 
 # No need to depend on self
 DEPENDS:remove = "python3-cython-native"
-- 
2.47.1


--===============8969663770299840450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cython/cython-3.2.5.tar.gz;downloadfilename=cython-3.2.5.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch file://0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch" to "https://files.pythonhosted.org/packages/source/c/cython/cython-3.2.8.tar.gz;downloadfilename=cython-3.2.8.tar.gz file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch"
packages/x86-64-v3-poky-linux/python3-cython: PKGV changed from 3.2.5 [default] to 3.2.8 [default]
packages/x86-64-v3-poky-linux/python3-cython: PV changed from "3.2.5" to "3.2.8"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.2.5 [default] to 3.2.8 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 27195832 to 27360992 (+1%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.2.5" to "3.2.8"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.2.5 [default] to 3.2.8 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.2.5" to "3.2.8"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.2.5 [default] to 3.2.8 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.2.5" to "3.2.8"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.2.5 [default] to 3.2.8 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.2.5" to "3.2.8"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: FILELIST: directory renamed /usr/src/debug/python3-cython/3.2.5/Cython/Compiler -> /usr/src/debug/python3-cython/3.2.8/Cython/Compiler, directory renamed /usr/src/debug/python3-cython/3.2.5/Cython -> /usr/src/debug/python3-cython/3.2.8/Cython, directory renamed /usr/src/debug/python3-cython/3.2.5/Cython/Plex -> /usr/src/debug/python3-cython/3.2.8/Cython/Plex, directory renamed /usr/src/debug/python3-cython/3.2.5/Cython/Runtime -> /usr/src/debug/python3-cython/3.2.8/Cython/Runtime, directory renamed /usr/src/debug/python3-cython/3.2.5/Cython/Tempita -> /usr/src/debug/python3-cython/3.2.8/Cython/Tempita
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.2.5 [default] to 3.2.8 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 23750503 to 23843733 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-src: PV changed from "3.2.5" to "3.2.8"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.2.5 [default] to 3.2.8 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.2.5" to "3.2.8"
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info -> /usr/lib/python3.14/site-packages/cython-3.2.8.dist-info
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGV changed from 3.2.5 [default] to 3.2.8 [default]
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 15324052 to 15359439 (+0%)
packages/x86-64-v3-poky-linux/python3-cython/python3-cython: PV changed from "3.2.5" to "3.2.8"
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info moved to /usr/lib/python3.14/site-packages/cython-3.2.8.dist-info

--===============8969663770299840450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cython/python3-cython: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info -> /usr/lib/python3.14/site-packages/cython-3.2.8.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.14/site-packages/cython-3.2.5.dist-info moved to /usr/lib/python3.14/site-packages/cython-3.2.8.dist-info

--===============8969663770299840450==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.2.5-3.2.8.patch"

RnJvbSBjM2NkYTIzMzZiMzdmMmMzYmNkMjY0NjAxMmQ1ZjJjZWVmNmJlMjBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKdWwgMjAyNiAwNTo1NToxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3l0aG9uOiB1cGdyYWRlIDMuMi41IC0+IDMuMi44CgotLS0KIC4uLnVsZS1Vc2UtU2hh
cmVkVXRpbGl0eVNvdXJjZURlc2NyaXB0by5wYXRjaCB8IDk0IC0tLS0tLS0tLS0tLS0tLS0tLS0K
IC4uLmljdGFibGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaCB8ICA0ICstCiAu
Li55dGhvbl8zLjIuNS5iYiA9PiBweXRob24zLWN5dGhvbl8zLjIuOC5iYn0gfCAgNyArLQogMyBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEwMSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAw
MDEtMy4yLngtU2hhcmVkLW1vZHVsZS1Vc2UtU2hhcmVkVXRpbGl0eVNvdXJjZURlc2NyaXB0by5w
YXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY3l0aG9u
XzMuMi41LmJiID0+IHB5dGhvbjMtY3l0aG9uXzMuMi44LmJifSAoODMlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob24vMDAwMS0zLjIueC1T
aGFyZWQtbW9kdWxlLVVzZS1TaGFyZWRVdGlsaXR5U291cmNlRGVzY3JpcHRvLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbi8wMDAxLTMuMi54LVNoYXJl
ZC1tb2R1bGUtVXNlLVNoYXJlZFV0aWxpdHlTb3VyY2VEZXNjcmlwdG8ucGF0Y2gKZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IGI1N2FjYjY5NjkuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbi8wMDAxLTMuMi54LVNoYXJlZC1t
b2R1bGUtVXNlLVNoYXJlZFV0aWxpdHlTb3VyY2VEZXNjcmlwdG8ucGF0Y2gKKysrIC9kZXYvbnVs
bApAQCAtMSw5NCArMCwwIEBACi1Gcm9tIGYzY2ZkZWJkNzUzNzRhMjlhOTMwNjg3YzFmMTI2Mjgy
YzUxYjdhOTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBtdi1weXRob24gPG1hdHVz
dmFsb0B1c2Vycy5ub3JlcGx5LmdpdGh1Yi5jb20+Ci1EYXRlOiBGcmksIDEyIEp1biAyMDI2IDEw
OjMyOjQyICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIFszLjIueF0gU2hhcmVkIG1vZHVsZTogVXNl
IGBTaGFyZWRVdGlsaXR5U291cmNlRGVzY3JpcHRvcmAKLSBpbnN0ZWFkIG9mIHRlbXBvcmFyeSBk
aXJlY3RvcnkgKCM3NzIzKSAoR0gtNzczOSkKLQotVGhpcyBQUiB1c2VzIGBTaGFyZWRVdGlsaXR5
U291cmNlRGVzY3JpcHRvcmAgaW5zdGVhZCBvZiBhbiBlbXB0eSBweXgKLWZpbGUgaW4gdGhlIHRl
bXAgZGlyLiBUaGlzIHNpbXBsaWZpZXMgdGhlIGxvZ2ljIGFuZCBhbHNvIGFzc3VyZXMgdGhhdAot
YF9fcHl4X2ZgIGlzIHVuY2hhbmdlZCBhY3Jvc3MgYnVpbGRzLgotCi1CYWNrcG9ydCBvZiBodHRw
czovL2dpdGh1Yi5jb20vY3l0aG9uL2N5dGhvbi9wdWxsLzc3MjMKLUFsdGVybmF0aXZlIHRvIGh0
dHBzOi8vZ2l0aHViLmNvbS9jeXRob24vY3l0aG9uL3B1bGwvNzYzNAotCi1VcHN0cmVhbS1TdGF0
dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20vY3l0aG9uL2N5dGhvbi9jb21taXQvZjNj
ZmRlYmQ3NTM3NGEyOWE5MzA2ODdjMWYxMjYyODJjNTFiN2E5Ml0KLQotU2lnbmVkLW9mZi1ieTog
WmhpeGlvbmcgQ2hpIDx6aGl4aW9uZy5jaGlAd2luZHJpdmVyLmNvbT4KLS0tLQotIEN5dGhvbi9C
dWlsZC9TaGFyZWRNb2R1bGUucHkgfCAyNSArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCi0gQ3l0
aG9uL0NvbXBpbGVyL1NjYW5uaW5nLnB5ICB8ICA5ICsrKysrKysrKwotIDIgZmlsZXMgY2hhbmdl
ZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9DeXRo
b24vQnVpbGQvU2hhcmVkTW9kdWxlLnB5IGIvQ3l0aG9uL0J1aWxkL1NoYXJlZE1vZHVsZS5weQot
aW5kZXggZmVkNjI2M2NkLi40NWRhNGI0NjIgMTAwNjQ0Ci0tLS0gYS9DeXRob24vQnVpbGQvU2hh
cmVkTW9kdWxlLnB5Ci0rKysgYi9DeXRob24vQnVpbGQvU2hhcmVkTW9kdWxlLnB5Ci1AQCAtMSwx
MyArMSwxMCBAQAotIGltcG9ydCBvcwotLWltcG9ydCByZQotLWltcG9ydCBzaHV0aWwKLS1pbXBv
cnQgdGVtcGZpbGUKLSAKLSBmcm9tIEN5dGhvbi5Db21waWxlciBpbXBvcnQgKAotICAgICBNZW1v
cnlWaWV3LCBDb2RlLCBPcHRpb25zLCBQaXBlbGluZSwgRXJyb3JzLCBNYWluLCBTeW10YWIKLSAp
Ci0gZnJvbSBDeXRob24uQ29tcGlsZXIuU3RyaW5nRW5jb2RpbmcgaW1wb3J0IEVuY29kZWRTdHJp
bmcKLS1mcm9tIEN5dGhvbi5Db21waWxlci5TY2FubmluZyBpbXBvcnQgRmlsZVNvdXJjZURlc2Ny
aXB0b3IKLStmcm9tIEN5dGhvbi5Db21waWxlci5TY2FubmluZyBpbXBvcnQgU2hhcmVkVXRpbGl0
eVNvdXJjZURlc2NyaXB0b3IKLSAKLSAKLSBkZWYgY3JlYXRlX3NoYXJlZF9saWJyYXJ5X3BpcGVs
aW5lKGNvbnRleHQsIHNjb3BlLCBvcHRpb25zLCByZXN1bHQpOgotQEAgLTcyLDIzICs2OSwxNyBA
QCBkZWYgZ2VuZXJhdGVfc2hhcmVkX21vZHVsZShvcHRpb25zKToKLSAgICAgRXJyb3JzLm9wZW5f
bGlzdGluZ19maWxlKE5vbmUpCi0gCi0gICAgIGRlc3RfY19maWxlID0gb3B0aW9ucy5zaGFyZWRf
Y19maWxlX3BhdGgKLSsgICAgcHl4X2ZpbGUgPSBvcy5wYXRoLnNwbGl0ZXh0KGRlc3RfY19maWxl
KVswXSArICcucHl4JwotICAgICBtb2R1bGVfbmFtZSA9IG9zLnBhdGguc3BsaXRleHQob3MucGF0
aC5iYXNlbmFtZShkZXN0X2NfZmlsZSkpWzBdCi0gCi0gICAgIGNvbnRleHQgPSBNYWluLkNvbnRl
eHQuZnJvbV9vcHRpb25zKG9wdGlvbnMpCi0gICAgIHNjb3BlID0gU3ltdGFiLk1vZHVsZVNjb3Bl
KCdNZW1vcnlWaWV3JywgcGFyZW50X21vZHVsZSA9IE5vbmUsIGNvbnRleHQgPSBjb250ZXh0LCBp
c19wYWNrYWdlPUZhbHNlKQotIAotLSAgICB3aXRoIHRlbXBmaWxlLlRlbXBvcmFyeURpcmVjdG9y
eSgpIGFzIHRtcGRpcm5hbWU6Ci0tICAgICAgICBweXhfZmlsZSA9IG9zLnBhdGguam9pbih0bXBk
aXJuYW1lLCBmJ3ttb2R1bGVfbmFtZX0ucHl4JykKLS0gICAgICAgIGNfZmlsZSA9IG9zLnBhdGgu
am9pbih0bXBkaXJuYW1lLCBmJ3ttb2R1bGVfbmFtZX0uYycpCi0tICAgICAgICB3aXRoIG9wZW4o
cHl4X2ZpbGUsICd3Jyk6Ci0tICAgICAgICAgICAgcGFzcwotLSAgICAgICAgc291cmNlX2Rlc2Mg
PSBGaWxlU291cmNlRGVzY3JpcHRvcihweXhfZmlsZSkKLS0gICAgICAgIGNvbXBfc3JjID0gTWFp
bi5Db21waWxhdGlvblNvdXJjZShzb3VyY2VfZGVzYywgRW5jb2RlZFN0cmluZyhtb2R1bGVfbmFt
ZSksIG9zLmdldGN3ZCgpKQotLSAgICAgICAgcmVzdWx0ID0gTWFpbi5jcmVhdGVfZGVmYXVsdF9y
ZXN1bHRvYmooY29tcF9zcmMsIG9wdGlvbnMpCi0tCi0tICAgICAgICBwaXBlbGluZSA9IGNyZWF0
ZV9zaGFyZWRfbGlicmFyeV9waXBlbGluZShjb250ZXh0LCBzY29wZSwgb3B0aW9ucywgcmVzdWx0
KQotLSAgICAgICAgZXJyLCBlbmRkYXRhID0gUGlwZWxpbmUucnVuX3BpcGVsaW5lKHBpcGVsaW5l
LCBjb21wX3NyYykKLS0gICAgICAgIGlmIGVyciBpcyBOb25lOgotLSAgICAgICAgICAgIHNodXRp
bC5jb3B5KGNfZmlsZSwgZGVzdF9jX2ZpbGUpCi0rICAgIHNvdXJjZV9kZXNjID0gU2hhcmVkVXRp
bGl0eVNvdXJjZURlc2NyaXB0b3IocHl4X2ZpbGUpCi0rICAgIGNvbXBfc3JjID0gTWFpbi5Db21w
aWxhdGlvblNvdXJjZShzb3VyY2VfZGVzYywgRW5jb2RlZFN0cmluZyhtb2R1bGVfbmFtZSksIG9z
LmdldGN3ZCgpKQotKyAgICByZXN1bHQgPSBNYWluLmNyZWF0ZV9kZWZhdWx0X3Jlc3VsdG9iaihj
b21wX3NyYywgb3B0aW9ucykKLSsKLSsgICAgcGlwZWxpbmUgPSBjcmVhdGVfc2hhcmVkX2xpYnJh
cnlfcGlwZWxpbmUoY29udGV4dCwgc2NvcGUsIG9wdGlvbnMsIHJlc3VsdCkKLSsgICAgZXJyLCBl
bmRkYXRhID0gUGlwZWxpbmUucnVuX3BpcGVsaW5lKHBpcGVsaW5lLCBjb21wX3NyYykKLSAKLSAg
ICAgcmV0dXJuIGVyciwgZW5kZGF0YQotZGlmZiAtLWdpdCBhL0N5dGhvbi9Db21waWxlci9TY2Fu
bmluZy5weSBiL0N5dGhvbi9Db21waWxlci9TY2FubmluZy5weQotaW5kZXggMmE4Y2I1YTkzLi40
Y2VjN2QxZWQgMTAwNjQ0Ci0tLS0gYS9DeXRob24vQ29tcGlsZXIvU2Nhbm5pbmcucHkKLSsrKyBi
L0N5dGhvbi9Db21waWxlci9TY2FubmluZy5weQotQEAgLTI4MSw2ICsyODEsMTUgQEAgY2xhc3Mg
U3RyaW5nU291cmNlRGVzY3JpcHRvcihTb3VyY2VEZXNjcmlwdG9yKToKLSAgICAgICAgIHJldHVy
biAiPFN0cmluZ1NvdXJjZURlc2NyaXB0b3I6JXM+IiAlIHNlbGYubmFtZQotIAotIAotK2NsYXNz
IFNoYXJlZFV0aWxpdHlTb3VyY2VEZXNjcmlwdG9yKEZpbGVTb3VyY2VEZXNjcmlwdG9yKToKLSsg
ICAgIiIiCi0rICAgIEEgc3BlY2lhbGl6ZWQgc291cmNlIGRlc2NyaXB0b3IgZm9yIHNoYXJlZCB1
dGlsaXR5IGNvZGUgb25seS4gTm90IHBhcnQgb2YgcHVibGljIEFQSS4KLSsgICAgIiIiCi0rCi0r
ICAgIGRlZiBnZXRfZmlsZV9vYmplY3Qoc2VsZiwgZW5jb2Rpbmc9Tm9uZSwgZXJyb3JfaGFuZGxp
bmc9Tm9uZSk6Ci0rICAgICAgICBmcm9tIGlvIGltcG9ydCBTdHJpbmdJTwotKyAgICAgICAgcmV0
dXJuIFN0cmluZ0lPKCcnKQotKwotICMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLSAKLSBjbGFzcyBQeXJleFNjYW5uZXIo
U2Nhbm5lcik6Ci0tLSAKLTIuNDMuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uLzAwMDEtUmVwbGFjZS1ub3QtcHJlZGljdGFibGUtYnVp
bGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jeXRob24vMDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1w
YXRoLXByZWZpeC13aXRoLWhhcmRjLnBhdGNoCmluZGV4IGZhZDdmMjhhNjAuLjU3M2E1M2VlNTYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob24v
MDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1wYXRoLXByZWZpeC13aXRoLWhhcmRj
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob24v
MDAwMS1SZXBsYWNlLW5vdC1wcmVkaWN0YWJsZS1idWlsZC1wYXRoLXByZWZpeC13aXRoLWhhcmRj
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5NDllM2MxODU3MTljMzdiM2EzZTRjMTE2NjRk
YjE2NTMzZjUxZGM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhM2I5ZDQzMDNiNmFh
ZjVlZjJjZTlmZmQxYmE0MmE5M2Y5Y2M2OGUwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAxNyBT
ZXAgMjAyNSAwMTo0MjowOCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBSZXBsYWNlIG5vdCBwcmVk
aWN0YWJsZSBidWlsZCBwYXRoIHByZWZpeCB3aXRoIGhhcmRjb2RlCkBAIC01Myw3ICs1Myw3IEBA
IFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9DeXRob24vQ29tcGlsZXIvTW9kdWxlTm9kZS5weSBiL0N5dGhvbi9Db21waWxlci9Nb2R1
bGVOb2RlLnB5Ci1pbmRleCAzMGU2N2FhLi5hZGU2YTdmIDEwMDY0NAoraW5kZXggMzRmMWIzMi4u
YjA5MzUwYiAxMDA2NDQKIC0tLSBhL0N5dGhvbi9Db21waWxlci9Nb2R1bGVOb2RlLnB5CiArKysg
Yi9DeXRob24vQ29tcGlsZXIvTW9kdWxlTm9kZS5weQogQEAgLTg3Nyw3ICs4NzcsOSBAQCBjbGFz
cyBNb2R1bGVOb2RlKE5vZGVzLk5vZGUsIE5vZGVzLkJsb2NrTm9kZSk6CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMi41LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjIuOC5iYgpzaW1pbGFy
aXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY3l0aG9uXzMuMi41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3l0aG9uXzMuMi44LmJiCmluZGV4IDhiZDY4YmQ0ZGYuLmU4OTlmYzQxMWYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jeXRob25f
My4yLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhv
bl8zLjIuOC5iYgpAQCAtNywxNCArNywxMSBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJ
Q0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Uu
dHh0O21kNT02MWMzZWU4OTYxNTc1ODYxZmE4NmM3ZTYyYmM5ZjY5YyIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjNkZDQyZTRjZjM2YWQxNWYyNjViZGZlYzIzMzdjYzAwYzY4OGM4ZWI2ZDM3NGZm
ZDEzYmIxOTQzN2MyN2JiYTEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjRmMjNhNTZiMjUyMjFh
MDZmOTE4MTdmZThmMzExNGFiOGI0OGE0ZmFjNzMxODdkYmI2NGJjMmM0YTg3OTYxZiIKIAogaW5o
ZXJpdCBweXBpIHNldHVwdG9vbHMzIGN5dGhvbgogCi1TUkNfVVJJICs9ICIgXAotICAgIGZpbGU6
Ly8wMDAxLVJlcGxhY2Utbm90LXByZWRpY3RhYmxlLWJ1aWxkLXBhdGgtcHJlZml4LXdpdGgtaGFy
ZGMucGF0Y2ggXAotICAgIGZpbGU6Ly8wMDAxLTMuMi54LVNoYXJlZC1tb2R1bGUtVXNlLVNoYXJl
ZFV0aWxpdHlTb3VyY2VEZXNjcmlwdG8ucGF0Y2ggXAotIgorU1JDX1VSSSArPSAiZmlsZTovLzAw
MDEtUmVwbGFjZS1ub3QtcHJlZGljdGFibGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5w
YXRjaCIKIAogIyBObyBuZWVkIHRvIGRlcGVuZCBvbiBzZWxmCiBERVBFTkRTOnJlbW92ZSA9ICJw
eXRob24zLWN5dGhvbi1uYXRpdmUiCi0tIAoyLjQ3LjEKCg==

--===============8969663770299840450==--

