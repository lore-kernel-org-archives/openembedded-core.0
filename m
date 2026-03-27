Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040BF10BA437
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:04:01 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68203.1774598633562874932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YXiba0NT;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486507134e4so21134535e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774598631; x=1775203431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=onbrd7StSKvua33/wOIp/s6Ph/0e1QBG/SO6nXNXijM=;
        b=YXiba0NTZfSQPayAIzVvMvPRK8/O+wfLLn/GEPFAqaVbc5tog0IEwx7owYkRU2IWqO
         fFpZ3xakL0FkzNfW2acWQUkpdO6MTyjNnPIgQiJBwFO61az5xkg9A3XbWmT2mpoAnpTM
         Mr62/UkT2tvjav6lB5+Rk8gcPcH6oyl5xHFls6CsMWm01/A8C0hHu7znSQoLbPaJcWE/
         FPRLxJd+JcOkFA110i+y/aWkMY3gQ/0EU5+YHQcaLRJngeq81j4r+xC2qgXgMHfaVpYI
         NWPf5XQw6RnJGC71Cbl8yTa5gV5b0wuea6Oljk+BnC+l+TiMXC1+LbSPExsEID8wtpFf
         SHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598631; x=1775203431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onbrd7StSKvua33/wOIp/s6Ph/0e1QBG/SO6nXNXijM=;
        b=FEC4lbuUWv7ufbzXvSm6KtgBqXbPKNWzNTFtRernaYWYO0GRx5wBUicECbl5PXacFl
         JQoHB42pyUyMrqIwnHy3wM54PwBiFpS1OdLa1pz7s5EsnG86rC/y6CkNZfhQCdJ9jSxn
         Nxt25el3KAb56rhbpX3dvrOOslHTHfqVuFKrFlDlahDPCfBPBqOWB4yauu7lvjPIsDz4
         2Rmbg4iJBmEWfgWFTsuU4gzICvzBlv5kNmB3RFOKVRvp2xiGchGdSk16xzPcFgNC5rPB
         S4cFUFIcFJrP9v+IonLU55DkzXgW9ubrin9Q2AhhKrxwxZvX8QlkXKVkDoamZKKmd0XJ
         dU/g==
X-Gm-Message-State: AOJu0YwGUT5BzeBWl29DDO3m8Y0yxH4Omth/er/5KWo6zy6jxp7DVNZf
	BP7XoueM1Hi8gcStZ9PALKft8rVufhLr0YjdnU8OkGyrT7tNsKsqqJl8kP2aMQ==
X-Gm-Gg: ATEYQzxBSOpIsfo2z/XrVPO6CI5A6r/Yz0U3p9zMkQmIewG4YBr/LSrH5En5GtzBELe
	VRhQoryefkIfRcdn8PMvF4PWRIIy+VCsNPGC0Po/9wHklRnigpQFkhRUFjfpYOZvkO+ecZtKJmh
	IPkMlmYTceMWz8wN6BZ0j4HvZJpALMjw1xg/XZYQYAttNr6rG6KRfojDNLDZQFbDeXzL6PBRQkj
	6h3KjOq8pwj1KIcKKKJHCyptNVw1eTjtttn5EvFXpei1YonJYUjufgVK6ysQwNGSnQ8yFKtbtxo
	vLpsR1KXTDOM76lHTS3l9prMLfI3k4Il56qHqzrj+C5YnInoGkmECvaFNULUcN/55Mp1LhUWWEC
	NNnEg3JOB10ZtOPH/5ajyrcTSO/hWvQb0v5rRFlvxOEqJDqoxI4PXmruGJGU3Y/SgGj+etxbjES
	ZX+WZK97JgoHqWFQ==
X-Received: by 2002:a05:600c:3b27:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-48727d5a252mr23388625e9.7.1774598631288;
        Fri, 27 Mar 2026 01:03:51 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c9f58fsm126386525e9.11.2026.03.27.01.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:03:50 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] python3: Fix manifest
Date: Fri, 27 Mar 2026 09:03:43 +0100
Message-ID: <20260327080343.422566-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234055

bitbake -c create_manifest failed with this error:

| ERROR:
| The following files were found in more than one package),
| this is likely to happen when new files are introduced after an upgrade,
| please check which package should get it,
|  modify the manifest accordingly and re-run the create_manifest task:
| ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpreters.*.so
| ${libdir}/python${PYTHON_MAJMIN}/string
| ${libdir}/python${PYTHON_MAJMIN}/string/__pycache__
| ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hmac.*.so

It needed a minimal hand-editing to make it work.

The first run of bitbake -c create_manifest then moved some things
around. The second run created an identical manifest.

Noticed while working on the free-threading enablement.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3/python3-manifest.json      | 90 +++++++++++++------
 1 file changed, 64 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 11ce2c97d2..23289ab8c5 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -98,7 +98,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/*/test",
             "${libdir}/python${PYTHON_MAJMIN}/*/tests",
-            "${libdir}/python${PYTHON_MAJMIN}/idlelib/idle_test/",
+            "${libdir}/python${PYTHON_MAJMIN}/idlelib/idle_test",
             "${libdir}/python${PYTHON_MAJMIN}/test"
         ],
         "cached": []
@@ -117,7 +117,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/asyncio",
             "${libdir}/python${PYTHON_MAJMIN}/concurrent",
             "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_remote_debugging.*.so"
         ],
         "cached": []
     },
@@ -165,11 +166,12 @@
             "core"
         ],
         "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/compression",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/_common",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd",
             "${libdir}/python${PYTHON_MAJMIN}/gzip.py",
             "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/zipfile/",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zstd.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/zipfile"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
