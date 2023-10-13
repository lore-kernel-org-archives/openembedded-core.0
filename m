Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EC0CDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 08:59:18 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.34388.1697187549253757280
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 01:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="123737575"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="123737575"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 17:59:06 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E4CDD29E1
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:59:04 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 855A6D6022
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:59:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C38656BA71;
	Fri, 13 Oct 2023 17:59:02 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libcomps: upgrade 0.1.19 -> 0.1.20
Date: Fri, 13 Oct 2023 16:58:56 +0800
Message-Id: <1697187536-4170-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10-2.704900-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/ycZLM5/LTRf/kdS3kPlaZyVkDFfw8NSG/Nnf
	JrUSEbFD/9FzCWH6Yv2mKaU7uZLa5se3wV6A2hch8t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQB1e
	gkZdCJXdsXqCizdUSQ9o7nBvaGi9BVoG8mkAKgzySRFDtqiM5SxtuGFXrmRpjNFcW7s87GgC6YY
	/KyxMxtSGpUS2AYGCGT9uWjMvB5NDEJl9JO3ababcPsR57JkIzmJAMgmwOylegeY5Nk114xZSDl
	QPoCUXSsX24ahsS5PuAMuqetGVetksDkkP3zIjq3QfwsVk0UbvqwGfCk7KUs+CYH0inzbLIbgcB
	ZSplS5Uya6FJ21WlnK336GlQoJQzEQRGHbTBaOXsNj4UXWU2i9THaKkrJ5JY0zECtGUs8NcWNJK
	4sd5hI4geppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 08:59:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189037

From: Wang Mingyu <wangmy@fujitsu.com>

0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch
removed since it's included in 0.1.20

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hash_t-instead-of-long-in-PyCOMPS_ha.patch | 66 -------------------
 ...{libcomps_0.1.19.bb => libcomps_0.1.20.bb} |  3 +-
 2 files changed, 1 insertion(+), 68 deletions(-)
 delete mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.19.bb => libcomps_0.1.20.bb} (86%)

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch b/meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch
deleted file mode 100644
index dd9ebc8af4..0000000000
--- a/meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 26a9647c832de15248ee649e5b77075521f3d4f0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 3 Mar 2023 08:37:35 -0800
-Subject: [PATCH] libcomps: Use Py_hash_t instead of long in PyCOMPS_hash()
-
-This function is used as a hashfunc callback in
-_typeobject defined python3.11/cpython/object.h
-compilers detect the protype mismatch for function pointers
-with clang16+
-
-Fixes
-libcomps/src/python/src/pycomps_sequence.c:667:5: error: incompatible function pointer types initializing 'hashfunc' (aka 'int (*)(struct _object *)') with an expression of type 'long (*)(PyObject *)' (aka 'long (*)(struct _object *)') [-Wincompatible-function-pointer-types]
-    &PyCOMPS_hash,             /*tp_hash */
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libcomps/pull/101]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libcomps/src/python/src/pycomps_hash.c  | 4 ++--
- libcomps/src/python/src/pycomps_hash.h  | 2 +-
- libcomps/src/python/src/pycomps_utils.h | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/libcomps/src/python/src/pycomps_hash.c b/libcomps/src/python/src/pycomps_hash.c
-index 474afd5..4577769 100644
---- a/libcomps/src/python/src/pycomps_hash.c
-+++ b/libcomps/src/python/src/pycomps_hash.c
-@@ -20,9 +20,9 @@
- #include "pycomps_hash.h"
- #include "pycomps_utils.h"
- 
--long PyCOMPS_hash(PyObject *self) {
-+Py_hash_t PyCOMPS_hash(PyObject *self) {
-     char *cstr = NULL;
--    long crc;
-+    Py_hash_t crc;
- 
-     cstr = comps_object_tostr(((PyCompsObject*)self)->c_obj);
-     crc = crc32(0, cstr, strlen(cstr));
-diff --git a/libcomps/src/python/src/pycomps_hash.h b/libcomps/src/python/src/pycomps_hash.h
-index b664cae..54e08d9 100644
---- a/libcomps/src/python/src/pycomps_hash.h
-+++ b/libcomps/src/python/src/pycomps_hash.h
-@@ -26,6 +26,6 @@
- #include "pycomps_utils.h"
- 
- 
--long PyCOMPS_hash(PyObject *self);
-+Py_hash_t PyCOMPS_hash(PyObject *self);
- 
- #endif
-diff --git a/libcomps/src/python/src/pycomps_utils.h b/libcomps/src/python/src/pycomps_utils.h
-index ba9bc2f..b34e4dc 100644
---- a/libcomps/src/python/src/pycomps_utils.h
-+++ b/libcomps/src/python/src/pycomps_utils.h
-@@ -137,7 +137,7 @@ COMPS_Object* __pycomps_bytes_in(PyObject *pobj);
- PyObject* __pycomps_str_out(COMPS_Object *obj);
- PyObject *str_to_unicode(void* str);
- 
--long PyCOMPS_hash(PyObject *self);
-+Py_hash_t PyCOMPS_hash(PyObject *self);
- 
- PyObject* PyCOMPSSeq_extra_get(PyObject *self, PyObject *key);
- 
--- 
-2.39.2
-
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb
similarity index 86%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.19.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.20.bb
index e362e8e108..1f59c5ea1e 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb
@@ -5,11 +5,10 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;protocol=https \
-           file://0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch \
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "9322bdcf06630cc094f094f944d7d0e2cb798b73"
+SRCREV = "854fbb9fe733b774981e1ffcf825b2d2ce0f8072"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


