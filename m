Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427FEC52D1E
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:01 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.2177.1719853075848223099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fsSoMOtg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=b5uTUu2B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101906f3b4a86-cdc16fc8-df0f-4903-b5cc-e9846fe4e449-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pezYI8PnU4TLpKPb8JsUl6aAF43DX7XcfEJkpN5VlrM=;
	b=fsSoMOtgRRUvHVfcEizJW55nUedv2fyV4N1XvFoGwLEJkfOvKnaI15JtxFcyrQ18
	2fTGTvU5nmV30ZGNhYJOKtmn2EAC6Qz7xICp+Sj4Pcuc/NBGxH9G5AITCis3CX5ST5J
	kBVsSRSVljovcBJImr1R8gDAXfYQDY5dfGNDiJ3I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pezYI8PnU4TLpKPb8JsUl6aAF43DX7XcfEJkpN5VlrM=;
	b=b5uTUu2B951t0y1VLs/h4bVVjsITS5gZTE8tvI2iVb4UQhZ1ep63/XNDp3kmeKHw
	NRztGJXRn8Pnf1K9b4iZIbkJ/UD1nr7r2S5RG6IuEyN/RodwxFPdjEkhjvAtghSU8hT
	nUhsfxrGbINrGB9IkBoRMtjJcZKNx888bKXm2VWU=
Content-Type: multipart/mixed; boundary="===============8420207139021576542=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.10.1 SUCCEEDED
Message-ID: <010101906f3b4a86-cdc16fc8-df0f-4903-b5cc-e9846fe4e449-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201327

--===============8420207139021576542==
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
From 3f69fdc91068d4e52b8c6f73a95f4815687f79a0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 07:03:49 +0000
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


--===============8420207139021576542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 32857200 to 32869488 (+0%)
packages/core2-64-poky-linux/ccache/ccache-dbg: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache/ccache-dbg: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache/ccache-dev: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache/ccache-dev: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache/ccache-doc: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache/ccache-doc: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache/ccache-locale: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache/ccache-locale: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache/ccache-src: PKGSIZE changed from 1636715 to 1637075 (+0%)
packages/core2-64-poky-linux/ccache/ccache-src: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache/ccache-src: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache/ccache-staticdev: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache/ccache: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache/ccache: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache: PV changed from "4.10" to "4.10.1"
packages/core2-64-poky-linux/ccache: PKGV changed from 4.10 [default] to 4.10.1 [default]
packages/core2-64-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.10/ccache-4.10.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.10.1/ccache-4.10.1.tar.gz"

--===============8420207139021576542==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.10-4.10.1.patch"

