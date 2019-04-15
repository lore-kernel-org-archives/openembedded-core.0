Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3BD937D9E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:19 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id z11so20155332wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6MYmY3oTGAfcy6+K84Qz/Ys7hmmMRkFoDjXeQGQXwuw=;
	b=nC5DmA5wm1U2tUadf7++jNSUzFT+CydhsABvAFYq+tVD5yF7BhVbNI145SKo5R7OLE
	UDCD/LrBH3cQBHI78fxCeWNDNlszq9aVeAIaVqp+Y7qx+pS2jaq9zElEChYeUGUu84p8
	wFtYu4y76jLhNO4dT2CIjnXnG3B7tVBKjYflWn66IZ4FXa9+++4EhhdMxA1eEFXerPeK
	mqiAxGP0PKgTUel9GDvipU9UehLqsPlwoudARRSvYPo5hyIDp8nNyHuP7vzGtwsOKXyb
	NwQJ/BgZifdbqI1CoC2EC+MAvDIdllYLtIMmfZQHArJiEst5tsSX0ue+JCylyQ+BvQvg
	Hjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6MYmY3oTGAfcy6+K84Qz/Ys7hmmMRkFoDjXeQGQXwuw=;
	b=EUeh03M8fHwZ14vqLi3HhU4/j2GpOUlpYTXpDbwwPjy/7YVDePuzm2wX1hbiHttUaL
	uee9LwAiPovDhla3eUintpzM+gay0J3DxEoi5CK5b88U+NuRtJBSjtw4z6J5X39TVryH
	H2+gWWDjl/yBGf2q8RBkeWP9sR9QPDtU8ANmNAkzJGvabaNC1ENctuX7rYxRXYJ2e1+y
	7A/UMwvMLXHJoWRe3EHXYtjvBwREZR2SPvDkYU73xHGVxLjjEICPweLd/kQbSq50iO39
	LZwiD+thdj69JfXqGextSh8TBslR2xPkykAzRQ3AleUgDuQcWx/TecrKBXEnA5bGPQrl
	ufyA==
X-Gm-Message-State: APjAAAU4Zk9Rhwl/er0FJfHrUPjFbEK4jqA+Immci7uHYnhDpw37LlPK
	0z5xAOojfniZ89FhQYhN8jiIP/hup9s=
X-Google-Smtp-Source: APXvYqxpJN2g1GMcFYLgv3DxVbGVz8rSGkYEjJDUK1T7AAx9IXonGroFZRiBW+i+wS/7YclGaxlMqA==
X-Received: by 2002:a1c:7208:: with SMTP id n8mr22879643wmc.46.1555325718916; 
	Mon, 15 Apr 2019 03:55:18 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:54 +0200
Message-Id: <20190415105457.57067-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/19] python: update to 2.7.16
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop backported patches

License-update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...tive_2.7.15.bb => python-native_2.7.16.bb} |   2 -
 meta/recipes-devtools/python/python.inc       |  11 +-
 ...e-XML_SetHashSalt-in-_elementtree-GH.patch |  96 --------------
 ...st_ssl-when-a-filename-cannot-be-enc.patch |  55 --------
 ...3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch | 120 ------------------
 ...-Convert-shutil._call_external_zip-t.patch |  67 ----------
 ...ssing-closing-wrapper-in-test_tls1_3.patch |  37 ------
 ...st_ssl.test_options-to-account-for-O.patch |  37 ------
 ...st_default_ecdh_curve-needs-no-tlsv1.patch |  34 -----
 .../{python_2.7.15.bb => python_2.7.16.bb}    |  56 ++++----
 10 files changed, 29 insertions(+), 486 deletions(-)
 rename meta/recipes-devtools/python/{python-native_2.7.15.bb => python-native_2.7.16.bb} (96%)
 delete mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch
 delete mode 100644 meta/recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch
 delete mode 100644 meta/recipes-devtools/python/python/0001-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch
 delete mode 100644 meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch
 delete mode 100644 meta/recipes-devtools/python/python/0002-bpo-34818-Add-missing-closing-wrapper-in-test_tls1_3.patch
 delete mode 100644 meta/recipes-devtools/python/python/0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch
 delete mode 100644 meta/recipes-devtools/python/python/0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch
 rename meta/recipes-devtools/python/{python_2.7.15.bb => python_2.7.16.bb} (86%)

