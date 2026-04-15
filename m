Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576B9F4212B
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19811.1776261873316093719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yNxAUkjh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qPXN9bdw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d91754c84-6598e751-bd7e-44fc-b97b-6401f5475dd0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261876;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DcYhjkIgFVUbzu5qJh68JHfIRPlYe0tMw/qMk8iNbBU=;
	b=yNxAUkjhbN83daSuPBrJ+q099YMA9LZMf+a3Aap78ThRyLuWnLo0YVfQn3+m0gZN
	kKyz+sCa4NoR0K1O3xFvFPathn3snBGtYmtrn1tVvVyybSYvvT2Wa4oi1Et/xGVqm45
	W9okzTZnqTlkLh0x0TpP111ZSd09LZr5njdw/sig=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261876;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DcYhjkIgFVUbzu5qJh68JHfIRPlYe0tMw/qMk8iNbBU=;
	b=qPXN9bdwMomakq16l3om/J6Ko3GxAVQr66joRqBrPmPAlzsC5EAnbW7SAOHwUTl0
	0tkwhkJZEfBZZ8O1p/QgzOElr/th6ETQk3azni0pCU5GQuDMC7MBr735zMPcB5XKvPc
	//6xc6nC8P1kjm2Zz1PKJQ0WIiK16tR+mocCad5o=
Content-Type: multipart/mixed; boundary="===============7569073682892684022=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-editables: upgrading to 0.6 SUCCEEDED
Message-ID: <0101019d91754c84-6598e751-bd7e-44fc-b97b-6401f5475dd0-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235229

--===============7569073682892684022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-editables* to *0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-editables-upgrade-0.5-0.6.patch
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
From f52dcc074cbcb169fa927ca532e26bea028eafbc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 07:33:56 +0000
Subject: [PATCH] python3-editables: upgrade 0.5 -> 0.6

---
 .../python/python3-editables_0.5.bb           | 13 ----
 .../python/python3-editables_0.6.bb           | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 13 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-editables_0.5.bb
 create mode 100644 meta/recipes-devtools/python/python3-editables_0.6.bb

diff --git a/meta/recipes-devtools/python/python3-editables_0.5.bb b/meta/recipes-devtools/python/python3-editables_0.5.bb
deleted file mode 100644
index 11566f096b..0000000000
--- a/meta/recipes-devtools/python/python3-editables_0.5.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "A Python library for creating editable wheels"
-HOMEPAGE = "https://github.com/pfmoore/editables"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41bc1be47b7bb8240db3ef928c7cb0bf"
-
-SRC_URI[sha256sum] = "309627d9b5c4adc0e668d8c6fa7bac1ba7c8c5d415c2d27f60f081f8e80d1de2"
-
-inherit pypi python_flit_core
-
-RDEPENDS:${PN} += "python3-io"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-editables_0.6.bb b/meta/recipes-devtools/python/python3-editables_0.6.bb
new file mode 100644
index 0000000000..78b2d86bfc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-editables_0.6.bb
@@ -0,0 +1,63 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.txt
+# +++ LICENSE.txt
+# @@ -1,18 +1,18 @@
+# -Copyright (c) 2020 Paul Moore
+# -
+# -Permission is hereby granted, free of charge, to any person obtaining a copy of
+# -this software and associated documentation files (the "Software"), to deal in
+# -the Software without restriction, including without limitation the rights to
+# -use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
+# -the Software, and to permit persons to whom the Software is furnished to do so,
+# -subject to the following conditions:
+# -
+# -The above copyright notice and this permission notice shall be included in all
+# -copies or substantial portions of the Software.
+# -
+# -THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# -IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
+# -FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
+# -COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
+# -IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+# -CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+# +Copyright (c) 2020 Paul Moore
+# +
+# +Permission is hereby granted, free of charge, to any person obtaining a copy of
+# +this software and associated documentation files (the "Software"), to deal in
+# +the Software without restriction, including without limitation the rights to
+# +use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
+# +the Software, and to permit persons to whom the Software is furnished to do so,
+# +subject to the following conditions:
+# +
+# +The above copyright notice and this permission notice shall be included in all
+# +copies or substantial portions of the Software.
+# +
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
+# +FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
+# +COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
+# +IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+# +CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+# 
+#
+
+SUMMARY = "A Python library for creating editable wheels"
+HOMEPAGE = "https://github.com/pfmoore/editables"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d731fc2dd253a6e78010aabef22fa987"
+
+SRC_URI[sha256sum] = "1163834902381c4613787951c5914800fdf155ae08848a373b8ea5006780977c"
+
+inherit pypi python_flit_core
+
+RDEPENDS:${PN} += "python3-io"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============7569073682892684022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-editables/python3-editables: FILELIST: directory renamed /usr/lib/python3.14/site-packages/editables-0.5.dist-info -> /usr/lib/python3.14/site-packages/editables-0.6.dist-info, directory renamed /usr/lib/python3.14/site-packages/editables-0.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/editables-0.6.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-editables/python3-editables: PKGSIZE changed from 21073 to 24649 (+17%)
Changes to packages/x86-64-v3-poky-linux/python3-editables (sysroot):
  /usr/lib/python3.14/site-packages/editables-0.5.dist-info moved to /usr/lib/python3.14/site-packages/editables-0.6.dist-info

