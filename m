Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 19B547F232
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:27 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id q10so8890967pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lGYJuOF3o05J/OK68u0DbpZQMh5YBWi2ewvcrTHrOqY=;
	b=Vdjp08DB1su/b8Gb5I5uIwNEzsBNR/bAxMIC5eoMPrbDH25kcsR6+mv1PL2DKrAuGE
	SCYlul9YFr1oSqxLmAFN2Y0acFJS0pe0b/KZ0xJA/OIi9Yx57x8+PIp7nGuJ2JkOuy2e
	R8fb+4clrrkhYNaHDpqav+IYtuQkymFppPIApRJ0YDE7CqKe3nQ8GQy0uiTAx29SR4Wp
	RCi/2zfTMPiBwSzZEgFFdHSkQpSRyOVA2s0v88Vc904aIf+3x1zyndxdccRSv+pPDPFo
	uukQenpOEanVLPOUWXPHb4fTve38aTPxlg/dNZ1evO7Gm49YAcDLqnCiz3XliCX+3Z95
	6f9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lGYJuOF3o05J/OK68u0DbpZQMh5YBWi2ewvcrTHrOqY=;
	b=bbDGfs+zKDesrRs58qN6qYllKfi0KkYJ070I0LycSr+Yyc5JfC9e5M7n4+zlMezeNh
	uINpOAoRV6ya/uNfPsXZCRYXVNt7QV4UmoK9YAXKcbR3ytEJi2iXYUKHaFKMX37xPlod
	OR3wFY6IqjiizAdR/JnS4hZCzTSUMzDtTtU4zdusWxvQp/HPNt7NMqovmZQWFD+9TzIL
	aV6OzAjO10q4Ns/HmAgzDAXPQCCpeDGJBUoltiPZ2M7/fxym7oRLpifFevQAHtwRM9q2
	lVfiHM0Rpxdp1Y/0OEI5P92sG4Un1o4nCaeDSzTPLguQwfs7x/dHjhv2/iMB17+CkLRv
	eA/Q==
X-Gm-Message-State: APjAAAV8FxlMuJRw6U4Ymu2KP2NcFFETsC03nd3p1LrttgWv9aB0+m1V
	FCMP0cwKS/HKa5Bkq1z5MnwqtyrQcGo=
X-Google-Smtp-Source: APXvYqyjtoIvT5QltMw7pJAjc544E+CfwAF7KOMIq5JMAtpS/7Cze1Ce1NH1pIDVoFCt7jdEZsaBBA==
X-Received: by 2002:a62:5fc1:: with SMTP id t184mr33282245pfb.84.1570461087947;
	Mon, 07 Oct 2019 08:11:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:10:57 -0700
Message-Id: <5862716f22ca9f5745d3bca85c6ed0d8c35c437b.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 20/26] python3: Fix CVEs
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:28 -0000

From: Dan Tran <dantran@microsoft.com>

Fixes CVE-2018-14647, CVE-2018-20406, CVE-2018-20852, CVE-2019-9636,
CVE-2019-9740, and CVE-2019-9747.

Signed-off-by: Dan Tran <dantran@microsoft.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3/CVE-2018-14647.patch            |  95 +++++++++
 .../python/python3/CVE-2018-20406.patch            | 217 +++++++++++++++++++++
 .../python/python3/CVE-2018-20852.patch            | 129 ++++++++++++
 .../python/python3/CVE-2019-9636.patch             | 154 +++++++++++++++
 meta/recipes-devtools/python/python3_3.5.6.bb      |   4 +
 5 files changed, 599 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2018-14647.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2018-20406.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2018-20852.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9636.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2018-14647.patch b/meta/recipes-devtools/python/python3/CVE-2018-14647.patch
