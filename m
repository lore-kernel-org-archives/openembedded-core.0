Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29802.1793868223470273478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=OJ3ZBCWo;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491d1f66968so14037f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868222; x=1794473022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=utqoqtB2cDKOQY5Go1abBbEY0yGV+zU+Jj4l/Oc+96Q=;
        b=OJ3ZBCWoH3QEPcc0r3mp3mNPErbXh48M6A0OtNeBAC4jltRel7pHtW5NFdaAPSrevW
         Z11VKEI0oX/Tk9CX1S1M2MT28pdi4RvuyKt2oPUPQpJ0Gh9sDh3pATWobGSXZk+KljbW
         kpfK4l7qCs/vqkAIaNQ9i44QIFjF1rK3Q8RDWFDGa3+3HOOZBLziPzxDvfZohIMN3WAD
         0tAqLSpCOFp5/n1B2YD+q+Y6gUcl5970UDcXYDlyZl2/jaODpw3fa0y4u1wlg3WFD+qR
         H4oC0K5HxMUEcbIyJkXtFiQ6tT+/BX4pt85XitZVxo2bHbnxbLPM8B/L+jXPkib5VRlU
         Hf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868222; x=1794473022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=utqoqtB2cDKOQY5Go1abBbEY0yGV+zU+Jj4l/Oc+96Q=;
        b=ONIjYeka9Pe/BkrmkwMJWhKXc4ZKZ5AxgjkonFzsOedRQxsyU7gENqSRe36/jPzKNg
         oD7dfvjnmr0AI/ZfY7a+2cSWkLxU3TPaV98YzEBnHnMkm99spoX9w2CfF27TnQAlXKh+
         kAhYmRp2mpH60bdGDaeTNXFBztJFuftGGSiv2SYXf2UZ/l5nkz0M2xwARLFDau/Avnu9
         hOxBdcG0NFRslwSBAHeh+KhxUx83IB/joAXIKobcLgYURhBhbCEpVi87cEua+ex0tWXW
         KibAA42LCt0rz7xyi82cjHpVHUASx5TLIOtQDRIuduZ/tM1RvAmcVQvillA457NRvlfn
         r2Bw==
X-Gm-Message-State: APuU4Z9JQU8n7zk30rXTNBKmBhyRLltvaU0nVx3QmYODAYLT2G3qSKTO
	CTokGFAR7Nt8F+lpuwUtFF0GRA2prUYgWVBaPerxpCuggWl9A20xR82BVSCMbbQOBNMVZeNAmI0
	zKL9jWWo=
X-Gm-Gg: AYBFou2kx70DTsJTL3mABQsMU45gv6XIE7Zazy6jQ3Jn6xU+UDVP0W8bSRRzXHKbVAU
	Zbo6sHtsuRJaeOaSyn3Dw/NdoWKJiuVYY0A4T93cnBsKeZMIQW2r+Uz5L550q24ZgtGs+W83wUI
	/kdwRyF+xvOEBFVmXW9EwJBiHU23jjONTqT7ro2EOaxP8FuAvqhAo4Z0/6I0o2q5BKHg5OM29zB
	fINj7niMEfAx/mWcqCdK5p1H2cygpRsIkQEKW9h3mE1wseTrebGUuSnehJJCRruwQUSnmilyI5n
	LRdeXwLREy+RuVXE1sm+4j5ckuPEzjBDZncjGWjnfizRDr6TyX/CLze4fPz29fQeyAp9Z8vVf0W
	leWIheuSZRlOI0aGC8+jumC6dg8y1j3NLw0xfqmZ+65wKhkPguzPXCRqHaD2FXDVO8S4kM6Zkn4
	pqtbeeMWHrX/u3M3J9isQgcgx9xIXlsnidjV6ow7LulG+7D882MHzSzksY7qh016ZWZYyqE2/3S
	gxF5WICiyf2B0xno8jbUhVD0bF/EFHqgeq2S2r2uTWWbBj0BUvg0sGvVHj+Xk5WtqBZ70RWpcKb
	Vrs8SIf6mxksuWAQvcw1CXK+UgNcmxq7TBDsVkDtusYDqcyOp8MwutipjCkDDh1xptm4hjiOntn
	up/aSF7ZWTbFPLVj4GqydoVhO5mjb
X-Received: by 2002:a05:6000:4008:b0:490:9af:d49b with SMTP id ffacd0b85a97d-49009afd4c7mr8014261f8f.53.1793868221437;
        Thu, 05 Nov 2026 00:43:41 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:41 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 08/60] python3: upgrade 3.14.7 -> 3.14.9
Date: Thu,  5 Nov 2026 09:42:27 +0100
Message-ID: <9c62ede73df2cb56ec1761db34d643c94029620d.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249467
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

