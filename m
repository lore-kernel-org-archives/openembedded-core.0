Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADD610BA44B
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:21 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68447.1774600271530874094
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NRoAxj8Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fd27754bso17097365e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774600270; x=1775205070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUGRtzLDwQZ+0u4KIpWHI8dtA8R1IabR/Vm7eTi/EII=;
        b=NRoAxj8QaFTkrrOWEo/2xNlzvyq4juzsWFP8d41hcwvE2Gr1fmkkV5idub1CDGLvGE
         xvosWAhKL0dahwBEM0beJuM7vdTNkoUpWlc0qoeUpdispdt9Ga4mUj6ADRWQXN1Zo1nH
         iDp78+uMLoxRWxX56J9+q7c41sAlvn8+FlRiA40Xw1FklZM/jc4C+2uC1l5fdzbpLt39
         VP9AVI8/LjYphCuDrpyFolpsP7N4MagU0P17s9qLlXbwVq1hqqiPjeqN8G/Zo5RkVaHV
         oy5j8HwKQr2vq02P++3u5YXFg1WduPg2ZP8SBVF3x8ux4jEymP1/JzBRi/lE65iswUK2
         AuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600270; x=1775205070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mUGRtzLDwQZ+0u4KIpWHI8dtA8R1IabR/Vm7eTi/EII=;
        b=pltksODcwsyeWkq/veXIbAZnsLPDcjx4/LwYBzxwZxLlgwLdJWHGKmDulVsCcbboS8
         53mhW7KyOB5ojOnlHewbYWuD0NWsUeTbFIF7KAhJgKwGxHZddmMlBazGPotzWl4u9+gV
         khMbI0aiXXFOBAQ5PasN7alJKnXeUhhDMk2B3yx6YeYmwt21HuEWExQleYbYDKs4G1Xz
         nle3FzWEbmE8zZDNEX3/TRfPB5KVPa5tsPRTqGIi06RyxARwYD1CCIy4ZDXBfgpEd4UJ
         wTKYmGvwoeVoKF19Z9MHEbVdlUg1finAkKMHV1quVgGata0tUqgQ3BY4SN9425uqdN42
         Y1qQ==
X-Gm-Message-State: AOJu0Yyyc0QV9JdXmjml6k896Qkw3eX+vgtl8KH5vxBqHCtKtQQGG4gT
	jx7mWYxlUIPoEaz6/aLrYl8EkpVRdgTBKJFJQMwzekWwy+7uTXysraNivHSwEQ==
X-Gm-Gg: ATEYQzzihNSFbwSYvyLOS171O+u9+iTrX06MuwAbcCAOenjQYShcV+YQ84NyPc3O92F
	DRNofRx2LjTuZFYlhsoLTSklFwwYMc5Cuk8ckwGZNA+ys3Ylmaeysv5BG5mWqUThd32DfWl6cAY
	+c8781Zjk2lXMKxvzqNdBqFPFnFGylYsTWJT3F8us0LaaKWpgClCE3FUL5u3G5NpCVvya93swOU
	2ix8l+hbESVmY1KHHjmKV+TJ3puSdRRF2fDr7TG7hrfxwzXT6VIuRZAMBGkIYn9C7JzZOqaYwK/
	f4qwRwqft0d9LJOqbcqQ8Oym41AreabfiMYBJsPwqtkaXn9jLuRG7j5syk67I0ja8bdf9+A8rJR
	Nx1t3ovvzeShHHfjFvAM1U0IlcDPdOOvBzLis6kRE7KK2N8b1K75e6lkhrp/2PBnCsGw4Cv1kU0
	sLg6C40aa8FFb1Fg==
X-Received: by 2002:a05:600c:8485:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-48727d733bfmr25517205e9.9.1774600268674;
        Fri, 27 Mar 2026 01:31:08 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm76411485e9.6.2026.03.27.01.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:08 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 03/12] python3: Use the variables from python3-dir.bbclass
Date: Fri, 27 Mar 2026 09:30:46 +0100
Message-ID: <20260327083055.12571-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327083055.12571-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260327083055.12571-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234059

Replace using PYTHON_MAJMIN and various custom constructed
settings with inherit python3-dir and its variables.

Adapted the manifest generator scripts and the manifest.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
v3: Rebased over the "bitbake -c create_manifest" fix

 .../python/python3/create_manifest3.py        |  10 +-
 .../python/python3/get_module_deps3.py        |   2 +-
 .../python/python3/python3-manifest.json      | 890 +++++++++---------
 .../recipes-devtools/python/python3_3.14.3.bb |  56 +-
 4 files changed, 479 insertions(+), 479 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index 288d5ede3a..6b254551a5 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -50,7 +50,7 @@ if '-d' in sys.argv:
 else:
     debugFlag = ''
 
-# Get python version from ${PYTHON_MAJMIN}
+# Get python version from ${PYTHON_MAINVERSION}
 pyversion = str(sys.argv[1])
 
 # Hack to get native python search path (for folders), not fond of it but it works for now
@@ -71,7 +71,7 @@ hasfolders = []
 allfolders = []
 
 def isFolder(value):
-    value = value.replace('${PYTHON_MAJMIN}',pyversion)
+    value = value.replace('${PYTHON_MAINVERSION}',pyversion)
     if os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib64')) or os.path.isdir(value.replace('${libdir}',nativelibfolder+'/usr/lib32')):
         return True
     else:
@@ -122,7 +122,7 @@ print_indent('Getting dependencies for package: core', 0)
 
 output = subprocess.check_output([sys.executable, 'get_module_deps3.py', 'python-core-package', '%s' % debugFlag]).decode('utf8')
 for coredep in output.split():
