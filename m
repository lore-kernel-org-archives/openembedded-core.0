Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.50322.1624294989559544278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 10:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=egmAADg5;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id a127so3590501pfa.10
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 10:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D27KQ1E2DaK6c3y/B3eG1PY6C6SGTkhT7MR34XRObSs=;
        b=egmAADg5Oa43Fh0Ufz5o1aJI9ed7X71CekIvb5rlME467Ng9iZN1nfOo/GFCU4SX8w
         0jW4AK9e34VrQ4HM1Z4IZxSpWmSbETUudT7JwTxKUmrIJK40p/wVqRx1YPijN6PTKXW0
         LYUe8lscdDeTOgmQKna8EQZ6k0AiWvrbjXqSQxA7eSjXehil5eTJbm6bL4jmI6z+bsqX
         jPCuYFwoGICk1mhU/oiO3kD1wo4QNVgNxG7Lp5DD3hy3i9WLpVta3v4IttBGw3vewiLx
         77eO47pvui7IGTovipm9lzKgoAw4Jfjbj8lVmRU6HC7syLyoxbWcK9dpEfybXTekxBAi
         Fblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D27KQ1E2DaK6c3y/B3eG1PY6C6SGTkhT7MR34XRObSs=;
        b=NBF0WxkAnLkKFwT3O4ueJOaZl00EgXPYkjBOusukBNavS13KOcd32Jm9bzi+Qo+4mP
         65RrOcvwGZ+I4hpQGn38L6xEfo7bKvN+8QVhkjjsDCgnuSJVcguGNk251sA24lzFu6oo
         /3tF6V9kpYpCJxz1QdJ0HmmiilbYwUe4CUwjbW9jLeSAY2PGyBq+QZ3WC5sI6M93/1W7
         p8CPCrYeE7tv9ytYt/V5P+QoLsqz1S2NrGr8zzCOOg3noGcLIKxHlU9HxpdxcnfjnCBT
         NQbo0oDGSVJ6fdPVL88scygNC5iC6njYTDUjtcRl6D0NrtLm/zD0FDamAZt1BdmRwa2S
         Fxcg==
X-Gm-Message-State: AOAM530ZGiUu0RVBuBTEc0pD421pSNWnc8/hJ9/LV1M1WVAi7N7jV8Hg
	iIbIHbg1sVGEpecmjaK6EsA9ECXmoDd0Rg==
X-Google-Smtp-Source: ABdhPJzCAUFmH2jTrkJ0N2guFbTufIjl/QsiltxwMXmqyb73xMReKPmSNqDWUJiD2/MIEThSsXLEcQ==
X-Received: by 2002:a62:14c8:0:b029:2fb:3d9e:bc35 with SMTP id 191-20020a6214c80000b02902fb3d9ebc35mr20319064pfu.40.1624294988794;
        Mon, 21 Jun 2021 10:03:08 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:8a50:f0aa:6cd5:a7ef])
        by smtp.gmail.com with ESMTPSA id s125sm6002868pgc.63.2021.06.21.10.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:03:08 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [RFC PATCH 06/10][dunfell] python3: upgrade 3.8.7 -> 3.8.8
Date: Mon, 21 Jun 2021 10:02:53 -0700
Message-Id: <a8d20250c1776378d13920008a004668bc2f5cf9.1624294059.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1624294059.git.timothy.t.orling@intel.com>
References: <cover.1624294059.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release Date: Feb. 19, 2021

Note: The release you're looking at is Python 3.8.8, a bugfix release for the
legacy 3.8 series. Python 3.9 is now the latest feature release series of
Python 3.

Notable changes in Python 3.8.8

Earlier Python versions allowed using both ; and & as query parameter
separators in urllib.parse.parse_qs() and urllib.parse.parse_qsl(). Due to
security concerns, and to conform with newer W3C recommendations, this has been
changed to allow only a single separator key, with & as the default. This
change also affects cgi.parse() and cgi.parse_multipart() as they use the
affected functions internally. For more details, please see their respective
documentation. (Contributed by Adam Goldschmidt, Senthil Kumaran and Ken Jin
in bpo-42967.)

License-Update: update copyright years

Drop patches fixed in 3.8.8:
- CVE-2021-3177

Fixes:
CVE: CVE-2021-3426
CVE: CVE-2021-23336

