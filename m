Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6C1F474903
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 06:32:18 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id p8-v6so1134008pgq.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 23:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xZIocPKbZW9RwZ4QiZPjwUqKKkIqmlOt97RjJNKaTS4=;
	b=OXrFdg7m70MC3V8jqlHfI+Y935SSWnqOqFD0ywwW5QVecPmOkRH+/pThfYXf5/NnZP
	r7g67TNVqx0kNdsci7ZbHBy7IOJtksA9r102yuZTGcd6tTFqmudw6EAUXWBalqJa+iCJ
	pZ5rFFQ0fijtNZZJogSY+jjSVY/vST3ha12qU8B29J8U+La8+mCqgyT/h6rltVpAzX1M
	CIuSKdKL8UugHIhK2WRGcxrzzIvykw47ZXpD4y0DM3eTBVlUEvk9AHXrZm70tnnSqMUE
	0czCV8W28fjCMs/WFRMSAth5qi9w0ltgQlw/e9ThS+/BqgVF6Sb8x4vjZfZOuhGuEkbJ
	Obkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xZIocPKbZW9RwZ4QiZPjwUqKKkIqmlOt97RjJNKaTS4=;
	b=cQp65J1InF4uMFTbxnAX4W++lsAMRFHxFKao++ugTA3CDmJbXhkWgNoaeso02f6b49
	TKKTum69apBelGi/FwqktWsKI+WwQP2oyPT9IW/Wovrp9FiABRTQqsrzIYXt/HRM79D0
	kwBFGSC8d3zg8iBfjyZcsmCogUbz/ccZakwKiBUD1Yc4xEPOavhb0yfzB0f3GbWQE/TV
	KmQH4/H7U5ypAw/vHEnQDE6RCQgu7tlSW/Z4yPlJbMeQSLaFJGYhD1iPNNwao5QeaFpd
	xbE1Te3TduXkKqPQ4fGNIHPcCJ6DUbtbyPqn0P+YlSF5kjahtnk3Nfl9AmRDGU4MW7Z5
	zZFQ==
X-Gm-Message-State: ALKqPwcEbfd66t4SKtYoKX4tVYhi48qd37CUqV9UaKMNXoA1G3Xg6dfG
	CQZ8LhVq6dUCV0IkZKVNhI7YgQ==
X-Google-Smtp-Source: AB8JxZrt3ZoY93EUXbRkGJ/r2Wy2J3BmrJpBHjjbSPrvaBpje7MaKQ9aIZKY1Dvueo7PcLmRqUKJmw==
X-Received: by 2002:a62:8910:: with SMTP id
	v16-v6mr18182719pfd.13.1526452339635; 
	Tue, 15 May 2018 23:32:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	s8-v6sm2517411pfh.30.2018.05.15.23.32.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 May 2018 23:32:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 23:32:10 -0700
Message-Id: <ea50bc631b20db2dfd3856b97bb90f251a6c5f94.1526452205.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1526452205.git.raj.khem@gmail.com>
References: <cover.1526452205.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] python2: Fix build with gcc8
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
X-List-Received-Date: Wed, 16 May 2018 06:32:19 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python-native_2.7.14.bb            |  1 +
 .../python/python/fix-gc-alignment.patch      | 43 +++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.14.bb |  1 +
 3 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/fix-gc-alignment.patch

diff --git a/meta/recipes-devtools/python/python-native_2.7.14.bb b/meta/recipes-devtools/python/python-native_2.7.14.bb
index 7c491fa3e0..b822583c53 100644
--- a/meta/recipes-devtools/python/python-native_2.7.14.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.14.bb
@@ -16,6 +16,7 @@ SRC_URI += "\
             file://builddir.patch \
             file://parallel-makeinst-create-bindir.patch \
             file://revert_use_of_sysconfigdata.patch \
+            file://fix-gc-alignment.patch \
            "
 
 S = "${WORKDIR}/Python-${PV}"
diff --git a/meta/recipes-devtools/python/python/fix-gc-alignment.patch b/meta/recipes-devtools/python/python/fix-gc-alignment.patch
new file mode 100644
index 0000000000..b63cd08747
--- /dev/null
+++ b/meta/recipes-devtools/python/python/fix-gc-alignment.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+Fix for over-aligned GC info
+Patch by Florian Weimer
+
+See: https://bugzilla.redhat.com/show_bug.cgi?id=1540316
+Upstream discussion: https://mail.python.org/pipermail/python-dev/2018-January/152000.html
+
+diff --git a/Include/objimpl.h b/Include/objimpl.h
+index 55e83eced6..aa906144dc 100644
+--- a/Include/objimpl.h
++++ b/Include/objimpl.h
+@@ -248,6 +248,18 @@ PyAPI_FUNC(PyVarObject *) _PyObject_GC_Resize(PyVarObject *, Py_ssize_t);
+ /* for source compatibility with 2.2 */
+ #define _PyObject_GC_Del PyObject_GC_Del
+ 
++/* Former over-aligned definition of PyGC_Head, used to compute the
++   size of the padding for the new version below. */
++union _gc_head;
++union _gc_head_old {
++    struct {
++        union _gc_head *gc_next;
++        union _gc_head *gc_prev;
++        Py_ssize_t gc_refs;
++    } gc;
++    long double dummy;
++};
++
+ /* GC information is stored BEFORE the object structure. */
+ typedef union _gc_head {
+     struct {
+@@ -255,7 +267,8 @@ typedef union _gc_head {
+         union _gc_head *gc_prev;
+         Py_ssize_t gc_refs;
+     } gc;
+-    long double dummy;  /* force worst-case alignment */
++    double dummy;  /* force worst-case alignment */
++    char dummy_padding[sizeof(union _gc_head_old)];
+ } PyGC_Head;
+ 
+ extern PyGC_Head *_PyGC_generation0;
+ 
\ No newline at end of file
diff --git a/meta/recipes-devtools/python/python_2.7.14.bb b/meta/recipes-devtools/python/python_2.7.14.bb
index 0a09926dfb..41a8609b15 100644
--- a/meta/recipes-devtools/python/python_2.7.14.bb
+++ b/meta/recipes-devtools/python/python_2.7.14.bb
@@ -30,6 +30,7 @@ SRC_URI += "\
   file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
   file://pass-missing-libraries-to-Extension-for-mul.patch \
   file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
+  file://fix-gc-alignment.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.17.0