-    coredep = coredep.replace(pyversion,'${PYTHON_MAJMIN}')
+    coredep = coredep.replace(pyversion,'${PYTHON_MAINVERSION}')
     if isCached(coredep):
         if coredep not in old_manifest['core']['cached']:
             old_manifest['core']['cached'].append(coredep)
@@ -173,7 +173,7 @@ for filedep in old_manifest['core']['files']:
 
 
     for pymodule_dep in output.split():
-        pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN}')
+        pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAINVERSION}')
 
         if isCached(pymodule_dep):
             if pymodule_dep not in old_manifest['core']['cached']:
@@ -318,7 +318,7 @@ for pypkg in old_manifest:
             #   is folder_string inside path/folder1/folder2/filename?, 
             #   Yes, it works, but we waste a couple of milliseconds.
 
-            pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN}')
+            pymodule_dep = pymodule_dep.replace(pyversion,'${PYTHON_MAINVERSION}')
             inFolders = False
             for folder in allfolders:
                 # The module could have a directory named after it, e.g. xml, if we take out the filename from the path
diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
index 8e432b49af..8eb01e4091 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -116,7 +116,7 @@ for item in dif:
 
     # Site-customize is a special case since we (OpenEmbedded) put it there manually
     if 'sitecustomize' in dep_path:
-        dep_path = '${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py'
+        dep_path = '${libdir}/python${PYTHON_MAINVERSION}/sitecustomize.py'
         # Prints out result, which is what will be used by create_manifest
         print (dep_path)
         continue
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 23289ab8c5..ca58e57e57 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -19,7 +19,7 @@
 #     We want to add a web browser package, including the file webbrowser.py
 #     which at the moment is on python3-misc.
 #     "webbrowser": {
-#         "files": ["${libdir}/python${PYTHON_MAJMIN}/lib-dynload/webbrowser.py"],
+#         "files": ["${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/webbrowser.py"],
 #         "rdepends": [],
 #         "summary": "Python Web Browser support"}
 #
@@ -28,7 +28,7 @@
 #     We run $ bitbake python3 -c create_manifest and the resulting manifest
 #     should be completed after a few seconds, showing something like:
 #     "webbrowser": {
-#         "files": ["${libdir}/python${PYTHON_MAJMIN}/webbrowser.py"],
+#         "files": ["${libdir}/python${PYTHON_MAINVERSION}/webbrowser.py"],
 #         "rdepends": ["core","fcntl","io","pickle","shell","subprocess"],
 #         "summary": "Python Web Browser support"}
 #
@@ -96,10 +96,10 @@
             "modules"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/*/test",
-            "${libdir}/python${PYTHON_MAJMIN}/*/tests",
-            "${libdir}/python${PYTHON_MAJMIN}/idlelib/idle_test",
-            "${libdir}/python${PYTHON_MAJMIN}/test"
+            "${libdir}/python${PYTHON_MAINVERSION}/*/test",
+            "${libdir}/python${PYTHON_MAINVERSION}/*/tests",
+            "${libdir}/python${PYTHON_MAINVERSION}/idlelib/idle_test",
+            "${libdir}/python${PYTHON_MAINVERSION}/test"
         ],
         "cached": []
     },
@@ -114,11 +114,11 @@
             "stringold"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/asyncio",
-            "${libdir}/python${PYTHON_MAJMIN}/concurrent",
-            "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_remote_debugging.*.so"
+            "${libdir}/python${PYTHON_MAINVERSION}/asyncio",
+            "${libdir}/python${PYTHON_MAINVERSION}/concurrent",
+            "${libdir}/python${PYTHON_MAINVERSION}/concurrent/futures",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_asyncio.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_remote_debugging.*.so"
         ],
         "cached": []
     },
@@ -128,10 +128,10 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/wave.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/wave.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/wave.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/wave.*.pyc"
         ]
     },
     "codecs": {
@@ -140,7 +140,7 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multibytecodec.*.so"
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_multibytecodec.*.so"
         ],
         "cached": []
     },
