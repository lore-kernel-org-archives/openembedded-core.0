Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1ABCD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 05:53:31 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13128.1781762008736868526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 22:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=m8QR2pg/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CIT/nEBI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ed94aa321-4ffe1669-6c3b-49e1-b254-0619443db278-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781762008;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AhpGR9tPK5td4ejo+1g6W4K3/ysJaZh6rSjcgGvuNy0=;
	b=m8QR2pg/LQY3LuK4NqsaGsMChgCGj4ie5MRWkLew25akU04jyLTVUtLNuuAq6UAu
	FcGYLZcA8FsZtr2GK6jwo9mmyQvhIvtmFwUTYs9ow83uFzsi4220i51V1dJdGlacTvT
	cFoSuD6clejtBNbeguL2LryoUQr1fZ/h2kMKjQv4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781762008;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AhpGR9tPK5td4ejo+1g6W4K3/ysJaZh6rSjcgGvuNy0=;
	b=CIT/nEBIRuau33rrPV5/nxOvH+Fwm+EkElyz8eMvk4BGj8VMLQX6mr6oN6w4iYu4
	zXnVAs7W1hGQGDhb+7pJ02FbNrsOUoAiPP3gHWub9rxWLbZd8D1mxvecxraG7lgJ3ud
	fMyNh/PBhIbWRX0bVhaEAMDrhhFFPXt4Hfnip0m4=
Content-Type: multipart/mixed; boundary="===============1683997187017064723=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake,cmake-native: upgrading to 4.3.4,4.3.4 SUCCEEDED
Message-ID: <0101019ed94aa321-4ffe1669-6c3b-49e1-b254-0619443db278-000000@us-west-2.amazonses.com>
Date: Thu, 18 Jun 2026 05:53:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 05:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239047

--===============1683997187017064723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake,cmake-native* to *4.3.4,4.3.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-cmake-native-upgrade-4.3.3-4.3.4-4.3.3-4.3.4.patch
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
From e1f923b3223e1215eb30c0c9f0c2d0fdd0af4e4f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 18 Jun 2026 05:27:09 +0000
Subject: [PATCH] cmake,cmake-native: upgrade 4.3.3 -> 4.3.4,4.3.3 -> 4.3.4

