Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B93C04FE0
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.102663.1697399114022811386
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bd/W5X6M;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=h3Mxzwem;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.30, mailfrom: 0101018b34df05d0-6d67307f-ed3d-4c14-8d18-985b7465e297-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WHbR+bJYuT0H99Od9jYQMRycWkFLDQWOsK4vD3HRhcI=;
	b=bd/W5X6MnT1dKd+ualDcwOc36ebpaegkFFM83wozi+G+3j20C16POy4hdns6bOyD
	fgl0sFszrQWyfKnLAsO2tJDEOoyTAm+cxNZAh0hIaKF2SXhi2ZtySZ6EUCEgCDDIFfd
	YOBdlww/ZtP85eIEdl2Ahm89AATa1+u9ufJcEs/M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WHbR+bJYuT0H99Od9jYQMRycWkFLDQWOsK4vD3HRhcI=;
	b=h3MxzwemigN9Xu2VfweSdNiDZ9jTWP7eVJzTnwI5VvlJJilaseQOeLRxuOgpC1W7
	lSc4qSoUv+kq+ZrhZLkdKt5BUKOzgqHFWYtTS2Cj84VQ2RrbBoC5hKH5y5LRHFzuHUI
	ysvUoZvmbxDRQdr4fgA2JPIkE+9uEEFpjSWrys6w=
Content-Type: multipart/mixed; boundary="===============4757816726309838401=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcomps: upgrading to 0.1.20 SUCCEEDED
Message-ID: <0101018b34df05d0-6d67307f-ed3d-4c14-8d18-985b7465e297-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189171

--===============4757816726309838401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcomps* to *0.1.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcomps-upgrade-0.1.19-0.1.20.patch
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
From d4285ca6a81da1a24dd72f8794499918ce652992 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 09:33:14 +0000
Subject: [PATCH] libcomps: upgrade 0.1.19 -> 0.1.20