@@ -150,14 +150,14 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/compileall.py",
-            "${libdir}/python${PYTHON_MAJMIN}/filecmp.py",
-            "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/compileall.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/filecmp.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/py_compile.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/filecmp.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/compileall.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/filecmp.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/py_compile.*.pyc"
         ]
     },
     "compression": {
@@ -166,284 +166,284 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/compression",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/_common",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd",
-            "${libdir}/python${PYTHON_MAJMIN}/gzip.py",
-            "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/zipfile"
+            "${libdir}/python${PYTHON_MAINVERSION}/compression",
+            "${libdir}/python${PYTHON_MAINVERSION}/compression/_common",
+            "${libdir}/python${PYTHON_MAINVERSION}/compression/zstd",
+            "${libdir}/python${PYTHON_MAINVERSION}/gzip.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/tarfile.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/zipfile"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/gzip.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/tarfile.*.pyc"
         ]
     },
     "core": {
         "summary": "Python interpreter and core modules",
         "rdepends": [],
         "files": [
-            "${bindir}/python${PYTHON_MAJMIN}",
-            "${bindir}/python${PYTHON_MAJMIN}.real",
+            "${bindir}/python${PYTHON_MAINVERSION}",
+            "${bindir}/python${PYTHON_MAINVERSION}.real",
             "${bindir}/python3",
-            "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
-            "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
-            "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
-            "${libdir}/python${PYTHON_MAJMIN}/UserString.py",
-            "${libdir}/python${PYTHON_MAJMIN}/__future__.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_abcoll.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_ast_unparse.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_bootlocale.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_colorize.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_compression.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_markupbase.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_opcode_metadata.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_py_warnings.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_pyrepl",
-            "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/pager.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_weakrefset.py",
-            "${libdir}/python${PYTHON_MAJMIN}/abc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/annotationlib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/argparse.py",
-            "${libdir}/python${PYTHON_MAJMIN}/ast.py",
-            "${libdir}/python${PYTHON_MAJMIN}/bisect.py",
-            "${libdir}/python${PYTHON_MAJMIN}/bz2.py",
-            "${libdir}/python${PYTHON_MAJMIN}/code.py",
-            "${libdir}/python${PYTHON_MAJMIN}/codecs.py",
-            "${libdir}/python${PYTHON_MAJMIN}/codeop.py",
-            "${libdir}/python${PYTHON_MAJMIN}/collections",
-            "${libdir}/python${PYTHON_MAJMIN}/collections/abc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/compression",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/_common",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/_streams.py",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd/_zstdfile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/configparser.py",
-            "${libdir}/python${PYTHON_MAJMIN}/contextlib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/copy.py",
-            "${libdir}/python${PYTHON_MAJMIN}/copyreg.py",
-            "${libdir}/python${PYTHON_MAJMIN}/csv.py",
-            "${libdir}/python${PYTHON_MAJMIN}/dataclasses.py",
-            "${libdir}/python${PYTHON_MAJMIN}/dis.py",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/aliases.py",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/latin_1.py",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/utf_8.py",
-            "${libdir}/python${PYTHON_MAJMIN}/enum.py",
-            "${libdir}/python${PYTHON_MAJMIN}/fnmatch.py",
-            "${libdir}/python${PYTHON_MAJMIN}/functools.py",
-            "${libdir}/python${PYTHON_MAJMIN}/genericpath.py",
-            "${libdir}/python${PYTHON_MAJMIN}/getopt.py",
-            "${libdir}/python${PYTHON_MAJMIN}/gettext.py",
-            "${libdir}/python${PYTHON_MAJMIN}/glob.py",
-            "${libdir}/python${PYTHON_MAJMIN}/heapq.py",
-            "${libdir}/python${PYTHON_MAJMIN}/imp.py",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/_abc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/_bootstrap.py",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/_bootstrap_external.py",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/abc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/machinery.py",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/util.py",
-            "${libdir}/python${PYTHON_MAJMIN}/inspect.py",
-            "${libdir}/python${PYTHON_MAJMIN}/io.py",
-            "${libdir}/python${PYTHON_MAJMIN}/ipaddress.py",
-            "${libdir}/python${PYTHON_MAJMIN}/keyword.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/_struct.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/binascii.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/time.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/xreadlines.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bisect.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bz2.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_heapq.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpreters.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lzma.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubprocess.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_struct.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_typing.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zstd.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/array.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/binascii.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/grp.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/math.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/parser.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/readline.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/select.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/time.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/unicodedata.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/xreadlines.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/zlib.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/linecache.py",
-            "${libdir}/python${PYTHON_MAJMIN}/locale.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lzma.py",
-            "${libdir}/python${PYTHON_MAJMIN}/new.py",
-            "${libdir}/python${PYTHON_MAJMIN}/ntpath.py",
-            "${libdir}/python${PYTHON_MAJMIN}/opcode.py",
-            "${libdir}/python${PYTHON_MAJMIN}/operator.py",
-            "${libdir}/python${PYTHON_MAJMIN}/optparse.py",
-            "${libdir}/python${PYTHON_MAJMIN}/os.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib/_abc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib/_local.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib/_os.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib/types.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
-            "${libdir}/python${PYTHON_MAJMIN}/platform.py",
-            "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
-            "${libdir}/python${PYTHON_MAJMIN}/re",
-            "${libdir}/python${PYTHON_MAJMIN}/re/_casefix.py",
-            "${libdir}/python${PYTHON_MAJMIN}/re/_compiler.py",
-            "${libdir}/python${PYTHON_MAJMIN}/re/_constants.py",
-            "${libdir}/python${PYTHON_MAJMIN}/re/_parser.py",
-            "${libdir}/python${PYTHON_MAJMIN}/reprlib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/rlcompleter.py",
-            "${libdir}/python${PYTHON_MAJMIN}/runpy.py",
-            "${libdir}/python${PYTHON_MAJMIN}/selectors.py",
-            "${libdir}/python${PYTHON_MAJMIN}/shutil.py",
-            "${libdir}/python${PYTHON_MAJMIN}/signal.py",
-            "${libdir}/python${PYTHON_MAJMIN}/site.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sre_compile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sre_constants.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sre_parse.py",
-            "${libdir}/python${PYTHON_MAJMIN}/stat.py",
-            "${libdir}/python${PYTHON_MAJMIN}/stringprep.py",
-            "${libdir}/python${PYTHON_MAJMIN}/struct.py",
-            "${libdir}/python${PYTHON_MAJMIN}/subprocess.py",
-            "${libdir}/python${PYTHON_MAJMIN}/symbol.py",
-            "${libdir}/python${PYTHON_MAJMIN}/sysconfig",
-            "${libdir}/python${PYTHON_MAJMIN}/sysconfig.py",
-            "${libdir}/python${PYTHON_MAJMIN}/textwrap.py",
-            "${libdir}/python${PYTHON_MAJMIN}/threading.py",
-            "${libdir}/python${PYTHON_MAJMIN}/token.py",
-            "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
-            "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
-            "${libdir}/python${PYTHON_MAJMIN}/types.py",
-            "${libdir}/python${PYTHON_MAJMIN}/typing.py",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
-            "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
-            "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
-            "${libdir}/python${PYTHON_MAJMIN}/zipimport.py",
-            "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
+            "${includedir}/python${PYTHON_MAINVERSION}/pyconfig*.h",
+            "${libdir}/python${PYTHON_MAINVERSION}/UserDict.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/UserList.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/UserString.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/__future__.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/_abcoll.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/_ast_unparse.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/_bootlocale.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/_collections_abc.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/_colorize.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/_compression.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/_markupbase.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/_opcode_metadata.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/_py_warnings.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/_pyrepl",
+            "${libdir}/python${PYTHON_MAINVERSION}/_pyrepl/pager.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/_sitebuiltins.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/_sysconfigdata*.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/_weakrefset.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/abc.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/annotationlib.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/argparse.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/ast.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/bisect.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/bz2.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/code.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/codecs.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/codeop.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/collections",
+            "${libdir}/python${PYTHON_MAINVERSION}/collections/abc.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/compression",
+            "${libdir}/python${PYTHON_MAINVERSION}/compression/_common",
+            "${libdir}/python${PYTHON_MAINVERSION}/compression/_common/_streams.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/compression/zstd",
+            "${libdir}/python${PYTHON_MAINVERSION}/compression/zstd/_zstdfile.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/configparser.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/contextlib.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/copy.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/copyreg.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/csv.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/dataclasses.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/dis.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/encodings",
+            "${libdir}/python${PYTHON_MAINVERSION}/encodings/aliases.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/encodings/latin_1.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/encodings/utf_8.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/enum.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/fnmatch.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/functools.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/genericpath.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/getopt.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/gettext.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/glob.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/heapq.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/imp.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/importlib",
+            "${libdir}/python${PYTHON_MAINVERSION}/importlib/_abc.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/importlib/_bootstrap.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/importlib/_bootstrap_external.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/importlib/abc.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/importlib/machinery.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/importlib/util.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/inspect.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/io.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/ipaddress.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/keyword.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/__pycache__/_struct.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/__pycache__/binascii.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/__pycache__/time.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/__pycache__/xreadlines.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_bisect.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_bz2.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_csv.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_heapq.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_interpreters.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_lzma.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_opcode.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_posixsubprocess.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_struct.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_typing.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_zstd.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/array.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/binascii.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/fcntl.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/grp.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/math.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/parser.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/readline.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/select.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/time.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/unicodedata.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/xreadlines.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/zlib.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/linecache.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/locale.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/lzma.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/new.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/ntpath.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/opcode.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/operator.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/optparse.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/os.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/pathlib",
+            "${libdir}/python${PYTHON_MAINVERSION}/pathlib.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/pathlib/_abc.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/pathlib/_local.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/pathlib/_os.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/pathlib/types.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/pkgutil.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/platform.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/posixpath.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/re",
+            "${libdir}/python${PYTHON_MAINVERSION}/re/_casefix.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/re/_compiler.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/re/_constants.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/re/_parser.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/reprlib.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/rlcompleter.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/runpy.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/selectors.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/shutil.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/signal.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/site.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/sitecustomize.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/sre_compile.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/sre_constants.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/sre_parse.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/stat.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/stringprep.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/struct.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/subprocess.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/symbol.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/sysconfig",
+            "${libdir}/python${PYTHON_MAINVERSION}/sysconfig.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/textwrap.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/threading.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/token.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/tokenize.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/traceback.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/types.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/typing.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/urllib",
+            "${libdir}/python${PYTHON_MAINVERSION}/urllib/parse.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/warnings.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/weakref.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/zipimport.py",
+            "${prefix}/lib/python${PYTHON_MAINVERSION}/config*/*[!.a]"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_ast_unparse.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_colorize.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_opcode_metadata.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_py_warnings.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata*.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/annotationlib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bz2.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/code.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codecs.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codeop.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/configparser.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextlib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copy.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copyreg.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/csv.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dataclasses.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dis.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/enum.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fnmatch.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/functools.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/genericpath.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getopt.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gettext.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/glob.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/heapq.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imp.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/inspect.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/io.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ipaddress.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/keyword.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/linecache.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/locale.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/lzma.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ntpath.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/opcode.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/operator.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/optparse.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/os.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pathlib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/runpy.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/selectors.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shutil.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/signal.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/site.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_compile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_constants.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_parse.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stat.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stringprep.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/struct.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/subprocess.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/symbol.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sysconfig.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/textwrap.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/threading.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/token.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/__pycache__/pager.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__/abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/__pycache__/_streams.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/zstd/__pycache__/_zstdfile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/aliases.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/latin_1.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/utf_8.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/_abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/machinery.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_local.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_os.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/types.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_casefix.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_compiler.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_constants.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_parser.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/sysconfig/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__/parse.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/__future__.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_ast_unparse.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_bootlocale.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_collections_abc.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_colorize.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_compression.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_markupbase.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_opcode_metadata.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_py_warnings.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_sitebuiltins.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_sysconfigdata*.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_weakrefset.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/abc.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/annotationlib.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/argparse.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/ast.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/bisect.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/bz2.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/code.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/codecs.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/codeop.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/configparser.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/contextlib.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/copy.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/copyreg.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/csv.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/dataclasses.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/dis.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/enum.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/fnmatch.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/functools.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/genericpath.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/getopt.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/gettext.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/glob.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/heapq.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/imp.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/inspect.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/io.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/ipaddress.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/keyword.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/linecache.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/locale.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/lzma.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/ntpath.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/opcode.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/operator.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/optparse.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/os.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/pathlib.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/pkgutil.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/platform.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/posixpath.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/re.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/reprlib.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/rlcompleter.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/runpy.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/selectors.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/shutil.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/signal.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/site.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/sre_compile.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/sre_constants.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/sre_parse.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/stat.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/stringprep.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/struct.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/subprocess.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/symbol.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/sysconfig.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/textwrap.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/threading.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/token.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/tokenize.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/traceback.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/types.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/typing.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/warnings.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/weakref.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/_pyrepl/__pycache__",
+            "${libdir}/python${PYTHON_MAINVERSION}/_pyrepl/__pycache__/pager.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/collections/__pycache__",
+            "${libdir}/python${PYTHON_MAINVERSION}/collections/__pycache__/abc.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/compression/__pycache__",
+            "${libdir}/python${PYTHON_MAINVERSION}/compression/_common/__pycache__",
+            "${libdir}/python${PYTHON_MAINVERSION}/compression/_common/__pycache__/_streams.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/compression/zstd/__pycache__",
+            "${libdir}/python${PYTHON_MAINVERSION}/compression/zstd/__pycache__/_zstdfile.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/encodings/__pycache__",
+            "${libdir}/python${PYTHON_MAINVERSION}/encodings/__pycache__/aliases.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/encodings/__pycache__/latin_1.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/encodings/__pycache__/utf_8.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/importlib/__pycache__",
+            "${libdir}/python${PYTHON_MAINVERSION}/importlib/__pycache__/_abc.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/importlib/__pycache__/abc.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/importlib/__pycache__/machinery.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/importlib/__pycache__/util.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/pathlib/__pycache__",
+            "${libdir}/python${PYTHON_MAINVERSION}/pathlib/__pycache__/_abc.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/pathlib/__pycache__/_local.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/pathlib/__pycache__/_os.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/pathlib/__pycache__/types.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/re/__pycache__",
+            "${libdir}/python${PYTHON_MAINVERSION}/re/__pycache__/_casefix.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/re/__pycache__/_compiler.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/re/__pycache__/_constants.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/re/__pycache__/_parser.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/sysconfig/__pycache__",
+            "${libdir}/python${PYTHON_MAINVERSION}/urllib/__pycache__",
+            "${libdir}/python${PYTHON_MAINVERSION}/urllib/__pycache__/parse.*.pyc"
         ]
     },
     "crypt": {
@@ -452,16 +452,16 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/hashlib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hashlib.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_md5.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha1.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha2.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so"
+            "${libdir}/python${PYTHON_MAINVERSION}/hashlib.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_blake2.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_hashlib.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_md5.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_sha1.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_sha2.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_sha3.*.so"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hashlib.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/hashlib.*.pyc"
         ]
     },
     "ctypes": {
@@ -473,9 +473,9 @@
             "math"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/ctypes",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ctypes.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ctypes_test.*.so"
+            "${libdir}/python${PYTHON_MAINVERSION}/ctypes",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_ctypes.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_ctypes_test.*.so"
         ],
         "cached": []
     },
