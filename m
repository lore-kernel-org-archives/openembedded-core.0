Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01217C44502
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 05:50:05 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.168347.1783403397177328602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 22:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dtnRMvZG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=r3Z8Zglp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f3b203c47-f884df6c-4175-4dab-bf6c-fa63efbe9755-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783403396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SM0HdgXjsVNP13fcsw2pH8jEppS+KD7SF8LQ1AA0yZo=;
	b=dtnRMvZGJQ7JPp8rSlgeT7VkfjFXLp9ijZ4/6tjZVVZFzKteg7s/PMlPBJUEmcUE
	lhhFB64/lkGp6EWh0ZOkAr3ff6bQdYVDF2zhnssqfxoCQJHbofSsvFJh7KghutAjU9A
	wocL8z7cOy1defwb12Hkp78oNl4aojwuBDnBOkUM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783403396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SM0HdgXjsVNP13fcsw2pH8jEppS+KD7SF8LQ1AA0yZo=;
	b=r3Z8ZglpXTZ3pavnyZf8xi3J7wfy1v3t1hu2jrOAZ5PM+JcIMJCmffC4LYPPIf2M
	jCDF2bH1NHCRZuxYuViPKQ/ve3LGv7IONUQXMxps0F/QdlCPa5xZHF12H/67vstKkwt
	d9aMSbCQ6+uxlv5wK/xFZa88Fl0ocr29p5IP2l+k=
Content-Type: multipart/mixed; boundary="===============2813976948370752547=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cffi: upgrading to 2.1.0 SUCCEEDED
Message-ID: <0101019f3b203c47-f884df6c-4175-4dab-bf6c-fa63efbe9755-000000@us-west-2.amazonses.com>
Date: Tue, 7 Jul 2026 05:49:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.07-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 05:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240357

--===============2813976948370752547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cffi* to *2.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cffi-upgrade-2.0.0-2.1.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From ad5d3c0315425ba145b38ada8ba226f75c405402 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 7 Jul 2026 05:38:48 +0000
Subject: [PATCH] python3-cffi: upgrade 2.0.0 -> 2.1.0

