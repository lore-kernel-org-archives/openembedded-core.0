Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.1173.1613765904813744905
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 12:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=nPQYdLJz;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.193, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f193.google.com with SMTP id a22so27241046ljp.10
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 12:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHlxsDGke8yCMlKdUB/0u5Mlm4N0lPlowcX6N2bUHp0=;
        b=nPQYdLJzJ08CEbQ7CrvqUgGp3Rj2RV2SlMHIy6JbzyhOUDYcTpGEOpIM4x+u9kS8Li
         tl1+aSnwR3UeTCaWise4X5CmIQJ1K++y0fX9OGJMRbOnrV4g8r9FzOzkehxdTrvrkYKh
         sZioDPr9kTRhQ6Ob8hI7vZB5g7xSQhUrpa5pMwWoH0lahk5IA1WF8B+tm/F7klNzY2+I
         UT5cHLUL/3dfZWWe0G82+nVb5uF/OS3Cl4GwGKs1Goj6Jt85kLiEpUsGq9r5uBs7Ebxe
         XTSlJK7uzaaydQN0kvY/xTHJVe1ccUUNZyo8tBfnBXAH7pMiD84zQGhll6dDwJoVx9+m
         A7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PHlxsDGke8yCMlKdUB/0u5Mlm4N0lPlowcX6N2bUHp0=;
        b=ulZYSlYl0gUoboKEyTLGuOsFgfuyV3h8j45uyqizTFXSgRzmaBMW6F2VRkLCanS83H
         BHxZy3fFyZFJpu5U+9wUz7Tej8/s4i6JjvpKkQz4y28NYIkm0YXduYBULFnrwvyaXvI9
         RfeSoEWr0jaz7H3tFLHViq7NK14jB8Tff06jqWJb5X8JS8k3Xm/bR2ut7CPQujYjSuYX
         SLIFWdI78ws9Yolpg8xT/iGdqmJo+GIjC5iKJlvag/rXskU+xs5Adc/I1RU49Kmc8Nrl
         jKRMt6IFt900WkUiLEIwvo0OJJR7lcnv0gdbbBkwKvR0wSQe12YYAEbMDRGztH/ALd/q
         Do0w==
X-Gm-Message-State: AOAM533+Twb7T2Qn1ZiMLtqq20gL2AuVhkE9/ZQCYGRC8ocMt0Iaz2Dv
	KhfxfBUOJREEr0u3C8xyCB2CQam60bQ4jUeN
X-Google-Smtp-Source: ABdhPJxIGpCeuzbUN6MQ2TvBglvDCkPkCOskMjO8UMZSF6HZHUoMNvS/5ecL95nsFeartCAnYkZ9xQ==
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr6691211lfd.563.1613765902387;
        Fri, 19 Feb 2021 12:18:22 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id z7sm1016992lfd.228.2021.02.19.12.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 12:17:17 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3: update to 3.9.2
Date: Fri, 19 Feb 2021 21:11:46 +0100
Message-Id: <20210219201146.1953636-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed CVE patch was upstreamed.

License-Update: copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/python3/CVE-2021-3177.patch        | 191 ------------------
 .../{python3_3.9.1.bb => python3_3.9.2.bb}    |   5 +-
 2 files changed, 2 insertions(+), 194 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3177.patch
 rename meta/recipes-devtools/python/{python3_3.9.1.bb => python3_3.9.2.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3177.patch b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
deleted file mode 100644
index a48207162f..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
+++ /dev/null
@@ -1,191 +0,0 @@
-From c347cbe694743cee120457aa6626712f7799a932 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 18 Jan 2021 13:29:31 -0800
-Subject: [PATCH] closes bpo-42938: Replace snprintf with Python unicode
- formatting in ctypes param reprs. (GH-24247)
-
-(cherry picked from commit 916610ef90a0d0761f08747f7b0905541f0977c7)
-
-Co-authored-by: Benjamin Peterson <benjamin@python.org>
-
-Co-authored-by: Benjamin Peterson <benjamin@python.org>
-
-CVE: CVE-2021-3177
-Upstream-Status: Backport [https://github.com/python/cpython/commit/c347cbe694743cee120457aa6626712f7799a932]
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
-index b0a36a30248f7..f2506de54498e 100644
---- a/Modules/_ctypes/callproc.c
-+++ b/Modules/_ctypes/callproc.c
-@@ -489,58 +489,47 @@ is_literal_char(unsigned char c)
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
-@@ -549,22 +538,20 @@ PyCArg_repr(PyCArgObject *self)
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
diff --git a/meta/recipes-devtools/python/python3_3.9.1.bb b/meta/recipes-devtools/python/python3_3.9.2.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.9.1.bb
rename to meta/recipes-devtools/python/python3_3.9.2.bb
index ad032e97ae..87231f97a6 100644
--- a/meta/recipes-devtools/python/python3_3.9.1.bb
+++ b/meta/recipes-devtools/python/python3_3.9.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.python.org"
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=33223c9ef60c31e3f0e866cb09b65e83"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c22d2438294c784731bf9dd224a467b7"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -29,7 +29,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
-           file://CVE-2021-3177.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -37,7 +36,7 @@ SRC_URI_append_class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "991c3f8ac97992f3d308fefeb03a64db462574eadbff34ce8bc5bb583d9903ff"
+SRC_URI[sha256sum] = "3c2034c54f811448f516668dce09d24008a0716c3a794dd8639b5388cbde247d"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1