new file mode 100644
index 0000000..c1f21f8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2018-14647.patch
@@ -0,0 +1,95 @@
+From 610b4b0dbaedd3099ab76acf678e9cc845d99a76 Mon Sep 17 00:00:00 2001
+From: stratakis <cstratak@redhat.com>
+Date: Mon, 25 Feb 2019 22:04:09 +0100
+Subject: [PATCH] [3.5] bpo-34623: Use XML_SetHashSalt in _elementtree (#9933)
+
+* bpo-34623: Use XML_SetHashSalt in _elementtree (GH-9146)
+
+The C accelerated _elementtree module now initializes hash randomization
+salt from _Py_HashSecret instead of libexpat's default CPRNG.
+
+Signed-off-by: Christian Heimes <christian@python.org>
+
+https://bugs.python.org/issue34623
+(cherry picked from commit cb5778f00ce48631c7140f33ba242496aaf7102b)
+
+Co-authored-by: Christian Heimes <christian@python.org>
+
+CVE: CVE-2018-14647
+Upstream-Status: Backport
+[https://github.com/python/cpython/commit/41b48e71ac8a71f56694b548f118bd20ce203410]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ Include/pyexpat.h                                            | 4 +++-
+ .../next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst   | 2 ++
+ Modules/_elementtree.c                                       | 5 +++++
+ Modules/pyexpat.c                                            | 5 +++++
+ 4 files changed, 15 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst
+
+diff --git a/Include/pyexpat.h b/Include/pyexpat.h
+index 44259bf6d7..07020b5dc9 100644
+--- a/Include/pyexpat.h
++++ b/Include/pyexpat.h
+@@ -3,7 +3,7 @@
+ 
+ /* note: you must import expat.h before importing this module! */
+ 
+-#define PyExpat_CAPI_MAGIC  "pyexpat.expat_CAPI 1.0"
++#define PyExpat_CAPI_MAGIC  "pyexpat.expat_CAPI 1.1"
+ #define PyExpat_CAPSULE_NAME "pyexpat.expat_CAPI"
+ 
+ struct PyExpat_CAPI
+@@ -48,6 +48,8 @@ struct PyExpat_CAPI
+     enum XML_Status (*SetEncoding)(XML_Parser parser, const XML_Char *encoding);
+     int (*DefaultUnknownEncodingHandler)(
+         void *encodingHandlerData, const XML_Char *name, XML_Encoding *info);
++    /* might be none for expat < 2.1.0 */
++    int (*SetHashSalt)(XML_Parser parser, unsigned long hash_salt);
+     /* always add new stuff to the end! */
+ };
+ 
+diff --git a/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst b/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst
+new file mode 100644
+index 0000000000..cbaa4b7506
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst
+@@ -0,0 +1,2 @@
++CVE-2018-14647: The C accelerated _elementtree module now initializes hash
++randomization salt from _Py_HashSecret instead of libexpat's default CSPRNG.
+diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
+index 5dba9f70a9..90c6daf64a 100644
+--- a/Modules/_elementtree.c
++++ b/Modules/_elementtree.c
+@@ -3282,6 +3282,11 @@ _elementtree_XMLParser___init___impl(XMLParserObject *self, PyObject *html,
+         PyErr_NoMemory();
+         return -1;
+     }
++    /* expat < 2.1.0 has no XML_SetHashSalt() */
++    if (EXPAT(SetHashSalt) != NULL) {
++        EXPAT(SetHashSalt)(self->parser,
++                           (unsigned long)_Py_HashSecret.expat.hashsalt);
++    }
+ 
+     if (target) {
+         Py_INCREF(target);
+diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
+index adc9b6cde8..948ab1b703 100644
+--- a/Modules/pyexpat.c
++++ b/Modules/pyexpat.c
+@@ -1882,6 +1882,11 @@ MODULE_INITFUNC(void)
+     capi.SetStartDoctypeDeclHandler = XML_SetStartDoctypeDeclHandler;
+     capi.SetEncoding = XML_SetEncoding;
+     capi.DefaultUnknownEncodingHandler = PyUnknownEncodingHandler;
++#if XML_COMBINED_VERSION >= 20100
++    capi.SetHashSalt = XML_SetHashSalt;
++#else
++    capi.SetHashSalt = NULL;
++#endif
+ 
+     /* export using capsule */
+     capi_object = PyCapsule_New(&capi, PyExpat_CAPSULE_NAME, NULL);
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/python/python3/CVE-2018-20406.patch b/meta/recipes-devtools/python/python3/CVE-2018-20406.patch
new file mode 100644
index 0000000..b69e0c4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2018-20406.patch
@@ -0,0 +1,217 @@
+From 3c7fd2b2729e3ebcf7877e7a32b3bbabf907a38d Mon Sep 17 00:00:00 2001
+From: Victor Stinner <vstinner@redhat.com>
+Date: Tue, 26 Feb 2019 01:42:39 +0100
+Subject: [PATCH] closes bpo-34656: Avoid relying on signed overflow in _pickle
+ memos. (GH-9261) (#11869)
+
+(cherry picked from commit a4ae828ee416a66d8c7bf5ee71d653c2cc6a26dd)
+
+CVE: CVE-2018-20406
+Upstream-Status: Backport
+[https://github.com/python/cpython/commit/ef33dd6036aafbd3f06c1d56e2b1a81dae3da63c]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ Modules/_pickle.c | 63 ++++++++++++++++++++++++-----------------------
+ 1 file changed, 32 insertions(+), 31 deletions(-)
+
+diff --git a/Modules/_pickle.c b/Modules/_pickle.c
+index 0f62b1c019..fcb9e87899 100644
+--- a/Modules/_pickle.c
++++ b/Modules/_pickle.c
+@@ -527,9 +527,9 @@ typedef struct {
+ } PyMemoEntry;
+ 
+ typedef struct {
+-    Py_ssize_t mt_mask;
+-    Py_ssize_t mt_used;
+-    Py_ssize_t mt_allocated;
++    size_t mt_mask;
++    size_t mt_used;
++    size_t mt_allocated;
+     PyMemoEntry *mt_table;
+ } PyMemoTable;
+ 
+@@ -573,8 +573,8 @@ typedef struct UnpicklerObject {
+     /* The unpickler memo is just an array of PyObject *s. Using a dict
+        is unnecessary, since the keys are contiguous ints. */
+     PyObject **memo;
+-    Py_ssize_t memo_size;       /* Capacity of the memo array */
+-    Py_ssize_t memo_len;        /* Number of objects in the memo */
++    size_t memo_size;       /* Capacity of the memo array */
++    size_t memo_len;        /* Number of objects in the memo */
+ 
+     PyObject *pers_func;        /* persistent_load() method, can be NULL. */
+ 
+@@ -658,7 +658,6 @@ PyMemoTable_New(void)
+ static PyMemoTable *
+ PyMemoTable_Copy(PyMemoTable *self)
+ {
+-    Py_ssize_t i;
+     PyMemoTable *new = PyMemoTable_New();
+     if (new == NULL)
+         return NULL;
+@@ -675,7 +674,7 @@ PyMemoTable_Copy(PyMemoTable *self)
+         PyErr_NoMemory();
+         return NULL;
+     }
+-    for (i = 0; i < self->mt_allocated; i++) {
++    for (size_t i = 0; i < self->mt_allocated; i++) {
+         Py_XINCREF(self->mt_table[i].me_key);
+     }
+     memcpy(new->mt_table, self->mt_table,
+@@ -721,7 +720,7 @@ _PyMemoTable_Lookup(PyMemoTable *self, PyObject *key)
+ {
+     size_t i;
+     size_t perturb;
+-    size_t mask = (size_t)self->mt_mask;
++    size_t mask = self->mt_mask;
+     PyMemoEntry *table = self->mt_table;
+     PyMemoEntry *entry;
+     Py_hash_t hash = (Py_hash_t)key >> 3;
+@@ -743,22 +742,24 @@ _PyMemoTable_Lookup(PyMemoTable *self, PyObject *key)
+ 
+ /* Returns -1 on failure, 0 on success. */
+ static int
+-_PyMemoTable_ResizeTable(PyMemoTable *self, Py_ssize_t min_size)
++_PyMemoTable_ResizeTable(PyMemoTable *self, size_t min_size)
+ {
+     PyMemoEntry *oldtable = NULL;
+     PyMemoEntry *oldentry, *newentry;
+-    Py_ssize_t new_size = MT_MINSIZE;
+-    Py_ssize_t to_process;
++    size_t new_size = MT_MINSIZE;
++    size_t to_process;
+ 
+     assert(min_size > 0);
+ 
+-    /* Find the smallest valid table size >= min_size. */
+-    while (new_size < min_size && new_size > 0)
+-        new_size <<= 1;
+-    if (new_size <= 0) {
++    if (min_size > PY_SSIZE_T_MAX) {
+         PyErr_NoMemory();
+         return -1;
+     }
++
++    /* Find the smallest valid table size >= min_size. */
++    while (new_size < min_size) {
++        new_size <<= 1;
++    }
+     /* new_size needs to be a power of two. */
+     assert((new_size & (new_size - 1)) == 0);
+ 
+@@ -808,6 +809,7 @@ static int
+ PyMemoTable_Set(PyMemoTable *self, PyObject *key, Py_ssize_t value)
+ {
+     PyMemoEntry *entry;
++    size_t desired_size;
+ 
+     assert(key != NULL);
+ 
+@@ -831,10 +833,12 @@ PyMemoTable_Set(PyMemoTable *self, PyObject *key, Py_ssize_t value)
+      * Very large memo tables (over 50K items) use doubling instead.
+      * This may help applications with severe memory constraints.
+      */
+-    if (!(self->mt_used * 3 >= (self->mt_mask + 1) * 2))
++    if (SIZE_MAX / 3 >= self->mt_used && self->mt_used * 3 < self->mt_allocated * 2) {
+         return 0;
+-    return _PyMemoTable_ResizeTable(self,
+-        (self->mt_used > 50000 ? 2 : 4) * self->mt_used);
++    }
++    // self->mt_used is always < PY_SSIZE_T_MAX, so this can't overflow.
++    desired_size = (self->mt_used > 50000 ? 2 : 4) * self->mt_used;
++    return _PyMemoTable_ResizeTable(self, desired_size);
+ }
+ 
+ #undef MT_MINSIZE
+@@ -1273,9 +1277,9 @@ _Unpickler_Readline(UnpicklerObject *self, char **result)
+ /* Returns -1 (with an exception set) on failure, 0 on success. The memo array
+    will be modified in place. */
+ static int
+-_Unpickler_ResizeMemoList(UnpicklerObject *self, Py_ssize_t new_size)
++_Unpickler_ResizeMemoList(UnpicklerObject *self, size_t new_size)
+ {
+-    Py_ssize_t i;
++    size_t i;
+ 
+     assert(new_size > self->memo_size);
+ 
+@@ -1292,9 +1296,9 @@ _Unpickler_ResizeMemoList(UnpicklerObject *self, Py_ssize_t new_size)
+ 
+ /* Returns NULL if idx is out of bounds. */
+ static PyObject *
+-_Unpickler_MemoGet(UnpicklerObject *self, Py_ssize_t idx)
++_Unpickler_MemoGet(UnpicklerObject *self, size_t idx)
+ {
+-    if (idx < 0 || idx >= self->memo_size)
++    if (idx >= self->memo_size)
+         return NULL;
+ 
+     return self->memo[idx];
+@@ -1303,7 +1307,7 @@ _Unpickler_MemoGet(UnpicklerObject *self, Py_ssize_t idx)
+ /* Returns -1 (with an exception set) on failure, 0 on success.
+    This takes its own reference to `value`. */
+ static int
+-_Unpickler_MemoPut(UnpicklerObject *self, Py_ssize_t idx, PyObject *value)
++_Unpickler_MemoPut(UnpicklerObject *self, size_t idx, PyObject *value)
+ {
+     PyObject *old_item;
+ 
+@@ -4194,14 +4198,13 @@ static PyObject *
+ _pickle_PicklerMemoProxy_copy_impl(PicklerMemoProxyObject *self)
+ /*[clinic end generated code: output=bb83a919d29225ef input=b73043485ac30b36]*/
+ {
+-    Py_ssize_t i;
+     PyMemoTable *memo;
+     PyObject *new_memo = PyDict_New();
+     if (new_memo == NULL)
+         return NULL;
+ 
+     memo = self->pickler->memo;
+-    for (i = 0; i < memo->mt_allocated; ++i) {
++    for (size_t i = 0; i < memo->mt_allocated; ++i) {
+         PyMemoEntry entry = memo->mt_table[i];
+         if (entry.me_key != NULL) {
+             int status;
+@@ -6620,7 +6623,7 @@ static PyObject *
+ _pickle_UnpicklerMemoProxy_copy_impl(UnpicklerMemoProxyObject *self)
+ /*[clinic end generated code: output=e12af7e9bc1e4c77 input=97769247ce032c1d]*/
+ {
+-    Py_ssize_t i;
++    size_t i;
+     PyObject *new_memo = PyDict_New();
+     if (new_memo == NULL)
+         return NULL;
+@@ -6771,8 +6774,7 @@ static int
+ Unpickler_set_memo(UnpicklerObject *self, PyObject *obj)
+ {
+     PyObject **new_memo;
+-    Py_ssize_t new_memo_size = 0;
+-    Py_ssize_t i;
++    size_t new_memo_size = 0;
+ 
+     if (obj == NULL) {
+         PyErr_SetString(PyExc_TypeError,
+@@ -6789,7 +6791,7 @@ Unpickler_set_memo(UnpicklerObject *self, PyObject *obj)
+         if (new_memo == NULL)
+             return -1;
+ 
+-        for (i = 0; i < new_memo_size; i++) {
++        for (size_t i = 0; i < new_memo_size; i++) {
+             Py_XINCREF(unpickler->memo[i]);
+             new_memo[i] = unpickler->memo[i];
+         }
+@@ -6837,8 +6839,7 @@ Unpickler_set_memo(UnpicklerObject *self, PyObject *obj)
+ 
+   error:
+     if (new_memo_size) {
+-        i = new_memo_size;
+-        while (--i >= 0) {
++        for (size_t i = new_memo_size - 1; i != SIZE_MAX; i--) {
+             Py_XDECREF(new_memo[i]);
+         }
+         PyMem_FREE(new_memo);
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/python/python3/CVE-2018-20852.patch b/meta/recipes-devtools/python/python3/CVE-2018-20852.patch
new file mode 100644
index 0000000..82a114f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2018-20852.patch
@@ -0,0 +1,129 @@
+From 31c16d62fc762ab87e66e7f47e36dbfcfc8b5224 Mon Sep 17 00:00:00 2001
+From: Xtreak <tir.karthi@gmail.com>
+Date: Sun, 17 Mar 2019 05:33:39 +0530
+Subject: [PATCH] [3.5] bpo-35121: prefix dot in domain for proper subdomain
+ validation (GH-10258) (#12281)
+
+Don't send cookies of domain A without Domain attribute to domain B when domain A is a suffix match of domain B while using a cookiejar with `http.cookiejar.DefaultCookiePolicy` policy.  Patch by Karthikeyan Singaravelan.
+(cherry picked from commit ca7fe5063593958e5efdf90f068582837f07bd14)
+
+Co-authored-by: Xtreak <tir.karthi@gmail.com>
+
+CVE: CVE-2018-20852
+Upstream-Status: Backport
+[https://github.com/python/cpython/commit/4749f1b69000259e23b4cc6f63c542a9bdc62f1b]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ Lib/http/cookiejar.py                         | 13 ++++++--
+ Lib/test/test_http_cookiejar.py               | 30 +++++++++++++++++++
+ .../2018-10-31-15-39-17.bpo-35121.EgHv9k.rst  |  4 +++
+ 3 files changed, 45 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
+
+diff --git a/Lib/http/cookiejar.py b/Lib/http/cookiejar.py
+index 6d4572af03..1cc9378ae4 100644
+--- a/Lib/http/cookiejar.py
++++ b/Lib/http/cookiejar.py
+@@ -1148,6 +1148,11 @@ class DefaultCookiePolicy(CookiePolicy):
+         req_host, erhn = eff_request_host(request)
+         domain = cookie.domain
+ 
++        if domain and not domain.startswith("."):
++            dotdomain = "." + domain
++        else:
++            dotdomain = domain
++
+         # strict check of non-domain cookies: Mozilla does this, MSIE5 doesn't
+         if (cookie.version == 0 and
+             (self.strict_ns_domain & self.DomainStrictNonDomain) and
+@@ -1160,7 +1165,7 @@ class DefaultCookiePolicy(CookiePolicy):
+             _debug("   effective request-host name %s does not domain-match "
+                    "RFC 2965 cookie domain %s", erhn, domain)
+             return False
+-        if cookie.version == 0 and not ("."+erhn).endswith(domain):
++        if cookie.version == 0 and not ("."+erhn).endswith(dotdomain):
+             _debug("   request-host %s does not match Netscape cookie domain "
+                    "%s", req_host, domain)
+             return False
+@@ -1174,7 +1179,11 @@ class DefaultCookiePolicy(CookiePolicy):
+             req_host = "."+req_host
+         if not erhn.startswith("."):
+             erhn = "."+erhn
+-        if not (req_host.endswith(domain) or erhn.endswith(domain)):
++        if domain and not domain.startswith("."):
++            dotdomain = "." + domain
++        else:
++            dotdomain = domain
++        if not (req_host.endswith(dotdomain) or erhn.endswith(dotdomain)):
+             #_debug("   request domain %s does not match cookie domain %s",
+             #       req_host, domain)
+             return False
+diff --git a/Lib/test/test_http_cookiejar.py b/Lib/test/test_http_cookiejar.py
+index 49c01ae489..e67e6ae780 100644
+--- a/Lib/test/test_http_cookiejar.py
++++ b/Lib/test/test_http_cookiejar.py
+@@ -417,6 +417,7 @@ class CookieTests(unittest.TestCase):
+             ("http://foo.bar.com/", ".foo.bar.com", True),
+             ("http://foo.bar.com/", "foo.bar.com", True),
+             ("http://foo.bar.com/", ".bar.com", True),
++            ("http://foo.bar.com/", "bar.com", True),
+             ("http://foo.bar.com/", "com", True),
+             ("http://foo.com/", "rhubarb.foo.com", False),
+             ("http://foo.com/", ".foo.com", True),
+@@ -427,6 +428,8 @@ class CookieTests(unittest.TestCase):
+             ("http://foo/", "foo", True),
+             ("http://foo/", "foo.local", True),
+             ("http://foo/", ".local", True),
++            ("http://barfoo.com", ".foo.com", False),
++            ("http://barfoo.com", "foo.com", False),
+             ]:
+             request = urllib.request.Request(url)
+             r = pol.domain_return_ok(domain, request)
+@@ -961,6 +964,33 @@ class CookieTests(unittest.TestCase):
+         c.add_cookie_header(req)
+         self.assertFalse(req.has_header("Cookie"))
+ 
++        c.clear()
++
++        pol.set_blocked_domains([])
++        req = urllib.request.Request("http://acme.com/")
++        res = FakeResponse(headers, "http://acme.com/")
++        cookies = c.make_cookies(res, req)
++        c.extract_cookies(res, req)
++        self.assertEqual(len(c), 1)
++
++        req = urllib.request.Request("http://acme.com/")
++        c.add_cookie_header(req)
++        self.assertTrue(req.has_header("Cookie"))
++
++        req = urllib.request.Request("http://badacme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(pol.return_ok(cookies[0], req))
++        self.assertFalse(req.has_header("Cookie"))
++
++        p = pol.set_blocked_domains(["acme.com"])
++        req = urllib.request.Request("http://acme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(req.has_header("Cookie"))
++
++        req = urllib.request.Request("http://badacme.com/")
++        c.add_cookie_header(req)
++        self.assertFalse(req.has_header("Cookie"))
++
+     def test_secure(self):
+         for ns in True, False:
+             for whitespace in " ", "":
+diff --git a/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst b/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
+new file mode 100644
+index 0000000000..d2eb8f1f35
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2018-10-31-15-39-17.bpo-35121.EgHv9k.rst
+@@ -0,0 +1,4 @@
++Don't send cookies of domain A without Domain attribute to domain B
++when domain A is a suffix match of domain B while using a cookiejar
++with :class:`http.cookiejar.DefaultCookiePolicy` policy. Patch by
++Karthikeyan Singaravelan.
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/python/python3/CVE-2019-9636.patch b/meta/recipes-devtools/python/python3/CVE-2019-9636.patch
new file mode 100644
index 0000000..ce8eb66
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2019-9636.patch
@@ -0,0 +1,154 @@
+From b0305339567b64e07df87620e97e4cb99332aef6 Mon Sep 17 00:00:00 2001
+From: Steve Dower <steve.dower@microsoft.com>
+Date: Sun, 10 Mar 2019 21:59:24 -0700
+Subject: [PATCH] bpo-36216: Add check for characters in netloc that normalize
+ to separators (GH-12201) (#12223)
+
+CVE: CVE-2019-9636
+Upstream-Status: Backport
+[https://github.com/python/cpython/commit/c0d95113b070799679bcb9dc49d4960d82e8bb08]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ Doc/library/urllib.parse.rst                  | 18 +++++++++++++++
+ Lib/test/test_urlparse.py                     | 23 +++++++++++++++++++
+ Lib/urllib/parse.py                           | 17 ++++++++++++++
+ .../2019-03-06-09-38-40.bpo-36216.6q1m4a.rst  |  3 +++
+ 4 files changed, 61 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+
+diff --git a/Doc/library/urllib.parse.rst b/Doc/library/urllib.parse.rst
+index 6f722a8897..a4c6b6726e 100644
+--- a/Doc/library/urllib.parse.rst
++++ b/Doc/library/urllib.parse.rst
+@@ -120,6 +120,11 @@ or on combining URL components into a URL string.
+    Unmatched square brackets in the :attr:`netloc` attribute will raise a
+    :exc:`ValueError`.
+ 
++   Characters in the :attr:`netloc` attribute that decompose under NFKC
++   normalization (as used by the IDNA encoding) into any of ``/``, ``?``,
++   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL is
++   decomposed before parsing, no error will be raised.
++
+    .. versionchanged:: 3.2
+       Added IPv6 URL parsing capabilities.
+ 
+@@ -128,6 +133,10 @@ or on combining URL components into a URL string.
+       false), in accordance with :rfc:`3986`.  Previously, a whitelist of
+       schemes that support fragments existed.
+ 
++   .. versionchanged:: 3.5.7
++      Characters that affect netloc parsing under NFKC normalization will
++      now raise :exc:`ValueError`.
++
+ 
+ .. function:: parse_qs(qs, keep_blank_values=False, strict_parsing=False, encoding='utf-8', errors='replace')
+ 
+@@ -236,6 +245,15 @@ or on combining URL components into a URL string.
+    Unmatched square brackets in the :attr:`netloc` attribute will raise a
+    :exc:`ValueError`.
+ 
++   Characters in the :attr:`netloc` attribute that decompose under NFKC
++   normalization (as used by the IDNA encoding) into any of ``/``, ``?``,
++   ``#``, ``@``, or ``:`` will raise a :exc:`ValueError`. If the URL is
++   decomposed before parsing, no error will be raised.
++
++   .. versionchanged:: 3.5.7
++      Characters that affect netloc parsing under NFKC normalization will
++      now raise :exc:`ValueError`.
++
+ 
+ .. function:: urlunsplit(parts)
+ 
+diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
+index e2cf1b7e0f..d0420b0e74 100644
+--- a/Lib/test/test_urlparse.py
++++ b/Lib/test/test_urlparse.py
+@@ -1,3 +1,5 @@
++import sys
++import unicodedata
+ import unittest
+ import urllib.parse
+ 
+@@ -970,6 +972,27 @@ class UrlParseTestCase(unittest.TestCase):
+                 expected.append(name)
+         self.assertCountEqual(urllib.parse.__all__, expected)
+ 
++    def test_urlsplit_normalization(self):
++        # Certain characters should never occur in the netloc,
++        # including under normalization.
++        # Ensure that ALL of them are detected and cause an error
++        illegal_chars = '/:#?@'
++        hex_chars = {'{:04X}'.format(ord(c)) for c in illegal_chars}
++        denorm_chars = [
++            c for c in map(chr, range(128, sys.maxunicode))
++            if (hex_chars & set(unicodedata.decomposition(c).split()))
++            and c not in illegal_chars
++        ]
++        # Sanity check that we found at least one such character
++        self.assertIn('\u2100', denorm_chars)
++        self.assertIn('\uFF03', denorm_chars)
++
++        for scheme in ["http", "https", "ftp"]:
++            for c in denorm_chars:
++                url = "{}://netloc{}false.netloc/path".format(scheme, c)
++                with self.subTest(url=url, char='{:04X}'.format(ord(c))):
++                    with self.assertRaises(ValueError):
++                        urllib.parse.urlsplit(url)
+ 
+ class Utility_Tests(unittest.TestCase):
+     """Testcase to test the various utility functions in the urllib."""
+diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
+index 62e8ddf04b..7ba2b445f5 100644
+--- a/Lib/urllib/parse.py
++++ b/Lib/urllib/parse.py
+@@ -327,6 +327,21 @@ def _splitnetloc(url, start=0):
+             delim = min(delim, wdelim)     # use earliest delim position
+     return url[start:delim], url[delim:]   # return (domain, rest)
+ 
++def _checknetloc(netloc):
++    if not netloc or not any(ord(c) > 127 for c in netloc):
++        return
++    # looking for characters like \u2100 that expand to 'a/c'
++    # IDNA uses NFKC equivalence, so normalize for this check
++    import unicodedata
++    netloc2 = unicodedata.normalize('NFKC', netloc)
++    if netloc == netloc2:
++        return
++    _, _, netloc = netloc.rpartition('@') # anything to the left of '@' is okay
++    for c in '/?#@:':
++        if c in netloc2:
++            raise ValueError("netloc '" + netloc2 + "' contains invalid " +
++                             "characters under NFKC normalization")
++
+ def urlsplit(url, scheme='', allow_fragments=True):
+     """Parse a URL into 5 components:
+     <scheme>://<netloc>/<path>?<query>#<fragment>
+@@ -356,6 +371,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+                 url, fragment = url.split('#', 1)
+             if '?' in url:
+                 url, query = url.split('?', 1)
++            _checknetloc(netloc)
+             v = SplitResult(scheme, netloc, url, query, fragment)
+             _parse_cache[key] = v
+             return _coerce_result(v)
+@@ -379,6 +395,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+         url, fragment = url.split('#', 1)
+     if '?' in url:
+         url, query = url.split('?', 1)
++    _checknetloc(netloc)
+     v = SplitResult(scheme, netloc, url, query, fragment)
+     _parse_cache[key] = v
+     return _coerce_result(v)
+diff --git a/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+new file mode 100644
+index 0000000000..5546394157
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-03-06-09-38-40.bpo-36216.6q1m4a.rst
+@@ -0,0 +1,3 @@
++Changes urlsplit() to raise ValueError when the URL contains characters that
++decompose under IDNA encoding (NFKC-normalization) into characters that
++affect how the URL is parsed.
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 7e74c55..b2f8a3d 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -44,6 +44,10 @@ SRC_URI += "\
             file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
             file://run-ptest \
             file://CVE-2019-9740.patch \
+            file://CVE-2018-14647.patch \
+            file://CVE-2018-20406.patch \
+            file://CVE-2018-20852.patch \
+            file://CVE-2019-9636.patch \
            "
 
 inherit multilib_header python3native update-alternatives qemu ptest
-- 
2.7.4


