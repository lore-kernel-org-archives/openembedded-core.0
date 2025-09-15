Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBF7CAC5A6
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:47 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.30884.1757937276286159986
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0q3S6Lfe;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=c9ZL777L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101994d3a1dce-1de30785-7439-49b3-9b86-59ad80a9aa56-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937278;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GIfc55pGEYGTvjWj3W7HraQVlPocIbdSeSLvYXZjavo=;
	b=0q3S6Lfe43Cq/YjeixO1E5v91SHrm4Zo5Njk/ZKmZ8eXtUVLWBr1lODKxDEiHZFj
	M48KJj68H5evhGshcEXURUc+DATdEhFuspzyNqhEyeBV9iFfJPO/YMKsZBE6aTYs0Ox
	Kb19V1+7C7LVuR+DX2uVRhczGrVPqUUu2EnY/dDI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937278;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GIfc55pGEYGTvjWj3W7HraQVlPocIbdSeSLvYXZjavo=;
	b=c9ZL777LP7xEIADsOQIbuDV1J8s8jzWV8vCKrH1jaB8TDRH82tpzPn9xCXKKYep3
	OsHsx5UKpCWs/C1Xo1qlb1L8kjmaGyvXAvnTp98X1RksxaQT1gbm1jbEK2bQnoN096a
	fcIHpifFpEWrzF/gs1BIdwbAPDDHfqgagdkJpWiw=
Content-Type: multipart/mixed; boundary="===============3858031650216913057=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.12 SUCCEEDED
Message-ID: <010101994d3a1dce-1de30785-7439-49b3-9b86-59ad80a9aa56-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223413

--===============3858031650216913057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.11.3-4.12.patch
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
From 5cdbf2190f70622cedcdef9d4146be4cfd23e8fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 07:49:04 +0000
Subject: [PATCH] ccache: upgrade 4.11.3 -> 4.12

