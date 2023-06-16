Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC58C3DA43
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.826.1686887483423077411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=g45C20tg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188c2544571-b0a2e009-0ce4-4493-9837-65889f31fbbd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rQ79JHGf4WGBkCMKTtTWBBaOjfz8BVGKytWAUb7dOmM=;
	b=g45C20tglQxGIdDSh+8whVCOR5Cgz8Qw1qw4vUkO1GNhTVxOLo1m3J5o86HhrsPK
	InHmN9erXROq58mZDyDrhy5o6O+6FosnFgoHgVZCK9ZFmxL1/NNCwl5PwUc0t7xeomv
	a7Fvcs/uLzgUbbVXJwr+bgvhOQU08GSb6ZHkCPSc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rQ79JHGf4WGBkCMKTtTWBBaOjfz8BVGKytWAUb7dOmM=;
	b=CKWTbAYHVJea6+iC+W6evLOjMrvrK5GqX8PbpDYLJ5+Rsxpw3wvlP4aNRJ3i+Kul
	hi1sdEw1ZR/WTlkI+NVMaTxRj/pSkpuUNgw5J5/8/K1aBEp7FQmKmgqIghm67LnnTf3
	MDNV54Qcv29pPwfETLxZAv2l1gqvcRODdImQ8eVI=
Content-Type: multipart/mixed; boundary="===============6354772200387610030=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyasn1: upgrading to 0.5.0 SUCCEEDED
Message-ID: <01010188c2544571-b0a2e009-0ce4-4493-9837-65889f31fbbd-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182917

--===============6354772200387610030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyasn1* to *0.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyasn1-upgrade-0.4.8-0.5.0.patch
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
From 2fc6107241d1f6943f9e20a93c1bf58fba533d31 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 13:34:44 +0000
Subject: [PATCH] python3-pyasn1: upgrade 0.4.8 -> 0.5.0

---
 .../recipes-devtools/python/python-pyasn1.inc | 12 ++++----
 ...arning-__int__-returned-non-int-on-P.patch | 28 -------------------
 .../python/python3-pyasn1_0.4.8.bb            |  2 --
 .../python/python3-pyasn1_0.5.0.bb            | 22 +++++++++++++++
 4 files changed, 27 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pyasn1/0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch
 delete mode 100644 meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 126d0388ef..0931e77341 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -1,10 +1,9 @@
 SUMMARY = "Python library implementing ASN.1 types."
 HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=a14482d15c2249de3b6f0e8a47e021fd"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[md5sum] = "dffae4ff9f997a83324b3f33fe62be54"
-SRC_URI[sha256sum] = "aef77c9fb94a3ac588e87841208bdec464471d9871bd5050a287cc9a475cd0ba"
+SRC_URI[sha256sum] = "97b7290ca68e62a832558ec3976f15cbf911bf5d7c7039d8b861c2a0ece69fde"
 
 RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-codecs \
@@ -17,10 +16,9 @@ BBCLASSEXTEND = "native nativesdk"
 
 inherit ptest
 
-SRC_URI += " \
-	file://run-ptest \
-	file://0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch \
-"
+SRC_URI = "${PYPI_SRC_URI} \
+           file://run-ptest \
+           "
 
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
diff --git a/meta/recipes-devtools/python/python3-pyasn1/0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch b/meta/recipes-devtools/python/python3-pyasn1/0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch
deleted file mode 100644
index 30ac9a6684..0000000000
--- a/meta/recipes-devtools/python/python3-pyasn1/0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From db8f1a7930c6b5826357646746337dafc983f953 Mon Sep 17 00:00:00 2001
-From: Ilya Etingof <etingof@gmail.com>
-Date: Sat, 21 Mar 2020 19:05:03 +0100
-Subject: [PATCH] Fix `DeprecationWarning: __int__ returned non-int` on Py3
-
-In `BitString.__int__()`
-Upstream-Status: Backport
-Signed-off-by: Yulong Liu <yulong.liu@windriver.com>
----
- pyasn1/type/univ.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyasn1/type/univ.py b/pyasn1/type/univ.py
-index 10924c3..488241f 100644
---- a/pyasn1/type/univ.py
-+++ b/pyasn1/type/univ.py
-@@ -551,7 +551,7 @@ class BitString(base.SimpleAsn1Type):
-         return self.clone(SizedInteger(self._value >> count).setBitLength(max(0, len(self._value) - count)))
- 
-     def __int__(self):
--        return self._value
-+        return int(self._value)
- 
-     def __float__(self):
-         return float(self._value)
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb b/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb
deleted file mode 100644
index a5e2a71362..0000000000
--- a/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-pyasn1.inc
diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb b/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb
new file mode 100644
index 0000000000..51ce432261
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.5.0.bb
@@ -0,0 +1,22 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.rst
+# +++ LICENSE.rst
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2005-2019, Ilya Etingof <etingof@gmail.com>
+# +Copyright (c) 2005-2020, Ilya Etingof <etingof@gmail.com>
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
+inherit pypi setuptools3
+require python-pyasn1.inc
+
-- 
2.39.2


