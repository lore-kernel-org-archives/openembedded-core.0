Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BEDC791AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:17:22 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id b15-v6so2453393oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nTK3YnAfdFIYBkUy7fM8TUlt/efwLCgVz2j3/VIGFpA=;
	b=S6JcGyCoJ/xUxxey3lxU3g+dcdhjcUJc4sXYGKreZVTNMl8CEoW1/kNSJMN+Gns7o/
	Ti1+aIjqM+W6pL18FBejmSwtsB2bAyZ+ILj0gnsS4P2zHivB01/PBPVpLUd0KhXHQ5RP
	9etTVzhLvDwNqzKLOjMzdn3gnpnrmjzO6VSyk53/9taA7yI2pzM5bmsHUYHO0TBe6prY
	EL0Ajy4zM5UOJe3FomxS0U2CIsOBCfNtZxpbylo255GgOw4tmbsvnMLRjCsGL7cD+PfN
	miyHEdWnXAiy/lIC758NDCxSkgB5clGKRE62710EV0BcowwyO0QVib8dbP10g74JlL87
	ZolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nTK3YnAfdFIYBkUy7fM8TUlt/efwLCgVz2j3/VIGFpA=;
	b=FS2iJ03Hg3q5M7tbMSiYZIfcmLYqN+UTHa88A3xKVPRUCPJu38I3zPo3d4L5XdgDQ8
	FO6o23h3GVjgZy2RQJT9Pk55GwxSimffuwzUELus4rG82P5oqjSTw4OUh6Tx85SbQuj2
	o3eq8wnunzev/zYGD03HlwCK+/DodhtMOfB8RKWmYxZiAjpUHDY2BNCYX+8e9Z3JiRuK
	C+j0ZOi+l6Pn7IoU9PVjyyqHuLw92vx4Ur9qmhanK2Rt3B94/aJ+Kld58BZAj+SxO52i
	kPiLd63wcE86FMLBkDtpGP9YhskFa2ALHvZjW0YZl6eejuYD+c3rvhi7qA9oHbwmCKrK
	MCrA==
X-Gm-Message-State: APzg51CNMI82pp3i7NZ6Rwv8jC+P850ywI5+YmaTRxGYEL5IecXVYsjQ
	gKM8GelBOTnP7rRJVYePaEo5BD8+xbg=
X-Google-Smtp-Source: ANB0VdYiHr4bvPQ3Sa+Orzo211BFnk+ki0Z/HOCIaqAR0GHcTdw8ds8+wenYnVg9kYBchHBc0Jzf3Q==
X-Received: by 2002:aca:ed45:: with SMTP id
	l66-v6mr3650361oih.40.1534936642947; 
	Wed, 22 Aug 2018 04:17:22 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm694446oix.36.2018.08.22.04.17.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:17:22 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:46:40 +0530
Message-Id: <1534936615-11658-4-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
Cc: Ferret on Shark <shark_admin@mvista.co>
Subject: [SUMO][PATCH 04/19] python: CVE-2018-1000030
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
X-List-Received-Date: Wed, 22 Aug 2018 11:17:22 -0000

From: Ferret on Shark <shark_admin@mvista.co>

* CVE-2018-1000030-1
[2.7] bpo-31530: Stop crashes when iterating over a file on multiple threads

* CVE-2018-1000030-2
Multiple threads iterating over a file can corrupt the file's internal readahead
buffer resulting in crashes. To fix this, cache buffer state thread-locally for
the duration of a file_iternext call and only update the file's internal state
after reading completes.

No attempt is made to define or provide "reasonable" semantics for iterating
over a file on multiple threads. (Non-crashing) races are still
present. Duplicated, corrupt, and missing data will happen.

This was originally fixed by 6401e56, which
raised an exception from seek() and next() when concurrent operations were
detected. Alas, this simpler solution breaks legitimate use cases such as
capturing the standard streams when multiple threads are logging.

