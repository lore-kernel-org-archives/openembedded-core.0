Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE2ECD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 10:12:02 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88523.1781345511849188942
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 03:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=idcsaqqC;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7866; q=dns/txt;
  s=iport01; t=1781345511; x=1782555111;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qw1ygc1Ax8ChptdZifD6LzZCKoitMqP3o+rxW3eNXsE=;
  b=idcsaqqCNXKIbpS/4yoaD/bgqYp5ibJTEbRy+QOtoHMNzcm0MEKDXLqN
   UpfLkfgmaPPQrB5qZDzjqqxJkjt7EpwldxhTZpyCTmdM3t1p95YfsuYbh
   P0F0GRTkiunIYoLaH0nEfllg38cVffa79j5V2/Y0xI1nLv48LR3HpZWdD
   5dh3pPhEmgF38hHnzDfjN+FhVvp+EfezlxK4a8ZeRwbOmIe4Wo89zC+Wg
   WzyrswBxTbmRm/sNhpRlw/+hFi4b3l6kZvaMB+6alnDtMBD30cMZBaWHf
   SOZ91xr0+9xgyOxW3WCqRgNc1LC1Rw+xwSUymXa3H3v6m5KJAsGXw6bBU
   g==;
X-CSE-ConnectionGUID: Q8hLzV+aR3yxrAPdLH1jmw==
X-CSE-MsgGUID: xfguodTKQqyw31chLykR7Q==
X-IPAS-Result: =?us-ascii?q?A0BGAgBaKy1q/5D/Ja1aglmCV3RfQkkDlCeCIYtnkjeBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEQI4LAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBLQsBGAFZAwECTwsjIQkRgmgBgjoDNgIBEbNegXkzgQGDK?=
 =?us-ascii?q?AExBQkCQ1DYSQ2CVgELDQIFAYE4gyCCH4J8hSNbGAGEfCcbG4FygRWDaYEFg?=
 =?us-ascii?q?RpCAQGBN4ZuBIINFYEMgV0ehDmKZEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDBsHBYFKgStqgQSFDSMfAzl/gXOBKGdnFTA1gQIRHwocAwsYDUgRL?=
 =?us-ascii?q?DcUGwQ+bgeMXRcPgUxyPSYrASoBFwkvMIEtEQ2lWKAecQoog3WMIY8+hXwaM?=
 =?us-ascii?q?4QEgVelEZkIglmLMYQJkkeEaIFoPIFHCwdwFYMiCUoZD444g2uBf4MUUcEqJ?=
 =?us-ascii?q?DUCCQMvAQEHAgcOAwuBaJAAAiYHgU4BAQ?=
IronPort-Data: A9a23:4I+xpquLWirYKTmnu99m/zyutOfnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWrXaKqDZWL1f9B0OY3jp0tU7MLdnNZnHgI9+y1mFn9HgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZDdJ5xYuajhKs/za80s21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIww7Z3JXNwt
 vUicyEddDm7i8aWmbC+Vbw57igjBJGD0II3oHpsy3TdSP0hW52GG/qM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtLYH49tL/Aan3XaCBUtVefpaMf6GnIxws327/oWDbQUoDbHpwNzxjI+
 goq+UzpDB4HM9Cj6gOc42333+TPuTL4Yt0rQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YeLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:SkR1Jqu0QrsnVwgVCflrQgjS7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: =?us-ascii?q?9a23=3ACEswtmjxw+e16pDQmNDL06s1KzJuSy3d6GXuYEa?=
 =?us-ascii?q?CUnd5UpStRXuwoaFhjJ87?=
X-Talos-MUID: 9a23:vF101giWBmOXj5oVG5lgG8MpJMln/qOiNGM0iIQZ4JCPNQhhOA3CtWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,202,1774310400"; 
   d="scan'208";a="493109684"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Jun 2026 10:11:50 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id A4D7A18000229
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:11:50 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 4B5E3CB6A93; Sat, 13 Jun 2026 03:11:50 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/4] python3: Fix CVE-2026-3644 and CVE-2026-0672
Date: Sat, 13 Jun 2026 03:11:35 -0700
Message-Id: <20260613101137.3690080-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238667