--===============6354772200387610030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pyasn1: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.4.8.tar.gz;downloadfilename=pyasn1-0.4.8.tar.gz file://run-ptest file://0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch" to "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.5.0.tar.gz;downloadfilename=pyasn1-0.5.0.tar.gz https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.5.0.tar.gz;downloadfilename=pyasn1-0.5.0.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-pyasn1: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-dev: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-dev: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-doc: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-doc: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-locale: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-locale: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGSIZE changed from 311524 to 319281 (+2%)
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: FILELIST: removed "/usr/lib/python3-pyasn1/ptest/tests/compat/test_binary.py", added "/usr/lib/python3-pyasn1/ptest/tests/codec/test_streaming.py"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-src: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-src: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: PKGSIZE changed from 786820 to 841150 (+7%)
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pyasn1-0.4.8.dist-info -> /usr/lib/python3.11/site-packages/pyasn1-0.5.0.dist-info, removed "/usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/calling.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/binary.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/dateandtime.py /usr/lib/python3.11/site-packages/pyasn1/compat/calling.py /usr/lib/python3.11/site-packages/pyasn1/compat/string.py /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/string.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/binary.py /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/dateandtime.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/pyasn1/codec/__pycache__/streaming.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/codec/streaming.py"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
Changes to packages/core2-32-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.11/site-packages/pyasn1-0.4.8.dist-info moved to /usr/lib/python3.11/site-packages/pyasn1-0.5.0.dist-info
  /usr/lib/python3.11/site-packages/pyasn1/codec/__pycache__/streaming.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pyasn1/codec/streaming.py was added
  /usr/lib/python3.11/site-packages/pyasn1/compat/binary.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/calling.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/dateandtime.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/binary.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/calling.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/dateandtime.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/string.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/string.py was removed

--===============6354772200387610030==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyasn1-upgrade-0.4.8-0.5.0.patch"

