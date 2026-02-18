Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8F1C531CF
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:48 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1415.1771440097149094134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Wpxxujn6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UBsQGfvc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019c720ed245-3ba8458b-7064-49f5-a6bb-edb8295f35ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440100;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Hh30Cp94K5yjJWf9Lgj9nlamK9t4hfjm0u0qSRvv1DQ=;
	b=Wpxxujn6Ei3h/2zWzYKDEKCy8M4BL0HkeR473ajCuCyz1j3nHxECcqyMCXSYIw6s
	pDF8CeKJsnXF8AJ+PE8g3PUWSfLQ2cRe7XcRC2gumWxJC9blEvcP9UOyYUZh3ZOrl1K
	emcLJdolLlB0ITbOUNEnJZxnRXG3T9GwqWWpuNnU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440100;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Hh30Cp94K5yjJWf9Lgj9nlamK9t4hfjm0u0qSRvv1DQ=;
	b=UBsQGfvcNlhaCtQR2ubvc1pF+eQoo3BywqsLAB+Gm0q7/78WwSZA7MPKpQEM00/u
	Bb5Nppe64lWHlw8ZQC2UgGbydD0cTuKNVXFcXty9GQb77qI8g6LakLxfgKSYkArBasE
	guzXLl8G5Z7f7Z7u3xTBnf/dKN97ADP1CAXgAfBM=
Content-Type: multipart/mixed; boundary="===============1941438402812328553=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.12.3 SUCCEEDED
Message-ID: <0101019c720ed245-3ba8458b-7064-49f5-a6bb-edb8295f35ae-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231345

--===============1941438402812328553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.12.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.12.2-4.12.3.patch
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
From 76cc43692f46919e5b30f8218bedc7c8cd56a966 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 12:49:15 +0000
Subject: [PATCH] ccache: upgrade 4.12.2 -> 4.12.3

