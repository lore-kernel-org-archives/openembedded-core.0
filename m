Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 14E497199E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 11:37:43 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id c8-v6so10141523qtp.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 04:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P0ZDMw0NjQ9gJ5VoS2WrwlVq2KVdiR2xFVhLNGFNu9s=;
	b=BDJxZFMOUJZ4gFqXyD1CESZpc2RkVLADqDGnl7gf3xtnyjS7WMZWm/HCUEu2Sl7/Aq
	TUnrouiUl/e57G6xQYN1U5X8U02KSR88ign1zLiZAacWydevUxtNplAgqcNCkdYD5wXQ
	QvkUCo3MqiKCeqMKEh/D7iad+kBGyYFN6BSmmTr/boYzWZ/f7+Ke9/q2e4lp16Tj52oK
	sf/4Dy8HE5HxCmEf+Nj/NExTwsJ4AvDBjyrSVgLY9/g+OV5+osl0nm996oE+KnKmiFpu
	XmQrhNb2qbCzfzFOcPFB5cvUAY7ftf7WCNai+4xMrE6ANQubJi9+xxoDjYvwM5FpEuf/
	axZg==
X-Gm-Message-State: APt69E1nhOW85Kmk6lk1tjL5wA59OC9hdj9SrRJobfsVhZf33/Wd4O9b
	NP5hOnVI9FkBcgw4lb3B0UXQEQFS
X-Google-Smtp-Source: AAOMgpfjDVYLsHksTLg5POdiAeH3UujI7TNmZXadMcxYicLSmk/j/TOThKU/s6SaPG76HOk1PbTRLw==
X-Received: by 2002:ac8:249:: with SMTP id
	o9-v6mr17070769qtg.355.1530358664405; 
	Sat, 30 Jun 2018 04:37:44 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	35-v6sm779307qtp.76.2018.06.30.04.37.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jun 2018 04:37:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jun 2018 07:37:35 -0400
Message-Id: <1530358655-7947-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python: update to version 2.7.15
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Jun 2018 11:37:44 -0000

Update to the latest stable version

License-Update: Copyright year updated to include 2018

Remove the alignment patch that is included upstream

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...on-native_2.7.14.bb => python-native_2.7.15.bb} |  1 -
 meta/recipes-devtools/python/python.inc            |  6 +--
 .../python/python/fix-gc-alignment.patch           | 43 ----------------------
 .../python/{python_2.7.14.bb => python_2.7.15.bb}  |  1 -
 4 files changed, 3 insertions(+), 48 deletions(-)
 rename meta/recipes-devtools/python/{python-native_2.7.14.bb => python-native_2.7.15.bb} (98%)
 delete mode 100644 meta/recipes-devtools/python/python/fix-gc-alignment.patch
 rename meta/recipes-devtools/python/{python_2.7.14.bb => python_2.7.15.bb} (99%)

diff --git a/meta/recipes-devtools/python/python-native_2.7.14.bb b/meta/recipes-devtools/python/python-native_2.7.15.bb
similarity index 98%
rename from meta/recipes-devtools/python/python-native_2.7.14.bb
rename to meta/recipes-devtools/python/python-native_2.7.15.bb
index b822583..7c491fa 100644
--- a/meta/recipes-devtools/python/python-native_2.7.14.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.15.bb
@@ -16,7 +16,6 @@ SRC_URI += "\
             file://builddir.patch \
             file://parallel-makeinst-create-bindir.patch \
             file://revert_use_of_sysconfigdata.patch \
-            file://fix-gc-alignment.patch \
            "
 
 S = "${WORKDIR}/Python-${PV}"
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 84bcb6a..901acd0 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -5,12 +5,12 @@ SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
 INC_PR = "r1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f741e51de91d4eeea5930b9c3c7fa69d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f257cc14f81685691652a3d3e1b5d754"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "1f6db41ad91d9eb0a6f0c769b8613c5b"
-SRC_URI[sha256sum] = "71ffb26e09e78650e424929b2b457b9c912ac216576e6bd9e7d204ed03296a66"
+SRC_URI[md5sum] = "a80ae3cc478460b922242f43a1b4094d"
+SRC_URI[sha256sum] = "22d9b1ac5b26135ad2b8c2901a9413537e08749a753356ee913c84dbd2df5574"
 
 # python recipe is actually python 2.x
 # also, exclude pre-releases for both python 2.x and 3.x
diff --git a/meta/recipes-devtools/python/python/fix-gc-alignment.patch b/meta/recipes-devtools/python/python/fix-gc-alignment.patch
deleted file mode 100644
index b63cd08..0000000
--- a/meta/recipes-devtools/python/python/fix-gc-alignment.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Fix for over-aligned GC info
-Patch by Florian Weimer
-
-See: https://bugzilla.redhat.com/show_bug.cgi?id=1540316
-Upstream discussion: https://mail.python.org/pipermail/python-dev/2018-January/152000.html
-
-diff --git a/Include/objimpl.h b/Include/objimpl.h
-index 55e83eced6..aa906144dc 100644
---- a/Include/objimpl.h
-+++ b/Include/objimpl.h
-@@ -248,6 +248,18 @@ PyAPI_FUNC(PyVarObject *) _PyObject_GC_Resize(PyVarObject *, Py_ssize_t);
- /* for source compatibility with 2.2 */
- #define _PyObject_GC_Del PyObject_GC_Del
- 
-+/* Former over-aligned definition of PyGC_Head, used to compute the
-+   size of the padding for the new version below. */
-+union _gc_head;
-+union _gc_head_old {
-+    struct {
-+        union _gc_head *gc_next;
-+        union _gc_head *gc_prev;
-+        Py_ssize_t gc_refs;
-+    } gc;
-+    long double dummy;
-+};
-+
- /* GC information is stored BEFORE the object structure. */
- typedef union _gc_head {
-     struct {
-@@ -255,7 +267,8 @@ typedef union _gc_head {
-         union _gc_head *gc_prev;
-         Py_ssize_t gc_refs;
-     } gc;
--    long double dummy;  /* force worst-case alignment */
-+    double dummy;  /* force worst-case alignment */
-+    char dummy_padding[sizeof(union _gc_head_old)];
- } PyGC_Head;
- 
- extern PyGC_Head *_PyGC_generation0;
- 
\ No newline at end of file
diff --git a/meta/recipes-devtools/python/python_2.7.14.bb b/meta/recipes-devtools/python/python_2.7.15.bb
similarity index 99%
rename from meta/recipes-devtools/python/python_2.7.14.bb
rename to meta/recipes-devtools/python/python_2.7.15.bb
index b923b92..3044c3d 100644
--- a/meta/recipes-devtools/python/python_2.7.14.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -30,7 +30,6 @@ SRC_URI += "\
   file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
   file://pass-missing-libraries-to-Extension-for-mul.patch \
   file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
-  file://fix-gc-alignment.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.7.4