@@ -178,7 +180,7 @@
     },
     "core": {
         "summary": "Python interpreter and core modules",
-        "rdepends": ["compression"],
+        "rdepends": [],
         "files": [
             "${bindir}/python${PYTHON_MAJMIN}",
             "${bindir}/python${PYTHON_MAJMIN}.real",
@@ -213,6 +215,11 @@
             "${libdir}/python${PYTHON_MAJMIN}/codeop.py",
             "${libdir}/python${PYTHON_MAJMIN}/collections",
             "${libdir}/python${PYTHON_MAJMIN}/collections/abc.py",
+            "${libdir}/python${PYTHON_MAJMIN}/compression",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/_common",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/_streams.py",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd/_zstdfile.py",
             "${libdir}/python${PYTHON_MAJMIN}/configparser.py",
             "${libdir}/python${PYTHON_MAJMIN}/contextlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/copy.py",
@@ -252,11 +259,13 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bz2.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_heapq.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpreters.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lzma.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubprocess.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_struct.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_typing.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zstd.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/array.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/binascii.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so",
@@ -282,6 +291,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/pathlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/_local.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/_os.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/types.py",
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
@@ -324,16 +335,19 @@
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_ast_unparse.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_abc.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_colorize.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_opcode_metadata.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_py_warnings.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata*.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/abc.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/annotationlib.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",
@@ -403,6 +417,11 @@
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/__pycache__/pager.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__/abc.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/__pycache__/_streams.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd/__pycache__/_zstdfile.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/aliases.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/latin_1.*.pyc",
@@ -415,6 +434,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_abc.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_local.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_os.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/types.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_casefix.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_compiler.*.pyc",
@@ -446,6 +467,7 @@
     "ctypes": {
         "summary": "Python C types support",
         "rdepends": [
+            "compression",
             "core",
             "io",
             "math"
@@ -477,8 +499,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_strptime.py",
             "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
-            "${libdir}/python${PYTHON_MAJMIN}/datetime.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_datetime.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/datetime.py"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_strptime.*.pyc",
@@ -500,7 +521,15 @@
     "debugger": {
         "summary": "Python debugger",
         "rdepends": [
+            "asyncio",
+            "compression",
             "core",
+            "io",
+            "json",
+            "logging",
+            "math",
+            "netclient",
+            "numbers",
             "pprint",
             "shell",
             "stringold"
@@ -549,9 +578,17 @@
     "doctest": {
         "summary": "Python framework for running examples in docstrings",
         "rdepends": [
+            "asyncio",
+            "compression",
             "core",
             "debugger",
             "difflib",
+            "io",
+            "json",
+            "logging",
+            "math",
+            "netclient",
+            "numbers",
             "pprint",
             "shell",
             "stringold",
@@ -586,10 +623,13 @@
     "ensurepip": {
         "summary": "Support for bootstrapping the pip installer",
         "rdepends": [
-            "core"
+            "compression",
+            "core",
+            "io",
+            "math"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/ensurepip/"
+            "${libdir}/python${PYTHON_MAJMIN}/ensurepip"
         ],
         "cached": []
     },
@@ -598,9 +638,7 @@
         "rdepends": [
             "core"
         ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so"
-        ],
+        "files": [],
         "cached": []
     },
     "gdbm": {
@@ -649,6 +687,7 @@
     "io": {
         "summary": "Python low-level I/O",
         "rdepends": [
+            "compression",
             "core",
             "math",
             "netclient"
@@ -813,10 +852,12 @@
     "multiprocessing": {
         "summary": "Python multiprocessing support",
         "rdepends": [
+            "compression",
             "core",
             "crypt",
             "ctypes",
             "io",
+            "json",
             "math",
             "mmap",
             "netclient",
@@ -848,6 +889,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
             "${libdir}/python${PYTHON_MAJMIN}/http",
             "${libdir}/python${PYTHON_MAJMIN}/http/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hmac.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_uuid.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/mimetypes.py",
             "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
@@ -890,7 +932,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/contextvars.py",
             "${libdir}/python${PYTHON_MAJMIN}/decimal.py",
             "${libdir}/python${PYTHON_MAJMIN}/fractions.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/numbers.py"
         ],
@@ -999,8 +1040,7 @@
     "shell": {
         "summary": "Python shell-like functionality",
         "rdepends": [
-            "core",
-            "stringold"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/cmd.py",
@@ -1044,12 +1084,9 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/string/__init__.py",
-            "${libdir}/python${PYTHON_MAJMIN}/string/templatelib.py"
+            "${libdir}/python${PYTHON_MAJMIN}/string"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/string.*.pyc"
-        ]
+        "cached": []
     },
     "syslog": {
         "summary": "Python syslog interface",
@@ -1104,10 +1141,11 @@
     "tomllib": {
         "summary": "Provides an interface for parsing TOML",
         "rdepends": [
-            "core"
+            "core",
+            "datetime"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/tomllib/"
+            "${libdir}/python${PYTHON_MAJMIN}/tomllib"
         ],
         "cached": []
     },
@@ -1125,9 +1163,7 @@
             "stringold"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/unittest",
-            "${libdir}/python${PYTHON_MAJMIN}/unittest/",
-            "${libdir}/python${PYTHON_MAJMIN}/unittest/__pycache__"
+            "${libdir}/python${PYTHON_MAJMIN}/unittest"
         ],
         "cached": []
     },
@@ -1147,8 +1183,10 @@
     "venv": {
         "summary": "Provides support for creating lightweight virtual environments with their own site directories, optionally isolated from system site directories.",
         "rdepends": [
+            "compression",
             "core",
             "logging",
+            "shell",
             "stringold"
         ],
         "files": [
-- 
2.53.0


