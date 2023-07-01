Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73CAC001B3
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:06 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.10494.1688227322577278755
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WitC6G2F;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101891230a007-35cb399d-7f0a-4448-88a5-ccbb1a870e7b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uUHczPnUxpNGgnQe9vUijK+cm11qzwUNkHTR6fwZbSM=;
	b=WitC6G2FRLXvll6bF5VGkwHjhkJfld2wbocsQSfRtLQzEYIhsVlI/6SHTwuGpBzO
	hFy8GsZ4vqyNKEloh5mMGHmZ+TAC0qqx0LmvnimzMSjA5hOGTVspqjeSC1RTn375dke
	itESS2fNIDURvSeiGPNaQkJ+756MtHQWU3YYtxzY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uUHczPnUxpNGgnQe9vUijK+cm11qzwUNkHTR6fwZbSM=;
	b=I1YcJMEOX7iaS1+YstvBmqc4vB6nQX2E9y/tMTMU31mFUT+ZOincpqUvWvxXwO4a
	k6K5bmipZPnvV0sAgYux/wrA1ccj2lCliF+tSNZL4vM9haPGfqSTx/suujzt5v/7JMx
	qPHMmD4xLnS7O3nM8bC8a6qoDvz03nxB9VFrE8zA=
Content-Type: multipart/mixed; boundary="===============9051658190080265926=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpng: upgrading to 1.6.40 SUCCEEDED
Message-ID: <010101891230a007-35cb399d-7f0a-4448-88a5-ccbb1a870e7b-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183758

--===============9051658190080265926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpng* to *1.6.40* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpng-upgrade-1.6.39-1.6.40.patch
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
From 08bc16c75a2730b537eb7264faf62d26cae6a311 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 14:08:16 +0000
Subject: [PATCH] libpng: upgrade 1.6.39 -> 1.6.40

