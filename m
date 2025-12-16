Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12634D5C0CC
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:24 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17393.1765872135280841953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nfUG/JQP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rISCwVQz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b262e7deb-1b6a6f6e-78c0-4467-8659-9cff370251d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pnuB8N4E8ERLOaesTsLbqvRolQAufzAWUyMqYFqqbo0=;
	b=nfUG/JQPvkL327XqFGh9IJn7DMNUap0+IYiXaO5zhHfrRoW+iXjvOVMPFjFlGLZQ
	IacaygGSvGy1/7LVmG+iJNXsNm1W8qVVtsio7/moaplJVxDZ5jcG/P9rSVxFmtt6TjH
	G9u11NtYU6IuHtFpENqdnPTiegy1Yt0INytWVNlA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872140;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pnuB8N4E8ERLOaesTsLbqvRolQAufzAWUyMqYFqqbo0=;
	b=rISCwVQzw4wCmPLGVKMy1gvvZxqq2tcgo8ldTwqU2HuHQWroMSH0FKsHPhVb0Gq7
	Nph2Q4oBwUy8Le3hJqRQSqlfLpx4myq0p2lyoVUxOdEjUhkndLk+3NTh7oNeTiytAtd
	NpQFXg3RIMkTLuRb20lIaUkQc1otShcWL+BUC9Zg=
Content-Type: multipart/mixed; boundary="===============2165408173373646792=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cffi: upgrading to 2.0.0 SUCCEEDED
Message-ID: <0101019b262e7deb-1b6a6f6e-78c0-4467-8659-9cff370251d4-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227798

--===============2165408173373646792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cffi* to *2.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cffi-upgrade-1.17.1-2.0.0.patch
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
From b536cf6884aecd70cbd99c157e8f149377f079d3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 23:29:21 +0000
Subject: [PATCH] python3-cffi: upgrade 1.17.1 -> 2.0.0

---
 ...ize_t-to-avoid-c-11-narrowing-warnin.patch | 34 ---------------
 ...3-cffi_1.17.1.bb => python3-cffi_2.0.0.bb} | 41 +++++++++++++++++--
 2 files changed, 37 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-cffi/0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch
 rename meta/recipes-devtools/python/{python3-cffi_1.17.1.bb => python3-cffi_2.0.0.bb} (36%)

