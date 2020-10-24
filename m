Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web09.18115.1603574529478657509
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2020 14:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BFftVPtw;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: aehs29@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id f26so1448989oou.11
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2020 14:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F4/UnCOJksEFsghWq59TuKfGBecV7QEGo5LMLykzuk0=;
        b=BFftVPtw0KgOQnm7gjmxJaokmgKpYT0po1RRfs+SRaXTdHdKC2F+2AAZQG5+8EikeM
         eD1zbUYMLbrk+x6zx6nB31ppnA4+XcUmhsISrxnI1Qa/7IvotUZaFh+YTtkW8PgP5BSN
         yf2isioEgZgy8iGUUMnaBksjEaLXZ24ok/fblRel7nlCeJpc7Sv2CNr91NLs+HvKZGbM
         6mc87qxGVzJpMUDcJBgJRWxoPVFqiwWVOCDxgZtlSwHtunANkU+l3DZXYFmvn5NSIWdT
         U+BH27BDQc2FG2q8VQ5myok2LoIkhATc54n6Q3yD9hv/rTpOts+Wt0DHr0/QXdJsRcdW
         pHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F4/UnCOJksEFsghWq59TuKfGBecV7QEGo5LMLykzuk0=;
        b=gyqMU6F4PT2+n8zMZeHanMe+J5a7lk+w7PZJ9PJ36kwm6Qgwfo9cYNGo1/wD64E03E
         VmZR2pabNzxt2DkbyyMrVxMRF9nsAuJZM/VC5Dml5Ji0WeSeNYqj5piySBDELtVa1fPO
         Fbiljme9TdJp8xFQ7N84llvC77lyGGHq9RjszyhFhgFaR9kvTb3axlsXN1Y6b2+4cSba
         6+b2Tdjs5Mp4MucD+TboEFbV7gwx8+tUaMBuuR7/CviS+cSh2toygXq/pBGrH5eC2NTy
         95PkfuCi/zzriF4lxsSJVXk6fCtT2yrnvizeYVc+jcctGFqoPTbSKXzRCPuE6lesWqvV
         UTiw==
X-Gm-Message-State: AOAM5315rSWPFQhVw2nxtY0e8urSI/lKsVnhPniPdOjmbDsQkkGFo0r6
	81HuwGmSU9UefnTLIlhBrBBy148NGbXSyg==
X-Google-Smtp-Source: ABdhPJyFUdUozkQL1AdXYYaI7+wrAK04lpQHFtSgB+h4MFi804Zht/AhxSdSjnv5qtH0AvNX0Z9ziw==
X-Received: by 2002:a4a:e04a:: with SMTP id v10mr7342083oos.24.1603574528383;
        Sat, 24 Oct 2020 14:22:08 -0700 (PDT)
Return-Path: <aehs29@gmail.com>
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com. [68.201.52.49])
        by smtp.gmail.com with ESMTPSA id d11sm1513090oti.69.2020.10.24.14.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 14:22:07 -0700 (PDT)
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
X-Google-Original-From: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@linux.microsoft.com>
Subject: [PATCH 1/2] libxml2: Backport patch to fix Python3.9 syntax
Date: Sat, 24 Oct 2020 15:20:24 -0600
Message-Id: <20201024212025.1107408-1-alejandro.hernandez@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building against python 3.9 causes some errors while compiling,
this has been fixed upstream, but hasnt been released yet:

upstream tracker:
https://gitlab.gnome.org/GNOME/libxml2/-/issues/149

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@linux.microsoft.com>
---
 ...1-Parenthesize-Py-type-_Check-in-ifs.patch | 96 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-Parenthesize-Py-type-_Check-in-ifs.patch

