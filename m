Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45903.1795624777951816941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=EZ0QY0g0;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A99352F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:34 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 432223F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624777; bh=ufrgWTwnsFWuaB7+xQjKsRxg2AeJrN5ZGmIVhL1edts=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EZ0QY0g0ZbpHD3+IQixcbBfOKQ+HF03eZ8gv/mVqwoKCZccCr6waA612yg0B3n7si
	 JJtDbqciD0ts+B10FX3ydgIefLEG8Qzyh7ATdlx0X0dU+HMehw4QysJGeQHM1uSmGu
	 2mdttZOltORlKkeFbWwLYz4PU5O6JRRUnevz68EQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/18] python3: move more files from -misc to -core
Date: Wed, 25 Nov 2026 16:39:19 +0000
Message-ID: <20261125163927.1835785-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251221
Content-Type: text/plain; charset="utf-8"

This is a selection of files that really should be in core, or are
sufficiently small that they don't need to be put into separate packages.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json            | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 8427b0fc101..6d6ee0c146c 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -200,9 +200,11 @@
             "${bindir}/python${PYTHON_MAJMIN}.real",
             "${bindir}/python3",
             "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
+            "${libdir}/python${PYTHON_MAJMIN}/LICENSE.txt",
             "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
             "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
             "${libdir}/python${PYTHON_MAJMIN}/UserString.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_*_support.py",
             "${libdir}/python${PYTHON_MAJMIN}/__future__.py",
             "${libdir}/python${PYTHON_MAJMIN}/_abcoll.py",
             "${libdir}/python${PYTHON_MAJMIN}/_ast_unparse.py",
@@ -212,6 +214,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/_markupbase.py",
             "${libdir}/python${PYTHON_MAJMIN}/_missing_stdlib_info.py",
             "${libdir}/python${PYTHON_MAJMIN}/_opcode_metadata.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_py_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/_py_warnings.py",
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl",
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/pager.py",
@@ -225,6 +228,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/ast.py",
             "${libdir}/python${PYTHON_MAJMIN}/base64.py",
             "${libdir}/python${PYTHON_MAJMIN}/bisect.py",
+            "${libdir}/python${PYTHON_MAJMIN}/build-details.json",
             "${libdir}/python${PYTHON_MAJMIN}/code.py",
             "${libdir}/python${PYTHON_MAJMIN}/codecs.py",
             "${libdir}/python${PYTHON_MAJMIN}/codeop.py",
@@ -242,12 +246,14 @@
             "${libdir}/python${PYTHON_MAJMIN}/encodings/latin_1.py",
             "${libdir}/python${PYTHON_MAJMIN}/encodings/utf_8.py",
             "${libdir}/python${PYTHON_MAJMIN}/enum.py",
+            "${libdir}/python${PYTHON_MAJMIN}/fileinput.py",
             "${libdir}/python${PYTHON_MAJMIN}/fnmatch.py",
             "${libdir}/python${PYTHON_MAJMIN}/functools.py",
             "${libdir}/python${PYTHON_MAJMIN}/genericpath.py",
             "${libdir}/python${PYTHON_MAJMIN}/getopt.py",
             "${libdir}/python${PYTHON_MAJMIN}/gettext.py",
             "${libdir}/python${PYTHON_MAJMIN}/glob.py",
+            "${libdir}/python${PYTHON_MAJMIN}/graphlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/heapq.py",
             "${libdir}/python${PYTHON_MAJMIN}/imp.py",
             "${libdir}/python${PYTHON_MAJMIN}/importlib",
@@ -282,8 +288,10 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/xreadlines.*.s=
o",
             "${libdir}/python${PYTHON_MAJMIN}/linecache.py",
             "${libdir}/python${PYTHON_MAJMIN}/locale.py",
+            "${libdir}/python${PYTHON_MAJMIN}/modulefinder.py",
             "${libdir}/python${PYTHON_MAJMIN}/new.py",
             "${libdir}/python${PYTHON_MAJMIN}/ntpath.py",
+            "${libdir}/python${PYTHON_MAJMIN}/nturl2path.py",
             "${libdir}/python${PYTHON_MAJMIN}/opcode.py",
             "${libdir}/python${PYTHON_MAJMIN}/operator.py",
             "${libdir}/python${PYTHON_MAJMIN}/optparse.py",
@@ -297,6 +305,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pyclbr.py",
             "${libdir}/python${PYTHON_MAJMIN}/quopri.py",
             "${libdir}/python${PYTHON_MAJMIN}/re",
             "${libdir}/python${PYTHON_MAJMIN}/re/_casefix.py",
@@ -309,6 +318,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/selectors.py",
             "${libdir}/python${PYTHON_MAJMIN}/shutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/signal.py",
+            "${libdir}/python${PYTHON_MAJMIN}/site-packages/",
             "${libdir}/python${PYTHON_MAJMIN}/site.py",
             "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py",
             "${libdir}/python${PYTHON_MAJMIN}/sre_compile.py",
@@ -320,9 +330,12 @@
             "${libdir}/python${PYTHON_MAJMIN}/struct.py",
             "${libdir}/python${PYTHON_MAJMIN}/subprocess.py",
             "${libdir}/python${PYTHON_MAJMIN}/symbol.py",
+            "${libdir}/python${PYTHON_MAJMIN}/symtable.py",
             "${libdir}/python${PYTHON_MAJMIN}/sysconfig",
             "${libdir}/python${PYTHON_MAJMIN}/sysconfig.py",
+            "${libdir}/python${PYTHON_MAJMIN}/tabnanny.py",
             "${libdir}/python${PYTHON_MAJMIN}/textwrap.py",
+            "${libdir}/python${PYTHON_MAJMIN}/this.py",
             "${libdir}/python${PYTHON_MAJMIN}/threading.py",
             "${libdir}/python${PYTHON_MAJMIN}/token.py",
             "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
--=20
2.43.0