---
 .../{ccache_4.11.3.bb => ccache_4.12.bb}      | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.11.3.bb => ccache_4.12.bb} (45%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.11.3.bb b/meta/recipes-devtools/ccache/ccache_4.12.bb
similarity index 45%
rename from meta/recipes-devtools/ccache/ccache_4.11.3.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.bb
index 83374fa44c..e6be988acb 100644
--- a/meta/recipes-devtools/ccache/ccache_4.11.3.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.bb
@@ -1,3 +1,43 @@
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
+# @@ -50,7 +50,7 @@
+#  
+#  === src/third_party/blake3/blake3/*
+#  
+# -This is a subset of https://github.com/BLAKE3-team/BLAKE3[BLAKE3] 1.6.1 with the
+# +This is a subset of https://github.com/BLAKE3-team/BLAKE3[BLAKE3] 1.8.2 with the
+#  following license:
+#  
+#  ----
+# @@ -390,7 +390,7 @@
+#  === src/third_party/cpp-httplib/httplib.h
+#  
+#  cpp-httplib - A C++11 cross-platform HTTP/HTTPS library. Copied from cpp-httplib
+# -v0.19.0 downloaded from https://github.com/yhirose/cpp-httplib[cpp-httplib]. The
+# +v0.20.0 downloaded from https://github.com/yhirose/cpp-httplib[cpp-httplib]. The
+#  library has the following license:
+#  
+#  ----
+# @@ -521,7 +521,7 @@
+#  
+#  === src/third_party/tl-expected/tl/expected.hpp
+#  
+# -This is https://github.com/TartanLlama/expected[TartanLlama expected] 1.1.0 with
+# +This is https://github.com/TartanLlama/expected[TartanLlama expected] 1.3.1 with
+#  the following license:
+#  
+#  ----
+# 
+#
+
 SUMMARY = "a fast C/C++ compiler cache"
 DESCRIPTION = "ccache is a compiler cache. It speeds up recompilation \
 by caching the result of previous compilations and detecting when the \
@@ -7,7 +47,7 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=b98c3470e22877fefa43a01a2dd0669c \
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=5633f18ca110f0d4cb907eba07c920ef \
                     file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=663aca6f84e7d67ade228aad32afc0ea \
                     file://src/third_party/nonstd-span/nonstd/span.hpp;endline=9;md5=b4af92a7f068b38c5b3410dceb30c186 \
                     file://src/third_party/win32-compat/win32/mktemp.c;endline=17;md5=d287e9c1f1cd2bb2bd164490e1cf449a \
@@ -17,7 +57,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "28a407314f03a7bd7a008038dbaffa83448bc670e2fc119609b1d99fb33bb600"
+SRC_URI[sha256sum] = "e884c62cbacae2e9488b8641a671a79fb7a1221db01310dacef61c9e55c2e55b"
 
 inherit cmake github-releases
 
-- 
2.47.1


--===============3858031650216913057==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.11.3-4.12.patch"

RnJvbSA1Y2RiZjIxOTBmNzA2MjJjZWRjZGVmOWQ0MTQ2YmU0Y2ZkMjNlOGZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDc6NDk6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC4xMS4zIC0+IDQuMTIKCi0tLQogLi4uL3tjY2FjaGVfNC4xMS4zLmJi
ID0+IGNjYWNoZV80LjEyLmJifSAgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NjYWNoZS97Y2NhY2hlXzQuMTEuMy5iYiA9PiBjY2FjaGVfNC4xMi5i
Yn0gKDQ1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNo
ZV80LjExLjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjEyLmJi
CnNpbWlsYXJpdHkgaW5kZXggNDUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9j
Y2FjaGUvY2NhY2hlXzQuMTEuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nj
YWNoZS9jY2FjaGVfNC4xMi5iYgppbmRleCA4MzM3NGZhNDRjLi5lNmJlOTg4YWNiIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjExLjMuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xMi5iYgpAQCAtMSwzICsxLDQz
IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0
ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVw
ZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5n
ZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisj
IChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisj
CisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS5hZG9jCisjICsrKyBMSUNFTlNFLmFk
b2MKKyMgQEAgLTUwLDcgKzUwLDcgQEAKKyMgIAorIyAgPT09IHNyYy90aGlyZF9wYXJ0eS9ibGFr
ZTMvYmxha2UzLyoKKyMgIAorIyAtVGhpcyBpcyBhIHN1YnNldCBvZiBodHRwczovL2dpdGh1Yi5j
b20vQkxBS0UzLXRlYW0vQkxBS0UzW0JMQUtFM10gMS42LjEgd2l0aCB0aGUKKyMgK1RoaXMgaXMg
YSBzdWJzZXQgb2YgaHR0cHM6Ly9naXRodWIuY29tL0JMQUtFMy10ZWFtL0JMQUtFM1tCTEFLRTNd
IDEuOC4yIHdpdGggdGhlCisjICBmb2xsb3dpbmcgbGljZW5zZToKKyMgIAorIyAgLS0tLQorIyBA
QCAtMzkwLDcgKzM5MCw3IEBACisjICA9PT0gc3JjL3RoaXJkX3BhcnR5L2NwcC1odHRwbGliL2h0
dHBsaWIuaAorIyAgCisjICBjcHAtaHR0cGxpYiAtIEEgQysrMTEgY3Jvc3MtcGxhdGZvcm0gSFRU
UC9IVFRQUyBsaWJyYXJ5LiBDb3BpZWQgZnJvbSBjcHAtaHR0cGxpYgorIyAtdjAuMTkuMCBkb3du
bG9hZGVkIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL3loaXJvc2UvY3BwLWh0dHBsaWJbY3BwLWh0
dHBsaWJdLiBUaGUKKyMgK3YwLjIwLjAgZG93bmxvYWRlZCBmcm9tIGh0dHBzOi8vZ2l0aHViLmNv
bS95aGlyb3NlL2NwcC1odHRwbGliW2NwcC1odHRwbGliXS4gVGhlCisjICBsaWJyYXJ5IGhhcyB0
aGUgZm9sbG93aW5nIGxpY2Vuc2U6CisjICAKKyMgIC0tLS0KKyMgQEAgLTUyMSw3ICs1MjEsNyBA
QAorIyAgCisjICA9PT0gc3JjL3RoaXJkX3BhcnR5L3RsLWV4cGVjdGVkL3RsL2V4cGVjdGVkLmhw
cAorIyAgCisjIC1UaGlzIGlzIGh0dHBzOi8vZ2l0aHViLmNvbS9UYXJ0YW5MbGFtYS9leHBlY3Rl
ZFtUYXJ0YW5MbGFtYSBleHBlY3RlZF0gMS4xLjAgd2l0aAorIyArVGhpcyBpcyBodHRwczovL2dp
dGh1Yi5jb20vVGFydGFuTGxhbWEvZXhwZWN0ZWRbVGFydGFuTGxhbWEgZXhwZWN0ZWRdIDEuMy4x
IHdpdGgKKyMgIHRoZSBmb2xsb3dpbmcgbGljZW5zZToKKyMgIAorIyAgLS0tLQorIyAKKyMKKwog
U1VNTUFSWSA9ICJhIGZhc3QgQy9DKysgY29tcGlsZXIgY2FjaGUiCiBERVNDUklQVElPTiA9ICJj
Y2FjaGUgaXMgYSBjb21waWxlciBjYWNoZS4gSXQgc3BlZWRzIHVwIHJlY29tcGlsYXRpb24gXAog
YnkgY2FjaGluZyB0aGUgcmVzdWx0IG9mIHByZXZpb3VzIGNvbXBpbGF0aW9ucyBhbmQgZGV0ZWN0
aW5nIHdoZW4gdGhlIFwKQEAgLTcsNyArNDcsNyBAQCBIT01FUEFHRSA9ICJodHRwOi8vY2NhY2hl
LnNhbWJhLm9yZyIKIFNFQ1RJT04gPSAiZGV2ZWwiCiAKIExJQ0VOU0UgPSAiR1BMLTMuMC1vci1s
YXRlciAmIE1JVCAmIEJTTC0xLjAgJiBJU0MiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLmFkb2M7bWQ1PWI5OGMzNDcwZTIyODc3ZmVmYTQzYTAxYTJkZDA2NjljIFwKK0xJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuYWRvYzttZDU9NTYzM2YxOGNhMTEwZjBkNGNi
OTA3ZWJhMDdjOTIwZWYgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL3RoaXJkX3Bh
cnR5L2NwcC1odHRwbGliL2h0dHBsaWIuaDtlbmRsaW5lPTY7bWQ1PTY2M2FjYTZmODRlN2Q2N2Fk
ZTIyOGFhZDMyYWZjMGVhIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy90aGlyZF9w
YXJ0eS9ub25zdGQtc3Bhbi9ub25zdGQvc3Bhbi5ocHA7ZW5kbGluZT05O21kNT1iNGFmOTJhN2Yw
NjhiMzhjNWIzNDEwZGNlYjMwYzE4NiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMv
dGhpcmRfcGFydHkvd2luMzItY29tcGF0L3dpbjMyL21rdGVtcC5jO2VuZGxpbmU9MTc7bWQ1PWQy
ODdlOWMxZjFjZDJiYjJiZDE2NDQ5MGUxY2Y0NDlhIFwKQEAgLTE3LDcgKzU3LDcgQEAgREVQRU5E
UyA9ICJ6c3RkIGZtdCB4eGhhc2giCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rv
d25sb2FkL3Yke1BWfS8ke0JQfS50YXIuZ3oiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyOGE0
MDczMTRmMDNhN2JkN2EwMDgwMzhkYmFmZmE4MzQ0OGJjNjcwZTJmYzExOTYwOWIxZDk5ZmIzM2Ji
NjAwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU4ODRjNjJjYmFjYWUyZTk0ODhiODY0MWE2NzFh
NzlmYjdhMTIyMWRiMDEzMTBkYWNlZjYxYzllNTVjMmU1NWIiCiAKIGluaGVyaXQgY21ha2UgZ2l0
aHViLXJlbGVhc2VzCiAKLS0gCjIuNDcuMQoK

--===============3858031650216913057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 33681336 to 34501160 (+2%)
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PV changed from "4.11.3" to "4.12"
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGV changed from 4.11.3 [default] to 4.12 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PV changed from "4.11.3" to "4.12"
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PKGV changed from 4.11.3 [default] to 4.12 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PV changed from "4.11.3" to "4.12"
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PKGV changed from 4.11.3 [default] to 4.12 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PV changed from "4.11.3" to "4.12"
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PKGV changed from 4.11.3 [default] to 4.12 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGSIZE changed from 1775825 to 1801295 (+1%)
packages/x86-64-v3-poky-linux/ccache/ccache-src: PV changed from "4.11.3" to "4.12"
packages/x86-64-v3-poky-linux/ccache/ccache-src: FILELIST: directory renamed /usr/src/debug/ccache/4.11.3/src/ccache/core -> /usr/src/debug/ccache/4.12/src/ccache/core, directory renamed /usr/src/debug/ccache/4.11.3/src/ccache/storage/local -> /usr/src/debug/ccache/4.12/src/ccache/storage/local, directory renamed /usr/src/debug/ccache/4.11.3/src/third_party/cxxurl/cxxurl -> /usr/src/debug/ccache/4.12/src/third_party/cxxurl/cxxurl, directory renamed /usr/src/debug/ccache/4.11.3/src/third_party/tl-expected/tl -> /usr/src/debug/ccache/4.12/src/third_party/tl-expected/tl, directory renamed /usr/src/debug/ccache/4.11.3/src/ccache/storage/remote -> /usr/src/debug/ccache/4.12/src/ccache/storage/remote, directory renamed /usr/src/debug/ccache/4.11.3/src/third_party/blake3/blake3 -> /usr/src/debug/ccache/4.12/src/third_party/blake3/blake3, directory renamed /usr/src/debug/ccache/4.11.3/src/third_party/nonstd-span/nonstd -> /usr/src/debug/ccache/4.12/src/third_party/nonstd-span/nonstd, directo
 ry renamed /usr/src/debug/ccache/4.11.3/src/third_party/cpp-httplib -> /usr/src/debug/ccache/4.12/src/third_party/cpp-httplib, removed "/usr/src/debug/ccache/4.11.3/src/ccache/util/path.hpp /usr/src/debug/ccache/4.11.3/src/ccache/ccache.hpp /usr/src/debug/ccache/4.11.3/src/ccache/config.hpp /usr/src/debug/ccache/4.11.3/src/ccache/ccache.cpp /usr/src/debug/ccache/4.11.3/src/ccache/config.cpp /usr/src/debug/ccache/4.11.3/src/ccache/main.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/zstd.hpp /usr/src/debug/ccache/4.11.3/src/ccache/hash.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/xxh3_64.hpp /usr/src/debug/ccache/4.11.3/src/ccache/argprocessing.hpp /usr/src/debug/ccache/4.11.3/src/ccache/argprocessing.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/temporaryfile.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/assertions.cpp /usr/src/debug/ccache/4.11.3/src/ccache/inodecache.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/umaskscope.hpp /usr/src/debug/ccache/4.11.3/src/ccache/
 util/bytes.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/types.hpp /usr/src/debug/ccache/4.11.3/src/ccache/storage/storage.hpp /usr/src/debug/ccache/4.11.3/src/ccache/args.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/logging.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/string.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/bitset.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/environment.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/process.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/bytes.cpp /usr/src/debug/ccache/4.11.3/src/ccache/hash.hpp /usr/src/debug/ccache/4.11.3/src/ccache/progressbar.hpp /usr/src/debug/ccache/4.11.3/src/ccache/execute.cpp /usr/src/debug/ccache/4.11.3/src/ccache/compopt.cpp /usr/src/debug/ccache/4.11.3/src/ccache/context.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/environment.cpp /usr/src/debug/ccache/4.11.3/src/ccache/execute.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/process.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/
 xxh3_128.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/longlivedlockfilemanager.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/lockfile.cpp /usr/src/debug/ccache/4.11.3/src/ccache/storage/storage.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/lockfile.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/longlivedlockfilemanager.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/texttable.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/texttable.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/file.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/time.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/direntry.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/direntry.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/filelock.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/filelock.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/filestream.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/filesystem.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/threadpool.hpp /usr/src/debug/ccache/
 4.11.3/src/ccache/depfile.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/cpu.hpp /usr/src/debug/ccache/4.11.3/src/ccache/signalhandler.cpp /usr/src/debug/ccache/4.11.3/src/ccache/signalhandler.hpp /usr/src/debug/ccache/4.11.3/src/ccache/progressbar.cpp /usr/src/debug/ccache/4.11.3/src/ccache/depfile.cpp /usr/src/debug/ccache/4.11.3/src/ccache/hashutil.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/string.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/zstd.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/path.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/duration.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/cpu.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/timepoint.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/timepoint.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/tokenizer.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/tokenizer.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/filesystem.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/threadpool.cpp /usr/s
 rc/debug/ccache/4.11.3/src/ccache/util/defer.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/timer.hpp /usr/src/debug/ccache/4.11.3/src/ccache/inodecache.hpp /usr/src/debug/ccache/4.11.3/src/ccache/compopt.hpp /usr/src/debug/ccache/4.11.3/src/ccache/argsinfo.hpp /usr/src/debug/ccache/4.11.3/src/ccache/context.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/logging.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/memorymap.cpp /usr/src/debug/ccache/4.11.3/src/ccache/util/memorymap.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/temporaryfile.hpp /usr/src/debug/ccache/4.11.3/src/ccache/language.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/fd.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/file.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/time.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/format.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/noncopyable.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/pathstring.hpp /usr/src/debug/ccache/4.11.3/src/ccache/args.cpp /usr
 /src/debug/ccache/4.11.3/src/ccache/macroskip.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/expected.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/assertions.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/conversion.hpp /usr/src/debug/ccache/4.11.3/src/ccache/util/umaskscope.cpp /usr/src/debug/ccache/4.11.3/src/ccache/hashutil.cpp /usr/src/debug/ccache/4.11.3/src/ccache/language.cpp /usr/src/debug/ccache/4.11.3/src/ccache/version.cpp", added "/usr/src/debug/ccache/4.12/src/ccache/util/filestream.hpp /usr/src/debug/ccache/4.12/src/ccache/util/pathstring.hpp /usr/src/debug/ccache/4.12/src/ccache/util/args.cpp /usr/src/debug/ccache/4.12/src/ccache/util/path.cpp /usr/src/debug/ccache/4.12/src/ccache/util/exec.cpp /usr/src/debug/ccache/4.12/src/ccache/util/file.cpp /usr/src/debug/ccache/4.12/src/ccache/util/time.cpp /usr/src/debug/ccache/4.12/src/ccache/util/texttable.cpp /usr/src/debug/ccache/4.12/src/ccache/util/zstd.cpp /usr/src/debug/ccache/4.12/src/ccache/hashutil.cpp /usr/s
 rc/debug/ccache/4.12/src/ccache/hashutil.hpp /usr/src/debug/ccache/4.12/src/ccache/util/bitset.hpp /usr/src/debug/ccache/4.12/src/ccache/util/format.hpp /usr/src/debug/ccache/4.12/src/ccache/progressbar.cpp /usr/src/debug/ccache/4.12/src/ccache/config.hpp /usr/src/debug/ccache/4.12/src/ccache/util/filelock.hpp /usr/src/debug/ccache/4.12/src/ccache/execute.cpp /usr/src/debug/ccache/4.12/src/ccache/execute.hpp /usr/src/debug/ccache/4.12/src/ccache/util/filesystem.cpp /usr/src/debug/ccache/4.12/src/ccache/util/filesystem.hpp /usr/src/debug/ccache/4.12/src/ccache/argsinfo.hpp /usr/src/debug/ccache/4.12/src/ccache/storage/storage.cpp /usr/src/debug/ccache/4.12/src/ccache/storage/storage.hpp /usr/src/debug/ccache/4.12/src/ccache/util/string.hpp /usr/src/debug/ccache/4.12/src/ccache/util/tokenizer.hpp /usr/src/debug/ccache/4.12/src/ccache/macroskip.hpp /usr/src/debug/ccache/4.12/src/ccache/util/timepoint.hpp /usr/src/debug/ccache/4.12/src/ccache/inodecache.cpp /usr/src/debug/ccache/4.12/sr
 c/ccache/util/xxh3_64.hpp /usr/src/debug/ccache/4.12/src/ccache/util/direntry.hpp /usr/src/debug/ccache/4.12/src/ccache/util/lockfile.hpp /usr/src/debug/ccache/4.12/src/ccache/util/tokenizer.cpp /usr/src/debug/ccache/4.12/src/ccache/compopt.cpp /usr/src/debug/ccache/4.12/src/ccache/compopt.hpp /usr/src/debug/ccache/4.12/src/ccache/util/noncopyable.hpp /usr/src/debug/ccache/4.12/src/ccache/signalhandler.cpp /usr/src/debug/ccache/4.12/src/ccache/util/threadpool.cpp /usr/src/debug/ccache/4.12/src/ccache/util/threadpool.hpp /usr/src/debug/ccache/4.12/src/ccache/util/temporaryfile.hpp /usr/src/debug/ccache/4.12/src/ccache/util/process.cpp /usr/src/debug/ccache/4.12/src/ccache/ccache.hpp /usr/src/debug/ccache/4.12/src/ccache/inodecache.hpp /usr/src/debug/ccache/4.12/src/ccache/util/logging.hpp /usr/src/debug/ccache/4.12/src/ccache/util/expected.hpp /usr/src/debug/ccache/4.12/src/ccache/util/assertions.cpp /usr/src/debug/ccache/4.12/src/ccache/util/assertions.hpp /usr/src/debug/ccache/4.12
 /src/ccache/util/bytes.cpp /usr/src/debug/ccache/4.12/src/ccache/util/clang.cpp /usr/src/debug/ccache/4.12/src/ccache/context.cpp /usr/src/debug/ccache/4.12/src/ccache/progressbar.hpp /usr/src/debug/ccache/4.12/src/ccache/context.hpp /usr/src/debug/ccache/4.12/src/ccache/util/cpu.cpp /usr/src/debug/ccache/4.12/src/ccache/util/cpu.hpp /usr/src/debug/ccache/4.12/src/ccache/config.cpp /usr/src/debug/ccache/4.12/src/ccache/argprocessing.cpp /usr/src/debug/ccache/4.12/src/ccache/util/lockfile.cpp /usr/src/debug/ccache/4.12/src/ccache/language.cpp /usr/src/debug/ccache/4.12/src/ccache/language.hpp /usr/src/debug/ccache/4.12/src/ccache/util/temporaryfile.cpp /usr/src/debug/ccache/4.12/src/ccache/version.cpp /usr/src/debug/ccache/4.12/src/ccache/argprocessing.hpp /usr/src/debug/ccache/4.12/src/ccache/ccache.cpp /usr/src/debug/ccache/4.12/src/ccache/util/memorymap.cpp /usr/src/debug/ccache/4.12/src/ccache/util/longlivedlockfilemanager.hpp /usr/src/debug/ccache/4.12/src/ccache/util/logging.cp
 p /usr/src/debug/ccache/4.12/src/ccache/util/duration.hpp /usr/src/debug/ccache/4.12/src/ccache/util/path.hpp /usr/src/debug/ccache/4.12/src/ccache/util/time.hpp /usr/src/debug/ccache/4.12/src/ccache/util/direntry.cpp /usr/src/debug/ccache/4.12/src/ccache/util/longlivedlockfilemanager.cpp /usr/src/debug/ccache/4.12/src/ccache/util/conversion.hpp /usr/src/debug/ccache/4.12/src/ccache/util/fd.hpp /usr/src/debug/ccache/4.12/src/ccache/util/memorymap.hpp /usr/src/debug/ccache/4.12/src/ccache/util/zstd.hpp /usr/src/debug/ccache/4.12/src/ccache/util/args.hpp /usr/src/debug/ccache/4.12/src/ccache/util/exec.hpp /usr/src/debug/ccache/4.12/src/ccache/util/types.hpp /usr/src/debug/ccache/4.12/src/ccache/util/file.hpp /usr/src/debug/ccache/4.12/src/ccache/util/bytes.hpp /usr/src/debug/ccache/4.12/src/ccache/util/clang.hpp /usr/src/debug/ccache/4.12/src/ccache/util/defer.hpp /usr/src/debug/ccache/4.12/src/ccache/util/environment.cpp /usr/src/debug/ccache/4.12/src/ccache/util/environment.hpp /usr
 /src/debug/ccache/4.12/src/ccache/util/timer.hpp /usr/src/debug/ccache/4.12/src/ccache/util/texttable.hpp /usr/src/debug/ccache/4.12/src/ccache/storage/types.hpp /usr/src/debug/ccache/4.12/src/ccache/hash.cpp /usr/src/debug/ccache/4.12/src/ccache/depfile.cpp /usr/src/debug/ccache/4.12/src/ccache/depfile.hpp /usr/src/debug/ccache/4.12/src/ccache/util/process.hpp /usr/src/debug/ccache/4.12/src/ccache/util/umaskscope.cpp /usr/src/debug/ccache/4.12/src/ccache/util/umaskscope.hpp /usr/src/debug/ccache/4.12/src/ccache/util/filelock.cpp /usr/src/debug/ccache/4.12/src/ccache/util/timepoint.cpp /usr/src/debug/ccache/4.12/src/ccache/signalhandler.hpp /usr/src/debug/ccache/4.12/src/ccache/hash.hpp /usr/src/debug/ccache/4.12/src/ccache/main.cpp /usr/src/debug/ccache/4.12/src/ccache/util/string.cpp /usr/src/debug/ccache/4.12/src/ccache/util/xxh3_128.hpp"
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGV changed from 4.11.3 [default] to 4.12 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PV changed from "4.11.3" to "4.12"
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.11.3 [default] to 4.12 [default]
packages/x86-64-v3-poky-linux/ccache/ccache: PKGSIZE changed from 1551768 to 1576416 (+2%)
packages/x86-64-v3-poky-linux/ccache/ccache: PV changed from "4.11.3" to "4.12"
packages/x86-64-v3-poky-linux/ccache/ccache: PKGV changed from 4.11.3 [default] to 4.12 [default]
packages/x86-64-v3-poky-linux/ccache: PV changed from "4.11.3" to "4.12"
packages/x86-64-v3-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.11.3/ccache-4.11.3.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.12/ccache-4.12.tar.gz"
packages/x86-64-v3-poky-linux/ccache: PKGV changed from 4.11.3 [default] to 4.12 [default]

--===============3858031650216913057==--

