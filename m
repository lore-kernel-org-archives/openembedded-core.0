Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCAEEE6451
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 06:44:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.41355.1726123476196844558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 23:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99850483cc=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C4xpZM015007
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 06:44:35 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gdt8nnqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 06:44:35 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 23:44:31 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3: Upgrade 3.12.5 -> 3.12.6
Date: Thu, 12 Sep 2024 06:44:07 +0000
Message-ID: <20240912064407.2503089-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: Wm-kAh8pH14a_dlhHpdpPDWz-CdBcVTT
X-Proofpoint-GUID: Wm-kAh8pH14a_dlhHpdpPDWz-CdBcVTT
X-Authority-Analysis: v=2.4 cv=a+hi9lSF c=1 sm=1 tr=0 ts=66e28dd3 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=8AHkEIZyAAAA:8 a=IpJZQVW2AAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=36PeEpfOJYvHNA8qd84A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-11_02,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120047
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 48C4xpZM015007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 06:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204425

From: Divya Chellam <divya.chellam@windriver.com>

Includes security fixes for CVE-2024-7592, CVE-2024-8088, CVE-2024-6232
and other bug fixes.

Removed below patches, as the fix is included in 3.12.6 upgrade:
1. CVE-2024-7592.patch
2. 0001-test_readline-skip-limited-history-test.patch

Release Notes:
https://www.python.org/downloads/release/python-3126/

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 ...t_readline-skip-limited-history-test.patch |  41 ----
 .../python/python3/CVE-2024-7592.patch        | 231 ------------------
 .../{python3_3.12.5.bb =3D> python3_3.12.6.bb}  |   4 +-
 3 files changed, 1 insertion(+), 275 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_readli=