diff --git a/meta/recipes-devtools/python/python-native_2.7.15.bb b/meta/recipes-devtools/python/python-native_2.7.16.bb
similarity index 96%
rename from meta/recipes-devtools/python/python-native_2.7.15.bb
rename to meta/recipes-devtools/python/python-native_2.7.16.bb
index 26d67df6b83..b7442800d98 100644
--- a/meta/recipes-devtools/python/python-native_2.7.15.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.16.bb
@@ -1,7 +1,6 @@
 require python.inc
 EXTRANATIVEPATH += "bzip2-native"
 DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native expat-native gdbm-native db-native"
-PR = "${INC_PR}.1"
 
 SRC_URI += "\
             file://05-enable-ctypes-cross-build.patch \
@@ -17,7 +16,6 @@ SRC_URI += "\
             file://parallel-makeinst-create-bindir.patch \
             file://revert_use_of_sysconfigdata.patch \
             file://0001-python-native-fix-one-do_populate_sysroot-warning.patch \
-            file://0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch \
            "
 
 S = "${WORKDIR}/Python-${PV}"
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 66923678b1d..779df535215 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -5,18 +5,13 @@ SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
 INC_PR = "r1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f257cc14f81685691652a3d3e1b5d754"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e466242989bd33c1bd2b6a526a742498"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
-           file://0001-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch \
-           file://0002-bpo-34818-Add-missing-closing-wrapper-in-test_tls1_3.patch \
-           file://0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch \
-           file://0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch \
-           file://0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch \
            "
 
-SRC_URI[md5sum] = "a80ae3cc478460b922242f43a1b4094d"
-SRC_URI[sha256sum] = "22d9b1ac5b26135ad2b8c2901a9413537e08749a753356ee913c84dbd2df5574"
+SRC_URI[md5sum] = "30157d85a2c0479c09ea2cbe61f2aaf5"
+SRC_URI[sha256sum] = "f222ef602647eecb6853681156d32de4450a2c39f4de93bd5b20235f2e660ed7"
 
 # python recipe is actually python 2.x
 # also, exclude pre-releases for both python 2.x and 3.x