References:
https://www.python.org/downloads/release/python-388/
https://docs.python.org/release/3.8.8/whatsnew/changelog.html#changelog
https://docs.python.org/3/whatsnew/3.8.html#notable-changes-in-python-3-8-8
https://nvd.nist.gov/vuln/detail/CVE-2021-3177
https://nvd.nist.gov/vuln/detail/CVE-2021-3426

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../python/python3/CVE-2021-3177.patch        | 191 ------------------
 .../{python3_3.8.7.bb => python3_3.8.8.bb}    |   7 +-
 2 files changed, 3 insertions(+), 195 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3177.patch
 rename meta/recipes-devtools/python/{python3_3.8.7.bb => python3_3.8.8.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3177.patch b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
deleted file mode 100644
index 43d678db467..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
+++ /dev/null
@@ -1,191 +0,0 @@
-From ece5dfd403dac211f8d3c72701fe7ba7b7aa5b5f Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 18 Jan 2021 13:28:52 -0800
-Subject: [PATCH] closes bpo-42938: Replace snprintf with Python unicode
- formatting in ctypes param reprs. (GH-24248)
-
-(cherry picked from commit 916610ef90a0d0761f08747f7b0905541f0977c7)
-
-Co-authored-by: Benjamin Peterson <benjamin@python.org>
-
-Co-authored-by: Benjamin Peterson <benjamin@python.org>
-
-CVE: CVE-2021-3177
-Upstream-Status: Backport [https://github.com/python/cpython/commit/ece5dfd403dac211f8d3c72701fe7ba7b7aa5b5f]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Lib/ctypes/test/test_parameters.py            | 43 ++++++++++++++++
- .../2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst  |  2 +
- Modules/_ctypes/callproc.c                    | 51 +++++++------------
- 3 files changed, 64 insertions(+), 32 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
-
-diff --git a/Lib/ctypes/test/test_parameters.py b/Lib/ctypes/test/test_parameters.py
-index e4c25fd880cef..531894fdec838 100644
---- a/Lib/ctypes/test/test_parameters.py
-+++ b/Lib/ctypes/test/test_parameters.py
-@@ -201,6 +201,49 @@ def __dict__(self):
-         with self.assertRaises(ZeroDivisionError):
-             WorseStruct().__setstate__({}, b'foo')
- 
-+    def test_parameter_repr(self):
-+        from ctypes import (
-+            c_bool,
-+            c_char,
-+            c_wchar,
-+            c_byte,
-+            c_ubyte,
-+            c_short,
-+            c_ushort,
-+            c_int,
-+            c_uint,
-+            c_long,
-+            c_ulong,
-+            c_longlong,
-+            c_ulonglong,
-+            c_float,
-+            c_double,
-+            c_longdouble,
-+            c_char_p,
-+            c_wchar_p,
-+            c_void_p,
-+        )
-+        self.assertRegex(repr(c_bool.from_param(True)), r"^<cparam '\?' at 0x[A-Fa-f0-9]+>$")
-+        self.assertEqual(repr(c_char.from_param(97)), "<cparam 'c' ('a')>")
-+        self.assertRegex(repr(c_wchar.from_param('a')), r"^<cparam 'u' at 0x[A-Fa-f0-9]+>$")
-+        self.assertEqual(repr(c_byte.from_param(98)), "<cparam 'b' (98)>")
-+        self.assertEqual(repr(c_ubyte.from_param(98)), "<cparam 'B' (98)>")
-+        self.assertEqual(repr(c_short.from_param(511)), "<cparam 'h' (511)>")
-+        self.assertEqual(repr(c_ushort.from_param(511)), "<cparam 'H' (511)>")
-+        self.assertRegex(repr(c_int.from_param(20000)), r"^<cparam '[li]' \(20000\)>$")
-+        self.assertRegex(repr(c_uint.from_param(20000)), r"^<cparam '[LI]' \(20000\)>$")
-+        self.assertRegex(repr(c_long.from_param(20000)), r"^<cparam '[li]' \(20000\)>$")
-+        self.assertRegex(repr(c_ulong.from_param(20000)), r"^<cparam '[LI]' \(20000\)>$")
-+        self.assertRegex(repr(c_longlong.from_param(20000)), r"^<cparam '[liq]' \(20000\)>$")
-+        self.assertRegex(repr(c_ulonglong.from_param(20000)), r"^<cparam '[LIQ]' \(20000\)>$")
-+        self.assertEqual(repr(c_float.from_param(1.5)), "<cparam 'f' (1.5)>")
-+        self.assertEqual(repr(c_double.from_param(1.5)), "<cparam 'd' (1.5)>")
-+        self.assertEqual(repr(c_double.from_param(1e300)), "<cparam 'd' (1e+300)>")
-+        self.assertRegex(repr(c_longdouble.from_param(1.5)), r"^<cparam ('d' \(1.5\)|'g' at 0x[A-Fa-f0-9]+)>$")
-+        self.assertRegex(repr(c_char_p.from_param(b'hihi')), "^<cparam 'z' \(0x[A-Fa-f0-9]+\)>$")
-+        self.assertRegex(repr(c_wchar_p.from_param('hihi')), "^<cparam 'Z' \(0x[A-Fa-f0-9]+\)>$")
-+        self.assertRegex(repr(c_void_p.from_param(0x12)), r"^<cparam 'P' \(0x0*12\)>$")
-+
- ################################################################
- 
- if __name__ == '__main__':
-diff --git a/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
-new file mode 100644
-index 0000000000000..7df65a156feab
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
-@@ -0,0 +1,2 @@
-+Avoid static buffers when computing the repr of :class:`ctypes.c_double` and
-+:class:`ctypes.c_longdouble` values.
-diff --git a/Modules/_ctypes/callproc.c b/Modules/_ctypes/callproc.c
-index a9b8675cd951b..de75918d49f37 100644
---- a/Modules/_ctypes/callproc.c
-+++ b/Modules/_ctypes/callproc.c
-@@ -484,58 +484,47 @@ is_literal_char(unsigned char c)
- static PyObject *
- PyCArg_repr(PyCArgObject *self)
- {
--    char buffer[256];
-     switch(self->tag) {
-     case 'b':
-     case 'B':
--        sprintf(buffer, "<cparam '%c' (%d)>",
-+        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
-             self->tag, self->value.b);
--        break;
-     case 'h':
-     case 'H':
--        sprintf(buffer, "<cparam '%c' (%d)>",
-+        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
-             self->tag, self->value.h);
--        break;
-     case 'i':
-     case 'I':
--        sprintf(buffer, "<cparam '%c' (%d)>",
-+        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
-             self->tag, self->value.i);
--        break;
-     case 'l':
-     case 'L':
--        sprintf(buffer, "<cparam '%c' (%ld)>",
-+        return PyUnicode_FromFormat("<cparam '%c' (%ld)>",
-             self->tag, self->value.l);
--        break;
- 
-     case 'q':
-     case 'Q':
--        sprintf(buffer,
--#ifdef MS_WIN32
--            "<cparam '%c' (%I64d)>",
--#else
--            "<cparam '%c' (%lld)>",
--#endif
-+        return PyUnicode_FromFormat("<cparam '%c' (%lld)>",
-             self->tag, self->value.q);
--        break;
-     case 'd':
--        sprintf(buffer, "<cparam '%c' (%f)>",
--            self->tag, self->value.d);
--        break;
--    case 'f':
--        sprintf(buffer, "<cparam '%c' (%f)>",
--            self->tag, self->value.f);
--        break;
--
-+    case 'f': {
-+        PyObject *f = PyFloat_FromDouble((self->tag == 'f') ? self->value.f : self->value.d);
-+        if (f == NULL) {
-+            return NULL;
-+        }
-+        PyObject *result = PyUnicode_FromFormat("<cparam '%c' (%R)>", self->tag, f);
-+        Py_DECREF(f);
-+        return result;
-+    }
-     case 'c':
-         if (is_literal_char((unsigned char)self->value.c)) {
--            sprintf(buffer, "<cparam '%c' ('%c')>",
-+            return PyUnicode_FromFormat("<cparam '%c' ('%c')>",
-                 self->tag, self->value.c);
-         }
-         else {
--            sprintf(buffer, "<cparam '%c' ('\\x%02x')>",
-+            return PyUnicode_FromFormat("<cparam '%c' ('\\x%02x')>",
-                 self->tag, (unsigned char)self->value.c);
-         }
--        break;
- 
- /* Hm, are these 'z' and 'Z' codes useful at all?
-    Shouldn't they be replaced by the functionality of c_string
-@@ -544,22 +533,20 @@ PyCArg_repr(PyCArgObject *self)
-     case 'z':
-     case 'Z':
-     case 'P':
--        sprintf(buffer, "<cparam '%c' (%p)>",
-+        return PyUnicode_FromFormat("<cparam '%c' (%p)>",
-             self->tag, self->value.p);
-         break;
- 
-     default:
-         if (is_literal_char((unsigned char)self->tag)) {
--            sprintf(buffer, "<cparam '%c' at %p>",
-+            return PyUnicode_FromFormat("<cparam '%c' at %p>",
-                 (unsigned char)self->tag, (void *)self);
-         }
-         else {
--            sprintf(buffer, "<cparam 0x%02x at %p>",
-+            return PyUnicode_FromFormat("<cparam 0x%02x at %p>",
-                 (unsigned char)self->tag, (void *)self);
-         }
--        break;
-     }
--    return PyUnicode_FromString(buffer);
- }
- 
- static PyMemberDef PyCArgType_members[] = {
-
diff --git a/meta/recipes-devtools/python/python3_3.8.7.bb b/meta/recipes-devtools/python/python3_3.8.8.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.8.7.bb
rename to meta/recipes-devtools/python/python3_3.8.8.bb
index 11a69ea808a..d77c7d87fb7 100644
--- a/meta/recipes-devtools/python/python3_3.8.7.bb
+++ b/meta/recipes-devtools/python/python3_3.8.8.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python is a programming language that lets you work more quickly
 LICENSE = "PSF-2.0 & BSD-0-Clause"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=33223c9ef60c31e3f0e866cb09b65e83"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c22d2438294c784731bf9dd224a467b7"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -33,7 +33,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
-           file://CVE-2021-3177.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -42,8 +41,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "60fe018fffc7f33818e6c340d29e2db9"
-SRC_URI[sha256sum] = "ddcc1df16bb5b87aa42ec5d20a5b902f2d088caa269b28e01590f97a798ec50a"
+SRC_URI[md5sum] = "23e6b769857233c1ac07b6be7442eff4"
+SRC_URI[sha256sum] = "7c664249ff77e443d6ea0e4cf0e587eae918ca3c48d081d1915fe2a1f1bcc5cc"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2

