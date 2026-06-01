Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1081FCD6E6C
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1553.1780328129208539660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Z/8xXI53;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=unE3UATB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e83d35f22-e5035efd-c2f2-48a5-820f-bae7358296d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328128;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4w1dGo6qwprTeVqB0OIqP4j+tEaZRxSL/NO0BIC0xis=;
	b=Z/8xXI53DH3UafnfY5lMVwKUW5K64VgawVEiOpnvh3gDuh8p5RokyuHrysKqYgOk
	rFwRSpjzPx6S7384CPtNKUebWFVfSZl1r2ktIY0OxjnLR6gCyClnnXCcXSEVtBHap4A
	YSNsKLkCDGMKTuzRqQdmFx3Xx0PKhzgXOH26h/Zw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328128;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4w1dGo6qwprTeVqB0OIqP4j+tEaZRxSL/NO0BIC0xis=;
	b=unE3UATBY91VNRWuNXapYh8r0C9CxnA1Zfx9QYSBAywlMrrsKxvvqydjB/RUhIVv
	N4TaZO2SKv8GKQTo2eEeuEGbBlowkqUjsqC3xPExdnmnnhEqaZxiWbLxYsis6baSzKt
	oCqXM6XmV+kNiiRlJDEW/KHxjS6CjtrzZWNIvt7A=
Content-Type: multipart/mixed; boundary="===============4130130649674978133=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake,cmake-native: upgrading to 4.3.3,4.3.3 SUCCEEDED
Message-ID: <0101019e83d35f22-e5035efd-c2f2-48a5-820f-bae7358296d2-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237843

--===============4130130649674978133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake,cmake-native* to *4.3.3,4.3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-cmake-native-upgrade-4.3.2-4.3.3-4.3.2-4.3.3.patch
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
From 8c487eb19916910cc83ff0e354a16f55df286ac4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 05:47:43 +0000
Subject: [PATCH] cmake,cmake-native: upgrade 4.3.2 -> 4.3.3,4.3.2 -> 4.3.3