The release notes are long[1] but the highlight is upgrading the bundled
pip wheel to 26.2.2, as pip bundles certifi which needed upgrading due
to the eMudhra intermediate CA compromise.

[1] https://docs.python.org/release/3.14.9/whatsnew/changelog.html
[2] https://emudhra.we-have-a-problem.com

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 526baf80188308bc1e65b09ccb41186772cd6336)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...shebang-overflow-on-python-config.py.patch |  2 +-
 ...-use-prefix-value-from-build-configu.patch |  2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |  2 +-
 ...146207-Add-support-for-OpenSSL-4.0.0.patch | 29 +++++++++----------
 ...Update-_ssl._SSLSocket-for-OpenSSL-4.patch | 18 ++++++------
 ...utdown-test-in-test_ssl.test_got_eof.patch |  2 +-
 .../python/python3/makerace.patch             |  2 +-
 .../{python3_3.14.7.bb => python3_3.14.9.bb}  |  2 +-
 8 files changed, 28 insertions(+), 31 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.14.7.bb => python3_3.14.9.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 7a605383647..7cacaf0ff37 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index e946018..345ed29 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2835,6 +2835,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2839,6 +2839,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 60391e726bd..580d38a4031 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -21,7 +21,7 @@ diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
 index 0a8bcc0..a2341f2 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
-@@ -538,12 +538,12 @@ def _init_config_vars():
+@@ -539,12 +539,12 @@ def _init_config_vars():
      _CONFIG_VARS['py_version'] = _PY_VERSION
      _CONFIG_VARS['py_version_short'] = _PY_VERSION_SHORT
      _CONFIG_VARS['py_version_nodot'] = _PY_VERSION_SHORT_NO_DOT
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index c7f14cad1e0..4e41b04a3bb 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 526d500..a7e536d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -861,8 +861,7 @@ profile-run-stamp:
+@@ -863,8 +863,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch b/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
index bef60443585..8bb4a4c9057 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
@@ -32,7 +32,7 @@ diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
 index dc795c6bd8a..61355927296 100644
 --- a/Lib/test/test_ssl.py
 +++ b/Lib/test/test_ssl.py
-@@ -395,7 +395,7 @@ def test_constants(self):
+@@ -424,7 +424,7 @@ class BasicSocketTests(unittest.TestCase):
          ssl.OP_NO_COMPRESSION
          self.assertEqual(ssl.HAS_SNI, True)
          self.assertEqual(ssl.HAS_ECDH, True)
@@ -41,7 +41,7 @@ index dc795c6bd8a..61355927296 100644
          self.assertEqual(ssl.HAS_TLSv1_3, True)
          ssl.OP_NO_SSLv2
          ssl.OP_NO_SSLv3
-@@ -586,11 +586,11 @@ def test_openssl_version(self):
+@@ -615,11 +615,11 @@ class BasicSocketTests(unittest.TestCase):
          # Some sanity checks follow
          # >= 1.1.1
          self.assertGreaterEqual(n, 0x10101000)
@@ -56,7 +56,7 @@ index dc795c6bd8a..61355927296 100644
          self.assertGreaterEqual(minor, 0)
          self.assertLess(minor, 256)
          self.assertGreaterEqual(fix, 0)
-@@ -656,12 +656,14 @@ def test_openssl111_deprecations(self):
+@@ -685,12 +685,14 @@ class BasicSocketTests(unittest.TestCase):
              ssl.OP_NO_TLSv1_2,
              ssl.OP_NO_TLSv1_3
          ]
@@ -77,7 +77,7 @@ index dc795c6bd8a..61355927296 100644
          versions = [
              ssl.TLSVersion.SSLv3,
              ssl.TLSVersion.TLSv1,
-@@ -1205,6 +1207,7 @@ def test_min_max_version(self):
+@@ -1184,6 +1186,7 @@ class ContextTests(unittest.TestCase):
                  ssl.TLSVersion.TLSv1,
                  ssl.TLSVersion.TLSv1_1,
                  ssl.TLSVersion.TLSv1_2,
@@ -85,7 +85,7 @@ index dc795c6bd8a..61355927296 100644
                  ssl.TLSVersion.SSLv3,
              }
          )
-@@ -1218,7 +1221,7 @@ def test_min_max_version(self):
+@@ -1197,7 +1200,7 @@ class ContextTests(unittest.TestCase):
          with self.assertRaises(ValueError):
              ctx.minimum_version = 42
  