diff --git a/meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch b/meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch
deleted file mode 100644
index 3c0d6622966..00000000000
--- a/meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 3ffc80959f01f9fde548f1632694b9f950c2dd7c Mon Sep 17 00:00:00 2001
-From: Christian Heimes <christian@python.org>
-Date: Tue, 18 Sep 2018 15:13:09 +0200
-Subject: [PATCH] [2.7] bpo-34623: Use XML_SetHashSalt in _elementtree
- (GH-9146) (GH-9394)
-
-The C accelerated _elementtree module now initializes hash randomization
-salt from _Py_HashSecret instead of libexpat's default CPRNG.
-
-Signed-off-by: Christian Heimes <christian@python.org>
-
-https://bugs.python.org/issue34623.
-(cherry picked from commit cb5778f00ce48631c7140f33ba242496aaf7102b)
-
-Co-authored-by: Christian Heimes <christian@python.org>
-
-
-
-https://bugs.python.org/issue34623
-
-Upstream-Status: Backport
-CVE: CVE-2018-14647
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Include/pyexpat.h                                                  | 4 +++-
- Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst | 2 ++
- Modules/_elementtree.c                                             | 5 +++++
- Modules/pyexpat.c                                                  | 5 +++++
- 4 files changed, 15 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst
-
-diff --git a/Include/pyexpat.h b/Include/pyexpat.h
-index 5340ef5..3fc5fa5 100644
---- a/Include/pyexpat.h
-+++ b/Include/pyexpat.h
-@@ -3,7 +3,7 @@
- 
- /* note: you must import expat.h before importing this module! */
- 
--#define PyExpat_CAPI_MAGIC  "pyexpat.expat_CAPI 1.0"
-+#define PyExpat_CAPI_MAGIC  "pyexpat.expat_CAPI 1.1"
- #define PyExpat_CAPSULE_NAME "pyexpat.expat_CAPI"
- 
- struct PyExpat_CAPI 
-@@ -43,6 +43,8 @@ struct PyExpat_CAPI
-         XML_Parser parser, XML_UnknownEncodingHandler handler,
-         void *encodingHandlerData);
-     void (*SetUserData)(XML_Parser parser, void *userData);
-+    /* might be none for expat < 2.1.0 */
-+    int (*SetHashSalt)(XML_Parser parser, unsigned long hash_salt);
-     /* always add new stuff to the end! */
- };
- 
-diff --git a/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst b/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst
-new file mode 100644
-index 0000000..31ad92e
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2018-09-10-16-05-39.bpo-34623.Ua9jMv.rst
-@@ -0,0 +1,2 @@
-+The C accelerated _elementtree module now initializes hash randomization
-+salt from _Py_HashSecret instead of libexpat's default CSPRNG.
-diff --git a/Modules/_elementtree.c b/Modules/_elementtree.c
-index 1d316a1..a19cbf7 100644
---- a/Modules/_elementtree.c
-+++ b/Modules/_elementtree.c
-@@ -2574,6 +2574,11 @@ xmlparser(PyObject* self_, PyObject* args, PyObject* kw)
-         PyErr_NoMemory();
-         return NULL;
-     }
-+    /* expat < 2.1.0 has no XML_SetHashSalt() */
-+    if (EXPAT(SetHashSalt) != NULL) {
-+        EXPAT(SetHashSalt)(self->parser,
-+                           (unsigned long)_Py_HashSecret.prefix);
-+    }
- 
-     ALLOC(sizeof(XMLParserObject), "create expatparser");
- 
-diff --git a/Modules/pyexpat.c b/Modules/pyexpat.c
-index 2b4d312..1f8c0d7 100644
---- a/Modules/pyexpat.c
-+++ b/Modules/pyexpat.c
-@@ -2042,6 +2042,11 @@ MODULE_INITFUNC(void)
-     capi.SetProcessingInstructionHandler = XML_SetProcessingInstructionHandler;
-     capi.SetUnknownEncodingHandler = XML_SetUnknownEncodingHandler;
-     capi.SetUserData = XML_SetUserData;
-+#if XML_COMBINED_VERSION >= 20100
-+    capi.SetHashSalt = XML_SetHashSalt;
-+#else
-+    capi.SetHashSalt = NULL;
-+#endif
- 
-     /* export using capsule */
-     capi_object = PyCapsule_New(&capi, PyExpat_CAPSULE_NAME, NULL);
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch b/meta/recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch
deleted file mode 100644
index 4c0b3577b24..00000000000
--- a/meta/recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 19f6bd06af3c7fc0db5f96878aaa68f5589ff13e Mon Sep 17 00:00:00 2001
-From: Pablo Galindo <Pablogsal@gmail.com>
-Date: Thu, 24 May 2018 23:20:44 +0100
-Subject: [PATCH] bpo-33354: Fix test_ssl when a filename cannot be encoded
- (GH-6613)
-
-Skip test_load_dh_params() of test_ssl when Python filesystem encoding
-cannot encode the provided path.
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/19f6bd06af3c7fc0db5f96878aaa68f5589ff13e]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Lib/test/test_ssl.py                                     | 9 ++++++++-
- .../next/Tests/2018-04-26-22-39-17.bpo-33354.g35-44.rst  | 2 ++
- 2 files changed, 10 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Tests/2018-04-26-22-39-17.bpo-33354.g35-44.rst
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index b59fe73f04..7ced90fdf6 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -989,6 +989,13 @@ class ContextTests(unittest.TestCase):
- 
- 
-     def test_load_dh_params(self):
-+        filename = u'dhpäräm.pem'
-+        fs_encoding = sys.getfilesystemencoding()
-+        try:
-+            filename.encode(fs_encoding)
-+        except UnicodeEncodeError:
-+            self.skipTest("filename %r cannot be encoded to the filesystem encoding %r" % (filename, fs_encoding))
-+
-         ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
-         ctx.load_dh_params(DHFILE)
-         if os.name != 'nt':
-@@ -1001,7 +1008,7 @@ class ContextTests(unittest.TestCase):
-         with self.assertRaises(ssl.SSLError) as cm:
-             ctx.load_dh_params(CERTFILE)
-         with support.temp_dir() as d:
--            fname = os.path.join(d, u'dhpäräm.pem')
-+            fname = os.path.join(d, filename)
-             shutil.copy(DHFILE, fname)
-             ctx.load_dh_params(fname)
- 
-diff --git a/Misc/NEWS.d/next/Tests/2018-04-26-22-39-17.bpo-33354.g35-44.rst b/Misc/NEWS.d/next/Tests/2018-04-26-22-39-17.bpo-33354.g35-44.rst
-new file mode 100644
-index 0000000000..c66cecac32
---- /dev/null
-+++ b/Misc/NEWS.d/next/Tests/2018-04-26-22-39-17.bpo-33354.g35-44.rst
-@@ -0,0 +1,2 @@
-+Skip ``test_ssl.test_load_dh_params`` when Python filesystem encoding cannot encode the
-+provided path.
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python/0001-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch b/meta/recipes-devtools/python/python/0001-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch
deleted file mode 100644
index 1f70562fc06..00000000000
--- a/meta/recipes-devtools/python/python/0001-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From a333351592f097220fc862911b34d3a300f0985e Mon Sep 17 00:00:00 2001
-From: Christian Heimes <christian@python.org>
-Date: Wed, 15 Aug 2018 09:07:28 +0200
-Subject: [PATCH 1/4] bpo-33570: TLS 1.3 ciphers for OpenSSL 1.1.1 (GH-6976)
- (GH-8760)
-
-Change TLS 1.3 cipher suite settings for compatibility with OpenSSL
-1.1.1-pre6 and newer. OpenSSL 1.1.1 will have TLS 1.3 cipers enabled by
-default.
-
-Also update multissltests to test with latest OpenSSL.
-
-Signed-off-by: Christian Heimes <christian@python.org>.
-(cherry picked from commit 3e630c541b35c96bfe5619165255e559f577ee71)
-
-Co-authored-by: Christian Heimes <christian@python.org>
-
-Upstream-Status: Accepted [https://github.com/python/cpython/pull/8771]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Doc/library/ssl.rst                           |  8 ++--
- Lib/test/test_ssl.py                          | 37 +++++++++++--------
- .../2018-05-18-21-50-47.bpo-33570.7CZy4t.rst  |  3 ++
- 3 files changed, 27 insertions(+), 21 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Library/2018-05-18-21-50-47.bpo-33570.7CZy4t.rst
-
-diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
-index 0421031772..7c7c85b833 100644
---- a/Doc/library/ssl.rst
-+++ b/Doc/library/ssl.rst
-@@ -294,11 +294,6 @@ purposes.
- 
-      3DES was dropped from the default cipher string.
- 
--   .. versionchanged:: 2.7.15
--
--     TLS 1.3 cipher suites TLS_AES_128_GCM_SHA256, TLS_AES_256_GCM_SHA384,
--     and TLS_CHACHA20_POLY1305_SHA256 were added to the default cipher string.
--
- .. function:: _https_verify_certificates(enable=True)
- 
-    Specifies whether or not server certificates are verified when creating
-@@ -1179,6 +1174,9 @@ to speed up repeated connections from the same clients.
-       when connected, the :meth:`SSLSocket.cipher` method of SSL sockets will
-       give the currently selected cipher.
- 
-+      OpenSSL 1.1.1 has TLS 1.3 cipher suites enabled by default. The suites
-+      cannot be disabled with :meth:`~SSLContext.set_ciphers`.
-+
- .. method:: SSLContext.set_alpn_protocols(protocols)
- 
-    Specify which protocols the socket should advertise during the SSL/TLS
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index dc14e22ad1..f51572e319 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -2772,19 +2772,24 @@ else:
-                     sock.do_handshake()
-                 self.assertEqual(cm.exception.errno, errno.ENOTCONN)
- 
--        def test_default_ciphers(self):
--            context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
--            try:
--                # Force a set of weak ciphers on our client context
--                context.set_ciphers("DES")
--            except ssl.SSLError:
--                self.skipTest("no DES cipher available")
--            with ThreadedEchoServer(CERTFILE,
--                                    ssl_version=ssl.PROTOCOL_SSLv23,
--                                    chatty=False) as server:
--                with closing(context.wrap_socket(socket.socket())) as s:
--                    with self.assertRaises(ssl.SSLError):
--                        s.connect((HOST, server.port))
-+        def test_no_shared_ciphers(self):
-+            server_context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
-+            server_context.load_cert_chain(SIGNED_CERTFILE)
-+            client_context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
-+            client_context.verify_mode = ssl.CERT_REQUIRED
-+            client_context.check_hostname = True
-+
-+            # OpenSSL enables all TLS 1.3 ciphers, enforce TLS 1.2 for test
-+            client_context.options |= ssl.OP_NO_TLSv1_3
-+            # Force different suites on client and master
-+            client_context.set_ciphers("AES128")
-+            server_context.set_ciphers("AES256")
-+            with ThreadedEchoServer(context=server_context) as server:
-+                s = client_context.wrap_socket(
-+                        socket.socket(),
-+                        server_hostname="localhost")
-+                with self.assertRaises(ssl.SSLError):
-+                    s.connect((HOST, server.port))
-             self.assertIn("no shared cipher", str(server.conn_errors[0]))
- 
-         def test_version_basic(self):
-@@ -2815,9 +2820,9 @@ else:
-                 with context.wrap_socket(socket.socket()) as s:
-                     s.connect((HOST, server.port))
-                     self.assertIn(s.cipher()[0], [
--                        'TLS13-AES-256-GCM-SHA384',
--                        'TLS13-CHACHA20-POLY1305-SHA256',
--                        'TLS13-AES-128-GCM-SHA256',
-+                        'TLS_AES_256_GCM_SHA384',
-+                        'TLS_CHACHA20_POLY1305_SHA256',
-+                        'TLS_AES_128_GCM_SHA256',
-                     ])
- 
-         @unittest.skipUnless(ssl.HAS_ECDH, "test requires ECDH-enabled OpenSSL")
-diff --git a/Misc/NEWS.d/next/Library/2018-05-18-21-50-47.bpo-33570.7CZy4t.rst b/Misc/NEWS.d/next/Library/2018-05-18-21-50-47.bpo-33570.7CZy4t.rst
-new file mode 100644
-index 0000000000..bd719a47e8
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2018-05-18-21-50-47.bpo-33570.7CZy4t.rst
-@@ -0,0 +1,3 @@
-+Change TLS 1.3 cipher suite settings for compatibility with OpenSSL
-+1.1.1-pre6 and newer. OpenSSL 1.1.1 will have TLS 1.3 cipers enabled by
-+default.
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch b/meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch
deleted file mode 100644
index 125db8512a9..00000000000
--- a/meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From c7e692c61dc091d07dee573f5f424b6b427ff056 Mon Sep 17 00:00:00 2001
-From: Benjamin Peterson <benjamin@python.org>
-Date: Wed, 29 Aug 2018 21:59:21 -0700
-Subject: [PATCH] closes bpo-34540: Convert shutil._call_external_zip to use
- subprocess rather than distutils.spawn. (GH-8985)
-
-Upstream-Status: Backport
-CVE: CVE-2018-1000802
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Lib/shutil.py                                            | 16 ++++++++++------
- .../Security/2018-08-28-22-11-54.bpo-34540.gfQ0TM.rst    |  3 +++
- 2 files changed, 13 insertions(+), 6 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2018-08-28-22-11-54.bpo-34540.gfQ0TM.rst
-
-diff --git a/Lib/shutil.py b/Lib/shutil.py
-index 3462f7c..0ab1a06 100644
---- a/Lib/shutil.py
-+++ b/Lib/shutil.py
-@@ -413,17 +413,21 @@ def _make_tarball(base_name, base_dir, compress="gzip", verbose=0, dry_run=0,
- 
-     return archive_name
- 
--def _call_external_zip(base_dir, zip_filename, verbose=False, dry_run=False):
-+def _call_external_zip(base_dir, zip_filename, verbose, dry_run, logger):
-     # XXX see if we want to keep an external call here
-     if verbose:
-         zipoptions = "-r"
-     else:
-         zipoptions = "-rq"
--    from distutils.errors import DistutilsExecError
--    from distutils.spawn import spawn
-+    cmd = ["zip", zipoptions, zip_filename, base_dir]
-+    if logger is not None:
-+        logger.info(' '.join(cmd))
-+    if dry_run:
-+        return
-+    import subprocess
-     try:
--        spawn(["zip", zipoptions, zip_filename, base_dir], dry_run=dry_run)
--    except DistutilsExecError:
-+        subprocess.check_call(cmd)
-+    except subprocess.CalledProcessError:
-         # XXX really should distinguish between "couldn't find
-         # external 'zip' command" and "zip failed".
-         raise ExecError, \
-@@ -458,7 +462,7 @@ def _make_zipfile(base_name, base_dir, verbose=0, dry_run=0, logger=None):
-         zipfile = None
- 
-     if zipfile is None:
--        _call_external_zip(base_dir, zip_filename, verbose, dry_run)
-+        _call_external_zip(base_dir, zip_filename, verbose, dry_run, logger)
-     else:
-         if logger is not None:
-             logger.info("creating '%s' and adding '%s' to it",
-diff --git a/Misc/NEWS.d/next/Security/2018-08-28-22-11-54.bpo-34540.gfQ0TM.rst b/Misc/NEWS.d/next/Security/2018-08-28-22-11-54.bpo-34540.gfQ0TM.rst
-new file mode 100644
-index 0000000..4f68696
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2018-08-28-22-11-54.bpo-34540.gfQ0TM.rst
-@@ -0,0 +1,3 @@
-+When ``shutil.make_archive`` falls back to the external ``zip`` problem, it
-+uses :mod:`subprocess` to invoke it rather than :mod:`distutils.spawn`. This
-+closes a possible shell injection vector.
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/python/python/0002-bpo-34818-Add-missing-closing-wrapper-in-test_tls1_3.patch b/meta/recipes-devtools/python/python/0002-bpo-34818-Add-missing-closing-wrapper-in-test_tls1_3.patch
deleted file mode 100644
index 96882712e95..00000000000
--- a/meta/recipes-devtools/python/python/0002-bpo-34818-Add-missing-closing-wrapper-in-test_tls1_3.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 0e1f3856a7e1511fb64d99646c54ddf3897cd444 Mon Sep 17 00:00:00 2001
-From: Dimitri John Ledkov <xnox@ubuntu.com>
-Date: Fri, 28 Sep 2018 14:15:52 +0100
-Subject: [PATCH 2/4] bpo-34818: Add missing closing() wrapper in test_tls1_3.
-
-Python 2.7 socket classes do not implement context manager protocol,
-hence closing() is required around it. Resolves testcase error
-traceback.
-
-Signed-off-by: Dimitri John Ledkov <xnox@ubuntu.com>
-
-https://bugs.python.org/issue34818
-
-Patch taken from Ubuntu.
-
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/9622]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Lib/test/test_ssl.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index f51572e319..7a14053cee 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -2817,7 +2817,7 @@ else:
-                 ssl.OP_NO_TLSv1 | ssl.OP_NO_TLSv1_1 | ssl.OP_NO_TLSv1_2
-             )
-             with ThreadedEchoServer(context=context) as server:
--                with context.wrap_socket(socket.socket()) as s:
-+                with closing(context.wrap_socket(socket.socket())) as s:
-                     s.connect((HOST, server.port))
-                     self.assertIn(s.cipher()[0], [
-                         'TLS_AES_256_GCM_SHA384',
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python/0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch b/meta/recipes-devtools/python/python/0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch
deleted file mode 100644
index 77016cb430a..00000000000
--- a/meta/recipes-devtools/python/python/0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8b06d56d26eee289fec22b9b72ab4c7cc3d6c482 Mon Sep 17 00:00:00 2001
-From: Dimitri John Ledkov <xnox@ubuntu.com>
-Date: Fri, 28 Sep 2018 16:34:16 +0100
-Subject: [PATCH 3/4] bpo-34834: Fix test_ssl.test_options to account for
- OP_ENABLE_MIDDLEBOX_COMPAT.
-
-Signed-off-by: Dimitri John Ledkov <xnox@ubuntu.com>
-
-https://bugs.python.org/issue34834
-
-Patch taken from Ubuntu.
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/9624]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Lib/test/test_ssl.py | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index 7a14053cee..efc906a5ba 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -777,6 +777,11 @@ class ContextTests(unittest.TestCase):
-         default = (ssl.OP_ALL | ssl.OP_NO_SSLv2 | ssl.OP_NO_SSLv3)
-         if not IS_LIBRESSL and ssl.OPENSSL_VERSION_INFO >= (1, 1, 0):
-             default |= ssl.OP_NO_COMPRESSION
-+        if not IS_LIBRESSL and ssl.OPENSSL_VERSION_INFO >= (1, 1, 1):
-+            # define MIDDLEBOX constant, as python2.7 does not know about it
-+            # but it is used by default.
-+            OP_ENABLE_MIDDLEBOX_COMPAT = 1048576L
-+            default |= OP_ENABLE_MIDDLEBOX_COMPAT
-         self.assertEqual(default, ctx.options)
-         ctx.options |= ssl.OP_NO_TLSv1
-         self.assertEqual(default | ssl.OP_NO_TLSv1, ctx.options)
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python/0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch b/meta/recipes-devtools/python/python/0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch
deleted file mode 100644
index 39e1bcfc862..00000000000
--- a/meta/recipes-devtools/python/python/0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 946a7969345c6697697effd226ec396d3fea05b7 Mon Sep 17 00:00:00 2001
-From: Dimitri John Ledkov <xnox@ubuntu.com>
-Date: Fri, 28 Sep 2018 17:30:19 +0100
-Subject: [PATCH 4/4] bpo-34836: fix test_default_ecdh_curve, needs no tlsv1.3.
-
-Signed-off-by: Dimitri John Ledkov <xnox@ubuntu.com>
-
-https://bugs.python.org/issue34836
-
-Patch taken from Ubuntu.
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/9626]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Lib/test/test_ssl.py | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index efc906a5ba..4a3286cd5f 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -2836,6 +2836,9 @@ else:
-             # should be enabled by default on SSL contexts.
-             context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
-             context.load_cert_chain(CERTFILE)
-+            # TLSv1.3 defaults to PFS key agreement and no longer has KEA in
-+            # cipher name.
-+            context.options |= ssl.OP_NO_TLSv1_3
-             # Prior to OpenSSL 1.0.0, ECDH ciphers have to be enabled
-             # explicitly using the 'ECCdraft' cipher alias.  Otherwise,
-             # our default cipher list should prefer ECDH-based ciphers
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.16.bb
similarity index 86%
rename from meta/recipes-devtools/python/python_2.7.15.bb
rename to meta/recipes-devtools/python/python_2.7.16.bb
index 62051a227b8..0e7dd2b3fb8 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -3,38 +3,34 @@ require python.inc
 DEPENDS = "python-native libffi bzip2 gdbm openssl \
            readline sqlite3 zlib virtual/crypt"
 
-PR = "${INC_PR}"
-
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
-SRC_URI += "\
-  file://01-use-proper-tools-for-cross-build.patch \
-  file://03-fix-tkinter-detection.patch \
-  file://06-avoid_usr_lib_termcap_path_in_linking.patch \
-  ${DISTRO_SRC_URI} \
-  file://multilib.patch \
-  file://cgi_py.patch \
-  file://setup_py_skip_cross_import_check.patch \
-  file://add-md5module-support.patch \
-  file://host_include_contamination.patch \
-  file://fix_for_using_different_libdir.patch \
-  file://setuptweaks.patch \
-  file://check-if-target-is-64b-not-host.patch \
-  file://search_db_h_in_inc_dirs_and_avoid_warning.patch \
-  ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_warning_about_tkinter.patch', d)} \
-  file://avoid_warning_for_sunos_specific_module.patch \
-  file://python-2.7.3-remove-bsdb-rpath.patch \
-  file://run-ptest \
-  file://parallel-makeinst-create-bindir.patch \
-  file://use_sysroot_ncurses_instead_of_host.patch \
-  file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
-  file://pass-missing-libraries-to-Extension-for-mul.patch \
-  file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
-  file://float-endian.patch \
-  file://0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch \
-  file://0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch \
-  file://0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch \
-"
+SRC_URI += " \
+           file://01-use-proper-tools-for-cross-build.patch \
+           file://03-fix-tkinter-detection.patch \
+           file://06-avoid_usr_lib_termcap_path_in_linking.patch \
+           ${DISTRO_SRC_URI} \
+           file://multilib.patch \
+           file://cgi_py.patch \
+           file://setup_py_skip_cross_import_check.patch \
+           file://add-md5module-support.patch \
+           file://host_include_contamination.patch \
+           file://fix_for_using_different_libdir.patch \
+           file://setuptweaks.patch \
+           file://check-if-target-is-64b-not-host.patch \
+           file://search_db_h_in_inc_dirs_and_avoid_warning.patch \
+           ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_warning_about_tkinter.patch', d)} \
+           file://avoid_warning_for_sunos_specific_module.patch \
+           file://python-2.7.3-remove-bsdb-rpath.patch \
+           file://run-ptest \
+           file://parallel-makeinst-create-bindir.patch \
+           file://use_sysroot_ncurses_instead_of_host.patch \
+           file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
+           file://pass-missing-libraries-to-Extension-for-mul.patch \
+           file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
+           file://float-endian.patch \
+           file://0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch \
+           "
 
 S = "${WORKDIR}/Python-${PV}"
 
-- 
2.17.1