diff --git a/meta/recipes-devtools/python/python3-cffi/0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch b/meta/recipes-devtools/python/python3-cffi/0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch
deleted file mode 100644
index a919f4f6fb..0000000000
--- a/meta/recipes-devtools/python/python3-cffi/0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2ac63f8765e62f1492ef3ee06791636700bc6cfb Mon Sep 17 00:00:00 2001
-From: triallax <triallax@tutanota.com>
-Date: Sat, 29 Jun 2024 15:25:24 +0100
-Subject: [PATCH] Cast offset to size_t to avoid c++11-narrowing warning (#92)
-
-e.g. with clang 18 on chimera linux:
-
-_CFFI_test_verify_anonymous_struct_with_star_typedef.cpp:583:10: error: non-constant-expression cannot be narrowed from type 'long' to 'size_t' (aka 'unsigned long') in initializer list [-Wc++11-narrowing]
-  583 |   { "a", ((char *)&((foo_t)4096)->a) - (char *)4096,
-      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-_CFFI_test_verify_anonymous_struct_with_star_typedef.cpp:583:10: note: insert an explicit cast to silence this issue
-  583 |   { "a", ((char *)&((foo_t)4096)->a) - (char *)4096,
-      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-      |          static_cast<size_t>(                      )
-
-Upstream-Status: Backport [https://github.com/python-cffi/cffi/pull/92]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/cffi/recompiler.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/cffi/recompiler.py b/src/cffi/recompiler.py
-index ac6c163e..14d578ee 100644
---- a/src/cffi/recompiler.py
-+++ b/src/cffi/recompiler.py
-@@ -953,7 +953,7 @@ class Recompiler:
-                 if cname is None or fbitsize >= 0:
-                     offset = '(size_t)-1'
-                 elif named_ptr is not None:
--                    offset = '((char *)&((%s)4096)->%s) - (char *)4096' % (
-+                    offset = '(size_t)(((char *)&((%s)4096)->%s) - (char *)4096)' % (
-                         named_ptr.name, fldname)
-                 else:
-                     offset = 'offsetof(%s, %s)' % (tp.get_c_name(''), fldname)
diff --git a/meta/recipes-devtools/python/python3-cffi_1.17.1.bb b/meta/recipes-devtools/python/python3-cffi_2.0.0.bb
similarity index 36%
rename from meta/recipes-devtools/python/python3-cffi_1.17.1.bb
rename to meta/recipes-devtools/python/python3-cffi_2.0.0.bb
index 5a3af03d9f..074174ed4d 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.17.1.bb
+++ b/meta/recipes-devtools/python/python3-cffi_2.0.0.bb
@@ -1,13 +1,46 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -3,7 +3,7 @@
+#  information at the beginning of each file) all software and
+#  documentation is licensed as follows: 
+#  
+# -    The MIT License
+# +    MIT No Attribution
+#  
+#      Permission is hereby granted, free of charge, to any person 
+#      obtaining a copy of this software and associated documentation 
+# @@ -11,10 +11,7 @@
+#      restriction, including without limitation the rights to use, 
+#      copy, modify, merge, publish, distribute, sublicense, and/or 
+#      sell copies of the Software, and to permit persons to whom the 
+# -    Software is furnished to do so, subject to the following conditions:
+# -
+# -    The above copyright notice and this permission notice shall be included 
+# -    in all copies or substantial portions of the Software.
+# +    Software is furnished to do so.
+#  
+#      THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
+#      OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
+# 
+#
+
 SUMMARY = "Foreign Function Interface for Python calling C code"
 HOMEPAGE = "http://cffi.readthedocs.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c0158ab9b75875f3bb7fea081d388818"
 DEPENDS += "libffi python3-pycparser"
 
-SRC_URI[sha256sum] = "1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824"
+SRC_URI[sha256sum] = "44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529"
 
-SRC_URI += "file://run-ptest \
-            file://0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch"
+SRC_URI += "file://run-ptest"
 
 inherit pypi python_setuptools_build_meta ptest pkgconfig
 
-- 
2.47.1


--===============2165408173373646792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info -> /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info, removed "/usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info/licenses/LICENSE", added "/usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/licenses/AUTHORS /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/licenses/LICENSE"
Changes to packages/x86-64-v3-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info was added
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/licenses/AUTHORS was added
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info was removed
  /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info/WHEEL was removed

--===============2165408173373646792==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cffi-upgrade-1.17.1-2.0.0.patch"

RnJvbSBiNTM2Y2Y2ODg0YWVjZDcwY2JkOTljMTU3ZThmMTQ5Mzc3ZjA3OWQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjM6Mjk6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNmZmk6IHVwZ3JhZGUgMS4xNy4xIC0+IDIuMC4wCgotLS0KIC4uLml6ZV90LXRvLWF2
b2lkLWMtMTEtbmFycm93aW5nLXdhcm5pbi5wYXRjaCB8IDM0IC0tLS0tLS0tLS0tLS0tLQogLi4u
My1jZmZpXzEuMTcuMS5iYiA9PiBweXRob24zLWNmZmlfMi4wLjAuYmJ9IHwgNDEgKysrKysrKysr
KysrKysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlv
bnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY2ZmaS8wMDAxLUNhc3Qtb2Zmc2V0LXRvLXNpemVfdC10by1hdm9pZC1jLTExLW5hcnJv
d2luZy13YXJuaW4ucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tw
eXRob24zLWNmZmlfMS4xNy4xLmJiID0+IHB5dGhvbjMtY2ZmaV8yLjAuMC5iYn0gKDM2JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2ZmaS8wMDAx
LUNhc3Qtb2Zmc2V0LXRvLXNpemVfdC10by1hdm9pZC1jLTExLW5hcnJvd2luZy13YXJuaW4ucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2ZmaS8wMDAxLUNhc3Qt
b2Zmc2V0LXRvLXNpemVfdC10by1hdm9pZC1jLTExLW5hcnJvd2luZy13YXJuaW4ucGF0Y2gKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGE5MTlmNGY2ZmIuLjAwMDAwMDAwMDAKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNmZmkvMDAwMS1DYXN0LW9mZnNl
dC10by1zaXplX3QtdG8tYXZvaWQtYy0xMS1uYXJyb3dpbmctd2FybmluLnBhdGNoCisrKyAvZGV2
L251bGwKQEAgLTEsMzQgKzAsMCBAQAotRnJvbSAyYWM2M2Y4NzY1ZTYyZjE0OTJlZjNlZTA2Nzkx
NjM2NzAwYmM2Y2ZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogdHJpYWxsYXggPHRy
aWFsbGF4QHR1dGFub3RhLmNvbT4KLURhdGU6IFNhdCwgMjkgSnVuIDIwMjQgMTU6MjU6MjQgKzAx
MDAKLVN1YmplY3Q6IFtQQVRDSF0gQ2FzdCBvZmZzZXQgdG8gc2l6ZV90IHRvIGF2b2lkIGMrKzEx
LW5hcnJvd2luZyB3YXJuaW5nICgjOTIpCi0KLWUuZy4gd2l0aCBjbGFuZyAxOCBvbiBjaGltZXJh
IGxpbnV4OgotCi1fQ0ZGSV90ZXN0X3ZlcmlmeV9hbm9ueW1vdXNfc3RydWN0X3dpdGhfc3Rhcl90
eXBlZGVmLmNwcDo1ODM6MTA6IGVycm9yOiBub24tY29uc3RhbnQtZXhwcmVzc2lvbiBjYW5ub3Qg
YmUgbmFycm93ZWQgZnJvbSB0eXBlICdsb25nJyB0byAnc2l6ZV90JyAoYWthICd1bnNpZ25lZCBs
b25nJykgaW4gaW5pdGlhbGl6ZXIgbGlzdCBbLVdjKysxMS1uYXJyb3dpbmddCi0gIDU4MyB8ICAg
eyAiYSIsICgoY2hhciAqKSYoKGZvb190KTQwOTYpLT5hKSAtIChjaGFyICopNDA5NiwKLSAgICAg
IHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Ci1f
Q0ZGSV90ZXN0X3ZlcmlmeV9hbm9ueW1vdXNfc3RydWN0X3dpdGhfc3Rhcl90eXBlZGVmLmNwcDo1
ODM6MTA6IG5vdGU6IGluc2VydCBhbiBleHBsaWNpdCBjYXN0IHRvIHNpbGVuY2UgdGhpcyBpc3N1
ZQotICA1ODMgfCAgIHsgImEiLCAoKGNoYXIgKikmKChmb29fdCk0MDk2KS0+YSkgLSAoY2hhciAq
KTQwOTYsCi0gICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgotICAgICAgfCAgICAgICAgICBzdGF0aWNfY2FzdDxzaXplX3Q+KCAgICAgICAg
ICAgICAgICAgICAgICApCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0
aHViLmNvbS9weXRob24tY2ZmaS9jZmZpL3B1bGwvOTJdCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gc3JjL2NmZmkvcmVjb21waWxlci5weSB8IDIg
Ky0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlm
ZiAtLWdpdCBhL3NyYy9jZmZpL3JlY29tcGlsZXIucHkgYi9zcmMvY2ZmaS9yZWNvbXBpbGVyLnB5
Ci1pbmRleCBhYzZjMTYzZS4uMTRkNTc4ZWUgMTAwNjQ0Ci0tLS0gYS9zcmMvY2ZmaS9yZWNvbXBp
bGVyLnB5Ci0rKysgYi9zcmMvY2ZmaS9yZWNvbXBpbGVyLnB5Ci1AQCAtOTUzLDcgKzk1Myw3IEBA
IGNsYXNzIFJlY29tcGlsZXI6Ci0gICAgICAgICAgICAgICAgIGlmIGNuYW1lIGlzIE5vbmUgb3Ig
ZmJpdHNpemUgPj0gMDoKLSAgICAgICAgICAgICAgICAgICAgIG9mZnNldCA9ICcoc2l6ZV90KS0x
JwotICAgICAgICAgICAgICAgICBlbGlmIG5hbWVkX3B0ciBpcyBub3QgTm9uZToKLS0gICAgICAg
ICAgICAgICAgICAgIG9mZnNldCA9ICcoKGNoYXIgKikmKCglcyk0MDk2KS0+JXMpIC0gKGNoYXIg
Kik0MDk2JyAlICgKLSsgICAgICAgICAgICAgICAgICAgIG9mZnNldCA9ICcoc2l6ZV90KSgoKGNo
YXIgKikmKCglcyk0MDk2KS0+JXMpIC0gKGNoYXIgKik0MDk2KScgJSAoCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgbmFtZWRfcHRyLm5hbWUsIGZsZG5hbWUpCi0gICAgICAgICAgICAgICAgIGVs
c2U6Ci0gICAgICAgICAgICAgICAgICAgICBvZmZzZXQgPSAnb2Zmc2V0b2YoJXMsICVzKScgJSAo
dHAuZ2V0X2NfbmFtZSgnJyksIGZsZG5hbWUpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2ZmaV8xLjE3LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY2ZmaV8yLjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDM2JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2ZmaV8xLjE3LjEu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZmZpXzIu
MC4wLmJiCmluZGV4IDVhM2FmMDNkOWYuLjA3NDE3NGVkNGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZmZpXzEuMTcuMS5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2ZmaV8yLjAuMC5iYgpAQCAtMSwxMyArMSw0
NiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRh
dGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJl
bmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1
cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFu
Z2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgor
IyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQor
IworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAg
LTMsNyArMyw3IEBACisjICBpbmZvcm1hdGlvbiBhdCB0aGUgYmVnaW5uaW5nIG9mIGVhY2ggZmls
ZSkgYWxsIHNvZnR3YXJlIGFuZAorIyAgZG9jdW1lbnRhdGlvbiBpcyBsaWNlbnNlZCBhcyBmb2xs
b3dzOiAKKyMgIAorIyAtICAgIFRoZSBNSVQgTGljZW5zZQorIyArICAgIE1JVCBObyBBdHRyaWJ1
dGlvbgorIyAgCisjICAgICAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBj
aGFyZ2UsIHRvIGFueSBwZXJzb24gCisjICAgICAgb2J0YWluaW5nIGEgY29weSBvZiB0aGlzIHNv
ZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gCisjIEBAIC0xMSwxMCArMTEsNyBA
QAorIyAgICAgIHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRoZSBy
aWdodHMgdG8gdXNlLCAKKyMgICAgICBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0
cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3IgCisjICAgICAgc2VsbCBjb3BpZXMgb2YgdGhlIFNv
ZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUgCisjIC0gICAgU29mdHdh
cmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0
aW9uczoKKyMgLQorIyAtICAgIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBl
cm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1ZGVkIAorIyAtICAgIGluIGFsbCBjb3BpZXMg
b3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorIyArICAgIFNvZnR3YXJl
IGlzIGZ1cm5pc2hlZCB0byBkbyBzby4KKyMgIAorIyAgICAgIFRIRSBTT0ZUV0FSRSBJUyBQUk9W
SURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIAorIyAg
ICAgIE9SIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJ
RVMgT0YgTUVSQ0hBTlRBQklMSVRZLCAKKyMgCisjCisKIFNVTU1BUlkgPSAiRm9yZWlnbiBGdW5j
dGlvbiBJbnRlcmZhY2UgZm9yIFB5dGhvbiBjYWxsaW5nIEMgY29kZSIKIEhPTUVQQUdFID0gImh0
dHA6Ly9jZmZpLnJlYWR0aGVkb2NzLm9yZy8iCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTU2NzdlMmZkYmY3Y2RkYTYxZDZkZDJiNTdkZjU0
N2JmIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YzAxNThhYjliNzU4
NzVmM2JiN2ZlYTA4MWQzODg4MTgiCiBERVBFTkRTICs9ICJsaWJmZmkgcHl0aG9uMy1weWNwYXJz
ZXIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxYzM5YzYwMTZjMzJiYzQ4ZGQ1NDU2MTk1MGVi
ZDY4MzZlMTY3MGYyYWU0NjEyOGY2N2NmNDllNzg5YzUyODI0IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjQ0ZDFiNTkwOTAyMTEzOWZlMzYwMDFhZTA0OGRiZGRlODIxNGFmYTIwMjAwZWRhMGY2NGMw
NjhjYWM1ZDU1MjkiCiAKLVNSQ19VUkkgKz0gImZpbGU6Ly9ydW4tcHRlc3QgXAotICAgICAgICAg
ICAgZmlsZTovLzAwMDEtQ2FzdC1vZmZzZXQtdG8tc2l6ZV90LXRvLWF2b2lkLWMtMTEtbmFycm93
aW5nLXdhcm5pbi5wYXRjaCIKK1NSQ19VUkkgKz0gImZpbGU6Ly9ydW4tcHRlc3QiCiAKIGluaGVy
aXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIHB0ZXN0IHBrZ2NvbmZpZwogCi0t
IAoyLjQ3LjEKCg==

--===============2165408173373646792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cffi: PKGV changed from 1.17.1 [default] to 2.0.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cffi/cffi-1.17.1.tar.gz;downloadfilename=cffi-1.17.1.tar.gz file://run-ptest file://0001-Cast-offset-to-size_t-to-avoid-c-11-narrowing-warnin.patch" to "https://files.pythonhosted.org/packages/source/c/cffi/cffi-2.0.0.tar.gz;downloadfilename=cffi-2.0.0.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-cffi: PV changed from "1.17.1" to "2.0.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dbg: PKGV changed from 1.17.1 [default] to 2.0.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dbg: PKGSIZE changed from 582024 to 592216 (+2%)
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dbg: PV changed from "1.17.1" to "2.0.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dev: PKGV changed from 1.17.1 [default] to 2.0.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dev: PV changed from "1.17.1" to "2.0.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-doc: PKGV changed from 1.17.1 [default] to 2.0.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-doc: PV changed from "1.17.1" to "2.0.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-locale: PKGV changed from 1.17.1 [default] to 2.0.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-locale: PV changed from "1.17.1" to "2.0.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-ptest: PKGV changed from 1.17.1 [default] to 2.0.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-ptest: PKGSIZE changed from 677014 to 684059 (+1%)
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-ptest: PV changed from "1.17.1" to "2.0.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-src: PKGV changed from 1.17.1 [default] to 2.0.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-src: PKGSIZE changed from 488407 to 497652 (+2%)
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-src: FILELIST: directory renamed /usr/src/debug/python3-cffi/1.17.1/src/cffi -> /usr/src/debug/python3-cffi/2.0.0/src/cffi, directory renamed /usr/src/debug/python3-cffi/1.17.1/src/c -> /usr/src/debug/python3-cffi/2.0.0/src/c
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-src: PV changed from "1.17.1" to "2.0.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-staticdev: PKGV changed from 1.17.1 [default] to 2.0.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-staticdev: PV changed from "1.17.1" to "2.0.0"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi: PKGV changed from 1.17.1 [default] to 2.0.0 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi: PKGSIZE changed from 1012467 to 1014971 (+0%)
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info -> /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info, removed "/usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info/licenses/LICENSE", added "/usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/licenses/LICENSE /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/licenses/AUTHORS"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi: PV changed from "1.17.1" to "2.0.0"
Changes to packages/x86-64-v3-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info was added
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/licenses/AUTHORS was added
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/cffi-2.0.0.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info was removed
  /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/cffi-1.17.1.dist-info/WHEEL was removed

--===============2165408173373646792==--