---
 ...hash_t-instead-of-long-in-PyCOMPS_ha.patch | 66 -------------------
 ...{libcomps_0.1.19.bb => libcomps_0.1.20.bb} |  3 +-
 2 files changed, 1 insertion(+), 68 deletions(-)
 delete mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.19.bb => libcomps_0.1.20.bb} (86%)

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch b/meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch
deleted file mode 100644
index dd9ebc8af4..0000000000
--- a/meta/recipes-devtools/libcomps/libcomps/0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 26a9647c832de15248ee649e5b77075521f3d4f0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 3 Mar 2023 08:37:35 -0800
-Subject: [PATCH] libcomps: Use Py_hash_t instead of long in PyCOMPS_hash()
-
-This function is used as a hashfunc callback in
-_typeobject defined python3.11/cpython/object.h
-compilers detect the protype mismatch for function pointers
-with clang16+
-
-Fixes
-libcomps/src/python/src/pycomps_sequence.c:667:5: error: incompatible function pointer types initializing 'hashfunc' (aka 'int (*)(struct _object *)') with an expression of type 'long (*)(PyObject *)' (aka 'long (*)(struct _object *)') [-Wincompatible-function-pointer-types]
-    &PyCOMPS_hash,             /*tp_hash */
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libcomps/pull/101]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libcomps/src/python/src/pycomps_hash.c  | 4 ++--
- libcomps/src/python/src/pycomps_hash.h  | 2 +-
- libcomps/src/python/src/pycomps_utils.h | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/libcomps/src/python/src/pycomps_hash.c b/libcomps/src/python/src/pycomps_hash.c
-index 474afd5..4577769 100644
---- a/libcomps/src/python/src/pycomps_hash.c
-+++ b/libcomps/src/python/src/pycomps_hash.c
-@@ -20,9 +20,9 @@
- #include "pycomps_hash.h"
- #include "pycomps_utils.h"
- 
--long PyCOMPS_hash(PyObject *self) {
-+Py_hash_t PyCOMPS_hash(PyObject *self) {
-     char *cstr = NULL;
--    long crc;
-+    Py_hash_t crc;
- 
-     cstr = comps_object_tostr(((PyCompsObject*)self)->c_obj);
-     crc = crc32(0, cstr, strlen(cstr));
-diff --git a/libcomps/src/python/src/pycomps_hash.h b/libcomps/src/python/src/pycomps_hash.h
-index b664cae..54e08d9 100644
---- a/libcomps/src/python/src/pycomps_hash.h
-+++ b/libcomps/src/python/src/pycomps_hash.h
-@@ -26,6 +26,6 @@
- #include "pycomps_utils.h"
- 
- 
--long PyCOMPS_hash(PyObject *self);
-+Py_hash_t PyCOMPS_hash(PyObject *self);
- 
- #endif
-diff --git a/libcomps/src/python/src/pycomps_utils.h b/libcomps/src/python/src/pycomps_utils.h
-index ba9bc2f..b34e4dc 100644
---- a/libcomps/src/python/src/pycomps_utils.h
-+++ b/libcomps/src/python/src/pycomps_utils.h
-@@ -137,7 +137,7 @@ COMPS_Object* __pycomps_bytes_in(PyObject *pobj);
- PyObject* __pycomps_str_out(COMPS_Object *obj);
- PyObject *str_to_unicode(void* str);
- 
--long PyCOMPS_hash(PyObject *self);
-+Py_hash_t PyCOMPS_hash(PyObject *self);
- 
- PyObject* PyCOMPSSeq_extra_get(PyObject *self, PyObject *key);
- 
--- 
-2.39.2
-
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb
similarity index 86%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.19.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.20.bb
index e362e8e108..1f59c5ea1e 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.19.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb
@@ -5,11 +5,10 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;protocol=https \
-           file://0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch \
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "9322bdcf06630cc094f094f944d7d0e2cb798b73"
+SRCREV = "854fbb9fe733b774981e1ffcf825b2d2ce0f8072"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============4757816726309838401==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcomps-upgrade-0.1.19-0.1.20.patch"

RnJvbSBkNDI4NWNhNmE4MWRhMWEyNGRkNzJmODc5NDQ5OTkxOGNlNjUyOTkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMDk6MzM6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjb21wczogdXBncmFkZSAwLjEuMTkgLT4gMC4xLjIwCgotLS0KIC4uLmhhc2hfdC1pbnN0ZWFk
LW9mLWxvbmctaW4tUHlDT01QU19oYS5wYXRjaCB8IDY2IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4u
LntsaWJjb21wc18wLjEuMTkuYmIgPT4gbGliY29tcHNfMC4xLjIwLmJifSB8ICAzICstCiAyIGZp
bGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2OCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliY29tcHMvbGliY29tcHMvMDAwMS1saWJj
b21wcy1Vc2UtUHlfaGFzaF90LWluc3RlYWQtb2YtbG9uZy1pbi1QeUNPTVBTX2hhLnBhdGNoCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmNvbXBzL3tsaWJjb21wc18wLjEuMTkuYmIg
PT4gbGliY29tcHNfMC4xLjIwLmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9saWJjb21wcy9saWJjb21wcy8wMDAxLWxpYmNvbXBzLVVzZS1QeV9oYXNoX3QtaW5z
dGVhZC1vZi1sb25nLWluLVB5Q09NUFNfaGEucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGliY29tcHMvbGliY29tcHMvMDAwMS1saWJjb21wcy1Vc2UtUHlfaGFzaF90LWluc3RlYWQtb2Yt
bG9uZy1pbi1QeUNPTVBTX2hhLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBk
ZDllYmM4YWY0Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJjb21w
cy9saWJjb21wcy8wMDAxLWxpYmNvbXBzLVVzZS1QeV9oYXNoX3QtaW5zdGVhZC1vZi1sb25nLWlu
LVB5Q09NUFNfaGEucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw2NiArMCwwIEBACi1Gcm9tIDI2
YTk2NDdjODMyZGUxNTI0OGVlNjQ5ZTViNzcwNzU1MjFmM2Q0ZjAgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCi1Gcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogRnJpLCAz
IE1hciAyMDIzIDA4OjM3OjM1IC0wODAwCi1TdWJqZWN0OiBbUEFUQ0hdIGxpYmNvbXBzOiBVc2Ug
UHlfaGFzaF90IGluc3RlYWQgb2YgbG9uZyBpbiBQeUNPTVBTX2hhc2goKQotCi1UaGlzIGZ1bmN0
aW9uIGlzIHVzZWQgYXMgYSBoYXNoZnVuYyBjYWxsYmFjayBpbgotX3R5cGVvYmplY3QgZGVmaW5l
ZCBweXRob24zLjExL2NweXRob24vb2JqZWN0LmgKLWNvbXBpbGVycyBkZXRlY3QgdGhlIHByb3R5
cGUgbWlzbWF0Y2ggZm9yIGZ1bmN0aW9uIHBvaW50ZXJzCi13aXRoIGNsYW5nMTYrCi0KLUZpeGVz
Ci1saWJjb21wcy9zcmMvcHl0aG9uL3NyYy9weWNvbXBzX3NlcXVlbmNlLmM6NjY3OjU6IGVycm9y
OiBpbmNvbXBhdGlibGUgZnVuY3Rpb24gcG9pbnRlciB0eXBlcyBpbml0aWFsaXppbmcgJ2hhc2hm
dW5jJyAoYWthICdpbnQgKCopKHN0cnVjdCBfb2JqZWN0ICopJykgd2l0aCBhbiBleHByZXNzaW9u
IG9mIHR5cGUgJ2xvbmcgKCopKFB5T2JqZWN0ICopJyAoYWthICdsb25nICgqKShzdHJ1Y3QgX29i
amVjdCAqKScpIFstV2luY29tcGF0aWJsZS1mdW5jdGlvbi1wb2ludGVyLXR5cGVzXQotICAgICZQ
eUNPTVBTX2hhc2gsICAgICAgICAgICAgIC8qdHBfaGFzaCAqLwotCi1VcHN0cmVhbS1TdGF0dXM6
IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2xp
YmNvbXBzL3B1bGwvMTAxXQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KLS0tLQotIGxpYmNvbXBzL3NyYy9weXRob24vc3JjL3B5Y29tcHNfaGFzaC5jICB8IDQg
KystLQotIGxpYmNvbXBzL3NyYy9weXRob24vc3JjL3B5Y29tcHNfaGFzaC5oICB8IDIgKy0KLSBs
aWJjb21wcy9zcmMvcHl0aG9uL3NyYy9weWNvbXBzX3V0aWxzLmggfCAyICstCi0gMyBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9s
aWJjb21wcy9zcmMvcHl0aG9uL3NyYy9weWNvbXBzX2hhc2guYyBiL2xpYmNvbXBzL3NyYy9weXRo
b24vc3JjL3B5Y29tcHNfaGFzaC5jCi1pbmRleCA0NzRhZmQ1Li40NTc3NzY5IDEwMDY0NAotLS0t
IGEvbGliY29tcHMvc3JjL3B5dGhvbi9zcmMvcHljb21wc19oYXNoLmMKLSsrKyBiL2xpYmNvbXBz
L3NyYy9weXRob24vc3JjL3B5Y29tcHNfaGFzaC5jCi1AQCAtMjAsOSArMjAsOSBAQAotICNpbmNs
dWRlICJweWNvbXBzX2hhc2guaCIKLSAjaW5jbHVkZSAicHljb21wc191dGlscy5oIgotIAotLWxv
bmcgUHlDT01QU19oYXNoKFB5T2JqZWN0ICpzZWxmKSB7Ci0rUHlfaGFzaF90IFB5Q09NUFNfaGFz
aChQeU9iamVjdCAqc2VsZikgewotICAgICBjaGFyICpjc3RyID0gTlVMTDsKLS0gICAgbG9uZyBj
cmM7Ci0rICAgIFB5X2hhc2hfdCBjcmM7Ci0gCi0gICAgIGNzdHIgPSBjb21wc19vYmplY3RfdG9z
dHIoKChQeUNvbXBzT2JqZWN0KilzZWxmKS0+Y19vYmopOwotICAgICBjcmMgPSBjcmMzMigwLCBj
c3RyLCBzdHJsZW4oY3N0cikpOwotZGlmZiAtLWdpdCBhL2xpYmNvbXBzL3NyYy9weXRob24vc3Jj
L3B5Y29tcHNfaGFzaC5oIGIvbGliY29tcHMvc3JjL3B5dGhvbi9zcmMvcHljb21wc19oYXNoLmgK
LWluZGV4IGI2NjRjYWUuLjU0ZTA4ZDkgMTAwNjQ0Ci0tLS0gYS9saWJjb21wcy9zcmMvcHl0aG9u
L3NyYy9weWNvbXBzX2hhc2guaAotKysrIGIvbGliY29tcHMvc3JjL3B5dGhvbi9zcmMvcHljb21w
c19oYXNoLmgKLUBAIC0yNiw2ICsyNiw2IEBACi0gI2luY2x1ZGUgInB5Y29tcHNfdXRpbHMuaCIK
LSAKLSAKLS1sb25nIFB5Q09NUFNfaGFzaChQeU9iamVjdCAqc2VsZik7Ci0rUHlfaGFzaF90IFB5
Q09NUFNfaGFzaChQeU9iamVjdCAqc2VsZik7Ci0gCi0gI2VuZGlmCi1kaWZmIC0tZ2l0IGEvbGli
Y29tcHMvc3JjL3B5dGhvbi9zcmMvcHljb21wc191dGlscy5oIGIvbGliY29tcHMvc3JjL3B5dGhv
bi9zcmMvcHljb21wc191dGlscy5oCi1pbmRleCBiYTliYzJmLi5iMzRlNGRjIDEwMDY0NAotLS0t
IGEvbGliY29tcHMvc3JjL3B5dGhvbi9zcmMvcHljb21wc191dGlscy5oCi0rKysgYi9saWJjb21w
cy9zcmMvcHl0aG9uL3NyYy9weWNvbXBzX3V0aWxzLmgKLUBAIC0xMzcsNyArMTM3LDcgQEAgQ09N
UFNfT2JqZWN0KiBfX3B5Y29tcHNfYnl0ZXNfaW4oUHlPYmplY3QgKnBvYmopOwotIFB5T2JqZWN0
KiBfX3B5Y29tcHNfc3RyX291dChDT01QU19PYmplY3QgKm9iaik7Ci0gUHlPYmplY3QgKnN0cl90
b191bmljb2RlKHZvaWQqIHN0cik7Ci0gCi0tbG9uZyBQeUNPTVBTX2hhc2goUHlPYmplY3QgKnNl
bGYpOwotK1B5X2hhc2hfdCBQeUNPTVBTX2hhc2goUHlPYmplY3QgKnNlbGYpOwotIAotIFB5T2Jq
ZWN0KiBQeUNPTVBTU2VxX2V4dHJhX2dldChQeU9iamVjdCAqc2VsZiwgUHlPYmplY3QgKmtleSk7
Ci0gCi0tLSAKLTIuMzkuMgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGli
Y29tcHMvbGliY29tcHNfMC4xLjE5LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmNvbXBz
L2xpYmNvbXBzXzAuMS4yMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbGliY29tcHMvbGliY29tcHNfMC4xLjE5LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliY29tcHMvbGliY29tcHNfMC4xLjIwLmJiCmluZGV4IGUz
NjJlOGUxMDguLjFmNTljNWVhMWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9s
aWJjb21wcy9saWJjb21wc18wLjEuMTkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xp
YmNvbXBzL2xpYmNvbXBzXzAuMS4yMC5iYgpAQCAtNSwxMSArNSwxMCBAQCBMSUNFTlNFID0gIkdQ
TC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRl
ZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5j
b20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvbGliY29tcHMuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJv
dG9jb2w9aHR0cHMgXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1saWJjb21wcy1Vc2UtUHlfaGFz
aF90LWluc3RlYWQtb2YtbG9uZy1pbi1QeUNPTVBTX2hhLnBhdGNoIFwKICAgICAgICAgICAgZmls
ZTovLzAwMDItRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24u
cGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICI5MzIyYmRjZjA2NjMwY2MwOTRmMDk0
Zjk0NGQ3ZDBlMmNiNzk4YjczIgorU1JDUkVWID0gIjg1NGZiYjlmZTczM2I3NzQ5ODFlMWZmY2Y4
MjViMmQyY2UwZjgwNzIiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============4757816726309838401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libcomps: PV changed from "0.1.19" to "0.1.20"
packages/core2-32-poky-linux/libcomps: SRC_URI changed from "git://github.com/rpm-software-management/libcomps.git;branch=master;protocol=https file://0001-libcomps-Use-Py_hash_t-instead-of-long-in-PyCOMPS_ha.patch file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch" to "git://github.com/rpm-software-management/libcomps.git;branch=master;protocol=https file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch"
packages/core2-32-poky-linux/libcomps: PKGV changed from 0.1.19 [default] to 0.1.20 [default]
packages/core2-32-poky-linux/libcomps/libcomps-dbg: PKGSIZE changed from 571668 to 570788 (-0%)
packages/core2-32-poky-linux/libcomps/libcomps-dbg: PV changed from "0.1.19" to "0.1.20"
packages/core2-32-poky-linux/libcomps/libcomps-dbg: PKGV changed from 0.1.19 [default] to 0.1.20 [default]
packages/core2-32-poky-linux/libcomps/libcomps-dev: PKGSIZE changed from 127840 to 127093 (-1%)
packages/core2-32-poky-linux/libcomps/libcomps-dev: PV changed from "0.1.19" to "0.1.20"
packages/core2-32-poky-linux/libcomps/libcomps-dev: PKGV changed from 0.1.19 [default] to 0.1.20 [default]
packages/core2-32-poky-linux/libcomps/libcomps-doc: PV changed from "0.1.19" to "0.1.20"
packages/core2-32-poky-linux/libcomps/libcomps-doc: PKGV changed from 0.1.19 [default] to 0.1.20 [default]
packages/core2-32-poky-linux/libcomps/libcomps-locale: PV changed from "0.1.19" to "0.1.20"
packages/core2-32-poky-linux/libcomps/libcomps-locale: PKGV changed from 0.1.19 [default] to 0.1.20 [default]
packages/core2-32-poky-linux/libcomps/libcomps-src: PKGSIZE changed from 815808 to 816687 (+0%)
packages/core2-32-poky-linux/libcomps/libcomps-src: PV changed from "0.1.19" to "0.1.20"
packages/core2-32-poky-linux/libcomps/libcomps-src: PKGV changed from 0.1.19 [default] to 0.1.20 [default]
packages/core2-32-poky-linux/libcomps/libcomps-staticdev: PV changed from "0.1.19" to "0.1.20"
packages/core2-32-poky-linux/libcomps/libcomps-staticdev: PKGV changed from 0.1.19 [default] to 0.1.20 [default]
packages/core2-32-poky-linux/libcomps/libcomps: PV changed from "0.1.19" to "0.1.20"
packages/core2-32-poky-linux/libcomps/libcomps: PKGV changed from 0.1.19 [default] to 0.1.20 [default]

--===============4757816726309838401==--

