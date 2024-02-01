Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A265EC48BC0
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:15 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2152.1706810405225963034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=C50kA8ab;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qoEP7kmf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018d65d3fbba-e803704c-7963-4be1-a1ac-774667a7d00b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s0AZfhk/7+RyttpQBXVcS1chlcsR9qWeuKHgjYaBRvs=;
	b=C50kA8abYw6R1PFMkBcCYvPGocXlf9NdhbfHIPOurMhQn+/U3PXkWIwkKsCO28IG
	bc+ZeRea3TLMcPyeVzoWKjCo5o2ITsPcXWF/rC0/OzzWQcRORqnUVt/AePsSJAT7jVt
	a6qoMLAwxcMKf9GT1npS7rBwqTEK3f9OwPyWghH0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s0AZfhk/7+RyttpQBXVcS1chlcsR9qWeuKHgjYaBRvs=;
	b=qoEP7kmfvwPlQ8asflFbHFdv615kTbc/+yQmxDYbrVV1jO/EjteuuRzvUTV12OCm
	cZa6ncqs7QTnBel4INUacg5AH4Y99RR7W+UmoiaFDhS4aJx+qKR1Wc+iO1VfWh9hCTi
	J4pj/fC9WBO7jU69ZYGLMsDZsBLsi6VIR7pM2d2Q=
Content-Type: multipart/mixed; boundary="===============8550960385938040377=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpng: upgrading to 1.6.41 SUCCEEDED
Message-ID: <0101018d65d3fbba-e803704c-7963-4be1-a1ac-774667a7d00b-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194705

--===============8550960385938040377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpng* to *1.6.41* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpng-upgrade-1.6.40-1.6.41.patch
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
From f6a9ab4477aafad127d93bc57baac38a628ce352 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 15:21:12 +0000
Subject: [PATCH] libpng: upgrade 1.6.40 -> 1.6.41