RnJvbSAzZjY5ZmRjOTEwNjhkNGU1MmI4YzZmNzNhOTVmNDgxNTY4N2Y3OWEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwNzowMzo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNj
YWNoZTogdXBncmFkZSA0LjEwIC0+IDQuMTAuMQoKLS0tCiAuLi4ve2NjYWNoZV80LjEwLmJiID0+
IGNjYWNoZV80LjEwLjEuYmJ9ICAgICAgfCA2MiArKysrKysrKysrKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY2NhY2hlL3tjY2FjaGVfNC4xMC5iYiA9PiBjY2FjaGVfNC4xMC4xLmJi
fSAoMzMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hl
XzQuMTAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjEwLjEuYmIK
c2ltaWxhcml0eSBpbmRleCAzMyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nj
YWNoZS9jY2FjaGVfNC4xMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNo
ZS9jY2FjaGVfNC4xMC4xLmJiCmluZGV4IGRmMTY5YjljMmIuLjBjODc3MzYzZjIgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTAuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xMC4xLmJiCkBAIC0xLDMgKzEsNTkg
QEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRl
ZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5j
ZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBk
YXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdl
cyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMg
KGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMK
KyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLmFkb2MKKyMgKysrIExJQ0VOU0UuYWRv
YworIyBAQCAtNDQ4LDYgKzQ0OCw0MiBAQAorIyAgLS0tLQorIyAgCisjICAKKyMgKz09PSBzcmMv
dGhpcmRfcGFydHkvZm10L2ZtdC8qLmggYW5kIHNyYy90aGlyZF9wYXJ0eS9mbXQvZm10L2Zvcm1h
dC5jYworIyArCisjICtUaGlzIGlzIGEgc3Vic2V0IG9mIGh0dHBzOi8vZm10LmRldltmbXRdIDEw
LjIuMSB3aXRoIHRoZSBmb2xsb3dpbmcgbGljZW5zZToKKyMgKworIyArLS0tLQorIyArRm9ybWF0
dGluZyBsaWJyYXJ5IGZvciBDKysKKyMgKworIyArQ29weXJpZ2h0IChjKSAyMDEyIC0gcHJlc2Vu
dCwgVmljdG9yIFp2ZXJvdmljaAorIyArCisjICtQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVk
LCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYSBjb3B5CisjICtvZiB0
aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29m
dHdhcmUiKSwgdG8gZGVhbAorIyAraW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24s
IGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24gdGhlIHJpZ2h0cworIyArdG8gdXNlLCBjb3B5
LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLCBhbmQvb3Ig
c2VsbAorIyArY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRv
IHdob20gdGhlIFNvZnR3YXJlIGlzIGZ1cm5pc2hlZAorIyArdG8gZG8gc28sIHN1YmplY3QgdG8g
dGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgorIyArCisjICtUaGUgYWJvdmUgY29weXJpZ2h0IG5v
dGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbgorIyAr
YWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisjICsK
KyMgK1RIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9G
IEFOWSBLSU5ELCBFWFBSRVNTIE9SCisjICtJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1J
VEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyMgK0ZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNI
QUxMIFRIRQorIyArQVVUSE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFO
WSBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUgorIyArTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFD
VElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwKKyMgK09V
VCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RI
RVIgREVBTElOR1MgSU4gVEhFCisjICtTT0ZUV0FSRS4KKyMgKworIyArLS0tIE9wdGlvbmFsIGV4
Y2VwdGlvbiB0byB0aGUgbGljZW5zZSAtLS0KKyMgKworIyArQXMgYW4gZXhjZXB0aW9uLCBpZiwg
YXMgYSByZXN1bHQgb2YgeW91ciBjb21waWxpbmcgeW91ciBzb3VyY2UgY29kZSwgcG9ydGlvbnMK
KyMgK29mIHRoaXMgU29mdHdhcmUgYXJlIGVtYmVkZGVkIGludG8gYSBtYWNoaW5lLWV4ZWN1dGFi
bGUgb2JqZWN0IGZvcm0gb2Ygc3VjaAorIyArc291cmNlIGNvZGUsIHlvdSBtYXkgcmVkaXN0cmli
dXRlIHN1Y2ggZW1iZWRkZWQgcG9ydGlvbnMgaW4gc3VjaCBvYmplY3QgZm9ybQorIyArd2l0aG91
dCBpbmNsdWRpbmcgdGhlIGFib3ZlIGNvcHlyaWdodCBhbmQgcGVybWlzc2lvbiBub3RpY2VzLgor
IyArLS0tLQorIyArCisjICsKKyMgID09PSBzcmMvdGhpcmRfcGFydHkvbm9uc3RkLXNwYW4vbm9u
c3RkL3NwYW4uaHBwCisjICAKKyMgIFRoaXMgaXMgdGhlIHNpbmdsZSBoZWFkZXIgdmVyc2lvbiBv
ZgorIyAKKyMKKwogU1VNTUFSWSA9ICJhIGZhc3QgQy9DKysgY29tcGlsZXIgY2FjaGUiCiBERVND
UklQVElPTiA9ICJjY2FjaGUgaXMgYSBjb21waWxlciBjYWNoZS4gSXQgc3BlZWRzIHVwIHJlY29t
cGlsYXRpb24gXAogYnkgY2FjaGluZyB0aGUgcmVzdWx0IG9mIHByZXZpb3VzIGNvbXBpbGF0aW9u
cyBhbmQgZGV0ZWN0aW5nIHdoZW4gdGhlIFwKQEAgLTcsMTcgKzYzLDE3IEBAIEhPTUVQQUdFID0g
Imh0dHA6Ly9jY2FjaGUuc2FtYmEub3JnIgogU0VDVElPTiA9ICJkZXZlbCIKIAogTElDRU5TRSA9
ICJHUEwtMy4wLW9yLWxhdGVyICYgTUlUICYgQlNMLTEuMCAmIElTQyIKLUxJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0UuYWRvYzttZDU9YzcyZmE1NzU1ZGM3MGVjNWI0MzkyMTJkNDcy
OTk0MTQgXAorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5hZG9jO21kNT03M2I4
NjMxMWVhZjJiNjZiMGQwOTNlYzFhMTVmYTYwZCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9zcmMvdGhpcmRfcGFydHkvY3BwLWh0dHBsaWIvaHR0cGxpYi5oO2VuZGxpbmU9NjttZDU9NTM4
OWQ5ZjVhODhhMTM4ZTQyYmE1ODg5NGJiY2VlYWMgXAogICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vc3JjL3RoaXJkX3BhcnR5L25vbnN0ZC1zcGFuL25vbnN0ZC9zcGFuLmhwcDtlbmRsaW5lPTk7
bWQ1PWI0YWY5MmE3ZjA2OGIzOGM1YjM0MTBkY2ViMzBjMTg2IFwKICAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL3NyYy90aGlyZF9wYXJ0eS93aW4zMi1jb21wYXQvd2luMzIvbWt0ZW1wLmM7ZW5k
bGluZT0xNzttZDU9ZDI4N2U5YzFmMWNkMmJiMmJkMTY0NDkwZTFjZjQ0OWEgXAotIgorICAgICAg
ICAgICAgICAgICAgICAiCiAKIERFUEVORFMgPSAienN0ZCBmbXQgeHhoYXNoIgogCiBTUkNfVVJJ
ID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vJHtCUH0udGFyLmd6IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMTY5NzJiYTYyYzg0OTkwNDVlZGMzYWU3ZDdiOGEwYjQxOWE5
NjE1NjdmNWZmMGYwMWJmNWE0NDE5NDIwNDc3NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4Zjhh
ZDYwZDkzNjM4NTc4MTJhYThhZjNmYTdmYjcyYmU1ZWE1Y2YxOTNmODI0ZDE2ZDIzN2E4YTc5MjU2
YmU0IgogCiBpbmhlcml0IGNtYWtlIGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjQ0LjAKCg==

--===============8420207139021576542==--