---
 .../cmake/{cmake-native_4.3.2.bb => cmake-native_4.3.3.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.3.2.bb => cmake_4.3.3.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.3.2.bb => cmake-native_4.3.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.3.2.bb => cmake_4.3.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb b/meta/recipes-devtools/cmake/cmake-native_4.3.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.3.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.3.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 889badb772..f183f823e3 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "b0231eb39b3c3cabdc568c619df78208a7bd95ea10c9b2236d61218bac1b367d"
+SRC_URI[sha256sum] = "cba4bb7a44edf2877bb6f059932896383babe435b3a8c3b5df48b4aa41c9bb85"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.3.2.bb b/meta/recipes-devtools/cmake/cmake_4.3.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.3.2.bb
rename to meta/recipes-devtools/cmake/cmake_4.3.3.bb
-- 
2.47.1


--===============4130130649674978133==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-cmake-native-upgrade-4.3.2-4.3.3-4.3.2-4.3.3.patch"

RnJvbSA4YzQ4N2ViMTk5MTY5MTBjYzgzZmYwZTM1NGExNmY1NWRmMjg2YWM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNTo0Nzo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlLGNtYWtlLW5hdGl2ZTogdXBncmFkZSA0LjMuMiAtPiA0LjMuMyw0LjMuMiAtPiA0LjMuMwoK
LS0tCiAuLi4vY21ha2Uve2NtYWtlLW5hdGl2ZV80LjMuMi5iYiA9PiBjbWFrZS1uYXRpdmVfNC4z
LjMuYmJ9ICAgICAgfCAwCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21h
a2Uve2NtYWtlXzQuMy4yLmJiID0+IGNtYWtlXzQuMy4zLmJifSAgfCAwCiAzIGZpbGVzIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL3tjbWFrZS1uYXRpdmVfNC4zLjIuYmIgPT4gY21ha2UtbmF0aXZlXzQuMy4z
LmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzQu
My4yLmJiID0+IGNtYWtlXzQuMy4zLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzQuMy4yLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80LjMuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80LjMu
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80
LjMuMy5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmlu
YyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKaW5kZXggODg5YmFkYjc3
Mi4uZjE4M2Y4MjNlMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCkBAIC0x
OSw3ICsxOSw3IEBAIENNQUtFX01BSk9SX1ZFUlNJT04gPSAiJHtAJy4nLmpvaW4oZC5nZXRWYXIo
J1BWJykuc3BsaXQoJy4nKVswOjJdKX0iCiBTUkNfVVJJID0gImh0dHBzOi8vY21ha2Uub3JnL2Zp
bGVzL3Yke0NNQUtFX01BSk9SX1ZFUlNJT059L2NtYWtlLSR7UFZ9LnRhci5neiBcCiAgICAgICAg
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImIwMjMxZWIzOWIzYzNjYWJkYzU2OGM2MTlk
Zjc4MjA4YTdiZDk1ZWExMGM5YjIyMzZkNjEyMThiYWMxYjM2N2QiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiY2JhNGJiN2E0NGVkZjI4NzdiYjZmMDU5OTMyODk2MzgzYmFiZTQzNWIzYThjM2I1ZGY0
OGI0YWE0MWM5YmI4NSIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiY21ha2UtKD9QPHB2ZXI+
XGQrKFwuXGQrKSspXC50YXIiCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9j
bWFrZS9jbWFrZV80LjMuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV80
LjMuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlXzQuMy4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY21ha2UvY21ha2VfNC4zLjMuYmIKLS0gCjIuNDcuMQoK

--===============4130130649674978133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PV changed from "4.3.2" to "4.3.3"
packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PKGV changed from 4.3.2 [default] to 4.3.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PV changed from "4.3.2" to "4.3.3"
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGV changed from 4.3.2 [default] to 4.3.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1295569624 to 1294345640 (-0%)
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PV changed from "4.3.2" to "4.3.3"
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PKGV changed from 4.3.2 [default] to 4.3.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PV changed from "4.3.2" to "4.3.3"
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PKGV changed from 4.3.2 [default] to 4.3.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PV changed from "4.3.2" to "4.3.3"
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PKGV changed from 4.3.2 [default] to 4.3.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-src: PV changed from "4.3.2" to "4.3.3"
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGV changed from 4.3.2 [default] to 4.3.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGSIZE changed from 10366504 to 10368138 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake-src: FILELIST: directory renamed /usr/src/debug/cmake/4.3.2/Source/CTest -> /usr/src/debug/cmake/4.3.3/Source/CTest, directory renamed /usr/src/debug/cmake/4.3.2/Utilities/cmlibarchive/libarchive -> /usr/src/debug/cmake/4.3.3/Utilities/cmlibarchive/libarchive, directory renamed /usr/src/debug/cmake/4.3.2/Utilities/cmelf -> /usr/src/debug/cmake/4.3.3/Utilities/cmelf, directory renamed /usr/src/debug/cmake/4.3.2/Utilities/cmjsoncpp/src/lib_json -> /usr/src/debug/cmake/4.3.3/Utilities/cmjsoncpp/src/lib_json, directory renamed /usr/src/debug/cmake/4.3.2/Source/CPack -> /usr/src/debug/cmake/4.3.3/Source/CPack, directory renamed /usr/src/debug/cmake/4.3.2/Utilities/std/cm -> /usr/src/debug/cmake/4.3.3/Utilities/std/cm, directory renamed /usr/src/debug/cmake/4.3.2/Utilities/std/cmext -> /usr/src/debug/cmake/4.3.3/Utilities/std/cmext, directory renamed /usr/src/debug/cmake/4.3.2/Utilities/cmjsoncpp/include/json -> /usr/src/debug/cmake/4.3.3/Utilities
 /cmjsoncpp/include/json, directory renamed /usr/src/debug/cmake/4.3.2/Source -> /usr/src/debug/cmake/4.3.3/Source, directory renamed /usr/src/debug/cmake/4.3.2/Source/CPack/IFW -> /usr/src/debug/cmake/4.3.3/Source/CPack/IFW, directory renamed /usr/src/debug/cmake/4.3.2/Utilities/std/cm/bits -> /usr/src/debug/cmake/4.3.3/Utilities/std/cm/bits, directory renamed /usr/src/debug/cmake/4.3.2/Source/LexerParser -> /usr/src/debug/cmake/4.3.3/Source/LexerParser, directory renamed /usr/src/debug/cmake/4.3.2/Source/kwsys -> /usr/src/debug/cmake/4.3.3/Source/kwsys, directory renamed /usr/src/debug/cmake/4.3.2/Utilities/cmlibrhash/librhash -> /usr/src/debug/cmake/4.3.3/Utilities/cmlibrhash/librhash, directory renamed /usr/src/debug/cmake/4.3.2/Utilities/cmllpkgc -> /usr/src/debug/cmake/4.3.3/Utilities/cmllpkgc, directory renamed /usr/src/debug/cmake/4.3.2/Source/cmsys -> /usr/src/debug/cmake/4.3.3/Source/cmsys
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PV changed from "4.3.2" to "4.3.3"
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PKGV changed from 4.3.2 [default] to 4.3.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake: PV changed from "4.3.2" to "4.3.3"
packages/x86-64-v3-poky-linux/cmake/cmake: PKGV changed from 4.3.2 [default] to 4.3.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake: PKGSIZE changed from 52644294 to 52650806 (+0%)
packages/x86-64-v3-poky-linux/cmake: PV changed from "4.3.2" to "4.3.3"
packages/x86-64-v3-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v4.3/cmake-4.3.2.tar.gz" to "https://cmake.org/files/v4.3/cmake-4.3.3.tar.gz"
packages/x86-64-v3-poky-linux/cmake: PKGV changed from 4.3.2 [default] to 4.3.3 [default]

--===============4130130649674978133==--