---
 .../{libpng_1.6.40.bb => libpng_1.6.41.bb}    | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.40.bb => libpng_1.6.41.bb} (52%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.40.bb b/meta/recipes-multimedia/libpng/libpng_1.6.41.bb
similarity index 52%
rename from meta/recipes-multimedia/libpng/libpng_1.6.40.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.41.bb
index 293bf2858d..23e37704d8 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.40.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.41.bb
@@ -1,3 +1,27 @@
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
+# @@ -4,8 +4,8 @@
+#  PNG Reference Library License version 2
+#  ---------------------------------------
+#  
+# - * Copyright (c) 1995-2023 The PNG Reference Library Authors.
+# - * Copyright (c) 2018-2023 Cosmin Truta.
+# + * Copyright (c) 1995-2024 The PNG Reference Library Authors.
+# + * Copyright (c) 2018-2024 Cosmin Truta.
+#   * Copyright (c) 2000-2002, 2004, 2006-2018 Glenn Randers-Pehrson.
+#   * Copyright (c) 1996-1997 Andreas Dilger.
+#   * Copyright (c) 1995-1996 Guy Eric Schalnat, Group 42, Inc.
+# 
+#
+
 SUMMARY = "PNG image format decoding library"
 DESCRIPTION = "An open source project to develop and maintain the reference \
 library for use in applications that read, create, and manipulate PNG \
@@ -5,13 +29,13 @@ library for use in applications that read, create, and manipulate PNG \
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8f533bc367bfd43f556b6f782234c076"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0fdbfbe10fc294a6fca24dc76134222a"
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "535b479b2467ff231a3ec6d92a525906fb8ef27978be4f66dbe05d3f3a01b3a1"
+SRC_URI[sha256sum] = "d6a49a7a4abca7e44f72542030e53319c081fea508daccf4ecc7c6d9958d190f"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.42.0


--===============8550960385938040377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.40.0", added "/usr/lib/libpng16.so.16.41.0"
Changes to packages/core2-64-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.40.0 to libpng16.so.16.41.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.40.0 to libpng16.so.16.41.0
  /usr/lib/libpng16.so.16.40.0 moved to /usr/lib/libpng16.so.16.41.0

--===============8550960385938040377==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpng-upgrade-1.6.40-1.6.41.patch"

RnJvbSBmNmE5YWI0NDc3YWFmYWQxMjdkOTNiYzU3YmFhYzM4YTYyOGNlMzUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNToyMToxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBuZzogdXBncmFkZSAxLjYuNDAgLT4gMS42LjQxCgotLS0KIC4uLi97bGlicG5nXzEuNi40MC5i
YiA9PiBsaWJwbmdfMS42LjQxLmJifSAgICB8IDI4ICsrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy97bGlicG5nXzEuNi40MC5iYiA9PiBsaWJwbmdfMS42
LjQxLmJifSAoNTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBu
Zy9saWJwbmdfMS42LjQwLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlicG5nL2xpYnBu
Z18xLjYuNDEuYmIKc2ltaWxhcml0eSBpbmRleCA1MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvbGlicG5nL2xpYnBuZ18xLjYuNDAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjQxLmJiCmluZGV4IDI5M2JmMjg1OGQuLjIz
ZTM3NzA0ZDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJw
bmdfMS42LjQwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdf
MS42LjQxLmJiCkBAIC0xLDMgKzEsMjcgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VN
IHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZv
bGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGlj
ZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwg
YW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdM
aWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJp
Z2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNF
CisjICsrKyBMSUNFTlNFCisjIEBAIC00LDggKzQsOCBAQAorIyAgUE5HIFJlZmVyZW5jZSBMaWJy
YXJ5IExpY2Vuc2UgdmVyc2lvbiAyCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KKyMgIAorIyAtICogQ29weXJpZ2h0IChjKSAxOTk1LTIwMjMgVGhlIFBORyBSZWZl
cmVuY2UgTGlicmFyeSBBdXRob3JzLgorIyAtICogQ29weXJpZ2h0IChjKSAyMDE4LTIwMjMgQ29z
bWluIFRydXRhLgorIyArICogQ29weXJpZ2h0IChjKSAxOTk1LTIwMjQgVGhlIFBORyBSZWZlcmVu
Y2UgTGlicmFyeSBBdXRob3JzLgorIyArICogQ29weXJpZ2h0IChjKSAyMDE4LTIwMjQgQ29zbWlu
IFRydXRhLgorIyAgICogQ29weXJpZ2h0IChjKSAyMDAwLTIwMDIsIDIwMDQsIDIwMDYtMjAxOCBH
bGVubiBSYW5kZXJzLVBlaHJzb24uCisjICAgKiBDb3B5cmlnaHQgKGMpIDE5OTYtMTk5NyBBbmRy
ZWFzIERpbGdlci4KKyMgICAqIENvcHlyaWdodCAoYykgMTk5NS0xOTk2IEd1eSBFcmljIFNjaGFs
bmF0LCBHcm91cCA0MiwgSW5jLgorIyAKKyMKKwogU1VNTUFSWSA9ICJQTkcgaW1hZ2UgZm9ybWF0
IGRlY29kaW5nIGxpYnJhcnkiCiBERVNDUklQVElPTiA9ICJBbiBvcGVuIHNvdXJjZSBwcm9qZWN0
IHRvIGRldmVsb3AgYW5kIG1haW50YWluIHRoZSByZWZlcmVuY2UgXAogbGlicmFyeSBmb3IgdXNl
IGluIGFwcGxpY2F0aW9ucyB0aGF0IHJlYWQsIGNyZWF0ZSwgYW5kIG1hbmlwdWxhdGUgUE5HIFwK
QEAgLTUsMTMgKzI5LDEzIEBAIGxpYnJhcnkgZm9yIHVzZSBpbiBhcHBsaWNhdGlvbnMgdGhhdCBy
ZWFkLCBjcmVhdGUsIGFuZCBtYW5pcHVsYXRlIFBORyBcCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3
LmxpYnBuZy5vcmcvIgogU0VDVElPTiA9ICJsaWJzIgogTElDRU5TRSA9ICJMaWJwbmciCi1MSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT04ZjUzM2JjMzY3YmZkNDNmNTU2YjZm
NzgyMjM0YzA3NiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTBmZGJm
YmUxMGZjMjk0YTZmY2EyNGRjNzYxMzQyMjJhIgogREVQRU5EUyA9ICJ6bGliIgogCiBMSUJWID0g
IjE2IgogCiBTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9SfS8ke0JQTn0vJHtCUE59JHtM
SUJWfS8ke0JQfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTM1YjQ3OWIyNDY3ZmYy
MzFhM2VjNmQ5MmE1MjU5MDZmYjhlZjI3OTc4YmU0ZjY2ZGJlMDVkM2YzYTAxYjNhMSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJkNmE0OWE3YTRhYmNhN2U0NGY3MjU0MjAzMGU1MzMxOWMwODFmZWE1
MDhkYWNjZjRlY2M3YzZkOTk1OGQxOTBmIgogCiBNSVJST1JTICs9ICIke1NPVVJDRUZPUkdFX01J
UlJPUn0vJHtCUE59LyR7QlBOfSR7TElCVn0vICR7U09VUkNFRk9SR0VfTUlSUk9SfS8ke0JQTn0v
JHtCUE59JHtMSUJWfS9vbGRlci1yZWxlYXNlcy8iCiAKLS0gCjIuNDIuMAoK

--===============8550960385938040377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libpng: PKGV changed from 1.6.40 [default] to 1.6.41 [default]
packages/core2-64-poky-linux/libpng: SRC_URI changed from "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.40.tar.xz" to "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.41.tar.xz"
packages/core2-64-poky-linux/libpng: PV changed from "1.6.40" to "1.6.41"
packages/core2-64-poky-linux/libpng/libpng-dbg: PKGV changed from 1.6.40 [default] to 1.6.41 [default]
packages/core2-64-poky-linux/libpng/libpng-dbg: PV changed from "1.6.40" to "1.6.41"
packages/core2-64-poky-linux/libpng/libpng-dbg: PKGSIZE changed from 783128 to 789976 (+1%)
packages/core2-64-poky-linux/libpng/libpng-dbg: FILELIST: removed "/usr/lib/.debug/libpng16.so.16.40.0", added "/usr/lib/.debug/libpng16.so.16.41.0"
packages/core2-64-poky-linux/libpng/libpng-dev: PKGV changed from 1.6.40 [default] to 1.6.41 [default]
packages/core2-64-poky-linux/libpng/libpng-dev: PV changed from "1.6.40" to "1.6.41"
packages/core2-64-poky-linux/libpng/libpng-dev: PKGSIZE changed from 173805 to 174152 (+0%)
packages/core2-64-poky-linux/libpng/libpng-doc: PKGV changed from 1.6.40 [default] to 1.6.41 [default]
packages/core2-64-poky-linux/libpng/libpng-doc: PV changed from "1.6.40" to "1.6.41"
packages/core2-64-poky-linux/libpng/libpng-doc: PKGSIZE changed from 268838 to 268850 (+0%)
packages/core2-64-poky-linux/libpng/libpng-locale: PKGV changed from 1.6.40 [default] to 1.6.41 [default]
packages/core2-64-poky-linux/libpng/libpng-locale: PV changed from "1.6.40" to "1.6.41"
packages/core2-64-poky-linux/libpng/libpng-src: PKGV changed from 1.6.40 [default] to 1.6.41 [default]
packages/core2-64-poky-linux/libpng/libpng-src: PV changed from "1.6.40" to "1.6.41"
packages/core2-64-poky-linux/libpng/libpng-src: PKGSIZE changed from 1398447 to 1400452 (+0%)
packages/core2-64-poky-linux/libpng/libpng-staticdev: PKGV changed from 1.6.40 [default] to 1.6.41 [default]
packages/core2-64-poky-linux/libpng/libpng-staticdev: PV changed from "1.6.40" to "1.6.41"
packages/core2-64-poky-linux/libpng/libpng-tools: PKGV changed from 1.6.40 [default] to 1.6.41 [default]
packages/core2-64-poky-linux/libpng/libpng-tools: PV changed from "1.6.40" to "1.6.41"
packages/core2-64-poky-linux/libpng/libpng: PKGV changed from 1.6.40 [default] to 1.6.41 [default]
packages/core2-64-poky-linux/libpng/libpng: PV changed from "1.6.40" to "1.6.41"
packages/core2-64-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.40.0", added "/usr/lib/libpng16.so.16.41.0"
Changes to packages/core2-64-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.40.0 to libpng16.so.16.41.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.40.0 to libpng16.so.16.41.0
  /usr/lib/libpng16.so.16.40.0 moved to /usr/lib/libpng16.so.16.41.0

--===============8550960385938040377==--