@@ -485,9 +485,9 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/curses",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_curses.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_curses_panel.*.so"
+            "${libdir}/python${PYTHON_MAINVERSION}/curses",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_curses.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_curses_panel.*.so"
         ],
         "cached": []
     },
@@ -497,14 +497,14 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/_strptime.py",
-            "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
-            "${libdir}/python${PYTHON_MAJMIN}/datetime.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/_strptime.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/calendar.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/datetime.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_strptime.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/calendar.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/datetime.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_strptime.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/calendar.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/datetime.*.pyc"
         ]
     },
     "db": {
@@ -513,8 +513,8 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/dbm",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_dbm.*.so"
+            "${libdir}/python${PYTHON_MAINVERSION}/dbm",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_dbm.*.so"
         ],
         "cached": []
     },
@@ -535,12 +535,12 @@
             "stringold"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pdb.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/bdb.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/pdb.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bdb.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pdb.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/bdb.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/pdb.*.pyc"
         ]
     },
     "dev": {
@@ -569,10 +569,10 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/difflib.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/difflib.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/difflib.*.pyc"
         ]
     },
     "doctest": {
@@ -595,10 +595,10 @@
             "unittest"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/doctest.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/doctest.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/doctest.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/doctest.*.pyc"
         ]
     },
     "email": {
@@ -613,11 +613,11 @@
             "stringold"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/email",
-            "${libdir}/python${PYTHON_MAJMIN}/imaplib.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/email",
+            "${libdir}/python${PYTHON_MAINVERSION}/imaplib.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imaplib.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/imaplib.*.pyc"
         ]
     },
     "ensurepip": {
@@ -629,7 +629,7 @@
             "math"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/ensurepip"
+            "${libdir}/python${PYTHON_MAINVERSION}/ensurepip"
         ],
         "cached": []
     },