--===============7569073682892684022==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-editables-upgrade-0.5-0.6.patch"

RnJvbSBmNTJkY2MwNzRjYmNiMTY5ZmE5MjdjYTUzMmUyNmJlYTAyOGVhZmJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDc6MzM6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWVkaXRhYmxlczogdXBncmFkZSAwLjUgLT4gMC42CgotLS0KIC4uLi9weXRob24vcHl0
aG9uMy1lZGl0YWJsZXNfMC41LmJiICAgICAgICAgICB8IDEzIC0tLS0KIC4uLi9weXRob24vcHl0
aG9uMy1lZGl0YWJsZXNfMC42LmJiICAgICAgICAgICB8IDYzICsrKysrKysrKysrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWVkaXRh
Ymxlc18wLjUuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtZWRpdGFibGVzXzAuNi5iYgoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1lZGl0YWJsZXNfMC41LmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWVkaXRhYmxlc18wLjUuYmIKZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDExNTY2ZjA5NmIuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWVkaXRhYmxlc18wLjUuYmIKKysrIC9kZXYvbnVsbApAQCAt
MSwxMyArMCwwIEBACi1TVU1NQVJZID0gIkEgUHl0aG9uIGxpYnJhcnkgZm9yIGNyZWF0aW5nIGVk
aXRhYmxlIHdoZWVscyIKLUhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9wZm1vb3JlL2Vk
aXRhYmxlcyIKLVNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgotTElDRU5TRSA9ICJNSVQiCi1MSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9NDFiYzFiZTQ3YjdiYjgyNDBk
YjNlZjkyOGM3Y2IwYmYiCi0KLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzMDk2MjdkOWI1YzRhZGMw
ZTY2OGQ4YzZmYTdiYWMxYmE3YzhjNWQ0MTVjMmQyN2Y2MGYwODFmOGU4MGQxZGUyIgotCi1pbmhl
cml0IHB5cGkgcHl0aG9uX2ZsaXRfY29yZQotCi1SREVQRU5EUzoke1BOfSArPSAicHl0aG9uMy1p
byIKLQotQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWVkaXRhYmxlc18wLjYuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZWRpdGFibGVzXzAuNi5iYgpuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi43OGIyZDg2YmZjCi0tLSAvZGV2L251bGwK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWVkaXRhYmxlc18wLjYu
YmIKQEAgLTAsMCArMSw2MyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVz
IGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5n
IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRl
eHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3Vt
bWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2Ut
VXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVh
cnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UudHh0Cisj
ICsrKyBMSUNFTlNFLnR4dAorIyBAQCAtMSwxOCArMSwxOCBAQAorIyAtQ29weXJpZ2h0IChjKSAy
MDIwIFBhdWwgTW9vcmUKKyMgLQorIyAtUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJl
ZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weSBvZgorIyAtdGhpcyBz
b2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJl
IiksIHRvIGRlYWwgaW4KKyMgLXRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNs
dWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRoZSByaWdodHMgdG8KKyMgLXVzZSwgY29weSwgbW9k
aWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29yIHNlbGwg
Y29waWVzIG9mCisjIC10aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9t
IHRoZSBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28sCisjIC1zdWJqZWN0IHRvIHRoZSBm
b2xsb3dpbmcgY29uZGl0aW9uczoKKyMgLQorIyAtVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2Ug
YW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4gYWxsCisjIC1j
b3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorIyAtCisjIC1U
SEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkg
S0lORCwgRVhQUkVTUyBPUgorIyAtSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBU
TyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksIEZJVE5FU1MKKyMgLUZPUiBBIFBB
UlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTCBU
SEUgQVVUSE9SUyBPUgorIyAtQ09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xB
SU0sIERBTUFHRVMgT1IgT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSCisjIC1JTiBBTiBBQ1RJT04g
T0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00sIE9VVCBPRiBPUiBJ
TgorIyAtQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERF
QUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KKyMgK0NvcHlyaWdodCAoYykgMjAyMCBQYXVsIE1vb3Jl
CisjICsKKyMgK1Blcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0
byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkgb2YKKyMgK3RoaXMgc29mdHdhcmUgYW5kIGFz
c29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsIGlu
CisjICt0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQg
bGltaXRhdGlvbiB0aGUgcmlnaHRzIHRvCisjICt1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1
Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vciBzZWxsIGNvcGllcyBvZgorIyAr
dGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgU29mdHdhcmUg
aXMgZnVybmlzaGVkIHRvIGRvIHNvLAorIyArc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRp
dGlvbnM6CisjICsKKyMgK1RoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1p
c3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIGluIGFsbAorIyArY29waWVzIG9yIHN1YnN0
YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KKyMgKworIyArVEhFIFNPRlRXQVJFIElT
IFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1Mg
T1IKKyMgK0lNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJ
RVMgT0YgTUVSQ0hBTlRBQklMSVRZLCBGSVRORVNTCisjICtGT1IgQSBQQVJUSUNVTEFSIFBVUlBP
U0UgQU5EIE5PTklORlJJTkdFTUVOVC4gSU4gTk8gRVZFTlQgU0hBTEwgVEhFIEFVVEhPUlMgT1IK
KyMgK0NPUFlSSUdIVCBIT0xERVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9S
IE9USEVSIExJQUJJTElUWSwgV0hFVEhFUgorIyArSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBU
T1JUIE9SIE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4KKyMgK0NPTk5FQ1RJ
T04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTiBUSEUg
U09GVFdBUkUuCisjIAorIworCitTVU1NQVJZID0gIkEgUHl0aG9uIGxpYnJhcnkgZm9yIGNyZWF0
aW5nIGVkaXRhYmxlIHdoZWVscyIKK0hPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9wZm1v
b3JlL2VkaXRhYmxlcyIKK1NFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgorTElDRU5TRSA9ICJNSVQi
CitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9ZDczMWZjMmRkMjUz
YTZlNzgwMTBhYWJlZjIyZmE5ODciCisKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxMTYzODM0OTAy
MzgxYzQ2MTM3ODc5NTFjNTkxNDgwMGZkZjE1NWFlMDg4NDhhMzczYjhlYTUwMDY3ODA5NzdjIgor
Citpbmhlcml0IHB5cGkgcHl0aG9uX2ZsaXRfY29yZQorCitSREVQRU5EUzoke1BOfSArPSAicHl0
aG9uMy1pbyIKKworQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi40Ny4x
Cgo=