RnJvbSAyZmM2MTA3MjQxZDFmNjk0M2Y5ZTIwYTkzYzFiZjU4ZmJhNTMzZDMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTM6MzQ6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5YXNuMTogdXBncmFkZSAwLjQuOCAtPiAwLjUuMAoKLS0tCiAuLi4vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uLXB5YXNuMS5pbmMgfCAxMiArKysrLS0tLQogLi4uYXJuaW5n
LV9faW50X18tcmV0dXJuZWQtbm9uLWludC1vbi1QLnBhdGNoIHwgMjggLS0tLS0tLS0tLS0tLS0t
LS0tLQogLi4uL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjQuOC5iYiAgICAgICAgICAgIHwgIDIg
LS0KIC4uLi9weXRob24vcHl0aG9uMy1weWFzbjFfMC41LjAuYmIgICAgICAgICAgICB8IDIyICsr
KysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAzNyBkZWxl
dGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlhc24xLzAwMDEtRml4LURlcHJlY2F0aW9uV2FybmluZy1fX2ludF9fLXJldHVy
bmVkLW5vbi1pbnQtb24tUC5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weWFzbjFfMC40LjguYmIKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNS4wLmJiCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcHlhc24xLmlu
YyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXB5YXNuMS5pbmMKaW5kZXgg
MTI2ZDAzODhlZi4uMDkzMWU3NzM0MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24tcHlhc24xLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbi1weWFzbjEuaW5jCkBAIC0xLDEwICsxLDkgQEAKIFNVTU1BUlkgPSAiUHl0aG9u
IGxpYnJhcnkgaW1wbGVtZW50aW5nIEFTTi4xIHR5cGVzLiIKIEhPTUVQQUdFID0gImh0dHA6Ly9w
eWFzbjEuc291cmNlZm9yZ2UubmV0LyIKIExJQ0VOU0UgPSAiQlNELTItQ2xhdXNlIgotTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1PWExNDQ4MmQxNWMyMjQ5ZGUzYjZm
MGU4YTQ3ZTAyMWZkIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1
PTE5MGY3OTI1MzkwOGM5ODZlNmNhY2YzODBjM2E1ZjZkIgogCi1TUkNfVVJJW21kNXN1bV0gPSAi
ZGZmYWU0ZmY5Zjk5N2E4MzMyNGIzZjMzZmU2MmJlNTQiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YWVmNzdjOWZiOTRhM2FjNTg4ZTg3ODQxMjA4YmRlYzQ2NDQ3MWQ5ODcxYmQ1MDUwYTI4N2NjOWE0
NzVjZDBiYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5N2I3MjkwY2E2OGU2MmE4MzI1NThlYzM5
NzZmMTVjYmY5MTFiZjVkN2M3MDM5ZDhiODYxYzJhMGVjZTY5ZmRlIgogCiBSREVQRU5EUzoke1BO
fTpjbGFzcy10YXJnZXQgKz0gIiBcCiAgICAgJHtQWVRIT05fUE59LWNvZGVjcyBcCkBAIC0xNywx
MCArMTYsOSBAQCBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKIGluaGVyaXQg
cHRlc3QKIAotU1JDX1VSSSArPSAiIFwKLQlmaWxlOi8vcnVuLXB0ZXN0IFwKLQlmaWxlOi8vMDAw
MS1GaXgtRGVwcmVjYXRpb25XYXJuaW5nLV9faW50X18tcmV0dXJuZWQtbm9uLWludC1vbi1QLnBh
dGNoIFwKLSIKK1NSQ19VUkkgPSAiJHtQWVBJX1NSQ19VUkl9IFwKKyAgICAgICAgICAgZmlsZTov
L3J1bi1wdGVzdCBcCisgICAgICAgICAgICIKIAogUkRFUEVORFM6JHtQTn0tcHRlc3QgKz0gIiBc
CiAJJHtQWVRIT05fUE59LXB5dGVzdCBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xLzAwMDEtRml4LURlcHJlY2F0aW9uV2FybmluZy1fX2lu
dF9fLXJldHVybmVkLW5vbi1pbnQtb24tUC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weWFzbjEvMDAwMS1GaXgtRGVwcmVjYXRpb25XYXJuaW5nLV9faW50X18t
cmV0dXJuZWQtbm9uLWludC1vbi1QLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAzMGFjOWE2Njg0Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1weWFzbjEvMDAwMS1GaXgtRGVwcmVjYXRpb25XYXJuaW5nLV9faW50X18tcmV0
dXJuZWQtbm9uLWludC1vbi1QLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMjggKzAsMCBAQAot
RnJvbSBkYjhmMWE3OTMwYzZiNTgyNjM1NzY0Njc0NjMzN2RhZmM5ODNmOTUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQotRnJvbTogSWx5YSBFdGluZ29mIDxldGluZ29mQGdtYWlsLmNvbT4KLURh
dGU6IFNhdCwgMjEgTWFyIDIwMjAgMTk6MDU6MDMgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gRml4
IGBEZXByZWNhdGlvbldhcm5pbmc6IF9faW50X18gcmV0dXJuZWQgbm9uLWludGAgb24gUHkzCi0K
LUluIGBCaXRTdHJpbmcuX19pbnRfXygpYAotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAotU2ln
bmVkLW9mZi1ieTogWXVsb25nIExpdSA8eXVsb25nLmxpdUB3aW5kcml2ZXIuY29tPgotLS0tCi0g
cHlhc24xL3R5cGUvdW5pdi5weSB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL3B5YXNuMS90eXBlL3VuaXYucHkgYi9w
eWFzbjEvdHlwZS91bml2LnB5Ci1pbmRleCAxMDkyNGMzLi40ODgyNDFmIDEwMDY0NAotLS0tIGEv
cHlhc24xL3R5cGUvdW5pdi5weQotKysrIGIvcHlhc24xL3R5cGUvdW5pdi5weQotQEAgLTU1MSw3
ICs1NTEsNyBAQCBjbGFzcyBCaXRTdHJpbmcoYmFzZS5TaW1wbGVBc24xVHlwZSk6Ci0gICAgICAg
ICByZXR1cm4gc2VsZi5jbG9uZShTaXplZEludGVnZXIoc2VsZi5fdmFsdWUgPj4gY291bnQpLnNl
dEJpdExlbmd0aChtYXgoMCwgbGVuKHNlbGYuX3ZhbHVlKSAtIGNvdW50KSkpCi0gCi0gICAgIGRl
ZiBfX2ludF9fKHNlbGYpOgotLSAgICAgICAgcmV0dXJuIHNlbGYuX3ZhbHVlCi0rICAgICAgICBy
ZXR1cm4gaW50KHNlbGYuX3ZhbHVlKQotIAotICAgICBkZWYgX19mbG9hdF9fKHNlbGYpOgotICAg
ICAgICAgcmV0dXJuIGZsb2F0KHNlbGYuX3ZhbHVlKQotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjQuOC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWFzbjFfMC40LjguYmIKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGE1ZTJhNzEzNjIuLjAwMDAwMDAwMDAKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjQuOC5iYgorKysg
L2Rldi9udWxsCkBAIC0xLDIgKzAsMCBAQAotaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCi1yZXF1
aXJlIHB5dGhvbi1weWFzbjEuaW5jCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5YXNuMV8wLjUuMC5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi41MWNlNDMyMjYxCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjUuMC5iYgpAQCAtMCwwICsxLDIyIEBACisj
IEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkg
J2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0
aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4K
KyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFt
cGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRo
ZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS5yc3QKKyMgKysrIExJQ0VOU0UucnN0CisjIEBA
IC0xLDQgKzEsNCBAQAorIyAtQ29weXJpZ2h0IChjKSAyMDA1LTIwMTksIElseWEgRXRpbmdvZiA8
ZXRpbmdvZkBnbWFpbC5jb20+CisjICtDb3B5cmlnaHQgKGMpIDIwMDUtMjAyMCwgSWx5YSBFdGlu
Z29mIDxldGluZ29mQGdtYWlsLmNvbT4KKyMgIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICAKKyMg
IFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGgg
b3Igd2l0aG91dAorIyAKKyMKKworaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCityZXF1aXJlIHB5
dGhvbi1weWFzbjEuaW5jCisKLS0gCjIuMzkuMgoK

--===============6354772200387610030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: FILELIST: removed "/usr/lib/python3-pyasn1/ptest/tests/compat/test_binary.py", added "/usr/lib/python3-pyasn1/ptest/tests/codec/test_streaming.py"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pyasn1-0.4.8.dist-info -> /usr/lib/python3.11/site-packages/pyasn1-0.5.0.dist-info, removed "/usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/dateandtime.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/binary.py /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/binary.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/string.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/dateandtime.py /usr/lib/python3.11/site-packages/pyasn1/compat/string.py /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/calling.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/calling.py", added "/usr/lib/python3.11/site-packages/pyasn1/codec/streaming.py /usr/lib/python3.11/site-packages/pyasn1/codec/__pycache__/streaming.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.11/site-packages/pyasn1-0.4.8.dist-info moved to /usr/lib/python3.11/site-packages/pyasn1-0.5.0.dist-info
  /usr/lib/python3.11/site-packages/pyasn1/codec/__pycache__/streaming.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pyasn1/codec/streaming.py was added
  /usr/lib/python3.11/site-packages/pyasn1/compat/binary.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/calling.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/dateandtime.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/binary.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/calling.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/dateandtime.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/string.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/string.py was removed

--===============6354772200387610030==--