@@ -647,7 +647,7 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_gdbm.*.so"
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_gdbm.*.so"
         ],
         "cached": []
     },
@@ -657,7 +657,7 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/html"
+            "${libdir}/python${PYTHON_MAINVERSION}/html"
         ],
         "cached": []
     },
@@ -668,7 +668,7 @@
         ],
         "files": [
             "${bindir}/idle*",
-            "${libdir}/python${PYTHON_MAJMIN}/idlelib"
+            "${libdir}/python${PYTHON_MAINVERSION}/idlelib"
         ],
         "cached": []
     },
@@ -678,10 +678,10 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/colorsys.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/colorsys.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/colorsys.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/colorsys.*.pyc"
         ]
     },
     "io": {
@@ -693,19 +693,19 @@
             "netclient"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_socket.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ssl.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/termios.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/socket.py",
-            "${libdir}/python${PYTHON_MAJMIN}/ssl.py",
-            "${libdir}/python${PYTHON_MAJMIN}/tempfile.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/_pyio.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_socket.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_ssl.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/termios.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/socket.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/ssl.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/tempfile.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pyio.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socket.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ssl.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tempfile.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_pyio.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/socket.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/ssl.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/tempfile.*.pyc"
         ]
     },
     "json": {
@@ -714,8 +714,8 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/json",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_json.*.so"
+            "${libdir}/python${PYTHON_MAINVERSION}/json",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_json.*.so"
         ],
         "cached": []
     },