diff --git a/meta/recipes-core/libxml/libxml2/0001-Parenthesize-Py-type-_Check-in-ifs.patch b/meta/recipes-core/libxml/libxml2/0001-Parenthesize-Py-type-_Check-in-ifs.patch
new file mode 100644
index 0000000000..bee8ab2cf6
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-Parenthesize-Py-type-_Check-in-ifs.patch
@@ -0,0 +1,96 @@
+From e4fb36841800038c289997432ca547c9bfef9db1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
+Date: Fri, 28 Feb 2020 12:48:14 +0100
+Subject: [PATCH] Parenthesize Py<type>_Check() in ifs
+
+In C, if expressions should be parenthesized.
+PyLong_Check, PyUnicode_Check etc. happened to expand to a parenthesized
+expression before, but that's not API to rely on.
+
+Since Python 3.9.0a4 it needs to be parenthesized explicitly.
+
+Fixes https://gitlab.gnome.org/GNOME/libxml2/issues/149
+
+Upstream-Status: Backport
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@linux.microsoft.com>
+
+---
+ python/libxml.c |  4 ++--
+ python/types.c  | 12 ++++++------
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/python/libxml.c b/python/libxml.c
+index bc676c4e..81e709f3 100644
+--- a/python/libxml.c
++++ b/python/libxml.c
+@@ -294,7 +294,7 @@ xmlPythonFileReadRaw (void * context, char * buffer, int len) {
+ 	lenread = PyBytes_Size(ret);
+ 	data = PyBytes_AsString(ret);
+ #ifdef PyUnicode_Check
+-    } else if PyUnicode_Check (ret) {
++    } else if (PyUnicode_Check (ret)) {
+ #if PY_VERSION_HEX >= 0x03030000
+         Py_ssize_t size;
+ 	const char *tmp;
+@@ -359,7 +359,7 @@ xmlPythonFileRead (void * context, char * buffer, int len) {
+ 	lenread = PyBytes_Size(ret);
+ 	data = PyBytes_AsString(ret);
+ #ifdef PyUnicode_Check
+-    } else if PyUnicode_Check (ret) {
++    } else if (PyUnicode_Check (ret)) {
+ #if PY_VERSION_HEX >= 0x03030000
+         Py_ssize_t size;
+ 	const char *tmp;
+diff --git a/python/types.c b/python/types.c
+index c2bafeb1..ed284ec7 100644
+--- a/python/types.c
++++ b/python/types.c
+@@ -602,16 +602,16 @@ libxml_xmlXPathObjectPtrConvert(PyObject *obj)
+     if (obj == NULL) {
+         return (NULL);
+     }
+-    if PyFloat_Check (obj) {
++    if (PyFloat_Check (obj)) {
+         ret = xmlXPathNewFloat((double) PyFloat_AS_DOUBLE(obj));
+-    } else if PyLong_Check(obj) {
++    } else if (PyLong_Check(obj)) {
+ #ifdef PyLong_AS_LONG
+         ret = xmlXPathNewFloat((double) PyLong_AS_LONG(obj));
+ #else
+         ret = xmlXPathNewFloat((double) PyInt_AS_LONG(obj));
+ #endif
+ #ifdef PyBool_Check
+-    } else if PyBool_Check (obj) {
++    } else if (PyBool_Check (obj)) {
+ 
+         if (obj == Py_True) {
+           ret = xmlXPathNewBoolean(1);
+@@ -620,14 +620,14 @@ libxml_xmlXPathObjectPtrConvert(PyObject *obj)
+           ret = xmlXPathNewBoolean(0);
+         }
+ #endif
+-    } else if PyBytes_Check (obj) {
++    } else if (PyBytes_Check (obj)) {
+         xmlChar *str;
+ 
+         str = xmlStrndup((const xmlChar *) PyBytes_AS_STRING(obj),
+                          PyBytes_GET_SIZE(obj));
+         ret = xmlXPathWrapString(str);
+ #ifdef PyUnicode_Check
+-    } else if PyUnicode_Check (obj) {
++    } else if (PyUnicode_Check (obj)) {
+ #if PY_VERSION_HEX >= 0x03030000
+         xmlChar *str;
+ 	const char *tmp;
+@@ -650,7 +650,7 @@ libxml_xmlXPathObjectPtrConvert(PyObject *obj)
+ 	ret = xmlXPathWrapString(str);
+ #endif
+ #endif
+-    } else if PyList_Check (obj) {
++    } else if (PyList_Check (obj)) {
+         int i;
+         PyObject *node;
+         xmlNodePtr cur;
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 90890ffaed..2034eaf36e 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2020-7595.patch \
            file://CVE-2019-20388.patch \
            file://CVE-2020-24977.patch \
+           file://0001-Parenthesize-Py-type-_Check-in-ifs.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.25.1

