Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE5BC83F2C
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.5672.1693650552812739238
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eExdewOF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IZnK0IxM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a55708502-b4f04d33-0965-4b7b-b732-6878b6c5ed71-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CuPBVE6IOmL4qFK9OJsjd0oTjWjPknN1SNqsF7n4edI=;
	b=eExdewOFHM9z8Amz6qh7iZTi4fdG+/6sguGXdR01i7bdR8vyI7Bo+iNIzMfGePWe
	5BwJn+M3PK5dgajOY4Pw6HGS7g5R3vjpl1j7FKjyAeAR0dP5foyXc5SDQKhof9meysH
	WbyH0YZWanPxt6UYajXrcKonX5ZhZ24QDI4qK3Y0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CuPBVE6IOmL4qFK9OJsjd0oTjWjPknN1SNqsF7n4edI=;
	b=IZnK0IxMeFkaInd902HaOZByWMzBp5bfbh5jnlEgkhQQV7nRnBLcyNQhrWEz7Moi
	mqU0ixb5ARwXNSjQCvrYRlJ2vB9FBpLMJpMpTos8c+kt1RYdg9yMbe/++kGm/x3GXRZ
	JIdbCAT5EZfNwe5eO/sJye2gvDsycmzjBNYCNyl4=
Content-Type: multipart/mixed; boundary="===============8112209686500762860=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.8.3 SUCCEEDED
Message-ID: <0101018a55708502-b4f04d33-0965-4b7b-b732-6878b6c5ed71-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187048

--===============8112209686500762860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ccache* to *4.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.8.2-4.8.3.patch
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
From b1bae2b7f8a707df58171a57520f1ab346fa35d3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 11:16:13 +0000
Subject: [PATCH] ccache: upgrade 4.8.2 -> 4.8.3