@@ -730,7 +730,7 @@
             "threading"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/logging"
+            "${libdir}/python${PYTHON_MAINVERSION}/logging"
         ],
         "cached": []
     },
@@ -747,10 +747,10 @@
             "stringold"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/mailbox.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mailbox.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/mailbox.*.pyc"
         ]
     },
     "math": {
@@ -759,12 +759,12 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_random.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/cmath.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/random.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_random.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/cmath.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/random.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/random.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/random.*.pyc"
         ]
     },
     "mime": {
@@ -773,10 +773,10 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/quopri.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/quopri.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/quopri.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/quopri.*.pyc"
         ]
     },
     "mmap": {
@@ -785,7 +785,7 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/mmap.*.so"
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/mmap.*.so"
         ],
         "cached": []
     },
@@ -865,9 +865,9 @@
             "threading"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multiprocessing.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixshmem.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/multiprocessing"
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_multiprocessing.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_posixshmem.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/multiprocessing"
         ],
         "cached": []
     },
@@ -884,29 +884,29 @@
             "stringold"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/base64.py",
-            "${libdir}/python${PYTHON_MAJMIN}/ftplib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
-            "${libdir}/python${PYTHON_MAJMIN}/http",
-            "${libdir}/python${PYTHON_MAJMIN}/http/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hmac.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_uuid.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/mimetypes.py",
-            "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/secrets.py",
-            "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib",
-            "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/base64.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/ftplib.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/hmac.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/http",
+            "${libdir}/python${PYTHON_MAINVERSION}/http/__pycache__",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_hmac.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_uuid.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/mimetypes.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/poplib.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/secrets.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/smtplib.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/urllib",
+            "${libdir}/python${PYTHON_MAINVERSION}/uuid.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ftplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hmac.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/poplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/secrets.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/base64.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/ftplib.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/hmac.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/mimetypes.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/poplib.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/secrets.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/smtplib.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/uuid.*.pyc"
         ]
     },
     "netserver": {
@@ -916,10 +916,10 @@
             "io"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/socketserver.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/socketserver.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socketserver.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/socketserver.*.pyc"
         ]
     },
     "numbers": {
@@ -928,19 +928,19 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/_pydecimal.py",
-            "${libdir}/python${PYTHON_MAJMIN}/contextvars.py",
-            "${libdir}/python${PYTHON_MAJMIN}/decimal.py",
-            "${libdir}/python${PYTHON_MAJMIN}/fractions.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/numbers.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/_pydecimal.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/contextvars.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/decimal.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/fractions.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_decimal.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/numbers.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pydecimal.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/decimal.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fractions.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/numbers.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_pydecimal.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/contextvars.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/decimal.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/fractions.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/numbers.*.pyc"
         ]
     },
     "pickle": {
@@ -949,17 +949,17 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/_compat_pickle.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_pickle.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/pickle.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pickletools.py",
-            "${libdir}/python${PYTHON_MAJMIN}/shelve.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/_compat_pickle.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_pickle.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/pickle.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/pickletools.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/shelve.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compat_pickle.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickle.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickletools.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shelve.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_compat_pickle.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/pickle.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/pickletools.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/shelve.*.pyc"
         ]
     },
     "pkgutil": {
@@ -978,10 +978,10 @@
             "xml"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/plistlib.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/plistlib.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/plistlib.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/plistlib.*.pyc"
         ]
     },
     "pprint": {
@@ -990,10 +990,10 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/pprint.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/pprint.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pprint.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/pprint.*.pyc"
         ]
     },
     "profile": {
@@ -1002,15 +1002,15 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lsprof.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/profile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/cProfile.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_lsprof.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/profile.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/pstats.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/cProfile.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/profile.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/pstats.*.pyc"
         ]
     },
     "pydoc": {
@@ -1020,11 +1020,11 @@
         ],
         "files": [
             "${bindir}/pydoc*",
-            "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
+            "${libdir}/python${PYTHON_MAINVERSION}/pydoc.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/pydoc_data"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/pydoc.*.pyc"
         ]
     },
     "resource": {
@@ -1033,7 +1033,7 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/resource.*.so"
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/resource.*.so"
         ],
         "cached": []
     },
@@ -1043,12 +1043,12 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/cmd.py",
-            "${libdir}/python${PYTHON_MAJMIN}/shlex.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/cmd.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/shlex.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cmd.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shlex.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/cmd.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/shlex.*.pyc"
         ]
     },
     "sqlite3": {
@@ -1058,8 +1058,8 @@
             "datetime"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sqlite3.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3"
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_sqlite3.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/sqlite3"
         ],
         "cached": []
     },
@@ -1071,11 +1071,11 @@
             "numbers"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_statistics.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/statistics.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_statistics.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/statistics.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/statistics.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/statistics.*.pyc"
         ]
     },
     "stringold": {
@@ -1084,7 +1084,7 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/string"
+            "${libdir}/python${PYTHON_MAINVERSION}/string"
         ],
         "cached": []
     },
@@ -1094,7 +1094,7 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/syslog.*.so"
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/syslog.*.so"
         ],
         "cached": []
     },
@@ -1105,12 +1105,12 @@
             "io"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/pty.py",
-            "${libdir}/python${PYTHON_MAJMIN}/tty.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/pty.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/tty.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pty.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tty.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/pty.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/tty.*.pyc"
         ]
     },
     "threading": {
@@ -1119,13 +1119,13 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/_threading_local.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/queue.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/_threading_local.py",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_queue.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/queue.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/_threading_local.*.pyc",
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/queue.*.pyc"
         ]
     },
     "tkinter": {
@@ -1134,7 +1134,7 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/tkinter"
+            "${libdir}/python${PYTHON_MAINVERSION}/tkinter"
         ],
         "cached": []
     },