@@ -94,7 +94,7 @@ index dc795c6bd8a..61355927296 100644
              ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1_1)
  
              self.assertIn(
-@@ -1675,23 +1678,24 @@ def test__create_stdlib_context(self):
+@@ -1749,23 +1752,24 @@ class ContextTests(unittest.TestCase):
          self.assertFalse(ctx.check_hostname)
          self._assert_context_options(ctx)
  
@@ -130,7 +130,7 @@ index dc795c6bd8a..61355927296 100644
  
          ctx = ssl._create_stdlib_context(purpose=ssl.Purpose.CLIENT_AUTH)
          self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLS_SERVER)
-@@ -3654,10 +3658,10 @@ def test_protocol_tlsv1_2(self):
+@@ -3863,10 +3867,10 @@ class ThreadedTests(unittest.TestCase):
                             client_options=ssl.OP_NO_TLSv1_2)
  
          try_protocol_combo(ssl.PROTOCOL_TLS, ssl.PROTOCOL_TLSv1_2, 'TLSv1.2')
@@ -147,7 +147,7 @@ diff --git a/Modules/_ssl.c b/Modules/_ssl.c
 index b45295b4c0c..6f75af86113 100644
 --- a/Modules/_ssl.c
 +++ b/Modules/_ssl.c
-@@ -164,6 +164,17 @@ static void _PySSLFixErrno(void) {
+@@ -135,6 +135,17 @@ static void _PySSLFixErrno(void) {
  #error Unsupported OpenSSL version
  #endif
  
@@ -165,7 +165,7 @@ index b45295b4c0c..6f75af86113 100644
  /* OpenSSL API 1.1.0+ does not include version methods */
  #ifndef OPENSSL_NO_SSL3_METHOD
  extern const SSL_METHOD *SSLv3_method(void);
-@@ -1151,7 +1162,7 @@ _asn1obj2py(_sslmodulestate *state, const ASN1_OBJECT *name, int no_name)
+@@ -1134,7 +1145,7 @@ _asn1obj2py(_sslmodulestate *state, const ASN1_OBJECT *name, int no_name)
  
  static PyObject *
  _create_tuple_for_attribute(_sslmodulestate *state,
@@ -174,7 +174,7 @@ index b45295b4c0c..6f75af86113 100644
  {
      Py_ssize_t buflen;
      PyObject *pyattr;
-@@ -1180,16 +1191,16 @@ _create_tuple_for_attribute(_sslmodulestate *state,
+@@ -1163,16 +1174,16 @@ _create_tuple_for_attribute(_sslmodulestate *state,
  }
  
  static PyObject *
@@ -195,7 +195,7 @@ index b45295b4c0c..6f75af86113 100644
      int index_counter;
      int rdn_level = -1;
      int retcode;
-@@ -6967,9 +6978,15 @@ sslmodule_init_constants(PyObject *m)
+@@ -6530,9 +6541,15 @@ sslmodule_init_constants(PyObject *m)
      ADD_INT_CONST("PROTOCOL_TLS", PY_SSL_VERSION_TLS);
      ADD_INT_CONST("PROTOCOL_TLS_CLIENT", PY_SSL_VERSION_TLS_CLIENT);
      ADD_INT_CONST("PROTOCOL_TLS_SERVER", PY_SSL_VERSION_TLS_SERVER);
@@ -229,7 +229,7 @@ diff --git a/Tools/ssl/multissltests.py b/Tools/ssl/multissltests.py
 index 3b4507c6771..48207e5330f 100755
 --- a/Tools/ssl/multissltests.py
 +++ b/Tools/ssl/multissltests.py
-@@ -429,9 +429,11 @@ def _post_install(self):
+@@ -422,9 +422,11 @@ class BuildOpenSSL(AbstractBuilder):
      def _post_install(self):
          if self.version.startswith("3."):
              self._post_install_3xx()
@@ -242,7 +242,7 @@ index 3b4507c6771..48207e5330f 100755
              config_args += ("enable-fips",)
          super()._build_src(config_args)
  
-@@ -447,6 +449,9 @@ def _post_install_3xx(self):
+@@ -440,6 +442,9 @@ class BuildOpenSSL(AbstractBuilder):
              lib64 = self.lib_dir + "64"
              os.symlink(lib64, self.lib_dir)
  
@@ -252,6 +252,3 @@ index 3b4507c6771..48207e5330f 100755
      @property
      def short_version(self):
          """Short version for OpenSSL download URL"""
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch b/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
index 587f141dd4c..1005fcf3ec4 100644
--- a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
+++ b/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
@@ -28,7 +28,7 @@ diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
 index 965dbc36f096499..03d9e3f9e5e96b5 100644
 --- a/Lib/test/test_ssl.py
 +++ b/Lib/test/test_ssl.py
-@@ -2711,6 +2711,36 @@ def close(self):
+@@ -2994,6 +2994,36 @@ class ThreadedEchoServer(threading.Thread):
      def stop(self):
          self.active = False
  
@@ -65,7 +65,7 @@ index 965dbc36f096499..03d9e3f9e5e96b5 100644
  class AsyncoreEchoServer(threading.Thread):
  
      # this one's based on asyncore.dispatcher
-@@ -4747,6 +4777,58 @@ def background(sock):
+@@ -5035,6 +5065,58 @@ class ThreadedTests(unittest.TestCase):
                      if cm.exc_value is not None:
                          raise cm.exc_value
  
@@ -141,7 +141,7 @@ diff --git a/Modules/_ssl.c b/Modules/_ssl.c
 index 1603d0ffd559559..376df32b7cb4bd6 100644
 --- a/Modules/_ssl.c
 +++ b/Modules/_ssl.c
-@@ -352,6 +352,16 @@ typedef struct {
+@@ -351,6 +351,16 @@ typedef struct {
       * and shutdown methods check for chained exceptions.
       */
      PyObject *exc;
@@ -158,7 +158,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
  } PySSLSocket;
  
  #define PySSLSocket_CAST(op)    ((PySSLSocket *)(op))
-@@ -499,6 +509,10 @@ fill_and_set_sslerror(_sslmodulestate *state,
+@@ -498,6 +508,10 @@ fill_and_set_sslerror(_sslmodulestate *state,
      PyObject *init_value, *msg, *key;
      PyUnicodeWriter *writer = NULL;
  
@@ -169,7 +169,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
      if (errcode != 0) {
          int lib, reason;
  
-@@ -654,6 +668,18 @@ PySSL_ChainExceptions(PySSLSocket *sslsock) {
+@@ -653,6 +667,18 @@ PySSL_ChainExceptions(PySSLSocket *sslsock) {
      return -1;
  }
  
@@ -188,7 +188,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
  static PyObject *
  PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
  {
-@@ -901,6 +927,7 @@ newPySSLSocket(PySSLContext *sslctx, PySocketSockObject *sock,
+@@ -900,6 +926,7 @@ newPySSLSocket(PySSLContext *sslctx, PySocketSockObject *sock,
      self->server_hostname = NULL;
      self->err = err;
      self->exc = NULL;
@@ -196,7 +196,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
  
      /* Make sure the SSL error state is initialized */
      ERR_clear_error();
-@@ -1041,6 +1068,11 @@ _ssl__SSLSocket_do_handshake_impl(PySSLSocket *self)
+@@ -1040,6 +1067,11 @@ _ssl__SSLSocket_do_handshake_impl(PySSLSocket *self)
          BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
      }
  
@@ -208,7 +208,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
      timeout = GET_SOCKET_TIMEOUT(sock);
      has_timeout = (timeout > 0);
      if (has_timeout) {
-@@ -2504,6 +2536,11 @@ _ssl__SSLSocket_write_impl(PySSLSocket *self, Py_buffer *b)
+@@ -2505,6 +2537,11 @@ _ssl__SSLSocket_write_impl(PySSLSocket *self, Py_buffer *b)
          BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
      }
  
@@ -220,7 +220,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
      timeout = GET_SOCKET_TIMEOUT(sock);
      has_timeout = (timeout > 0);
      if (has_timeout) {
-@@ -2644,6 +2681,11 @@ _ssl__SSLSocket_read_impl(PySSLSocket *self, Py_ssize_t len,
+@@ -2645,6 +2682,11 @@ _ssl__SSLSocket_read_impl(PySSLSocket *self, Py_ssize_t len,
          Py_INCREF(sock);
      }
  
diff --git a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch b/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
index af067f549c4..c42b336798c 100644
--- a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
+++ b/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
@@ -24,7 +24,7 @@ diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
 index 03d9e3f9e5e96b5..6445f122b4272be 100644
 --- a/Lib/test/test_ssl.py
 +++ b/Lib/test/test_ssl.py
-@@ -4820,14 +4820,6 @@ def test_got_eof(self):
+@@ -5108,14 +5108,6 @@ class ThreadedTests(unittest.TestCase):
                  sslsock.do_handshake()
  
              self.assertEqual(sslsock.pending(), 0)
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index 248a521118c..b589dfb3460 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index a7e536d..e946018 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2741,7 +2741,7 @@ COMPILEALL_OPTS=-j0
+@@ -2745,7 +2745,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-devtools/python/python3_3.14.9.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.7.bb
rename to meta/recipes-devtools/python/python3_3.14.9.bb
index f917edebd86..e6fa2bd111e 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.9.bb
@@ -30,7 +30,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81"
+SRC_URI[sha256sum] = "e02d9ac21cebda6e46435369744a92c65cc7cd8669697694122cf97ffacd1e53"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