---
 .../cmake/{cmake-native_4.3.3.bb => cmake-native_4.3.4.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.3.3.bb => cmake_4.3.4.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.3.3.bb => cmake-native_4.3.4.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.3.3.bb => cmake_4.3.4.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.3.3.bb b/meta/recipes-devtools/cmake/cmake-native_4.3.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.3.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.3.4.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index f183f823e3..f08b0715ba 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "cba4bb7a44edf2877bb6f059932896383babe435b3a8c3b5df48b4aa41c9bb85"
+SRC_URI[sha256sum] = "fdeff897b9eb49d764539f2b1edc6eb7e1440df325678a97c1978499e931adda"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.3.3.bb b/meta/recipes-devtools/cmake/cmake_4.3.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.3.3.bb
rename to meta/recipes-devtools/cmake/cmake_4.3.4.bb
-- 
2.47.1


--===============1683997187017064723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PKGV changed from 4.3.3 [default] to 4.3.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PV changed from "4.3.3" to "4.3.4"
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1294346000 to 1295130800 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGV changed from 4.3.3 [default] to 4.3.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PV changed from "4.3.3" to "4.3.4"
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PKGV changed from 4.3.3 [default] to 4.3.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PV changed from "4.3.3" to "4.3.4"
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PKGV changed from 4.3.3 [default] to 4.3.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PV changed from "4.3.3" to "4.3.4"
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PKGV changed from 4.3.3 [default] to 4.3.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PV changed from "4.3.3" to "4.3.4"
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGSIZE changed from 10368138 to 10372626 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGV changed from 4.3.3 [default] to 4.3.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-src: FILELIST: directory renamed /usr/src/debug/cmake/4.3.3/Source/kwsys -> /usr/src/debug/cmake/4.3.4/Source/kwsys, directory renamed /usr/src/debug/cmake/4.3.3/Utilities/cmjsoncpp/src/lib_json -> /usr/src/debug/cmake/4.3.4/Utilities/cmjsoncpp/src/lib_json, directory renamed /usr/src/debug/cmake/4.3.3/Utilities/std/cm/bits -> /usr/src/debug/cmake/4.3.4/Utilities/std/cm/bits, directory renamed /usr/src/debug/cmake/4.3.3/Utilities/cmlibarchive/libarchive -> /usr/src/debug/cmake/4.3.4/Utilities/cmlibarchive/libarchive, directory renamed /usr/src/debug/cmake/4.3.3/Source/CPack -> /usr/src/debug/cmake/4.3.4/Source/CPack, directory renamed /usr/src/debug/cmake/4.3.3/Source -> /usr/src/debug/cmake/4.3.4/Source, directory renamed /usr/src/debug/cmake/4.3.3/Utilities/cmjsoncpp/include/json -> /usr/src/debug/cmake/4.3.4/Utilities/cmjsoncpp/include/json, directory renamed /usr/src/debug/cmake/4.3.3/Utilities/std/cmext -> /usr/src/debug/cmake/4.3.4/Util
 ities/std/cmext, directory renamed /usr/src/debug/cmake/4.3.3/Source/cmsys -> /usr/src/debug/cmake/4.3.4/Source/cmsys, directory renamed /usr/src/debug/cmake/4.3.3/Utilities/std/cm -> /usr/src/debug/cmake/4.3.4/Utilities/std/cm, directory renamed /usr/src/debug/cmake/4.3.3/Utilities/cmlibrhash/librhash -> /usr/src/debug/cmake/4.3.4/Utilities/cmlibrhash/librhash, directory renamed /usr/src/debug/cmake/4.3.3/Source/LexerParser -> /usr/src/debug/cmake/4.3.4/Source/LexerParser, directory renamed /usr/src/debug/cmake/4.3.3/Utilities/cmllpkgc -> /usr/src/debug/cmake/4.3.4/Utilities/cmllpkgc, directory renamed /usr/src/debug/cmake/4.3.3/Source/CPack/IFW -> /usr/src/debug/cmake/4.3.4/Source/CPack/IFW, directory renamed /usr/src/debug/cmake/4.3.3/Utilities/cmelf -> /usr/src/debug/cmake/4.3.4/Utilities/cmelf, directory renamed /usr/src/debug/cmake/4.3.3/Source/CTest -> /usr/src/debug/cmake/4.3.4/Source/CTest
packages/x86-64-v3-poky-linux/cmake/cmake-src: PV changed from "4.3.3" to "4.3.4"
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PKGV changed from 4.3.3 [default] to 4.3.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PV changed from "4.3.3" to "4.3.4"
packages/x86-64-v3-poky-linux/cmake/cmake: PKGSIZE changed from 52650806 to 52686116 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake: PKGV changed from 4.3.3 [default] to 4.3.4 [default]
packages/x86-64-v3-poky-linux/cmake/cmake: PV changed from "4.3.3" to "4.3.4"
packages/x86-64-v3-poky-linux/cmake: PKGV changed from 4.3.3 [default] to 4.3.4 [default]
packages/x86-64-v3-poky-linux/cmake: PV changed from "4.3.3" to "4.3.4"
packages/x86-64-v3-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v4.3/cmake-4.3.3.tar.gz" to "https://cmake.org/files/v4.3/cmake-4.3.4.tar.gz"

--===============1683997187017064723==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-cmake-native-upgrade-4.3.3-4.3.4-4.3.3-4.3.4.patch"

RnJvbSBlMWY5MjNiMzIyM2UxMjE1ZWIzMGMwYzlmMGMyZDBmZGQwYWY0ZTRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTggSnVuIDIwMjYgMDU6Mjc6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZSxjbWFrZS1uYXRpdmU6IHVwZ3JhZGUgNC4zLjMgLT4gNC4zLjQsNC4zLjMgLT4gNC4zLjQK
Ci0tLQogLi4uL2NtYWtlL3tjbWFrZS1uYXRpdmVfNC4zLjMuYmIgPT4gY21ha2UtbmF0aXZlXzQu
My40LmJifSAgICAgIHwgMAogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nt
YWtlL3tjbWFrZV80LjMuMy5iYiA9PiBjbWFrZV80LjMuNC5iYn0gIHwgMAogMyBmaWxlcyBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS97Y21ha2UtbmF0aXZlXzQuMy4zLmJiID0+IGNtYWtlLW5hdGl2ZV80LjMu
NC5iYn0gKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV80
LjMuMy5iYiA9PiBjbWFrZV80LjMuNC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80LjMuMy5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfNC4zLjQuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfNC4z
LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVf
NC4zLjQuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5p
bmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCmluZGV4IGYxODNmODIz
ZTMuLmYwOGIwNzE1YmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9j
bWFrZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYwpAQCAt
MTksNyArMTksNyBAQCBDTUFLRV9NQUpPUl9WRVJTSU9OID0gIiR7QCcuJy5qb2luKGQuZ2V0VmFy
KCdQVicpLnNwbGl0KCcuJylbMDoyXSl9IgogU1JDX1VSSSA9ICJodHRwczovL2NtYWtlLm9yZy9m
aWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9OfS9jbWFrZS0ke1BWfS50YXIuZ3ogXAogICAgICAg
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjYmE0YmI3YTQ0ZWRmMjg3N2JiNmYwNTk5
MzI4OTYzODNiYWJlNDM1YjNhOGMzYjVkZjQ4YjRhYTQxYzliYjg1IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImZkZWZmODk3YjllYjQ5ZDc2NDUzOWYyYjFlZGM2ZWI3ZTE0NDBkZjMyNTY3OGE5N2Mx
OTc4NDk5ZTkzMWFkZGEiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImNtYWtlLSg/UDxwdmVy
PlxkKyhcLlxkKykrKVwudGFyIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2UvY21ha2VfNC4zLjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2Vf
NC4zLjQuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZV80LjMuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2NtYWtlL2NtYWtlXzQuMy40LmJiCi0tIAoyLjQ3LjEKCg==

--===============1683997187017064723==--