---
 .../{ccache_4.8.2.bb => ccache_4.8.3.bb}      | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.8.2.bb => ccache_4.8.3.bb} (48%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.8.2.bb b/meta/recipes-devtools/ccache/ccache_4.8.3.bb
similarity index 48%
rename from meta/recipes-devtools/ccache/ccache_4.8.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.8.3.bb
index 22a6b385b0..218d5851f0 100644
--- a/meta/recipes-devtools/ccache/ccache_4.8.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.8.3.bb
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
+# @@ -771,7 +771,7 @@
+#  from <https://github.com/Cyan4973/xxHash/releases>.
+#  
+#  ----
+# -Copyright (c) 2012-2020 Yann Collet
+# +Copyright (c) 2012-2021 Yann Collet
+#  All rights reserved.
+#  
+#  BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+# 
+#
+
 SUMMARY = "a fast C/C++ compiler cache"
 DESCRIPTION = "ccache is a compiler cache. It speeds up recompilation \
 by caching the result of previous compilations and detecting when the \
@@ -7,14 +29,14 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=cd54b7abfc462470b0f505273c38f0ff"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=6a6fe0ae4e57592b187ab72fa6d420ec"
 
 DEPENDS = "zstd"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
            "
-SRC_URI[sha256sum] = "75eef15b8b9da48db9c91e1d0ff58b3645fc70c0e4ca2ef1b6825a12f21f217d"
+SRC_URI[sha256sum] = "d59dd569ad2bbc826c0bc335c8ebd73e78ed0f2f40ba6b30069347e63585d9ef"
 
 inherit cmake github-releases
 
-- 
2.39.2


--===============8112209686500762860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ccache/ccache-dbg: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/ccache/ccache-dbg: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 25496680 to 25467316 (-0%)
packages/core2-32-poky-linux/ccache/ccache-dev: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/ccache/ccache-dev: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/ccache/ccache-doc: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/ccache/ccache-doc: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/ccache/ccache-locale: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/ccache/ccache-locale: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/ccache/ccache-src: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/ccache/ccache-src: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/ccache/ccache-src: PKGSIZE changed from 1927081 to 1977268 (+3%)
packages/core2-32-poky-linux/ccache/ccache-staticdev: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/ccache/ccache: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/ccache/ccache: PKGV changed from 4.8.2 [default] to 4.8.3 [default]
packages/core2-32-poky-linux/ccache: PV changed from "4.8.2" to "4.8.3"
packages/core2-32-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.8.2/ccache-4.8.2.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch" to "https://github.com/ccache/ccache/releases//download/v4.8.3/ccache-4.8.3.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch"
packages/core2-32-poky-linux/ccache: PKGV changed from 4.8.2 [default] to 4.8.3 [default]

--===============8112209686500762860==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.8.2-4.8.3.patch"

RnJvbSBiMWJhZTJiN2Y4YTcwN2RmNTgxNzFhNTc1MjBmMWFiMzQ2ZmEzNWQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxMToxNjoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNj
YWNoZTogdXBncmFkZSA0LjguMiAtPiA0LjguMwoKLS0tCiAuLi4ve2NjYWNoZV80LjguMi5iYiA9
PiBjY2FjaGVfNC44LjMuYmJ9ICAgICAgfCAyNiArKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY2NhY2hlL3tjY2FjaGVfNC44LjIuYmIgPT4gY2NhY2hlXzQuOC4zLmJi
fSAoNDglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hl
XzQuOC4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC44LjMuYmIK
c2ltaWxhcml0eSBpbmRleCA0OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nj
YWNoZS9jY2FjaGVfNC44LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2Fj
aGUvY2NhY2hlXzQuOC4zLmJiCmluZGV4IDIyYTZiMzg1YjAuLjIxOGQ1ODUxZjAgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuOC4yLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuOC4zLmJiCkBAIC0xLDMgKzEsMjUg
QEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRl
ZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5j
ZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBk
YXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdl
cyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMg
KGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMK
KyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLmFkb2MKKyMgKysrIExJQ0VOU0UuYWRv
YworIyBAQCAtNzcxLDcgKzc3MSw3IEBACisjICBmcm9tIDxodHRwczovL2dpdGh1Yi5jb20vQ3lh
bjQ5NzMveHhIYXNoL3JlbGVhc2VzPi4KKyMgIAorIyAgLS0tLQorIyAtQ29weXJpZ2h0IChjKSAy
MDEyLTIwMjAgWWFubiBDb2xsZXQKKyMgK0NvcHlyaWdodCAoYykgMjAxMi0yMDIxIFlhbm4gQ29s
bGV0CisjICBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgCisjICBCU0QgMi1DbGF1c2UgTGljZW5z
ZSAoaHR0cDovL3d3dy5vcGVuc291cmNlLm9yZy9saWNlbnNlcy9ic2QtbGljZW5zZS5waHApCisj
IAorIworCiBTVU1NQVJZID0gImEgZmFzdCBDL0MrKyBjb21waWxlciBjYWNoZSIKIERFU0NSSVBU
SU9OID0gImNjYWNoZSBpcyBhIGNvbXBpbGVyIGNhY2hlLiBJdCBzcGVlZHMgdXAgcmVjb21waWxh
dGlvbiBcCiBieSBjYWNoaW5nIHRoZSByZXN1bHQgb2YgcHJldmlvdXMgY29tcGlsYXRpb25zIGFu
ZCBkZXRlY3Rpbmcgd2hlbiB0aGUgXApAQCAtNywxNCArMjksMTQgQEAgSE9NRVBBR0UgPSAiaHR0
cDovL2NjYWNoZS5zYW1iYS5vcmciCiBTRUNUSU9OID0gImRldmVsIgogCiBMSUNFTlNFID0gIkdQ
TC0zLjAtb3ItbGF0ZXIiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLmFkb2M7
bWQ1PWNkNTRiN2FiZmM0NjI0NzBiMGY1MDUyNzNjMzhmMGZmIgorTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRS5hZG9jO21kNT02YTZmZTBhZTRlNTc1OTJiMTg3YWI3MmZhNmQ0MjBl
YyIKIAogREVQRU5EUyA9ICJ6c3RkIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9k
b3dubG9hZC92JHtQVn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEteHho
YXNoLmgtRml4LWJ1aWxkLXdpdGgtZ2NjLTEyLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjc1ZWVmMTViOGI5ZGE0OGRiOWM5MWUxZDBmZjU4YjM2NDVmYzcwYzBl
NGNhMmVmMWI2ODI1YTEyZjIxZjIxN2QiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDU5ZGQ1Njlh
ZDJiYmM4MjZjMGJjMzM1YzhlYmQ3M2U3OGVkMGYyZjQwYmE2YjMwMDY5MzQ3ZTYzNTg1ZDllZiIK
IAogaW5oZXJpdCBjbWFrZSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi4zOS4yCgo=

--===============8112209686500762860==--