From: Sudhir Dumbhare <sudumbha@cisco.com>

Apply the upstream v3.13 fix [1], as referenced in [2], to address
CVE-2026-3644 by rejecting control characters in http.cookies.Morsel.update(),
the |= operator, and unpickling paths.

CVE-2026-3644 [2] revealed the CVE-2026-0672 fix was incomplete, as
Morsel.update(), |=, and unpickling could bypass input validation. The fix
also adds output validation to BaseCookie.js_output(), matching the
control-character safeguards already present in BaseCookie.output().

[1] https://github.com/python/cpython/commit/d16ecc6c3626f0e2cc8f08c309c83934e8a979dd
[2] https://security-tracker.debian.org/tracker/CVE-2026-3644

References:
https://security-tracker.debian.org/tracker/CVE-2026-3644
https://security-tracker.debian.org/tracker/CVE-2026-0672
https://nvd.nist.gov/vuln/detail/CVE-2026-3644
https://nvd.nist.gov/vuln/detail/CVE-2026-0672

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../python3/CVE-2026-3644_CVE-2026-0672.patch | 154 ++++++++++++++++++
 .../python/python3_3.12.13.bb                 |   1 +
 2 files changed, 155 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch b/meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch
new file mode 100644
index 0000000000..42d8133a18
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch
@@ -0,0 +1,154 @@
+From 6e291d2eba0b6820bc924e68f1db750328bf6c75 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 16 Mar 2026 15:05:13 +0100
+Subject: [PATCH] [3.13] gh-145599, CVE 2026-3644: Reject control
+ characters in `http.cookies.Morsel.update()` (GH-145600) (#146024)
+
+gh-145599, CVE 2026-3644: Reject control characters in `http.cookies.Morsel.update()` (GH-145600)
+
+Reject control characters in `http.cookies.Morsel.update()` and `http.cookies.BaseCookie.js_output`.
+
+CVE: CVE-2026-3644 CVE-2026-0672
+Upstream-Status: Backport [https://github.com/python/cpython/commit/d16ecc6c3626f0e2cc8f08c309c83934e8a979dd]
+
+Backport Changes:
+- This file is not present in the current version and is therefore omitted
+  Misc/NEWS.d/next/Security/2026-03-06-17-03-38.gh-issue-145599.kchwZV.rst
+
+(cherry picked from commit 57e88c1cf95e1481b94ae57abe1010469d47a6b4)
+
+Co-authored-by: Stan Ulbrych <89152624+StanFromIreland@users.noreply.github.com>
+Co-authored-by: Victor Stinner <vstinner@python.org>
+Co-authored-by: Victor Stinner <victor.stinner@gmail.com>
+(cherry picked from commit d16ecc6c3626f0e2cc8f08c309c83934e8a979dd)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ Lib/http/cookies.py           | 24 ++++++++++++++++++----
+ Lib/test/test_http_cookies.py | 38 +++++++++++++++++++++++++++++++++++
+ 2 files changed, 58 insertions(+), 4 deletions(-)
+
+diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
+index d0a69cbe191..63d119ad46c 100644
+--- a/Lib/http/cookies.py
++++ b/Lib/http/cookies.py
+@@ -335,9 +335,16 @@ class Morsel(dict):
+             key = key.lower()
+             if key not in self._reserved:
+                 raise CookieError("Invalid attribute %r" % (key,))
++            if _has_control_character(key, val):
++                raise CookieError("Control characters are not allowed in "
++                                  f"cookies {key!r} {val!r}")
+             data[key] = val
+         dict.update(self, data)
+ 
++    def __ior__(self, values):
++        self.update(values)
++        return self
++
+     def isReservedKey(self, K):
+         return K.lower() in self._reserved
+ 
+@@ -363,9 +370,15 @@ class Morsel(dict):
+         }
+ 
+     def __setstate__(self, state):
+-        self._key = state['key']
+-        self._value = state['value']
+-        self._coded_value = state['coded_value']
++        key = state['key']
++        value = state['value']
++        coded_value = state['coded_value']
++        if _has_control_character(key, value, coded_value):
++            raise CookieError("Control characters are not allowed in cookies "
++                              f"{key!r} {value!r} {coded_value!r}")
++        self._key = key
++        self._value = value
++        self._coded_value = coded_value
+ 
+     def output(self, attrs=None, header="Set-Cookie:"):
+         return "%s %s" % (header, self.OutputString(attrs))
+@@ -377,13 +390,16 @@ class Morsel(dict):
+ 
+     def js_output(self, attrs=None):
+         # Print javascript
++        output_string = self.OutputString(attrs)
++        if _has_control_character(output_string):
++            raise CookieError("Control characters are not allowed in cookies")
+         return """
+         <script type="text/javascript">
+         <!-- begin hiding
+         document.cookie = \"%s\";
+         // end hiding -->
+         </script>
+-        """ % (self.OutputString(attrs).replace('"', r'\"'))
++        """ % (output_string.replace('"', r'\"'))
+ 
+     def OutputString(self, attrs=None):
+         # Build up our result
+diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.py
+index f196bcc48e3..2478a6c630f 100644
+--- a/Lib/test/test_http_cookies.py
++++ b/Lib/test/test_http_cookies.py
+@@ -573,6 +573,14 @@ class MorselTests(unittest.TestCase):
+             with self.assertRaises(cookies.CookieError):
+                 morsel["path"] = c0
+ 
++            # .__setstate__()
++            with self.assertRaises(cookies.CookieError):
++                morsel.__setstate__({'key': c0, 'value': 'val', 'coded_value': 'coded'})
++            with self.assertRaises(cookies.CookieError):
++                morsel.__setstate__({'key': 'key', 'value': c0, 'coded_value': 'coded'})
++            with self.assertRaises(cookies.CookieError):
++                morsel.__setstate__({'key': 'key', 'value': 'val', 'coded_value': c0})
++
+             # .setdefault()
+             with self.assertRaises(cookies.CookieError):
+                 morsel.setdefault("path", c0)
+@@ -587,6 +595,18 @@ class MorselTests(unittest.TestCase):
+             with self.assertRaises(cookies.CookieError):
+                 morsel.set("path", "val", c0)
+ 
++            # .update()
++            with self.assertRaises(cookies.CookieError):
++                morsel.update({"path": c0})
++            with self.assertRaises(cookies.CookieError):
++                morsel.update({c0: "val"})
++
++            # .__ior__()
++            with self.assertRaises(cookies.CookieError):
++                morsel |= {"path": c0}
++            with self.assertRaises(cookies.CookieError):
++                morsel |= {c0: "val"}
++
+     def test_control_characters_output(self):
+         # Tests that even if the internals of Morsel are modified
+         # that a call to .output() has control character safeguards.
+@@ -607,6 +627,24 @@ class MorselTests(unittest.TestCase):
+             with self.assertRaises(cookies.CookieError):
+                 cookie.output()
+ 
++        # Tests that .js_output() also has control character safeguards.
++        for c0 in support.control_characters_c0():
++            morsel = cookies.Morsel()
++            morsel.set("key", "value", "coded-value")
++            morsel._key = c0  # Override private variable.
++            cookie = cookies.SimpleCookie()
++            cookie["cookie"] = morsel
++            with self.assertRaises(cookies.CookieError):
++                cookie.js_output()
++
++            morsel = cookies.Morsel()
++            morsel.set("key", "value", "coded-value")
++            morsel._coded_value = c0  # Override private variable.
++            cookie = cookies.SimpleCookie()
++            cookie["cookie"] = morsel
++            with self.assertRaises(cookies.CookieError):
++                cookie.js_output()
++
+ 
+ def load_tests(loader, tests, pattern):
+     tests.addTest(doctest.DocTestSuite(cookies))
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index 5fa25235fe..41d2efbd28 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
+           file://CVE-2026-3644_CVE-2026-0672.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.35.6


