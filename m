Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBC7C54ED0
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:21 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.1362.1721071146337108433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Q9YcQUaV;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mQ6fZYlQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010190b7d591c5-210e3db6-a360-4468-9d47-b4d56617a31a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dXkQm6e3hBw8q5Ana/XoPMNx7OvkLqZiJjqtATGMsoE=;
	b=Q9YcQUaVHd/mIwOjbWNRzvvau8MihXFVjQgt/GoRRH/2irK1sGQbPYKL9DBnCJvz
	8RFKKVRe3yepAhLycrE2LrB0KhlxBRHhCktngqS7SUbYY+TwKHjU+6kz6xyMHz3nRpj
	Ou0VwqDRKuZWUVDLFIiV7zMwz3zoU6h9dk++mtn8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dXkQm6e3hBw8q5Ana/XoPMNx7OvkLqZiJjqtATGMsoE=;
	b=mQ6fZYlQqBBHBb6qV1D8AMzDMee9/N651NgerAOxcxHeSCv4NYcgTO+6YzBN4jco
	US1vZtHf1XeidHkst21NKzkVOf8XJkD9XS3naMrieuJgPe2r1Ct4Edf+eKv4gCzNSyg
	wmTx7T48gcG+uL6D1ic86ocxePXQTDEZRRwDiOb0=
Content-Type: multipart/mixed; boundary="===============7898314324021327289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.10.1 SUCCEEDED
Message-ID: <01010190b7d591c5-210e3db6-a360-4468-9d47-b4d56617a31a-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201961

--===============7898314324021327289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ccache* to *4.10.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.10-4.10.1.patch
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
From 9a6efddc8841c7604bfeca2f0465a6d665892c7f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 08:47:23 +0000
Subject: [PATCH] ccache: upgrade 4.10 -> 4.10.1