---
 .../{libpng_1.6.39.bb => libpng_1.6.40.bb}    | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.39.bb => libpng_1.6.40.bb} (52%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.40.bb
similarity index 52%
rename from meta/recipes-multimedia/libpng/libpng_1.6.39.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.40.bb
index a6c229f5cf..f476de01f0 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.40.bb
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
+# - * Copyright (c) 1995-2022 The PNG Reference Library Authors.
+# - * Copyright (c) 2018-2022 Cosmin Truta.
+# + * Copyright (c) 1995-2023 The PNG Reference Library Authors.
+# + * Copyright (c) 2018-2023 Cosmin Truta.
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
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5c900cc124ba35a274073b5de7639b13"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8f533bc367bfd43f556b6f782234c076"
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"
+SRC_URI[sha256sum] = "535b479b2467ff231a3ec6d92a525906fb8ef27978be4f66dbe05d3f3a01b3a1"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.39.2


--===============9051658190080265926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.39.0", added "/usr/lib/libpng16.so.16.40.0"
Changes to packages/core2-32-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.39.0 to libpng16.so.16.40.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.39.0 to libpng16.so.16.40.0
  /usr/lib/libpng16.so.16.39.0 moved to /usr/lib/libpng16.so.16.40.0

--===============9051658190080265926==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpng-upgrade-1.6.39-1.6.40.patch"

RnJvbSAwOGJjMTZjNzVhMjczMGI1MzdlYjcyNjRmYWY2MmQyNmNhZTZhMzExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAxNDowODoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBuZzogdXBncmFkZSAxLjYuMzkgLT4gMS42LjQwCgotLS0KIC4uLi97bGlicG5nXzEuNi4zOS5i
YiA9PiBsaWJwbmdfMS42LjQwLmJifSAgICB8IDI4ICsrKysrKysrKysrKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy97bGlicG5nXzEuNi4zOS5iYiA9PiBsaWJwbmdfMS42
LjQwLmJifSAoNTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBu
Zy9saWJwbmdfMS42LjM5LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlicG5nL2xpYnBu
Z18xLjYuNDAuYmIKc2ltaWxhcml0eSBpbmRleCA1MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvbGlicG5nL2xpYnBuZ18xLjYuMzkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdfMS42LjQwLmJiCmluZGV4IGE2YzIyOWY1Y2YuLmY0
NzZkZTAxZjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJw
bmdfMS42LjM5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnBuZy9saWJwbmdf
MS42LjQwLmJiCkBAIC0xLDMgKzEsMjcgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VN
IHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZv
bGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGlj
ZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwg
YW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdM
aWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJp
Z2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNF
CisjICsrKyBMSUNFTlNFCisjIEBAIC00LDggKzQsOCBAQAorIyAgUE5HIFJlZmVyZW5jZSBMaWJy
YXJ5IExpY2Vuc2UgdmVyc2lvbiAyCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KKyMgIAorIyAtICogQ29weXJpZ2h0IChjKSAxOTk1LTIwMjIgVGhlIFBORyBSZWZl
cmVuY2UgTGlicmFyeSBBdXRob3JzLgorIyAtICogQ29weXJpZ2h0IChjKSAyMDE4LTIwMjIgQ29z
bWluIFRydXRhLgorIyArICogQ29weXJpZ2h0IChjKSAxOTk1LTIwMjMgVGhlIFBORyBSZWZlcmVu
Y2UgTGlicmFyeSBBdXRob3JzLgorIyArICogQ29weXJpZ2h0IChjKSAyMDE4LTIwMjMgQ29zbWlu
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
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01YzkwMGNjMTI0YmEzNWEyNzQwNzNi
NWRlNzYzOWIxMyIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PThmNTMz
YmMzNjdiZmQ0M2Y1NTZiNmY3ODIyMzRjMDc2IgogREVQRU5EUyA9ICJ6bGliIgogCiBMSUJWID0g
IjE2IgogCiBTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9SfS8ke0JQTn0vJHtCUE59JHtM
SUJWfS8ke0JQfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWY0Njk2Y2U3MGI0ZWU1
Zjg1ZjFlMTYyM2RjMTIyOWIyMTAwMjlmYTRiN2FlZTU3M2RmM2UyYmE3YjAzNjkzNyIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI1MzViNDc5YjI0NjdmZjIzMWEzZWM2ZDkyYTUyNTkwNmZiOGVmMjc5
NzhiZTRmNjZkYmUwNWQzZjNhMDFiM2ExIgogCiBNSVJST1JTICs9ICIke1NPVVJDRUZPUkdFX01J
UlJPUn0vJHtCUE59LyR7QlBOfSR7TElCVn0vICR7U09VUkNFRk9SR0VfTUlSUk9SfS8ke0JQTn0v
JHtCUE59JHtMSUJWfS9vbGRlci1yZWxlYXNlcy8iCiAKLS0gCjIuMzkuMgoK

--===============9051658190080265926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libpng: SRC_URI changed from "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.39.tar.xz" to "https://downloads.sourceforge.net/libpng/libpng16/libpng-1.6.40.tar.xz"
packages/core2-32-poky-linux/libpng: PKGV changed from 1.6.39 [default] to 1.6.40 [default]
packages/core2-32-poky-linux/libpng: PV changed from "1.6.39" to "1.6.40"
packages/core2-32-poky-linux/libpng/libpng-dbg: PKGV changed from 1.6.39 [default] to 1.6.40 [default]
packages/core2-32-poky-linux/libpng/libpng-dbg: PKGSIZE changed from 679380 to 679532 (+0%)
packages/core2-32-poky-linux/libpng/libpng-dbg: FILELIST: removed "/usr/lib/.debug/libpng16.so.16.39.0", added "/usr/lib/.debug/libpng16.so.16.40.0"
packages/core2-32-poky-linux/libpng/libpng-dbg: PV changed from "1.6.39" to "1.6.40"
packages/core2-32-poky-linux/libpng/libpng-dev: PKGV changed from 1.6.39 [default] to 1.6.40 [default]
packages/core2-32-poky-linux/libpng/libpng-dev: PKGSIZE changed from 173833 to 173805 (-0%)
packages/core2-32-poky-linux/libpng/libpng-dev: PV changed from "1.6.39" to "1.6.40"
packages/core2-32-poky-linux/libpng/libpng-doc: PKGV changed from 1.6.39 [default] to 1.6.40 [default]
packages/core2-32-poky-linux/libpng/libpng-doc: PKGSIZE changed from 269462 to 268838 (-0%)
packages/core2-32-poky-linux/libpng/libpng-doc: PV changed from "1.6.39" to "1.6.40"
packages/core2-32-poky-linux/libpng/libpng-locale: PKGV changed from 1.6.39 [default] to 1.6.40 [default]
packages/core2-32-poky-linux/libpng/libpng-locale: PV changed from "1.6.39" to "1.6.40"
packages/core2-32-poky-linux/libpng/libpng-src: PKGV changed from 1.6.39 [default] to 1.6.40 [default]
packages/core2-32-poky-linux/libpng/libpng-src: PKGSIZE changed from 1398094 to 1398447 (+0%)
packages/core2-32-poky-linux/libpng/libpng-src: PV changed from "1.6.39" to "1.6.40"
packages/core2-32-poky-linux/libpng/libpng-staticdev: PKGV changed from 1.6.39 [default] to 1.6.40 [default]
packages/core2-32-poky-linux/libpng/libpng-staticdev: PV changed from "1.6.39" to "1.6.40"
packages/core2-32-poky-linux/libpng/libpng-tools: PKGV changed from 1.6.39 [default] to 1.6.40 [default]
packages/core2-32-poky-linux/libpng/libpng-tools: PV changed from "1.6.39" to "1.6.40"
packages/core2-32-poky-linux/libpng/libpng: PKGV changed from 1.6.39 [default] to 1.6.40 [default]
packages/core2-32-poky-linux/libpng/libpng: FILELIST: removed "/usr/lib/libpng16.so.16.39.0", added "/usr/lib/libpng16.so.16.40.0"
packages/core2-32-poky-linux/libpng/libpng: PV changed from "1.6.39" to "1.6.40"
Changes to packages/core2-32-poky-linux/libpng (sysroot):
  /usr/lib/libpng16.so.16 changed symlink target from libpng16.so.16.39.0 to libpng16.so.16.40.0
  /usr/lib/libpng16.so changed symlink target from libpng16.so.16.39.0 to libpng16.so.16.40.0
  /usr/lib/libpng16.so.16.39.0 moved to /usr/lib/libpng16.so.16.40.0

--===============9051658190080265926==--