Affects python <= 2.7.14

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/recipes-devtools/python/python.inc            |   4 +-
 .../python/python/CVE-2018-1000030-1.patch         | 138 ++++++++++
 .../python/python/CVE-2018-1000030-2.patch         | 306 +++++++++++++++++++++
 3 files changed, 447 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python/CVE-2018-1000030-1.patch
 create mode 100644 meta/recipes-devtools/python/python/CVE-2018-1000030-2.patch

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 979b601..69542c9 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -7,7 +7,9 @@ INC_PR = "r1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f741e51de91d4eeea5930b9c3c7fa69d"
 
-SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz"
+SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
+           file://CVE-2018-1000030-1.patch \
+           file://CVE-2018-1000030-2.patch"
 
 SRC_URI[md5sum] = "1f6db41ad91d9eb0a6f0c769b8613c5b"
 SRC_URI[sha256sum] = "71ffb26e09e78650e424929b2b457b9c912ac216576e6bd9e7d204ed03296a66"
diff --git a/meta/recipes-devtools/python/python/CVE-2018-1000030-1.patch b/meta/recipes-devtools/python/python/CVE-2018-1000030-1.patch
new file mode 100644
index 0000000..06ad4c6
--- /dev/null
+++ b/meta/recipes-devtools/python/python/CVE-2018-1000030-1.patch
@@ -0,0 +1,138 @@
+From 6401e5671781eb217ee1afb4603cc0d1b0367ae6 Mon Sep 17 00:00:00 2001
+From: Serhiy Storchaka <storchaka@gmail.com>
+Date: Fri, 10 Nov 2017 12:58:55 +0200
+Subject: [PATCH] [2.7] bpo-31530: Stop crashes when iterating over a file on
+ multiple threads. (#3672)
+
+CVE: CVE-2018-1000030
+Upstream-Status: Backport [https://github.com/python/cpython/commit/6401e5671781eb217ee1afb4603cc0d1b0367ae6]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ Lib/test/test_file2k.py                            | 32 ++++++++++++++++++++++
+ .../2017-09-20-18-28-09.bpo-31530.CdLOM7.rst       |  4 +++
+ Objects/fileobject.c                               | 19 +++++++++++--
+ 3 files changed, 52 insertions(+), 3 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Core and Builtins/2017-09-20-18-28-09.bpo-31530.CdLOM7.rst
+
+diff --git a/Lib/test/test_file2k.py b/Lib/test/test_file2k.py
+index e39ef7042e..d8966e034e 100644
+--- a/Lib/test/test_file2k.py
++++ b/Lib/test/test_file2k.py
+@@ -652,6 +652,38 @@ class FileThreadingTests(unittest.TestCase):
+             self.f.writelines('')
+         self._test_close_open_io(io_func)
+ 
++    def test_iteration_torture(self):
++        # bpo-31530: Crash when concurrently iterate over a file.
++        with open(self.filename, "wb") as fp:
++            for i in xrange(2**20):
++                fp.write(b"0"*50 + b"\n")
++        with open(self.filename, "rb") as f:
++            def iterate():
++                try:
++                    for l in f:
++                        pass
++                except IOError:
++                    pass
++            self._run_workers(iterate, 10)
++
++    def test_iteration_seek(self):
++        # bpo-31530: Crash when concurrently seek and iterate over a file.
++        with open(self.filename, "wb") as fp:
++            for i in xrange(10000):
++                fp.write(b"0"*50 + b"\n")
++        with open(self.filename, "rb") as f:
++            it = iter([1] + [0]*10)  # one thread reads, others seek
++            def iterate():
++                try:
++                    if next(it):
++                        for l in f:
++                            pass
++                    else:
++                        for i in range(100):
++                            f.seek(i*100, 0)
++                except IOError:
++                    pass
++            self._run_workers(iterate, 10)
+ 
+ @unittest.skipUnless(os.name == 'posix', 'test requires a posix system.')
+ class TestFileSignalEINTR(unittest.TestCase):
+diff --git a/Misc/NEWS.d/next/Core and Builtins/2017-09-20-18-28-09.bpo-31530.CdLOM7.rst b/Misc/NEWS.d/next/Core and Builtins/2017-09-20-18-28-09.bpo-31530.CdLOM7.rst
+new file mode 100644
+index 0000000000..a6cb6c9e9b
+--- /dev/null
++++ b/Misc/NEWS.d/next/Core and Builtins/2017-09-20-18-28-09.bpo-31530.CdLOM7.rst	
+@@ -0,0 +1,4 @@
++Fixed crashes when iterating over a file on multiple threads.
++seek() and next() methods of file objects now raise an exception during
++concurrent operation on the same file object.
++A lock can be used to prevent the error.
+diff --git a/Objects/fileobject.c b/Objects/fileobject.c
+index 7e07a5376f..2f63c374d1 100644
+--- a/Objects/fileobject.c
++++ b/Objects/fileobject.c
+@@ -430,7 +430,7 @@ close_the_file(PyFileObject *f)
+             if (f->ob_refcnt > 0) {
+                 PyErr_SetString(PyExc_IOError,
+                     "close() called during concurrent "
+-                    "operation on the same file object.");
++                    "operation on the same file object");
+             } else {
+                 /* This should not happen unless someone is
+                  * carelessly playing with the PyFileObject
+@@ -438,7 +438,7 @@ close_the_file(PyFileObject *f)
+                  * pointer. */
+                 PyErr_SetString(PyExc_SystemError,
+                     "PyFileObject locking error in "
+-                    "destructor (refcnt <= 0 at close).");
++                    "destructor (refcnt <= 0 at close)");
+             }
+             return NULL;
+         }
+@@ -762,6 +762,12 @@ file_seek(PyFileObject *f, PyObject *args)
+ 
+     if (f->f_fp == NULL)
+         return err_closed();
++    if (f->unlocked_count > 0) {
++        PyErr_SetString(PyExc_IOError,
++            "seek() called during concurrent "
++            "operation on the same file object");
++        return NULL;
++    }
+     drop_readahead(f);
+     whence = 0;
+     if (!PyArg_ParseTuple(args, "O|i:seek", &offobj, &whence))
+@@ -2238,6 +2244,7 @@ readahead(PyFileObject *f, Py_ssize_t bufsize)
+ {
+     Py_ssize_t chunksize;
+ 
++    assert(f->unlocked_count == 0);
+     if (f->f_buf != NULL) {
+         if( (f->f_bufend - f->f_bufptr) >= 1)
+             return 0;
+@@ -2279,6 +2286,12 @@ readahead_get_line_skip(PyFileObject *f, Py_ssize_t skip, Py_ssize_t bufsize)
+     char *buf;
+     Py_ssize_t len;
+ 
++    if (f->unlocked_count > 0) {
++        PyErr_SetString(PyExc_IOError,
++            "next() called during concurrent "
++            "operation on the same file object");
++        return NULL;
++    }
+     if (f->f_buf == NULL)
+         if (readahead(f, bufsize) < 0)
+             return NULL;
+@@ -2692,7 +2705,7 @@ int PyObject_AsFileDescriptor(PyObject *o)
+     }
+     else {
+         PyErr_SetString(PyExc_TypeError,
+-                        "argument must be an int, or have a fileno() method.");
++                        "argument must be an int, or have a fileno() method");
+         return -1;
+     }
+ 
+-- 
+2.13.3
+
diff --git a/meta/recipes-devtools/python/python/CVE-2018-1000030-2.patch b/meta/recipes-devtools/python/python/CVE-2018-1000030-2.patch
new file mode 100644
index 0000000..9b7713b
--- /dev/null
+++ b/meta/recipes-devtools/python/python/CVE-2018-1000030-2.patch
@@ -0,0 +1,306 @@
+From dbf52e02f18dac6f5f0a64f78932f3dc6efc056b Mon Sep 17 00:00:00 2001
+From: Benjamin Peterson <benjamin@python.org>
+Date: Tue, 2 Jan 2018 09:25:41 -0800
+Subject: [PATCH] bpo-31530: fix crash when multiple threads iterate over a
+ file, round 2 (#5060)
+
+Multiple threads iterating over a file can corrupt the file's internal readahead
+buffer resulting in crashes. To fix this, cache buffer state thread-locally for
+the duration of a file_iternext call and only update the file's internal state
+after reading completes.
+
+No attempt is made to define or provide "reasonable" semantics for iterating
+over a file on multiple threads. (Non-crashing) races are still
+present. Duplicated, corrupt, and missing data will happen.
+
+This was originally fixed by 6401e5671781eb217ee1afb4603cc0d1b0367ae6, which
+raised an exception from seek() and next() when concurrent operations were
+detected. Alas, this simpler solution breaks legitimate use cases such as
+capturing the standard streams when multiple threads are logging.
+
+CVE: CVE-2018-1000030
+Upstream-Status: Backport [https://github.com/python/cpython/commit/dbf52e02f18dac6f5f0a64f78932f3dc6efc056b]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+
+---
+ Lib/test/test_file2k.py                            |  27 ++---
+ .../2017-09-20-18-28-09.bpo-31530.CdLOM7.rst       |   3 -
+ Objects/fileobject.c                               | 118 ++++++++++++---------
+ 3 files changed, 78 insertions(+), 70 deletions(-)
+
+diff --git a/Lib/test/test_file2k.py b/Lib/test/test_file2k.py
+index d8966e034e..c73e8d8dc4 100644
+--- a/Lib/test/test_file2k.py
++++ b/Lib/test/test_file2k.py
+@@ -653,18 +653,15 @@ class FileThreadingTests(unittest.TestCase):
+         self._test_close_open_io(io_func)
+ 
+     def test_iteration_torture(self):
+-        # bpo-31530: Crash when concurrently iterate over a file.
++        # bpo-31530
+         with open(self.filename, "wb") as fp:
+             for i in xrange(2**20):
+                 fp.write(b"0"*50 + b"\n")
+         with open(self.filename, "rb") as f:
+-            def iterate():
+-                try:
+-                    for l in f:
+-                        pass
+-                except IOError:
++            def it():
++                for l in f:
+                     pass
+-            self._run_workers(iterate, 10)
++            self._run_workers(it, 10)
+ 
+     def test_iteration_seek(self):
+         # bpo-31530: Crash when concurrently seek and iterate over a file.
+@@ -674,17 +671,15 @@ class FileThreadingTests(unittest.TestCase):
+         with open(self.filename, "rb") as f:
+             it = iter([1] + [0]*10)  # one thread reads, others seek
+             def iterate():
+-                try:
+-                    if next(it):
+-                        for l in f:
+-                            pass
+-                    else:
+-                        for i in range(100):
+-                            f.seek(i*100, 0)
+-                except IOError:
+-                    pass
++                if next(it):
++                    for l in f:
++                        pass
++                else:
++                    for i in xrange(100):
++                        f.seek(i*100, 0)
+             self._run_workers(iterate, 10)
+ 
++
+ @unittest.skipUnless(os.name == 'posix', 'test requires a posix system.')
+ class TestFileSignalEINTR(unittest.TestCase):
+     def _test_reading(self, data_to_write, read_and_verify_code, method_name,
+diff --git a/Misc/NEWS.d/next/Core and Builtins/2017-09-20-18-28-09.bpo-31530.CdLOM7.rst b/Misc/NEWS.d/next/Core and Builtins/2017-09-20-18-28-09.bpo-31530.CdLOM7.rst
+index a6cb6c9e9b..beb09b5ae6 100644
+--- a/Misc/NEWS.d/next/Core and Builtins/2017-09-20-18-28-09.bpo-31530.CdLOM7.rst	
++++ b/Misc/NEWS.d/next/Core and Builtins/2017-09-20-18-28-09.bpo-31530.CdLOM7.rst	
+@@ -1,4 +1 @@
+ Fixed crashes when iterating over a file on multiple threads.
+-seek() and next() methods of file objects now raise an exception during
+-concurrent operation on the same file object.
+-A lock can be used to prevent the error.
+diff --git a/Objects/fileobject.c b/Objects/fileobject.c
+index 8d1c5812f0..270b28264a 100644
+--- a/Objects/fileobject.c
++++ b/Objects/fileobject.c
+@@ -609,7 +609,12 @@ err_iterbuffered(void)
+     return NULL;
+ }
+ 
+-static void drop_readahead(PyFileObject *);
++static void
++drop_file_readahead(PyFileObject *f)
++{
++    PyMem_FREE(f->f_buf);
++    f->f_buf = NULL;
++}
+ 
+ /* Methods */
+ 
+@@ -632,7 +637,7 @@ file_dealloc(PyFileObject *f)
+     Py_XDECREF(f->f_mode);
+     Py_XDECREF(f->f_encoding);
+     Py_XDECREF(f->f_errors);
+-    drop_readahead(f);
++    drop_file_readahead(f);
+     Py_TYPE(f)->tp_free((PyObject *)f);
+ }
+ 
+@@ -767,13 +772,7 @@ file_seek(PyFileObject *f, PyObject *args)
+ 
+     if (f->f_fp == NULL)
+         return err_closed();
+-    if (f->unlocked_count > 0) {
+-        PyErr_SetString(PyExc_IOError,
+-            "seek() called during concurrent "
+-            "operation on the same file object");
+-        return NULL;
+-    }
+-    drop_readahead(f);
++    drop_file_readahead(f);
+     whence = 0;
+     if (!PyArg_ParseTuple(args, "O|i:seek", &offobj, &whence))
+         return NULL;
+@@ -2242,12 +2241,16 @@ static PyGetSetDef file_getsetlist[] = {
+     {0},
+ };
+ 
++typedef struct {
++    char *buf, *bufptr, *bufend;
++} readaheadbuffer;
++
+ static void
+-drop_readahead(PyFileObject *f)
++drop_readaheadbuffer(readaheadbuffer *rab)
+ {
+-    if (f->f_buf != NULL) {
+-        PyMem_Free(f->f_buf);
+-        f->f_buf = NULL;
++    if (rab->buf != NULL) {
++        PyMem_FREE(rab->buf);
++        rab->buf = NULL;
+     }
+ }
+ 
+@@ -2255,36 +2258,34 @@ drop_readahead(PyFileObject *f)
+    (unless at EOF) and no more than bufsize.  Returns negative value on
+    error, will set MemoryError if bufsize bytes cannot be allocated. */
+ static int
+-readahead(PyFileObject *f, Py_ssize_t bufsize)
++readahead(PyFileObject *f, readaheadbuffer *rab, Py_ssize_t bufsize)
+ {
+     Py_ssize_t chunksize;
+ 
+-    assert(f->unlocked_count == 0);
+-    if (f->f_buf != NULL) {
+-        if( (f->f_bufend - f->f_bufptr) >= 1)
++    if (rab->buf != NULL) {
++        if ((rab->bufend - rab->bufptr) >= 1)
+             return 0;
+         else
+-            drop_readahead(f);
++            drop_readaheadbuffer(rab);
+     }
+-    if ((f->f_buf = (char *)PyMem_Malloc(bufsize)) == NULL) {
++    if ((rab->buf = PyMem_MALLOC(bufsize)) == NULL) {
+         PyErr_NoMemory();
+         return -1;
+     }
+     FILE_BEGIN_ALLOW_THREADS(f)
+     errno = 0;
+-    chunksize = Py_UniversalNewlineFread(
+-        f->f_buf, bufsize, f->f_fp, (PyObject *)f);
++    chunksize = Py_UniversalNewlineFread(rab->buf, bufsize, f->f_fp, (PyObject *)f);
+     FILE_END_ALLOW_THREADS(f)
+     if (chunksize == 0) {
+         if (ferror(f->f_fp)) {
+             PyErr_SetFromErrno(PyExc_IOError);
+             clearerr(f->f_fp);
+-            drop_readahead(f);
++            drop_readaheadbuffer(rab);
+             return -1;
+         }
+     }
+-    f->f_bufptr = f->f_buf;
+-    f->f_bufend = f->f_buf + chunksize;
++    rab->bufptr = rab->buf;
++    rab->bufend = rab->buf + chunksize;
+     return 0;
+ }
+ 
+@@ -2294,51 +2295,43 @@ readahead(PyFileObject *f, Py_ssize_t bufsize)
+    logarithmic buffer growth to about 50 even when reading a 1gb line. */
+ 
+ static PyStringObject *
+-readahead_get_line_skip(PyFileObject *f, Py_ssize_t skip, Py_ssize_t bufsize)
++readahead_get_line_skip(PyFileObject *f, readaheadbuffer *rab, Py_ssize_t skip, Py_ssize_t bufsize)
+ {
+     PyStringObject* s;
+     char *bufptr;
+     char *buf;
+     Py_ssize_t len;
+ 
+-    if (f->unlocked_count > 0) {
+-        PyErr_SetString(PyExc_IOError,
+-            "next() called during concurrent "
+-            "operation on the same file object");
+-        return NULL;
+-    }
+-    if (f->f_buf == NULL)
+-        if (readahead(f, bufsize) < 0)
++    if (rab->buf == NULL)
++        if (readahead(f, rab, bufsize) < 0)
+             return NULL;
+ 
+-    len = f->f_bufend - f->f_bufptr;
++    len = rab->bufend - rab->bufptr;
+     if (len == 0)
+-        return (PyStringObject *)
+-            PyString_FromStringAndSize(NULL, skip);
+-    bufptr = (char *)memchr(f->f_bufptr, '\n', len);
++        return (PyStringObject *)PyString_FromStringAndSize(NULL, skip);
++    bufptr = (char *)memchr(rab->bufptr, '\n', len);
+     if (bufptr != NULL) {
+         bufptr++;                               /* Count the '\n' */
+-        len = bufptr - f->f_bufptr;
+-        s = (PyStringObject *)
+-            PyString_FromStringAndSize(NULL, skip + len);
++        len = bufptr - rab->bufptr;
++        s = (PyStringObject *)PyString_FromStringAndSize(NULL, skip + len);
+         if (s == NULL)
+             return NULL;
+-        memcpy(PyString_AS_STRING(s) + skip, f->f_bufptr, len);
+-        f->f_bufptr = bufptr;
+-        if (bufptr == f->f_bufend)
+-            drop_readahead(f);
++        memcpy(PyString_AS_STRING(s) + skip, rab->bufptr, len);
++        rab->bufptr = bufptr;
++        if (bufptr == rab->bufend)
++            drop_readaheadbuffer(rab);
+     } else {
+-        bufptr = f->f_bufptr;
+-        buf = f->f_buf;
+-        f->f_buf = NULL;                /* Force new readahead buffer */
++        bufptr = rab->bufptr;
++        buf = rab->buf;
++        rab->buf = NULL;                /* Force new readahead buffer */
+         assert(len <= PY_SSIZE_T_MAX - skip);
+-        s = readahead_get_line_skip(f, skip + len, bufsize + (bufsize>>2));
++        s = readahead_get_line_skip(f, rab, skip + len, bufsize + (bufsize>>2));
+         if (s == NULL) {
+-            PyMem_Free(buf);
++            PyMem_FREE(buf);
+             return NULL;
+         }
+         memcpy(PyString_AS_STRING(s) + skip, bufptr, len);
+-        PyMem_Free(buf);
++        PyMem_FREE(buf);
+     }
+     return s;
+ }
+@@ -2356,7 +2349,30 @@ file_iternext(PyFileObject *f)
+     if (!f->readable)
+         return err_mode("reading");
+ 
+-    l = readahead_get_line_skip(f, 0, READAHEAD_BUFSIZE);
++    {
++        /*
++          Multiple threads can enter this method while the GIL is released
++          during file read and wreak havoc on the file object's readahead
++          buffer. To avoid dealing with cross-thread coordination issues, we
++          cache the file buffer state locally and only set it back on the file
++          object when we're done.
++        */
++        readaheadbuffer rab = {f->f_buf, f->f_bufptr, f->f_bufend};
++        f->f_buf = NULL;
++        l = readahead_get_line_skip(f, &rab, 0, READAHEAD_BUFSIZE);
++        /*
++          Make sure the file's internal read buffer is cleared out. This will
++          only do anything if some other thread interleaved with us during
++          readahead. We want to drop any changeling buffer, so we don't leak
++          memory. We may lose data, but that's what you get for reading the same
++          file object in multiple threads.
++        */
++        drop_file_readahead(f);
++        f->f_buf = rab.buf;
++        f->f_bufptr = rab.bufptr;
++        f->f_bufend = rab.bufend;
++    }
++
+     if (l == NULL || PyString_GET_SIZE(l) == 0) {
+         Py_XDECREF(l);
+         return NULL;
+-- 
+2.13.3
+
-- 
2.7.4