---
 .../{ccache_4.10.bb => ccache_4.10.1.bb}      | 62 ++++++++++++++++++-
 1 file changed, 59 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.10.bb => ccache_4.10.1.bb} (33%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.10.bb b/meta/recipes-devtools/ccache/ccache_4.10.1.bb
similarity index 33%
rename from meta/recipes-devtools/ccache/ccache_4.10.bb
rename to meta/recipes-devtools/ccache/ccache_4.10.1.bb
index df169b9c2b..0c877363f2 100644
--- a/meta/recipes-devtools/ccache/ccache_4.10.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.10.1.bb
@@ -1,3 +1,59 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.adoc
+# +++ LICENSE.adoc
+# @@ -448,6 +448,42 @@
+#  ----
+#  
+#  
+# +=== src/third_party/fmt/fmt/*.h and src/third_party/fmt/fmt/format.cc
+# +
+# +This is a subset of https://fmt.dev[fmt] 10.2.1 with the following license:
+# +
+# +----
+# +Formatting library for C++
+# +
+# +Copyright (c) 2012 - present, Victor Zverovich
+# +
+# +Permission is hereby granted, free of charge, to any person obtaining a copy
+# +of this software and associated documentation files (the "Software"), to deal
+# +in the Software without restriction, including without limitation the rights
+# +to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# +copies of the Software, and to permit persons to whom the Software is furnished
+# +to do so, subject to the following conditions:
+# +
+# +The above copyright notice and this permission notice shall be included in
+# +all copies or substantial portions of the Software.
+# +
+# +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+# +SOFTWARE.
+# +
+# +--- Optional exception to the license ---
+# +
+# +As an exception, if, as a result of your compiling your source code, portions
+# +of this Software are embedded into a machine-executable object form of such
+# +source code, you may redistribute such embedded portions in such object form
+# +without including the above copyright and permission notices.
+# +----
+# +
+# +
+#  === src/third_party/nonstd-span/nonstd/span.hpp
+#  
+#  This is the single header version of
+# 
+#
+
 SUMMARY = "a fast C/C++ compiler cache"
 DESCRIPTION = "ccache is a compiler cache. It speeds up recompilation \
 by caching the result of previous compilations and detecting when the \
@@ -7,17 +63,17 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=c72fa5755dc70ec5b439212d47299414 \
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=73b86311eaf2b66b0d093ec1a15fa60d \
                     file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=5389d9f5a88a138e42ba58894bbceeac \
                     file://src/third_party/nonstd-span/nonstd/span.hpp;endline=9;md5=b4af92a7f068b38c5b3410dceb30c186 \
                     file://src/third_party/win32-compat/win32/mktemp.c;endline=17;md5=d287e9c1f1cd2bb2bd164490e1cf449a \
-"
+                    "
 
 DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "16972ba62c8499045edc3ae7d7b8a0b419a961567f5ff0f01bf5a44194204775"
+SRC_URI[sha256sum] = "8f8ad60d9363857812aa8af3fa7fb72be5ea5cf193f824d16d237a8a79256be4"
 
 inherit cmake github-releases
 
-- 
2.44.0


--===============7898314324021327289==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.10-4.10.1.patch"

RnJvbSA5YTZlZmRkYzg4NDFjNzYwNGJmZWNhMmYwNDY1YTZkNjY1ODkyYzdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMDg6NDc6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC4xMCAtPiA0LjEwLjEKCi0tLQogLi4uL3tjY2FjaGVfNC4xMC5iYiA9
PiBjY2FjaGVfNC4xMC4xLmJifSAgICAgIHwgNjIgKysrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NjYWNoZS97Y2NhY2hlXzQuMTAuYmIgPT4gY2NhY2hlXzQuMTAuMS5i
Yn0gKDMzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNo
ZV80LjEwLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xMC4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggMzMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9j
Y2FjaGUvY2NhY2hlXzQuMTAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2Fj
aGUvY2NhY2hlXzQuMTAuMS5iYgppbmRleCBkZjE2OWI5YzJiLi4wYzg3NzM2M2YyIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjEwLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTAuMS5iYgpAQCAtMSwzICsxLDU5
IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0
ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVw
ZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5n
ZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisj
IChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisj
CisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS5hZG9jCisjICsrKyBMSUNFTlNFLmFk
b2MKKyMgQEAgLTQ0OCw2ICs0NDgsNDIgQEAKKyMgIC0tLS0KKyMgIAorIyAgCisjICs9PT0gc3Jj
L3RoaXJkX3BhcnR5L2ZtdC9mbXQvKi5oIGFuZCBzcmMvdGhpcmRfcGFydHkvZm10L2ZtdC9mb3Jt
YXQuY2MKKyMgKworIyArVGhpcyBpcyBhIHN1YnNldCBvZiBodHRwczovL2ZtdC5kZXZbZm10XSAx
MC4yLjEgd2l0aCB0aGUgZm9sbG93aW5nIGxpY2Vuc2U6CisjICsKKyMgKy0tLS0KKyMgK0Zvcm1h
dHRpbmcgbGlicmFyeSBmb3IgQysrCisjICsKKyMgK0NvcHlyaWdodCAoYykgMjAxMiAtIHByZXNl
bnQsIFZpY3RvciBadmVyb3ZpY2gKKyMgKworIyArUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRl
ZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyArb2Yg
dGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNv
ZnR3YXJlIiksIHRvIGRlYWwKKyMgK2luIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9u
LCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRoZSByaWdodHMKKyMgK3RvIHVzZSwgY29w
eSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwgYW5kL29y
IHNlbGwKKyMgK2NvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0
byB3aG9tIHRoZSBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQKKyMgK3RvIGRvIHNvLCBzdWJqZWN0IHRv
IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyMgKworIyArVGhlIGFib3ZlIGNvcHlyaWdodCBu
b3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KKyMg
K2FsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorIyAr
CisjICtUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBP
RiBBTlkgS0lORCwgRVhQUkVTUyBPUgorIyArSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElN
SVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCisjICtGSVRORVNTIEZP
UiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBT
SEFMTCBUSEUKKyMgK0FVVEhPUlMgT1IgQ09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxFIEZPUiBB
TlkgQ0xBSU0sIERBTUFHRVMgT1IgT1RIRVIKKyMgK0xJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBB
Q1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00sCisjICtP
VVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9U
SEVSIERFQUxJTkdTIElOIFRIRQorIyArU09GVFdBUkUuCisjICsKKyMgKy0tLSBPcHRpb25hbCBl
eGNlcHRpb24gdG8gdGhlIGxpY2Vuc2UgLS0tCisjICsKKyMgK0FzIGFuIGV4Y2VwdGlvbiwgaWYs
IGFzIGEgcmVzdWx0IG9mIHlvdXIgY29tcGlsaW5nIHlvdXIgc291cmNlIGNvZGUsIHBvcnRpb25z
CisjICtvZiB0aGlzIFNvZnR3YXJlIGFyZSBlbWJlZGRlZCBpbnRvIGEgbWFjaGluZS1leGVjdXRh
YmxlIG9iamVjdCBmb3JtIG9mIHN1Y2gKKyMgK3NvdXJjZSBjb2RlLCB5b3UgbWF5IHJlZGlzdHJp
YnV0ZSBzdWNoIGVtYmVkZGVkIHBvcnRpb25zIGluIHN1Y2ggb2JqZWN0IGZvcm0KKyMgK3dpdGhv
dXQgaW5jbHVkaW5nIHRoZSBhYm92ZSBjb3B5cmlnaHQgYW5kIHBlcm1pc3Npb24gbm90aWNlcy4K
KyMgKy0tLS0KKyMgKworIyArCisjICA9PT0gc3JjL3RoaXJkX3BhcnR5L25vbnN0ZC1zcGFuL25v
bnN0ZC9zcGFuLmhwcAorIyAgCisjICBUaGlzIGlzIHRoZSBzaW5nbGUgaGVhZGVyIHZlcnNpb24g
b2YKKyMgCisjCisKIFNVTU1BUlkgPSAiYSBmYXN0IEMvQysrIGNvbXBpbGVyIGNhY2hlIgogREVT
Q1JJUFRJT04gPSAiY2NhY2hlIGlzIGEgY29tcGlsZXIgY2FjaGUuIEl0IHNwZWVkcyB1cCByZWNv
bXBpbGF0aW9uIFwKIGJ5IGNhY2hpbmcgdGhlIHJlc3VsdCBvZiBwcmV2aW91cyBjb21waWxhdGlv
bnMgYW5kIGRldGVjdGluZyB3aGVuIHRoZSBcCkBAIC03LDE3ICs2MywxNyBAQCBIT01FUEFHRSA9
ICJodHRwOi8vY2NhY2hlLnNhbWJhLm9yZyIKIFNFQ1RJT04gPSAiZGV2ZWwiCiAKIExJQ0VOU0Ug
PSAiR1BMLTMuMC1vci1sYXRlciAmIE1JVCAmIEJTTC0xLjAgJiBJU0MiCi1MSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFLmFkb2M7bWQ1PWM3MmZhNTc1NWRjNzBlYzViNDM5MjEyZDQ3
Mjk5NDE0IFwKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuYWRvYzttZDU9NzNi
ODYzMTFlYWYyYjY2YjBkMDkzZWMxYTE1ZmE2MGQgXAogICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vc3JjL3RoaXJkX3BhcnR5L2NwcC1odHRwbGliL2h0dHBsaWIuaDtlbmRsaW5lPTY7bWQ1PTUz
ODlkOWY1YTg4YTEzOGU0MmJhNTg4OTRiYmNlZWFjIFwKICAgICAgICAgICAgICAgICAgICAgZmls
ZTovL3NyYy90aGlyZF9wYXJ0eS9ub25zdGQtc3Bhbi9ub25zdGQvc3Bhbi5ocHA7ZW5kbGluZT05
O21kNT1iNGFmOTJhN2YwNjhiMzhjNWIzNDEwZGNlYjMwYzE4NiBcCiAgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9zcmMvdGhpcmRfcGFydHkvd2luMzItY29tcGF0L3dpbjMyL21rdGVtcC5jO2Vu
ZGxpbmU9MTc7bWQ1PWQyODdlOWMxZjFjZDJiYjJiZDE2NDQ5MGUxY2Y0NDlhIFwKLSIKKyAgICAg
ICAgICAgICAgICAgICAgIgogCiBERVBFTkRTID0gInpzdGQgZm10IHh4aGFzaCIKIAogU1JDX1VS
SSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7QlB9LnRhci5neiIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjE2OTcyYmE2MmM4NDk5MDQ1ZWRjM2FlN2Q3YjhhMGI0MTlh
OTYxNTY3ZjVmZjBmMDFiZjVhNDQxOTQyMDQ3NzUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGY4
YWQ2MGQ5MzYzODU3ODEyYWE4YWYzZmE3ZmI3MmJlNWVhNWNmMTkzZjgyNGQxNmQyMzdhOGE3OTI1
NmJlNCIKIAogaW5oZXJpdCBjbWFrZSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi40NC4wCgo=

--===============7898314324021327289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 32857112 to 32869392 (+0%)
packages/core2-64-poky-linux/ccache/ccache-dbg: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache/ccache-dbg: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache/ccache-dev: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache/ccache-dev: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache/ccache-doc: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache/ccache-doc: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache/ccache-locale: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache/ccache-locale: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache/ccache-src: PKGSIZE changed from 1636715 to 1637075 (+0%)
packages/core2-64-poky-linux/ccache/ccache-src: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache/ccache-src: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache/ccache-staticdev: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache/ccache: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache/ccache: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.10/ccache-4.10.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.10.1/ccache-4.10.1.tar.gz"
packages/core2-64-poky-linux/ccache: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache: PV changed from "4.10" to "4.10.1"

--===============7898314324021327289==--