---
 .../{ccache_4.12.2.bb => ccache_4.12.3.bb}    | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.2.bb => ccache_4.12.3.bb} (61%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.2.bb b/meta/recipes-devtools/ccache/ccache_4.12.3.bb
similarity index 61%
rename from meta/recipes-devtools/ccache/ccache_4.12.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.3.bb
index 28f36e5ed7..c7c8e1342d 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.3.bb
@@ -1,3 +1,25 @@
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
+# @@ -35,7 +35,7 @@
+#  
+#  ----
+#  Copyright (C) 2002-2007 Andrew Tridgell
+# -Copyright (C) 2009-2025 Joel Rosdahl and other contributors
+# +Copyright (C) 2009-2026 Joel Rosdahl and other contributors
+#  ----
+#  
+#  
+# 
+#
+
 SUMMARY = "a fast C/C++ compiler cache"
 DESCRIPTION = "ccache is a compiler cache. It speeds up recompilation \
 by caching the result of previous compilations and detecting when the \
@@ -7,7 +29,7 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=5633f18ca110f0d4cb907eba07c920ef \
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=22ef4326c8a14ac937fc2b76ef0fd233 \
                     file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=663aca6f84e7d67ade228aad32afc0ea \
                     file://src/third_party/nonstd-span/nonstd/span.hpp;endline=9;md5=b4af92a7f068b38c5b3410dceb30c186 \
                     file://src/third_party/win32-compat/win32/mktemp.c;endline=17;md5=d287e9c1f1cd2bb2bd164490e1cf449a \
@@ -17,7 +39,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "2a087efb66b62d4c66d4eb276748bbfa797ff3bde20adf44c53e5a8b9f3679af"
+SRC_URI[sha256sum] = "d683d5964a395f00c1c812ea1d1d523179f1097cbff7e7e54e714fa3f99711b1"
 
 inherit cmake github-releases
 
-- 
2.47.1


--===============1941438402812328553==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.12.2-4.12.3.patch"

RnJvbSA3NmNjNDM2OTJmNDY5MTllNWIzMGY4MjE4YmVkYzdjOGNkNTZhOTY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTI6NDk6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC4xMi4yIC0+IDQuMTIuMwoKLS0tCiAuLi4ve2NjYWNoZV80LjEyLjIu
YmIgPT4gY2NhY2hlXzQuMTIuMy5iYn0gICAgfCAyNiArKysrKysrKysrKysrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL3tjY2FjaGVfNC4xMi4yLmJiID0+IGNjYWNoZV80LjEy
LjMuYmJ9ICg2MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9j
Y2FjaGVfNC4xMi4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4x
Mi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggNjElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9jY2FjaGUvY2NhY2hlXzQuMTIuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2NjYWNoZS9jY2FjaGVfNC4xMi4zLmJiCmluZGV4IDI4ZjM2ZTVlZDcuLmM3YzhlMTM0MmQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTIuMi5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjEyLjMuYmIKQEAg
LTEsMyArMSwyNSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUg
YmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRo
ZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisj
IFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXpl
IHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRl
OicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBk
YXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UuYWRvYworIyArKysg
TElDRU5TRS5hZG9jCisjIEBAIC0zNSw3ICszNSw3IEBACisjICAKKyMgIC0tLS0KKyMgIENvcHly
aWdodCAoQykgMjAwMi0yMDA3IEFuZHJldyBUcmlkZ2VsbAorIyAtQ29weXJpZ2h0IChDKSAyMDA5
LTIwMjUgSm9lbCBSb3NkYWhsIGFuZCBvdGhlciBjb250cmlidXRvcnMKKyMgK0NvcHlyaWdodCAo
QykgMjAwOS0yMDI2IEpvZWwgUm9zZGFobCBhbmQgb3RoZXIgY29udHJpYnV0b3JzCisjICAtLS0t
CisjICAKKyMgIAorIyAKKyMKKwogU1VNTUFSWSA9ICJhIGZhc3QgQy9DKysgY29tcGlsZXIgY2Fj
aGUiCiBERVNDUklQVElPTiA9ICJjY2FjaGUgaXMgYSBjb21waWxlciBjYWNoZS4gSXQgc3BlZWRz
IHVwIHJlY29tcGlsYXRpb24gXAogYnkgY2FjaGluZyB0aGUgcmVzdWx0IG9mIHByZXZpb3VzIGNv
bXBpbGF0aW9ucyBhbmQgZGV0ZWN0aW5nIHdoZW4gdGhlIFwKQEAgLTcsNyArMjksNyBAQCBIT01F
UEFHRSA9ICJodHRwOi8vY2NhY2hlLnNhbWJhLm9yZyIKIFNFQ1RJT04gPSAiZGV2ZWwiCiAKIExJ
Q0VOU0UgPSAiR1BMLTMuMC1vci1sYXRlciAmIE1JVCAmIEJTTC0xLjAgJiBJU0MiCi1MSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLmFkb2M7bWQ1PTU2MzNmMThjYTExMGYwZDRjYjkw
N2ViYTA3YzkyMGVmIFwKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuYWRvYztt
ZDU9MjJlZjQzMjZjOGExNGFjOTM3ZmMyYjc2ZWYwZmQyMzMgXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vc3JjL3RoaXJkX3BhcnR5L2NwcC1odHRwbGliL2h0dHBsaWIuaDtlbmRsaW5lPTY7
bWQ1PTY2M2FjYTZmODRlN2Q2N2FkZTIyOGFhZDMyYWZjMGVhIFwKICAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL3NyYy90aGlyZF9wYXJ0eS9ub25zdGQtc3Bhbi9ub25zdGQvc3Bhbi5ocHA7ZW5k
bGluZT05O21kNT1iNGFmOTJhN2YwNjhiMzhjNWIzNDEwZGNlYjMwYzE4NiBcCiAgICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9zcmMvdGhpcmRfcGFydHkvd2luMzItY29tcGF0L3dpbjMyL21rdGVt
cC5jO2VuZGxpbmU9MTc7bWQ1PWQyODdlOWMxZjFjZDJiYjJiZDE2NDQ5MGUxY2Y0NDlhIFwKQEAg
LTE3LDcgKzM5LDcgQEAgREVQRU5EUyA9ICJ6c3RkIGZtdCB4eGhhc2giCiAKIFNSQ19VUkkgPSAi
JHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS8ke0JQfS50YXIuZ3oiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICIyYTA4N2VmYjY2YjYyZDRjNjZkNGViMjc2NzQ4YmJmYTc5N2ZmM2Jk
ZTIwYWRmNDRjNTNlNWE4YjlmMzY3OWFmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ2ODNkNTk2
NGEzOTVmMDBjMWM4MTJlYTFkMWQ1MjMxNzlmMTA5N2NiZmY3ZTdlNTRlNzE0ZmEzZjk5NzExYjEi
CiAKIGluaGVyaXQgY21ha2UgZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIuNDcuMQoK

--===============1941438402812328553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 35031432 to 35025200 (-0%)
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PKGV changed from 4.12.2 [default] to 4.12.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dbg: PV changed from "4.12.2" to "4.12.3"
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PKGV changed from 4.12.2 [default] to 4.12.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-dev: PV changed from "4.12.2" to "4.12.3"
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PKGV changed from 4.12.2 [default] to 4.12.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-doc: PV changed from "4.12.2" to "4.12.3"
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PKGV changed from 4.12.2 [default] to 4.12.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-locale: PV changed from "4.12.2" to "4.12.3"
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGSIZE changed from 1802566 to 1804780 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache-src: PKGV changed from 4.12.2 [default] to 4.12.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-src: FILELIST: directory renamed /usr/src/debug/ccache/4.12.2/src/ccache/storage/remote -> /usr/src/debug/ccache/4.12.3/src/ccache/storage/remote, directory renamed /usr/src/debug/ccache/4.12.2/src/ccache/util -> /usr/src/debug/ccache/4.12.3/src/ccache/util, directory renamed /usr/src/debug/ccache/4.12.2/src/third_party/nonstd-span/nonstd -> /usr/src/debug/ccache/4.12.3/src/third_party/nonstd-span/nonstd, directory renamed /usr/src/debug/ccache/4.12.2/src/ccache/core -> /usr/src/debug/ccache/4.12.3/src/ccache/core, directory renamed /usr/src/debug/ccache/4.12.2/src/third_party/cxxurl/cxxurl -> /usr/src/debug/ccache/4.12.3/src/third_party/cxxurl/cxxurl, directory renamed /usr/src/debug/ccache/4.12.2/src/third_party/cpp-httplib -> /usr/src/debug/ccache/4.12.3/src/third_party/cpp-httplib, directory renamed /usr/src/debug/ccache/4.12.2/src/third_party/tl-expected/tl -> /usr/src/debug/ccache/4.12.3/src/third_party/tl-expected/tl, directory renam
 ed /usr/src/debug/ccache/4.12.2/src/ccache/storage -> /usr/src/debug/ccache/4.12.3/src/ccache/storage, directory renamed /usr/src/debug/ccache/4.12.2/src/ccache/storage/local -> /usr/src/debug/ccache/4.12.3/src/ccache/storage/local, directory renamed /usr/src/debug/ccache/4.12.2/src/third_party/blake3/blake3 -> /usr/src/debug/ccache/4.12.3/src/third_party/blake3/blake3, directory renamed /usr/src/debug/ccache/4.12.2/src/ccache -> /usr/src/debug/ccache/4.12.3/src/ccache
packages/x86-64-v3-poky-linux/ccache/ccache-src: PV changed from "4.12.2" to "4.12.3"
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.12.2 [default] to 4.12.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache-staticdev: PV changed from "4.12.2" to "4.12.3"
packages/x86-64-v3-poky-linux/ccache/ccache: PKGSIZE changed from 1576416 to 1580576 (+0%)
packages/x86-64-v3-poky-linux/ccache/ccache: PKGV changed from 4.12.2 [default] to 4.12.3 [default]
packages/x86-64-v3-poky-linux/ccache/ccache: PV changed from "4.12.2" to "4.12.3"
packages/x86-64-v3-poky-linux/ccache: PKGV changed from 4.12.2 [default] to 4.12.3 [default]
packages/x86-64-v3-poky-linux/ccache: PV changed from "4.12.2" to "4.12.3"
packages/x86-64-v3-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.12.2/ccache-4.12.2.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.12.3/ccache-4.12.3.tar.gz"

--===============1941438402812328553==--