@@ -1145,7 +1145,7 @@
             "datetime"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/tomllib"
+            "${libdir}/python${PYTHON_MAINVERSION}/tomllib"
         ],
         "cached": []
     },
@@ -1163,7 +1163,7 @@
             "stringold"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/unittest"
+            "${libdir}/python${PYTHON_MAINVERSION}/unittest"
         ],
         "cached": []
     },
@@ -1174,10 +1174,10 @@
             "io"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/getpass.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/getpass.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/getpass.*.pyc"
         ]
     },
     "venv": {
@@ -1191,7 +1191,7 @@
         ],
         "files": [
             "${bindir}/pyvenv*",
-            "${libdir}/python${PYTHON_MAJMIN}/venv"
+            "${libdir}/python${PYTHON_MAINVERSION}/venv"
         ],
         "cached": []
     },
@@ -1201,9 +1201,9 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_elementtree.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/pyexpat.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/xml"
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_elementtree.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/pyexpat.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/xml"
         ],
         "cached": []
     },
@@ -1225,8 +1225,8 @@
             "xml"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc",
-            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc/__pycache__"
+            "${libdir}/python${PYTHON_MAINVERSION}/xmlrpc",
+            "${libdir}/python${PYTHON_MAINVERSION}/xmlrpc/__pycache__"
         ],
         "cached": []
     },
@@ -1237,10 +1237,10 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/zipapp.py"
+            "${libdir}/python${PYTHON_MAINVERSION}/zipapp.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipapp.*.pyc"
+            "${libdir}/python${PYTHON_MAINVERSION}/__pycache__/zipapp.*.pyc"
         ]
     },
     "zoneinfo": {
@@ -1250,8 +1250,8 @@
             "datetime"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zoneinfo.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/zoneinfo"
+            "${libdir}/python${PYTHON_MAINVERSION}/lib-dynload/_zoneinfo.*.so",
+            "${libdir}/python${PYTHON_MAINVERSION}/zoneinfo"
         ],
         "cached": []
     }
diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
index c40742fb43..1a891208ff 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -48,19 +48,17 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 CVE_PRODUCT = "python:python python_software_foundation:python cpython"
 
-PYTHON_MAJMIN = "3.14"
-
 S = "${UNPACKDIR}/Python-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-inherit autotools pkgconfig qemu ptest multilib_header update-alternatives
+inherit autotools pkgconfig qemu python3-dir ptest multilib_header update-alternatives
 
 MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
 
 ALTERNATIVE:${PN}-dev = "python3-config"
-ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config"
-ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
+ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/${PYTHON_DIR}-config"
+ALTERNATIVE_TARGET[python3-config] = "${bindir}/${PYTHON_DIR}-config-${MULTILIB_SUFFIX}"
 
 DEPENDS = "\
     autoconf-archive-native \
@@ -87,7 +85,7 @@ EXTRA_OECONF:append:class-native = " --bindir=${bindir}/${PN}"
 EXTRA_OECONF:append:class-target = " --with-build-python=nativepython3 PLATFORM_TRIPLET=${HOST_ARCH}-${HOST_OS}"
 EXTRA_OECONF:append:class-nativesdk = " --with-build-python=nativepython3"
 
-export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
+export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/lib-dynload/"
 
 EXTRANATIVEPATH += "python3-native"
 