ne-skip-limited-history-test.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2024-7592.pa=
tch
 rename meta/recipes-devtools/python/{python3_3.12.5.bb =3D> python3_3.12=
.6.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip=
-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-t=
est_readline-skip-limited-history-test.patch
deleted file mode 100644
index 50a4609f7a..0000000000
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limite=
d-history-test.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d9d916d5ea946c945323679d1709de1b87029b96 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 13 Aug 2024 11:07:05 -0400
-Subject: [PATCH] test_readline: skip limited history test
-
-This test was added recently and is failing on the ptest image when
-using the default PACKAGECONFIG settings (i.e. with editline instead of
-readline).. Disable it until the proper fix is determined.
-
-A bug has been opened upstream: https://github.com/python/cpython/issues=
/123018
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- Lib/test/test_readline.py | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
-index 91fd7dd13f9..d81f9bf8eed 100644
---- a/Lib/test/test_readline.py
-+++ b/Lib/test/test_readline.py
-@@ -132,6 +132,7 @@ def test_nonascii_history(self):
-         self.assertEqual(readline.get_history_item(1), "entr=C3=A9e 1")
-         self.assertEqual(readline.get_history_item(2), "entr=C3=A9e 22"=
)
-=20
-+    @unittest.skip("Skipping problematic test")
-     def test_write_read_limited_history(self):
-         previous_length =3D readline.get_history_length()
-         self.addCleanup(readline.set_history_length, previous_length)
-@@ -349,6 +350,7 @@ def test_history_size(self):
-             self.assertEqual(len(lines), history_size)
-             self.assertEqual(lines[-1].strip(), b"last input")
-=20
-+    @unittest.skip("Skipping problematic test")
-     def test_write_read_limited_history(self):
-         previous_length =3D readline.get_history_length()
-         self.addCleanup(readline.set_history_length, previous_length)
---=20
-2.39.2
-
diff --git a/meta/recipes-devtools/python/python3/CVE-2024-7592.patch b/m=
eta/recipes-devtools/python/python3/CVE-2024-7592.patch
deleted file mode 100644
index 7fd74abed3..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2024-7592.patch
+++ /dev/null
@@ -1,231 +0,0 @@
-From 04ac47b343b10f2182c4b3730d4be241b2397a4d Mon Sep 17 00:00:00 2001
-From: Serhiy Storchaka <storchaka@gmail.com>
-Date: Fri, 16 Aug 2024 19:13:37 +0300
-Subject: [PATCH 1/4] gh-123067: Fix quadratic complexity in parsing cook=
ies
- with backslashes
-
-This fixes CVE-2024-7592.
-
-CVE: CVE-2024-7592
-Upstream-Status: Backport [https://github.com/python/cpython/pull/123075=
]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- Lib/http/cookies.py                           | 34 ++++-------------
- Lib/test/test_http_cookies.py                 | 38 +++++++++++++++++++
- ...-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst |  1 +
- 3 files changed, 47 insertions(+), 26 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issu=
e-123067.Nx9O4R.rst
-
-diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
-index 351faf428a20cd..11a67e8a2e008b 100644
---- a/Lib/http/cookies.py
-+++ b/Lib/http/cookies.py
-@@ -184,8 +184,12 @@ def _quote(str):
-         return '"' + str.translate(_Translator) + '"'
-=20
-=20
--_OctalPatt =3D re.compile(r"\\[0-3][0-7][0-7]")
--_QuotePatt =3D re.compile(r"[\\].")
-+_unquote_re =3D re.compile(r'\\(?:([0-3][0-7][0-7])|(["\\]))')
-+def _unquote_replace(m):
-+    if m[1]:
-+        return chr(int(m[1], 8))
-+    else:
-+        return m[2]
-=20
- def _unquote(str):
-     # If there aren't any doublequotes,
-@@ -205,30 +209,8 @@ def _unquote(str):
-     #    \012 --> \n
-     #    \"   --> "
-     #
--    i =3D 0
--    n =3D len(str)
--    res =3D []
--    while 0 <=3D i < n:
--        o_match =3D _OctalPatt.search(str, i)
--        q_match =3D _QuotePatt.search(str, i)
--        if not o_match and not q_match:              # Neither matched
--            res.append(str[i:])
--            break
--        # else:
--        j =3D k =3D -1
--        if o_match:
--            j =3D o_match.start(0)
--        if q_match:
--            k =3D q_match.start(0)
--        if q_match and (not o_match or k < j):     # QuotePatt matched
--            res.append(str[i:k])
--            res.append(str[k+1])
--            i =3D k + 2
--        else:                                      # OctalPatt matched
--            res.append(str[i:j])
--            res.append(chr(int(str[j+1:j+4], 8)))
--            i =3D j + 4
--    return _nulljoin(res)
-+
-+    return _unquote_re.sub(_unquote_replace, str)
-=20
- # The _getdate() routine is used to set the expiration time in the cook=
ie's HTTP
- # header.  By default, _getdate() returns the current time in the appro=
priate
-diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.=
py
-index 925c8697f60de6..13b526d49b0856 100644
---- a/Lib/test/test_http_cookies.py
-+++ b/Lib/test/test_http_cookies.py
-@@ -5,6 +5,7 @@
- import doctest
- from http import cookies
- import pickle
-+from test import support
-=20
-=20
- class CookieTests(unittest.TestCase):
-@@ -58,6 +59,43 @@ def test_basic(self):
-             for k, v in sorted(case['dict'].items()):
-                 self.assertEqual(C[k].value, v)
-=20
-+    def test_unquote(self):
-+        cases =3D [
-+            (r'a=3D"b=3D\""', 'b=3D"'),
-+            (r'a=3D"b=3D\\"', 'b=3D\\'),
-+            (r'a=3D"b=3D\=3D"', 'b=3D\\=3D'),
-+            (r'a=3D"b=3D\n"', 'b=3D\\n'),
-+            (r'a=3D"b=3D\042"', 'b=3D"'),
-+            (r'a=3D"b=3D\134"', 'b=3D\\'),
-+            (r'a=3D"b=3D\377"', 'b=3D\xff'),
-+            (r'a=3D"b=3D\400"', 'b=3D\\400'),
-+            (r'a=3D"b=3D\42"', 'b=3D\\42'),
-+            (r'a=3D"b=3D\\042"', 'b=3D\\042'),
-+            (r'a=3D"b=3D\\134"', 'b=3D\\134'),
-+            (r'a=3D"b=3D\\\""', 'b=3D\\"'),
-+            (r'a=3D"b=3D\\\042"', 'b=3D\\"'),
-+            (r'a=3D"b=3D\134\""', 'b=3D\\"'),
-+            (r'a=3D"b=3D\134\042"', 'b=3D\\"'),
-+        ]
-+        for encoded, decoded in cases:
-+            with self.subTest(encoded):
-+                C =3D cookies.SimpleCookie()
-+                C.load(encoded)
-+                self.assertEqual(C['a'].value, decoded)
-+
-+    @support.requires_resource('cpu')
-+    def test_unquote_large(self):
-+        n =3D 10**6
-+        for encoded in r'\\', r'\134':
-+            with self.subTest(encoded):
-+                data =3D 'a=3D"b=3D' + encoded*n + ';"'
-+                C =3D cookies.SimpleCookie()
-+                C.load(data)
-+                value =3D C['a'].value
-+                self.assertEqual(value[:3], 'b=3D\\')
-+                self.assertEqual(value[-2:], '\\;')
-+                self.assertEqual(len(value), n + 3)
-+
-     def test_load(self):
-         C =3D cookies.SimpleCookie()
-         C.load('Customer=3D"WILE_E_COYOTE"; Version=3D1; Path=3D/acme')
-diff --git a/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-12306=
7.Nx9O4R.rst b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-1230=
67.Nx9O4R.rst
-new file mode 100644
-index 00000000000000..158b938a65a2d4
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4=
R.rst
-@@ -0,0 +1 @@
-+Fix quadratic complexity in parsing cookies with backslashes.
-
-From ab87c992c2d4cd28560178048915bc9636d6566e Mon Sep 17 00:00:00 2001
-From: Serhiy Storchaka <storchaka@gmail.com>
-Date: Fri, 16 Aug 2024 19:38:20 +0300
-Subject: [PATCH 2/4] Restore the current behavior for backslash-escaping.
-
----
- Lib/http/cookies.py           | 2 +-
- Lib/test/test_http_cookies.py | 8 ++++----
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
-index 11a67e8a2e008b..464abeb0fb253a 100644
---- a/Lib/http/cookies.py
-+++ b/Lib/http/cookies.py
-@@ -184,7 +184,7 @@ def _quote(str):
-         return '"' + str.translate(_Translator) + '"'
-=20
-=20
--_unquote_re =3D re.compile(r'\\(?:([0-3][0-7][0-7])|(["\\]))')
-+_unquote_re =3D re.compile(r'\\(?:([0-3][0-7][0-7])|(.))')
- def _unquote_replace(m):
-     if m[1]:
-         return chr(int(m[1], 8))
-diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.=
py
-index 13b526d49b0856..8879902a6e2f41 100644
---- a/Lib/test/test_http_cookies.py
-+++ b/Lib/test/test_http_cookies.py
-@@ -63,13 +63,13 @@ def test_unquote(self):
-         cases =3D [
-             (r'a=3D"b=3D\""', 'b=3D"'),
-             (r'a=3D"b=3D\\"', 'b=3D\\'),
--            (r'a=3D"b=3D\=3D"', 'b=3D\\=3D'),
--            (r'a=3D"b=3D\n"', 'b=3D\\n'),
-+            (r'a=3D"b=3D\=3D"', 'b=3D=3D'),
-+            (r'a=3D"b=3D\n"', 'b=3Dn'),
-             (r'a=3D"b=3D\042"', 'b=3D"'),
-             (r'a=3D"b=3D\134"', 'b=3D\\'),
-             (r'a=3D"b=3D\377"', 'b=3D\xff'),
--            (r'a=3D"b=3D\400"', 'b=3D\\400'),
--            (r'a=3D"b=3D\42"', 'b=3D\\42'),
-+            (r'a=3D"b=3D\400"', 'b=3D400'),
-+            (r'a=3D"b=3D\42"', 'b=3D42'),
-             (r'a=3D"b=3D\\042"', 'b=3D\\042'),
-             (r'a=3D"b=3D\\134"', 'b=3D\\134'),
-             (r'a=3D"b=3D\\\""', 'b=3D\\"'),
-
-From 1fe24921da4c6c547da82e11c9703f3588dc5fab Mon Sep 17 00:00:00 2001
-From: Serhiy Storchaka <storchaka@gmail.com>
-Date: Sat, 17 Aug 2024 12:40:11 +0300
-Subject: [PATCH 3/4] Cache the sub() method, not the compiled pattern ob=
ject.
-
----
- Lib/http/cookies.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
-index 464abeb0fb253a..6b9ed24ad8ec78 100644
---- a/Lib/http/cookies.py
-+++ b/Lib/http/cookies.py
-@@ -184,7 +184,8 @@ def _quote(str):
-         return '"' + str.translate(_Translator) + '"'
-=20
-=20
--_unquote_re =3D re.compile(r'\\(?:([0-3][0-7][0-7])|(.))')
-+_unquote_sub =3D re.compile(r'\\(?:([0-3][0-7][0-7])|(.))').sub
-+
- def _unquote_replace(m):
-     if m[1]:
-         return chr(int(m[1], 8))
-@@ -209,8 +210,7 @@ def _unquote(str):
-     #    \012 --> \n
-     #    \"   --> "
-     #
--
--    return _unquote_re.sub(_unquote_replace, str)
-+    return _unquote_sub(_unquote_replace, str)
-=20
- # The _getdate() routine is used to set the expiration time in the cook=
ie's HTTP
- # header.  By default, _getdate() returns the current time in the appro=
priate
-
-From 8256ed2228137c87d4b20747db84a9cdf0fa1d34 Mon Sep 17 00:00:00 2001
-From: Serhiy Storchaka <storchaka@gmail.com>
-Date: Sat, 17 Aug 2024 13:08:20 +0300
-Subject: [PATCH 4/4] Add a reference to the module in NEWS.
-
----
- .../next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-12306=
7.Nx9O4R.rst b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-1230=
67.Nx9O4R.rst
-index 158b938a65a2d4..6a234561fe31a3 100644
---- a/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4=
R.rst
-+++ b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4=
R.rst
-@@ -1 +1 @@
--Fix quadratic complexity in parsing cookies with backslashes.
-+Fix quadratic complexity in parsing ``"``-quoted cookie values with bac=
kslashes by :mod:`http.cookies`.
diff --git a/meta/recipes-devtools/python/python3_3.12.5.bb b/meta/recipe=
s-devtools/python/python3_3.12.6.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.5.bb
rename to meta/recipes-devtools/python/python3_3.12.6.bb
index 29b02ef510..8c938554ed 100644
--- a/meta/recipes-devtools/python/python3_3.12.5.bb
+++ b/meta/recipes-devtools/python/python3_3.12.6.bb
@@ -33,15 +33,13 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/P=
ython-${PV}.tar.xz \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-fa=
ilu.patch \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
-           file://0001-test_readline-skip-limited-history-test.patch \
-           file://CVE-2024-7592.patch \
            "
=20
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-conf=
igu.patch \
            "
=20
-SRC_URI[sha256sum] =3D "fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba9=
91dcc55113876397"
+SRC_URI[sha256sum] =3D "1999658298cf2fb837dffed8ff3c033ef0c98ef20cf73c5d=
5f66bed5ab89697c"
=20
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
--=20
2.40.0


