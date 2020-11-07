Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web09.6581.1604714520079435519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 18:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n4XdUM/Y;
 spf=pass (domain: gmail.com, ip: 209.85.210.66, mailfrom: aehs29@gmail.com)
Received: by mail-ot1-f66.google.com with SMTP id z16so3130543otq.6
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 18:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F4ouCZF9vx/lC2eahT+VFLayOmnebUXyTLtiIpmZczU=;
        b=n4XdUM/Yx6IdszJe+HtwJtum4y8jDTyH/U00TTU7mlXop9i4/QVZT/rN9EvCQFl1uj
         Ek9eMsUidsqCgAnsv5f5fIXTWLQaziclLcJ0JKI2NFMOrYb5gTXpxQWDSAVyHv/YgcgU
         A6Eyxw7QxhAXgfva7/YQIK/BHtojHBzeA58N7uM8hSeSePHyT6TzEt9RnlgjR7QmMNCd
         JuwTrwxoI24yFmoTlhSujVOR2tuC/ebG0ST0Z8uukCLaShajCrH/Ony+8KAuvZSa3qUD
         yOuFmjbRmtJPl6Y9R5+VT4aFQu1XAPJwbqPKB8CfsYaSQviTCqhGSWfUHgKlqMKWEPlY
         P2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F4ouCZF9vx/lC2eahT+VFLayOmnebUXyTLtiIpmZczU=;
        b=DpfqYVLNLMNu61m+F0prgt9doIKKfkAjPrBpWK259di2Ovn9yxH9/iEKUQd4MhU7/H
         gqztMoWv5xjIsUsEl2FD+cexnukXT26ONeVo45qo+wcDccg/Std6K/06x7lKa4eXf0oL
         A7c1Zb1kzKCxzhbaSS6X2SvukJnEk3xrjuGRp3/GHsHkPnYJOIHbnCnCs+k0Kjd/0I81
         fYN9fLAi3xabvR9fmX+QqEre6Ll5xwrkpmkgkRIdOGTssvSf/XdcX+V/qob9W1xUEoi9
         FNW6/EEE4Q/8QJjn+ysusj5ezfDoOSQxde4HhWvPlZOOR/B6+xtj9iI/lVg35osEKsQy
         kTJA==
X-Gm-Message-State: AOAM532vmiYs7pdhVAAg2LygDKvir+q7QtSZ7/a+gB/mWL+y11Ya41xt
	LKSa7uQMq0Npt2inwUjnDbNmk9Lew0eCng==
X-Google-Smtp-Source: ABdhPJy6lkUDUP+4KsM8+ONlBdOgNplBE90mnHIiS43PE54fQZx3V0LoIWFbFqXAAwB7pBUnlfGPYw==
X-Received: by 2002:a9d:bf4:: with SMTP id 107mr3017189oth.320.1604714518964;
        Fri, 06 Nov 2020 18:01:58 -0800 (PST)
Return-Path: <aehs29@gmail.com>
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com. [68.201.52.49])
        by smtp.gmail.com with ESMTPSA id c190sm722801oig.34.2020.11.06.18.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 18:01:58 -0800 (PST)
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
X-Google-Original-From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH] python3: Update manifest
Date: Fri,  6 Nov 2020 19:01:56 -0700
Message-Id: <20201107020156.351764-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the python3-manifest to match the files installed by the
new version of python3.
- Kept tkinter the way it was although tk isnt part of OE-Core
- Made typing part of python3-core
- Update other packages with new dependencies such as filecmp and dataclasses.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
---
 .../python/python3/python3-manifest.json      | 35 +++++--------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 69aecb7004..615dc3a5e5 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -122,8 +122,7 @@
             "logging",
             "netclient",
             "numbers",
-            "stringold",
-            "typing"
+            "stringold"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/asyncio",
@@ -173,10 +172,12 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/compileall.py",
+            "${libdir}/python${PYTHON_MAJMIN}/filecmp.py",
             "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/filecmp.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc"
         ]
     },
@@ -313,6 +314,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
             "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
             "${libdir}/python${PYTHON_MAJMIN}/types.py",
+            "${libdir}/python${PYTHON_MAJMIN}/typing.py",
             "${libdir}/python${PYTHON_MAJMIN}/urllib",
             "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
             "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
@@ -388,6 +390,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
@@ -557,18 +560,12 @@
     "doctest": {
         "summary": "Python framework for running examples in docstrings",
         "rdepends": [
-            "asyncio",
             "core",
             "debugger",
             "difflib",
-            "io",
-            "logging",
-            "netclient",
-            "numbers",
             "pprint",
             "shell",
             "stringold",
-            "typing",
             "unittest"
         ],
         "files": [
@@ -822,7 +819,6 @@
             "terminal",
             "threading",
             "tkinter",
-            "typing",
             "unittest",
             "unixadmin",
             "venv",
@@ -999,12 +995,14 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
+            "${libdir}/python${PYTHON_MAJMIN}/dataclasses.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lsprof.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/profile.py",
             "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dataclasses.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
         ]
@@ -1130,13 +1128,11 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/_dummy_thread.py",
             "${libdir}/python${PYTHON_MAJMIN}/_threading_local.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/queue.py"
         ],
         "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_dummy_thread.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
         ]
@@ -1147,23 +1143,11 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
+	    "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/tkinter"
         ],
         "cached": []
     },
-    "typing": {
-        "summary": "Python typing support",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/typing.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc"
-        ]
-    },
     "unittest": {
         "summary": "Python unit testing framework",
         "rdepends": [
@@ -1175,8 +1159,7 @@
             "netclient",
             "numbers",
             "pprint",
-            "stringold",
-            "typing"
+            "stringold"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/unittest",
-- 
2.25.1