@@ -186,7 +184,7 @@ do_install:prepend() {
 }
 
 do_install:append:class-target() {
-        oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
+        oe_multilib_header ${PYTHON_DIR}/pyconfig.h
 }
 
 do_install:append:class-native() {
@@ -211,20 +209,20 @@ do_install:append:class-native() {
 
         # Nothing should be looking into ${B} for python3-native
         sed -i -e 's:${B}:/build/path/unavailable/:g' \
-                ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile
+                ${D}/${libdir}/${PYTHON_DIR}/config-${PYTHON_MAINVERSION}*/Makefile
 
         # disable the lookup in user's site-packages globally
-        sed -i 's#ENABLE_USER_SITE = None#ENABLE_USER_SITE = False#' ${D}${libdir}/python${PYTHON_MAJMIN}/site.py
+        sed -i 's#ENABLE_USER_SITE = None#ENABLE_USER_SITE = False#' ${D}${libdir}/${PYTHON_DIR}/site.py
 
         # python3-config needs to be in /usr/bin and not in a subdir of it to work properly
         mv ${D}/${bindir}/${PN}/python*config ${D}/${bindir}/
 }
 
 do_install:append() {
-        for c in ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
+        for c in ${D}/${libdir}/${PYTHON_DIR}/_sysconfigdata*.py; do
             python3 ${UNPACKDIR}/reformat_sysconfig.py $c
         done
-        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata*.cpython*
+        rm -f ${D}${libdir}/${PYTHON_DIR}/__pycache__/_sysconfigdata*.cpython*
 
         mkdir -p ${D}${libdir}/python-sysconfigdata
         sysconfigfile=`find ${D} -name _sysconfig*.py`
@@ -232,8 +230,8 @@ do_install:append() {
                 -e "s,^ 'LIBDIR'.*, 'LIBDIR': '${STAGING_LIBDIR}'\,,g" \
                 -e "s,^ 'INCLUDEDIR'.*, 'INCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
                 -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
-                -e "s,^ 'INCLUDEPY'.*, 'INCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
-                -e "s,^ 'CONFINCLUDEPY'.*, 'CONFINCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
+                -e "s,^ 'INCLUDEPY'.*, 'INCLUDEPY': '${STAGING_INCDIR}/${PYTHON_DIR}'\,,g" \
+                -e "s,^ 'CONFINCLUDEPY'.*, 'CONFINCLUDEPY': '${STAGING_INCDIR}/${PYTHON_DIR}'\,,g" \
                 -e "s,${B},/build/path/unavailable/,g" \
                 $sysconfigfile
         cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
@@ -249,7 +247,7 @@ do_install:append:class-nativesdk () {
     for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
          sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
     done
-    create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
+    create_wrapper ${D}${bindir}/${PYTHON_DIR} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
 do_install_ptest:append:class-target:libc-musl () {
@@ -265,7 +263,7 @@ SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " provide_target_config_script
 provide_target_config_script() {
         install -d ${SYSROOT_DESTDIR}${prefix}/python-target-config/
         install ${D}/${bindir}/python3-config ${SYSROOT_DESTDIR}/${prefix}/python-target-config/
-        install ${D}/${bindir}/python${PYTHON_MAJMIN}-config ${SYSROOT_DESTDIR}/${prefix}/python-target-config/
+        install ${D}/${bindir}/${PYTHON_DIR}-config ${SYSROOT_DESTDIR}/${prefix}/python-target-config/
 }
 SYSROOT_DIRS += "${prefix}/python-target-config/"
 
@@ -288,13 +286,13 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile \
-                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \
-                ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
+                ${PKGD}/${libdir}/${PYTHON_DIR}/config-${PYTHON_MAINVERSION}*/Makefile \
+                ${PKGD}/${libdir}/${PYTHON_DIR}/_sysconfigdata*.py \
+                ${PKGD}/${bindir}/${PYTHON_DIR}-config
 
         # Reformat _sysconfigdata after modifying it so that it remains
         # reproducible
-        for c in ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
+        for c in ${PKGD}/${libdir}/${PYTHON_DIR}/_sysconfigdata*.py; do
             python3 ${UNPACKDIR}/reformat_sysconfig.py $c
         done
 
@@ -309,7 +307,7 @@ py_package_preprocess () {
              -c "from py_compile import compile; compile('$sysconfigfile', optimize=2)"
         cd -
 
-        mv ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}
+        mv ${PKGD}/${bindir}/${PYTHON_DIR}-config ${PKGD}/${bindir}/${PYTHON_DIR}-config-${MULTILIB_SUFFIX}
 
         #Remove the unneeded copy of target sysconfig data
         rm -rf ${PKGD}/${libdir}/python-sysconfigdata
@@ -321,7 +319,7 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars*.json
+		${PKGD}/${libdir}/${PYTHON_DIR}/_sysconfig_vars*.json
 }
 
 # We want bytecode precompiled .py files (.pyc's) by default
@@ -422,7 +420,7 @@ do_create_manifest() {
     cp ${UNPACKDIR}/get_module_deps3.py ${WORKDIR}
     cd ${WORKDIR}
     # This needs to be executed by python-native and NOT by HOST's python
-    nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
+    nativepython3 create_manifest3.py ${PYTHON_MAINVERSION}
     cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
 }
 
@@ -437,11 +435,12 @@ RRECOMMENDS:${PN}-crypt:append:class-nativesdk = " ${MLPREFIX}openssl ${MLPREFIX
 
 # For historical reasons PN is empty and provided by python3-modules
 FILES:${PN} = ""
+FILES:${PN}-core:append = " ${bindir}/python${PYTHON_BASEVERSION}"
 RPROVIDES:${PN}-modules = "${PN}"
 
-FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
-FILES:${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
-FILES:${PN}-tkinter += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so"
+FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAINVERSION} ${bindir}/pydoc3"
+FILES:${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAINVERSION}"
+FILES:${PN}-tkinter += "${libdir}/${PYTHON_DIR}/lib-dynload/_tkinter.*.so"
 
 # provide python-pyvenv from python3-venv
 RPROVIDES:${PN}-venv += "${MLPREFIX}python3-pyvenv"
@@ -449,13 +448,14 @@ RPROVIDES:${PN}-venv += "${MLPREFIX}python3-pyvenv"
 # package libpython3
 PACKAGES =+ "libpython3 libpython3-staticdev"
 FILES:libpython3 = "${libdir}/libpython*.so.*"
-FILES:libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a"
+FILES:libpython3-staticdev += "${libdir}/${PYTHON_DIR}/config-${PYTHON_MAINVERSION}-*/lib${PYTHON_DIR}.a"
 INSANE_SKIP:${PN}-dev += "dev-elf"
 INSANE_SKIP:${PN}-ptest = "dev-deps"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
 RDEPENDS:${PN}-misc += "\
+    bash \
     ${PN}-audio \
     ${PN}-codecs \
     ${PN}-core \
@@ -467,7 +467,7 @@ RDEPENDS:${PN}-misc += "\
 RDEPENDS:${PN}-modules:append:class-target = " ${MLPREFIX}python3-misc"
 RDEPENDS:${PN}-modules:append:class-nativesdk = " ${MLPREFIX}python3-misc"
 RDEPENDS:${PN}-modules:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '${MLPREFIX}python3-gdbm', '', d)}"
-FILES:${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
+FILES:${PN}-misc = "${libdir}/${PYTHON_DIR} ${libdir}/${PYTHON_DIR}/lib-dynload"
 
 # catch manpage
 PACKAGES += "${PN}-man"
@@ -507,5 +507,5 @@ RDEPENDS:${PN}-tests:append:class-nativesdk = " ${MLPREFIX}bash"
 # Python's tests contain large numbers of files we don't need in the recipe sysroots
 SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
 py3_sysroot_cleanup () {
-	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
+	rm -rf ${SYSROOT_DESTDIR}${libdir}/${PYTHON_DIR}/test
 }
-- 
2.53.0