--===============7569073682892684022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-editables: PV changed from "0.5" to "0.6"
packages/x86-64-v3-poky-linux/python3-editables: SRC_URI changed from "https://files.pythonhosted.org/packages/source/e/editables/editables-0.5.tar.gz;downloadfilename=editables-0.5.tar.gz" to "https://files.pythonhosted.org/packages/source/e/editables/editables-0.6.tar.gz;downloadfilename=editables-0.6.tar.gz"
packages/x86-64-v3-poky-linux/python3-editables: PKGV changed from 0.5 [default] to 0.6 [default]
packages/x86-64-v3-poky-linux/python3-editables/python3-editables-dbg: PV changed from "0.5" to "0.6"
packages/x86-64-v3-poky-linux/python3-editables/python3-editables-dbg: PKGV changed from 0.5 [default] to 0.6 [default]
packages/x86-64-v3-poky-linux/python3-editables/python3-editables-dev: PV changed from "0.5" to "0.6"
packages/x86-64-v3-poky-linux/python3-editables/python3-editables-dev: PKGV changed from 0.5 [default] to 0.6 [default]
packages/x86-64-v3-poky-linux/python3-editables/python3-editables-doc: PV changed from "0.5" to "0.6"
packages/x86-64-v3-poky-linux/python3-editables/python3-editables-doc: PKGV changed from 0.5 [default] to 0.6 [default]
packages/x86-64-v3-poky-linux/python3-editables/python3-editables-locale: PV changed from "0.5" to "0.6"
packages/x86-64-v3-poky-linux/python3-editables/python3-editables-locale: PKGV changed from 0.5 [default] to 0.6 [default]
packages/x86-64-v3-poky-linux/python3-editables/python3-editables-src: PV changed from "0.5" to "0.6"
packages/x86-64-v3-poky-linux/python3-editables/python3-editables-src: PKGV changed from 0.5 [default] to 0.6 [default]
packages/x86-64-v3-poky-linux/python3-editables/python3-editables-staticdev: PV changed from "0.5" to "0.6"
packages/x86-64-v3-poky-linux/python3-editables/python3-editables-staticdev: PKGV changed from 0.5 [default] to 0.6 [default]
packages/x86-64-v3-poky-linux/python3-editables/python3-editables: PV changed from "0.5" to "0.6"
packages/x86-64-v3-poky-linux/python3-editables/python3-editables: PKGV changed from 0.5 [default] to 0.6 [default]
packages/x86-64-v3-poky-linux/python3-editables/python3-editables: FILELIST: directory renamed /usr/lib/python3.14/site-packages/editables-0.5.dist-info -> /usr/lib/python3.14/site-packages/editables-0.6.dist-info, directory renamed /usr/lib/python3.14/site-packages/editables-0.5.dist-info/licenses -> /usr/lib/python3.14/site-packages/editables-0.6.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-editables/python3-editables: PKGSIZE changed from 21073 to 24649 (+17%)
Changes to packages/x86-64-v3-poky-linux/python3-editables (sysroot):
  /usr/lib/python3.14/site-packages/editables-0.5.dist-info moved to /usr/lib/python3.14/site-packages/editables-0.6.dist-info

--===============7569073682892684022==--