---
 ...parsing-more-resilient-to-changes-in.patch | 110 ------------------
 ...n3-cffi_2.0.0.bb => python3-cffi_2.1.0.bb} |   5 +-
 2 files changed, 2 insertions(+), 113 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-cffi/0001-Make-test_parsing-more-resilient-to-changes-in.patch
 rename meta/recipes-devtools/python/{python3-cffi_2.0.0.bb => python3-cffi_2.1.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-cffi/0001-Make-test_parsing-more-resilient-to-changes-in.patch b/meta/recipes-devtools/python/python3-cffi/0001-Make-test_parsing-more-resilient-to-changes-in.patch
deleted file mode 100644
index 2919b78a6e..0000000000
--- a/meta/recipes-devtools/python/python3-cffi/0001-Make-test_parsing-more-resilient-to-changes-in.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 6f345f658a7012bca0859d23436a11b9902711ae Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Fri, 6 Feb 2026 01:53:23 +0000
-Subject: [PATCH] Make test_parsing more resilient to changes in
- pycparser  (#224)
-
-* Make test_parsing more resilient to changes in pycparser
-
-Several tests expect precise error messages from pycparser, which pycparser
-doesn't guarantee. While testing CFFI with pycparser 3.0, some tests needed
-to be made more resilient. I've used the .startswith() approach already used
-in this file, instead of exact string matching.
-
-Ref #223
-
-* Loosen error message assertion even more
-
-Upstream-Status: Backport [https://github.com/python-cffi/cffi/commit/c36c02fa6f4f1d12a9cead81861c6f42af47da22]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- testing/cffi0/test_parsing.py | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/testing/cffi0/test_parsing.py b/testing/cffi0/test_parsing.py
-index f10b989..7009e34 100644
---- a/testing/cffi0/test_parsing.py
-+++ b/testing/cffi0/test_parsing.py
-@@ -197,7 +197,7 @@ def test_dont_remove_comment_in_line_directives():
- 
-         some syntax error here
-     """)
--    assert str(e.value) == "parse error\nbaz.c:9:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nbaz.c:9:")
-     #
-     e = pytest.raises(CDefError, ffi.cdef, """
-         #line 7 "foo//bar.c"
-@@ -205,21 +205,21 @@ def test_dont_remove_comment_in_line_directives():
-         some syntax error here
-     """)
-     #
--    assert str(e.value) == "parse error\nfoo//bar.c:8:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nfoo//bar.c:8:")
-     ffi = FFI(backend=FakeBackend())
-     e = pytest.raises(CDefError, ffi.cdef, """
-         \t # \t 8 \t "baz.c" \t
- 
-         some syntax error here
-     """)
--    assert str(e.value) == "parse error\nbaz.c:9:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nbaz.c:9:")
-     #
-     e = pytest.raises(CDefError, ffi.cdef, """
-         # 7 "foo//bar.c"
- 
-         some syntax error here
-     """)
--    assert str(e.value) == "parse error\nfoo//bar.c:8:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nfoo//bar.c:8:")
- 
- def test_multiple_line_directives():
-     ffi = FFI(backend=FakeBackend())
-@@ -233,7 +233,7 @@ def test_multiple_line_directives():
-         #line 8 "yadda.c"
-         extern int zz;
-     """)
--    assert str(e.value) == "parse error\nbaz.c:7:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nbaz.c:7:")
-     #
-     e = pytest.raises(CDefError, ffi.cdef,
-     """ # 5 "foo.c"
-@@ -245,7 +245,7 @@ def test_multiple_line_directives():
-         # 8 "yadda.c"
-         extern int zz;
-     """)
--    assert str(e.value) == "parse error\nbaz.c:7:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nbaz.c:7:")
- 
- def test_commented_line_directive():
-     ffi = FFI(backend=FakeBackend())
-@@ -262,7 +262,7 @@ def test_commented_line_directive():
-         some syntax error
-     """)
-     #
--    assert str(e.value) == "parse error\nbar.c:9:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nbar.c:9:")
-     e = pytest.raises(CDefError, ffi.cdef, """
-         /*
-         # 5 "foo.c"
-@@ -275,7 +275,7 @@ def test_commented_line_directive():
-         */
-         some syntax error
-     """)
--    assert str(e.value) == "parse error\nbar.c:9:14: before: syntax"
-+    assert str(e.value).startswith("parse error\nbar.c:9:")
- 
- def test_line_continuation_in_defines():
-     ffi = FFI(backend=FakeBackend())
-@@ -365,7 +365,7 @@ def test_unknown_name():
-     e = pytest.raises(CDefError, ffi.cast, "foobarbazunknown*", 0)
-     assert str(e.value).startswith('cannot parse "foobarbazunknown*"')
-     e = pytest.raises(CDefError, ffi.cast, "int(*)(foobarbazunknown)", 0)
--    assert str(e.value).startswith('cannot parse "int(*)(foobarbazunknown)"')
-+    assert 'foobarbazunknown' in str(e.value)
- 
- def test_redefine_common_type():
-     prefix = "" if sys.version_info < (3,) else "b"
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/python/python3-cffi_2.0.0.bb b/meta/recipes-devtools/python/python3-cffi_2.1.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-cffi_2.0.0.bb
rename to meta/recipes-devtools/python/python3-cffi_2.1.0.bb
index 269595f5c3..718e43e339 100644
--- a/meta/recipes-devtools/python/python3-cffi_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_2.1.0.bb
@@ -4,10 +4,9 @@ LICENSE = "MIT-0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c0158ab9b75875f3bb7fea081d388818"
 DEPENDS += "libffi python3-pycparser"
 
-SRC_URI[sha256sum] = "44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529"
+SRC_URI[sha256sum] = "efc1cdd798b1aaf39b4610bba7aad28c9bea9b910f25c784ccf9ec1fa719d1f9"
 
-SRC_URI += "file://run-ptest \
-            file://0001-Make-test_parsing-more-resilient-to-changes-in.patch"
+SRC_URI += "file://run-ptest"
 
 inherit pypi python_setuptools_build_meta ptest pkgconfig
 
-- 
2.47.1


--===============2813976948370752547==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cffi-upgrade-2.0.0-2.1.0.patch"

RnJvbSBhZDVkM2MwMzE1NDI1YmExNDViMzhhZGE4YmEyMjZmNzVjNDA1NDAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNyBKdWwgMjAyNiAwNTozODo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2ZmaTogdXBncmFkZSAyLjAuMCAtPiAyLjEuMAoKLS0tCiAuLi5wYXJzaW5nLW1vcmUt
cmVzaWxpZW50LXRvLWNoYW5nZXMtaW4ucGF0Y2ggfCAxMTAgLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li5uMy1jZmZpXzIuMC4wLmJiID0+IHB5dGhvbjMtY2ZmaV8yLjEuMC5iYn0gfCAgIDUgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMTMgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNmZmkvMDAw
MS1NYWtlLXRlc3RfcGFyc2luZy1tb3JlLXJlc2lsaWVudC10by1jaGFuZ2VzLWluLnBhdGNoCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jZmZpXzIuMC4wLmJi
ID0+IHB5dGhvbjMtY2ZmaV8yLjEuMC5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2ZmaS8wMDAxLU1ha2UtdGVzdF9wYXJzaW5nLW1v
cmUtcmVzaWxpZW50LXRvLWNoYW5nZXMtaW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY2ZmaS8wMDAxLU1ha2UtdGVzdF9wYXJzaW5nLW1vcmUtcmVzaWxpZW50
LXRvLWNoYW5nZXMtaW4ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDI5MTli
NzhhNmUuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWNmZmkvMDAwMS1NYWtlLXRlc3RfcGFyc2luZy1tb3JlLXJlc2lsaWVudC10by1jaGFuZ2Vz
LWluLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMTEwICswLDAgQEAKLUZyb20gNmYzNDVmNjU4
YTcwMTJiY2EwODU5ZDIzNDM2YTExYjk5MDI3MTFhZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
LUZyb206IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+Ci1EYXRlOiBGcmksIDYgRmVi
IDIwMjYgMDE6NTM6MjMgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0gTWFrZSB0ZXN0X3BhcnNpbmcg
bW9yZSByZXNpbGllbnQgdG8gY2hhbmdlcyBpbgotIHB5Y3BhcnNlciAgKCMyMjQpCi0KLSogTWFr
ZSB0ZXN0X3BhcnNpbmcgbW9yZSByZXNpbGllbnQgdG8gY2hhbmdlcyBpbiBweWNwYXJzZXIKLQot
U2V2ZXJhbCB0ZXN0cyBleHBlY3QgcHJlY2lzZSBlcnJvciBtZXNzYWdlcyBmcm9tIHB5Y3BhcnNl
ciwgd2hpY2ggcHljcGFyc2VyCi1kb2Vzbid0IGd1YXJhbnRlZS4gV2hpbGUgdGVzdGluZyBDRkZJ
IHdpdGggcHljcGFyc2VyIDMuMCwgc29tZSB0ZXN0cyBuZWVkZWQKLXRvIGJlIG1hZGUgbW9yZSBy
ZXNpbGllbnQuIEkndmUgdXNlZCB0aGUgLnN0YXJ0c3dpdGgoKSBhcHByb2FjaCBhbHJlYWR5IHVz
ZWQKLWluIHRoaXMgZmlsZSwgaW5zdGVhZCBvZiBleGFjdCBzdHJpbmcgbWF0Y2hpbmcuCi0KLVJl
ZiAjMjIzCi0KLSogTG9vc2VuIGVycm9yIG1lc3NhZ2UgYXNzZXJ0aW9uIGV2ZW4gbW9yZQotCi1V
cHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uLWNmZmkv
Y2ZmaS9jb21taXQvYzM2YzAyZmE2ZjRmMWQxMmE5Y2VhZDgxODYxYzZmNDJhZjQ3ZGEyMl0KLQot
U2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4KLS0tLQotIHRl
c3RpbmcvY2ZmaTAvdGVzdF9wYXJzaW5nLnB5IHwgMTggKysrKysrKysrLS0tLS0tLS0tCi0gMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdp
dCBhL3Rlc3RpbmcvY2ZmaTAvdGVzdF9wYXJzaW5nLnB5IGIvdGVzdGluZy9jZmZpMC90ZXN0X3Bh
cnNpbmcucHkKLWluZGV4IGYxMGI5ODkuLjcwMDllMzQgMTAwNjQ0Ci0tLS0gYS90ZXN0aW5nL2Nm
ZmkwL3Rlc3RfcGFyc2luZy5weQotKysrIGIvdGVzdGluZy9jZmZpMC90ZXN0X3BhcnNpbmcucHkK
LUBAIC0xOTcsNyArMTk3LDcgQEAgZGVmIHRlc3RfZG9udF9yZW1vdmVfY29tbWVudF9pbl9saW5l
X2RpcmVjdGl2ZXMoKToKLSAKLSAgICAgICAgIHNvbWUgc3ludGF4IGVycm9yIGhlcmUKLSAgICAg
IiIiKQotLSAgICBhc3NlcnQgc3RyKGUudmFsdWUpID09ICJwYXJzZSBlcnJvclxuYmF6LmM6OTox
NDogYmVmb3JlOiBzeW50YXgiCi0rICAgIGFzc2VydCBzdHIoZS52YWx1ZSkuc3RhcnRzd2l0aCgi
cGFyc2UgZXJyb3JcbmJhei5jOjk6IikKLSAgICAgIwotICAgICBlID0gcHl0ZXN0LnJhaXNlcyhD
RGVmRXJyb3IsIGZmaS5jZGVmLCAiIiIKLSAgICAgICAgICNsaW5lIDcgImZvby8vYmFyLmMiCi1A
QCAtMjA1LDIxICsyMDUsMjEgQEAgZGVmIHRlc3RfZG9udF9yZW1vdmVfY29tbWVudF9pbl9saW5l
X2RpcmVjdGl2ZXMoKToKLSAgICAgICAgIHNvbWUgc3ludGF4IGVycm9yIGhlcmUKLSAgICAgIiIi
KQotICAgICAjCi0tICAgIGFzc2VydCBzdHIoZS52YWx1ZSkgPT0gInBhcnNlIGVycm9yXG5mb28v
L2Jhci5jOjg6MTQ6IGJlZm9yZTogc3ludGF4IgotKyAgICBhc3NlcnQgc3RyKGUudmFsdWUpLnN0
YXJ0c3dpdGgoInBhcnNlIGVycm9yXG5mb28vL2Jhci5jOjg6IikKLSAgICAgZmZpID0gRkZJKGJh
Y2tlbmQ9RmFrZUJhY2tlbmQoKSkKLSAgICAgZSA9IHB5dGVzdC5yYWlzZXMoQ0RlZkVycm9yLCBm
ZmkuY2RlZiwgIiIiCi0gICAgICAgICBcdCAjIFx0IDggXHQgImJhei5jIiBcdAotIAotICAgICAg
ICAgc29tZSBzeW50YXggZXJyb3IgaGVyZQotICAgICAiIiIpCi0tICAgIGFzc2VydCBzdHIoZS52
YWx1ZSkgPT0gInBhcnNlIGVycm9yXG5iYXouYzo5OjE0OiBiZWZvcmU6IHN5bnRheCIKLSsgICAg
YXNzZXJ0IHN0cihlLnZhbHVlKS5zdGFydHN3aXRoKCJwYXJzZSBlcnJvclxuYmF6LmM6OToiKQot
ICAgICAjCi0gICAgIGUgPSBweXRlc3QucmFpc2VzKENEZWZFcnJvciwgZmZpLmNkZWYsICIiIgot
ICAgICAgICAgIyA3ICJmb28vL2Jhci5jIgotIAotICAgICAgICAgc29tZSBzeW50YXggZXJyb3Ig
aGVyZQotICAgICAiIiIpCi0tICAgIGFzc2VydCBzdHIoZS52YWx1ZSkgPT0gInBhcnNlIGVycm9y
XG5mb28vL2Jhci5jOjg6MTQ6IGJlZm9yZTogc3ludGF4IgotKyAgICBhc3NlcnQgc3RyKGUudmFs
dWUpLnN0YXJ0c3dpdGgoInBhcnNlIGVycm9yXG5mb28vL2Jhci5jOjg6IikKLSAKLSBkZWYgdGVz
dF9tdWx0aXBsZV9saW5lX2RpcmVjdGl2ZXMoKToKLSAgICAgZmZpID0gRkZJKGJhY2tlbmQ9RmFr
ZUJhY2tlbmQoKSkKLUBAIC0yMzMsNyArMjMzLDcgQEAgZGVmIHRlc3RfbXVsdGlwbGVfbGluZV9k
aXJlY3RpdmVzKCk6Ci0gICAgICAgICAjbGluZSA4ICJ5YWRkYS5jIgotICAgICAgICAgZXh0ZXJu
IGludCB6ejsKLSAgICAgIiIiKQotLSAgICBhc3NlcnQgc3RyKGUudmFsdWUpID09ICJwYXJzZSBl
cnJvclxuYmF6LmM6NzoxNDogYmVmb3JlOiBzeW50YXgiCi0rICAgIGFzc2VydCBzdHIoZS52YWx1
ZSkuc3RhcnRzd2l0aCgicGFyc2UgZXJyb3JcbmJhei5jOjc6IikKLSAgICAgIwotICAgICBlID0g
cHl0ZXN0LnJhaXNlcyhDRGVmRXJyb3IsIGZmaS5jZGVmLAotICAgICAiIiIgIyA1ICJmb28uYyIK
LUBAIC0yNDUsNyArMjQ1LDcgQEAgZGVmIHRlc3RfbXVsdGlwbGVfbGluZV9kaXJlY3RpdmVzKCk6
Ci0gICAgICAgICAjIDggInlhZGRhLmMiCi0gICAgICAgICBleHRlcm4gaW50IHp6OwotICAgICAi
IiIpCi0tICAgIGFzc2VydCBzdHIoZS52YWx1ZSkgPT0gInBhcnNlIGVycm9yXG5iYXouYzo3OjE0
OiBiZWZvcmU6IHN5bnRheCIKLSsgICAgYXNzZXJ0IHN0cihlLnZhbHVlKS5zdGFydHN3aXRoKCJw
YXJzZSBlcnJvclxuYmF6LmM6NzoiKQotIAotIGRlZiB0ZXN0X2NvbW1lbnRlZF9saW5lX2RpcmVj
dGl2ZSgpOgotICAgICBmZmkgPSBGRkkoYmFja2VuZD1GYWtlQmFja2VuZCgpKQotQEAgLTI2Miw3
ICsyNjIsNyBAQCBkZWYgdGVzdF9jb21tZW50ZWRfbGluZV9kaXJlY3RpdmUoKToKLSAgICAgICAg
IHNvbWUgc3ludGF4IGVycm9yCi0gICAgICIiIikKLSAgICAgIwotLSAgICBhc3NlcnQgc3RyKGUu
dmFsdWUpID09ICJwYXJzZSBlcnJvclxuYmFyLmM6OToxNDogYmVmb3JlOiBzeW50YXgiCi0rICAg
IGFzc2VydCBzdHIoZS52YWx1ZSkuc3RhcnRzd2l0aCgicGFyc2UgZXJyb3JcbmJhci5jOjk6IikK
LSAgICAgZSA9IHB5dGVzdC5yYWlzZXMoQ0RlZkVycm9yLCBmZmkuY2RlZiwgIiIiCi0gICAgICAg
ICAvKgotICAgICAgICAgIyA1ICJmb28uYyIKLUBAIC0yNzUsNyArMjc1LDcgQEAgZGVmIHRlc3Rf
Y29tbWVudGVkX2xpbmVfZGlyZWN0aXZlKCk6Ci0gICAgICAgICAqLwotICAgICAgICAgc29tZSBz
eW50YXggZXJyb3IKLSAgICAgIiIiKQotLSAgICBhc3NlcnQgc3RyKGUudmFsdWUpID09ICJwYXJz
ZSBlcnJvclxuYmFyLmM6OToxNDogYmVmb3JlOiBzeW50YXgiCi0rICAgIGFzc2VydCBzdHIoZS52
YWx1ZSkuc3RhcnRzd2l0aCgicGFyc2UgZXJyb3JcbmJhci5jOjk6IikKLSAKLSBkZWYgdGVzdF9s
aW5lX2NvbnRpbnVhdGlvbl9pbl9kZWZpbmVzKCk6Ci0gICAgIGZmaSA9IEZGSShiYWNrZW5kPUZh
a2VCYWNrZW5kKCkpCi1AQCAtMzY1LDcgKzM2NSw3IEBAIGRlZiB0ZXN0X3Vua25vd25fbmFtZSgp
OgotICAgICBlID0gcHl0ZXN0LnJhaXNlcyhDRGVmRXJyb3IsIGZmaS5jYXN0LCAiZm9vYmFyYmF6
dW5rbm93bioiLCAwKQotICAgICBhc3NlcnQgc3RyKGUudmFsdWUpLnN0YXJ0c3dpdGgoJ2Nhbm5v
dCBwYXJzZSAiZm9vYmFyYmF6dW5rbm93bioiJykKLSAgICAgZSA9IHB5dGVzdC5yYWlzZXMoQ0Rl
ZkVycm9yLCBmZmkuY2FzdCwgImludCgqKShmb29iYXJiYXp1bmtub3duKSIsIDApCi0tICAgIGFz
c2VydCBzdHIoZS52YWx1ZSkuc3RhcnRzd2l0aCgnY2Fubm90IHBhcnNlICJpbnQoKikoZm9vYmFy
YmF6dW5rbm93bikiJykKLSsgICAgYXNzZXJ0ICdmb29iYXJiYXp1bmtub3duJyBpbiBzdHIoZS52
YWx1ZSkKLSAKLSBkZWYgdGVzdF9yZWRlZmluZV9jb21tb25fdHlwZSgpOgotICAgICBwcmVmaXgg
PSAiIiBpZiBzeXMudmVyc2lvbl9pbmZvIDwgKDMsKSBlbHNlICJiIgotLS0gCi0yLjQzLjAKLQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNmZmlfMi4w
LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2ZmaV8yLjEuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY2ZmaV8yLjAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNmZmlfMi4xLjAuYmIKaW5kZXggMjY5NTk1ZjVjMy4uNzE4ZTQz
ZTMzOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNm
ZmlfMi4wLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNm
ZmlfMi4xLjAuYmIKQEAgLTQsMTAgKzQsOSBAQCBMSUNFTlNFID0gIk1JVC0wIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YzAxNThhYjliNzU4NzVmM2JiN2ZlYTA4MWQz
ODg4MTgiCiBERVBFTkRTICs9ICJsaWJmZmkgcHl0aG9uMy1weWNwYXJzZXIiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI0NGQxYjU5MDkwMjExMzlmZTM2MDAxYWUwNDhkYmRkZTgyMTRhZmEyMDIw
MGVkYTBmNjRjMDY4Y2FjNWQ1NTI5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImVmYzFjZGQ3OThi
MWFhZjM5YjQ2MTBiYmE3YWFkMjhjOWJlYTliOTEwZjI1Yzc4NGNjZjllYzFmYTcxOWQxZjkiCiAK
LVNSQ19VUkkgKz0gImZpbGU6Ly9ydW4tcHRlc3QgXAotICAgICAgICAgICAgZmlsZTovLzAwMDEt
TWFrZS10ZXN0X3BhcnNpbmctbW9yZS1yZXNpbGllbnQtdG8tY2hhbmdlcy1pbi5wYXRjaCIKK1NS
Q19VUkkgKz0gImZpbGU6Ly9ydW4tcHRlc3QiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0
b29sc19idWlsZF9tZXRhIHB0ZXN0IHBrZ2NvbmZpZwogCi0tIAoyLjQ3LjEKCg==

--===============2813976948370752547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cffi: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cffi/cffi-2.0.0.tar.gz;downloadfilename=cffi-2.0.0.tar.gz file://run-ptest file://0001-Make-test_parsing-more-resilient-to-changes-in.patch" to "https://files.pythonhosted.org/packages/source/c/cffi/cffi-2.1.0.tar.gz;downloadfilename=cffi-2.1.0.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-cffi: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dbg: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dbg: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dbg: PKGSIZE changed from 656288 to 656704 (+0%)
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dev: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dev: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-doc: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-doc: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-locale: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-locale: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-ptest: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-ptest: FILELIST: added "/usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/read_sources_example/src/squared/squared.cdef.txt /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/exec_python_example/src/squared/__init__.py /usr/lib/python3-cffi/ptest/testing/cffi1/test_cffi_gen_src.py /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/exec_python_example/src/csrc/square.h /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/exec_python_example/src/csrc/square.c /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/exec_python_example/pyproject.toml /usr/lib/python3-cffi/ptest/testing/cffi1/test_cffi_gen_src_meson.py /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/read_sources_example/src/squared/squared.csrc.c /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/common/src/squared/__init__.py /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src
 _examples/read_sources_example/src/csrc/square.h /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/common/pyproject.toml /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/read_sources_example/src/csrc/square.c /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/common/src/csrc/square.c /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/common/src/csrc/square.h /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/read_sources_example/meson.build /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/exec_python_example/src/squared/_squared_build.py /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/read_sources_example/src/squared/__init__.py /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/exec_python_example/meson.build /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/read_sources_example/pyproject.toml"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-ptest: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-ptest: PKGSIZE changed from 683955 to 696239 (+2%)
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-src: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-src: FILELIST: directory renamed /usr/src/debug/python3-cffi/2.0.0/src/cffi -> /usr/src/debug/python3-cffi/2.1.0/src/cffi, directory renamed /usr/src/debug/python3-cffi/2.0.0/src/c -> /usr/src/debug/python3-cffi/2.1.0/src/c
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-src: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-src: PKGSIZE changed from 497652 to 485835 (-2%)
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-staticdev: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-staticdev: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cffi-2.0.0.dist-info -> /usr/lib/python3.14/site-packages/cffi-2.1.0.dist-info, removed "/usr/lib/python3.14/site-packages/cffi-2.0.0.dist-info/licenses/AUTHORS /usr/lib/python3.14/site-packages/cffi-2.0.0.dist-info/licenses/LICENSE", added "/usr/lib/python3.14/site-packages/cffi/_cffi_gen_src.py /usr/bin/cffi-gen-src /usr/lib/python3.14/site-packages/cffi/__pycache__/_cffi_gen_src.cpython-314.pyc /usr/lib/python3.14/site-packages/cffi/gen_src.py /usr/lib/python3.14/site-packages/cffi/__pycache__/gen_src.cpython-314.pyc /usr/lib/python3.14/site-packages/cffi-2.1.0.dist-info/licenses/LICENSE"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi: PKGSIZE changed from 1033277 to 1044849 (+1%)
Changes to packages/x86-64-v3-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.14/site-packages/cffi-2.0.0.dist-info moved to /usr/lib/python3.14/site-packages/cffi-2.1.0.dist-info
  /usr/lib/python3.14/site-packages/cffi/_cffi_gen_src.py was added
  /usr/lib/python3.14/site-packages/cffi/gen_src.py was added
  /usr/lib/python3.14/site-packages/cffi/__pycache__/_cffi_gen_src.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/cffi/__pycache__/gen_src.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/cffi-2.0.0.dist-info/licenses/AUTHORS was removed

--===============2813976948370752547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-ptest: FILELIST: added "/usr/lib/python3-cffi/ptest/testing/cffi1/test_cffi_gen_src_meson.py /usr/lib/python3-cffi/ptest/testing/cffi1/test_cffi_gen_src.py /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/common/src/csrc/square.h /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/read_sources_example/meson.build /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/common/src/csrc/square.c /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/read_sources_example/src/csrc/square.c /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/read_sources_example/src/squared/squared.csrc.c /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/read_sources_example/src/csrc/square.h /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/exec_python_example/src/squared/_squared_build.py /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/read_sources_ex
 ample/src/squared/__init__.py /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/common/pyproject.toml /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/exec_python_example/src/squared/__init__.py /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/exec_python_example/src/csrc/square.c /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/exec_python_example/meson.build /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/exec_python_example/src/csrc/square.h /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/exec_python_example/pyproject.toml /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/read_sources_example/pyproject.toml /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/read_sources_example/src/squared/squared.cdef.txt /usr/lib/python3-cffi/ptest/testing/cffi1/cffi_gen_src_examples/common/src/squared/__init__.py"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cffi-2.0.0.dist-info -> /usr/lib/python3.14/site-packages/cffi-2.1.0.dist-info, removed "/usr/lib/python3.14/site-packages/cffi-2.0.0.dist-info/licenses/AUTHORS /usr/lib/python3.14/site-packages/cffi-2.0.0.dist-info/licenses/LICENSE", added "/usr/lib/python3.14/site-packages/cffi/__pycache__/_cffi_gen_src.cpython-314.pyc /usr/lib/python3.14/site-packages/cffi-2.1.0.dist-info/licenses/LICENSE /usr/lib/python3.14/site-packages/cffi/_cffi_gen_src.py /usr/bin/cffi-gen-src /usr/lib/python3.14/site-packages/cffi/gen_src.py /usr/lib/python3.14/site-packages/cffi/__pycache__/gen_src.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.14/site-packages/cffi-2.0.0.dist-info moved to /usr/lib/python3.14/site-packages/cffi-2.1.0.dist-info
  /usr/lib/python3.14/site-packages/cffi/_cffi_gen_src.py was added
  /usr/lib/python3.14/site-packages/cffi/gen_src.py was added
  /usr/lib/python3.14/site-packages/cffi/__pycache__/_cffi_gen_src.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/cffi/__pycache__/gen_src.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/cffi-2.0.0.dist-info/licenses/AUTHORS was removed

--===============2813976948370752547==--

