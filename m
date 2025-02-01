Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43FEC021AB
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:00 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.42622.1738416045115238196
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=glM1KlZI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=oXGsGL90;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010194c1abeabb-e87c01c5-db84-4f51-9779-aab838756b87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416057;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8gY1CUYW6OznipxBQzxg6z/p9U70tmgh6N499LsXdjM=;
	b=glM1KlZIf2MT6EvHeJGF9GAIoVqbg2wGI1FaFqwtLj95Ql0RftjRwWR2/5rgST1d
	4HyMjwsHk/Z3O1Kxsu5XmkEdxhqTFXWsG/N2QrQt/6jD/HPGAE2LMHmLcULKg4uQdhH
	99zuLlqnEXhfSs20KfcWbZKp5ARqH5SC5kkhibl0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416057;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8gY1CUYW6OznipxBQzxg6z/p9U70tmgh6N499LsXdjM=;
	b=oXGsGL9066iUckJOJcWJWr0wb8egmIc3Gq6wPSu9zgqtkrS2zC7ayLUJlRnoy8TS
	IAPYc9hpmC6g9O/aBF/XZcCIK9RIB96rjvvdcw58bWjKAjhTkeBZLbPKzfNwnkF+lLr
	mnnToyoLTHumMFNv+2ixSzEHsQMH3VSnEOuelWnc=
Content-Type: multipart/mixed; boundary="===============0397156862778547387=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ed: upgrading to 1.21 SUCCEEDED
Message-ID: <01010194c1abeabb-e87c01c5-db84-4f51-9779-aab838756b87-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210550

--===============0397156862778547387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ed* to *1.21* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ed-upgrade-1.20.2-1.21.patch
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
From 60dc9d5fdc745b66d92a231e8be6384c7541b07f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 09:07:26 +0000
Subject: [PATCH] ed: upgrade 1.20.2 -> 1.21

---
 .../ed/{ed_1.20.2.bb => ed_1.21.bb}           | 57 +++++++++++++++++--
 1 file changed, 53 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.20.2.bb => ed_1.21.bb} (31%)

diff --git a/meta/recipes-extended/ed/ed_1.20.2.bb b/meta/recipes-extended/ed/ed_1.21.bb
similarity index 31%
rename from meta/recipes-extended/ed/ed_1.20.2.bb
rename to meta/recipes-extended/ed/ed_1.21.bb
index 2b78b080ba..6b5fa7af19 100644
--- a/meta/recipes-extended/ed/ed_1.20.2.bb
+++ b/meta/recipes-extended/ed/ed_1.21.bb
@@ -1,11 +1,60 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,8 +1,7 @@
+#                      GNU GENERAL PUBLIC LICENSE
+#                         Version 2, June 1991
+#  
+# - Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+# - 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+# + Copyright (C) 1989, 1991 Free Software Foundation, Inc. <http://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# --- ed.h
+# +++ ed.h
+# @@ -1,7 +1,7 @@
+#  /* Global declarations for the ed editor.  */
+#  /* GNU ed - The GNU line editor.
+#     Copyright (C) 1993, 1994 Andrew L. Moore, Talke Studio
+# -   Copyright (C) 2006-2024 Antonio Diaz Diaz.
+# +   Copyright (C) 2006-2025 Antonio Diaz Diaz.
+#  
+#     This program is free software: you can redistribute it and/or modify
+#     it under the terms of the GNU General Public License as published by
+# @@ -17,4 +17,4 @@
+#     along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#  */
+#  
+# -#ifndef __cplusplus
+# +#include <stdbool.h>
+# --- main.c
+# +++ main.c
+# @@ -1,5 +1,5 @@
+#  /* GNU ed - The GNU line editor.
+# -   Copyright (C) 2006-2024 Antonio Diaz Diaz.
+# +   Copyright (C) 2006-2025 Antonio Diaz Diaz.
+#  
+#     This program is free software: you can redistribute it and/or modify
+#     it under the terms of the GNU General Public License as published by
+# 
+#
+
 SUMMARY = "Line-oriented text editor"
 HOMEPAGE = "http://www.gnu.org/software/ed/"
 DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, display, modify and otherwise manipulate text files, both interactively and via shell scripts. A restricted version of ed, red, can only edit files in the current directory and cannot execute shell commands."
 
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
-                    file://ed.h;endline=20;md5=c3212b6c53b09668107420af9368c0ef \
-                    file://main.c;endline=17;md5=e5d2ae5ddd1ecb87dc71702c06dd06dc \
+LIC_FILES_CHKSUM = "file://COPYING;md5=cca7f74ec83b7a9ce7ccd195aad471bd \
+                    file://ed.h;endline=20;md5=a24e7f91c0fb83e65a746f5994762a49 \
+                    file://main.c;endline=17;md5=fd6ad9f1853f123f4ae7a31d59761f09 \
                     "
 
 SECTION = "base"
@@ -19,7 +68,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "65fec7318f48c2ca17f334ac0f4703defe62037bb13cc23920de077b5fa24523"
+SRC_URI[sha256sum] = "60e24998727d453a5cf02c54664b97536de46a2b34cd1f4f67c1c1a61bbbad75"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.44.1


--===============0397156862778547387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ed/ed-dbg: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed/ed-dbg: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed/ed-dbg: PKGSIZE changed from 158464 to 157904 (-0%)
packages/core2-64-poky-linux/ed/ed-dev: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed/ed-dev: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed/ed-doc: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed/ed-doc: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed/ed-doc: PKGSIZE changed from 73723 to 75706 (+3%)
packages/core2-64-poky-linux/ed/ed-locale: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed/ed-locale: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed/ed-src: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed/ed-src: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed/ed-src: PKGSIZE changed from 113189 to 113401 (+0%)
packages/core2-64-poky-linux/ed/ed-staticdev: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed/ed-staticdev: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed/ed: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed/ed: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed: SRC_URI changed from "https://ftp.gnu.org/gnu/ed/ed-1.20.2.tar.lz" to "https://ftp.gnu.org/gnu/ed/ed-1.21.tar.lz"
packages/core2-64-poky-linux/ed: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed: PV changed from "1.20.2" to "1.21"

--===============0397156862778547387==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ed-upgrade-1.20.2-1.21.patch"

RnJvbSA2MGRjOWQ1ZmRjNzQ1YjY2ZDkyYTIzMWU4YmU2Mzg0Yzc1NDFiMDdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwOTowNzoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVk
OiB1cGdyYWRlIDEuMjAuMiAtPiAxLjIxCgotLS0KIC4uLi9lZC97ZWRfMS4yMC4yLmJiID0+IGVk
XzEuMjEuYmJ9ICAgICAgICAgICB8IDU3ICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCA1MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9lZC97ZWRfMS4yMC4yLmJiID0+IGVkXzEuMjEuYmJ9ICgzMSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2VkL2VkXzEuMjAuMi5iYiBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9lZC9lZF8xLjIxLmJiCnNpbWlsYXJpdHkgaW5kZXggMzElCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9lZC9lZF8xLjIwLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9lZC9lZF8xLjIxLmJiCmluZGV4IDJiNzhiMDgwYmEuLjZiNWZhN2FmMTkg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9lZC9lZF8xLjIwLjIuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2VkL2VkXzEuMjEuYmIKQEAgLTEsMTEgKzEsNjAgQEAKKyMg
RklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAn
ZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRo
ZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgor
IyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1w
bGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhl
IGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0xLDggKzEs
NyBAQAorIyAgICAgICAgICAgICAgICAgICAgICBHTlUgR0VORVJBTCBQVUJMSUMgTElDRU5TRQor
IyAgICAgICAgICAgICAgICAgICAgICAgICBWZXJzaW9uIDIsIEp1bmUgMTk5MQorIyAgCisjIC0g
Q29weXJpZ2h0IChDKSAxOTg5LCAxOTkxIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwK
KyMgLSA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEz
MDEgVVNBCisjICsgQ29weXJpZ2h0IChDKSAxOTg5LCAxOTkxIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbiwgSW5jLiA8aHR0cDovL2ZzZi5vcmcvPgorIyAgIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0
byBjb3B5IGFuZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGllcworIyAgIG9mIHRoaXMgbGljZW5z
ZSBkb2N1bWVudCwgYnV0IGNoYW5naW5nIGl0IGlzIG5vdCBhbGxvd2VkLgorIyAgCisjIC0tLSBl
ZC5oCisjICsrKyBlZC5oCisjIEBAIC0xLDcgKzEsNyBAQAorIyAgLyogR2xvYmFsIGRlY2xhcmF0
aW9ucyBmb3IgdGhlIGVkIGVkaXRvci4gICovCisjICAvKiBHTlUgZWQgLSBUaGUgR05VIGxpbmUg
ZWRpdG9yLgorIyAgICAgQ29weXJpZ2h0IChDKSAxOTkzLCAxOTk0IEFuZHJldyBMLiBNb29yZSwg
VGFsa2UgU3R1ZGlvCisjIC0gICBDb3B5cmlnaHQgKEMpIDIwMDYtMjAyNCBBbnRvbmlvIERpYXog
RGlhei4KKyMgKyAgIENvcHlyaWdodCAoQykgMjAwNi0yMDI1IEFudG9uaW8gRGlheiBEaWF6Lgor
IyAgCisjICAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTogeW91IGNhbiByZWRpc3Ry
aWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorIyAgICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyMgQEAgLTE3LDQgKzE3
LDQgQEAKKyMgICAgIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtLiAgSWYgbm90LCBzZWUgPGh0dHA6
Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorIyAgKi8KKyMgIAorIyAtI2lmbmRlZiBfX2NwbHVz
cGx1cworIyArI2luY2x1ZGUgPHN0ZGJvb2wuaD4KKyMgLS0tIG1haW4uYworIyArKysgbWFpbi5j
CisjIEBAIC0xLDUgKzEsNSBAQAorIyAgLyogR05VIGVkIC0gVGhlIEdOVSBsaW5lIGVkaXRvci4K
KyMgLSAgIENvcHlyaWdodCAoQykgMjAwNi0yMDI0IEFudG9uaW8gRGlheiBEaWF6LgorIyArICAg
Q29weXJpZ2h0IChDKSAyMDA2LTIwMjUgQW50b25pbyBEaWF6IERpYXouCisjICAKKyMgICAgIFRo
aXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOiB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQv
b3IgbW9kaWZ5CisjICAgICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQorIyAKKyMKKwogU1VNTUFSWSA9ICJMaW5lLW9y
aWVudGVkIHRleHQgZWRpdG9yIgogSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5nbnUub3JnL3NvZnR3
YXJlL2VkLyIKIERFU0NSSVBUSU9OID0gIkdOVSBlZCBpcyBhIGxpbmUtb3JpZW50ZWQgdGV4dCBl
ZGl0b3IuIEl0IGlzIHVzZWQgdG8gY3JlYXRlLCBkaXNwbGF5LCBtb2RpZnkgYW5kIG90aGVyd2lz
ZSBtYW5pcHVsYXRlIHRleHQgZmlsZXMsIGJvdGggaW50ZXJhY3RpdmVseSBhbmQgdmlhIHNoZWxs
IHNjcmlwdHMuIEEgcmVzdHJpY3RlZCB2ZXJzaW9uIG9mIGVkLCByZWQsIGNhbiBvbmx5IGVkaXQg
ZmlsZXMgaW4gdGhlIGN1cnJlbnQgZGlyZWN0b3J5IGFuZCBjYW5ub3QgZXhlY3V0ZSBzaGVsbCBj
b21tYW5kcy4iCiAKIExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5IgotTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9NzZkNmUzMDBmZmQ4ZmI5ZDE4YmQ5YjEzNmE5YmJhMTMgXAot
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vZWQuaDtlbmRsaW5lPTIwO21kNT1jMzIxMmI2YzUz
YjA5NjY4MTA3NDIwYWY5MzY4YzBlZiBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9tYWlu
LmM7ZW5kbGluZT0xNzttZDU9ZTVkMmFlNWRkZDFlY2I4N2RjNzE3MDJjMDZkZDA2ZGMgXAorTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9Y2NhN2Y3NGVjODNiN2E5Y2U3Y2Nk
MTk1YWFkNDcxYmQgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vZWQuaDtlbmRsaW5lPTIw
O21kNT1hMjRlN2Y5MWMwZmI4M2U2NWE3NDZmNTk5NDc2MmE0OSBcCisgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9tYWluLmM7ZW5kbGluZT0xNzttZDU9ZmQ2YWQ5ZjE4NTNmMTIzZjRhZTdhMzFk
NTk3NjFmMDkgXAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNFQ1RJT04gPSAiYmFzZSIKQEAg
LTE5LDcgKzY4LDcgQEAgYmluZGlyID0gIiR7YmFzZV9iaW5kaXJ9IgogU1JDX1VSSSA9ICIke0dO
VV9NSVJST1J9L2VkLyR7QlB9LnRhci5seiIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICIke0dOVV9N
SVJST1J9L2VkLyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY1ZmVjNzMxOGY0OGMyY2ExN2Yz
MzRhYzBmNDcwM2RlZmU2MjAzN2JiMTNjYzIzOTIwZGUwNzdiNWZhMjQ1MjMiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNjBlMjQ5OTg3MjdkNDUzYTVjZjAyYzU0NjY0Yjk3NTM2ZGU0NmEyYjM0Y2Qx
ZjRmNjdjMWMxYTYxYmJiYWQ3NSIKIAogRVhUUkFfT0VNQUtFID0gIi1lIE1BS0VGTEFHUz0iCiAK
LS0gCjIuNDQuMQoK

--===============0397156862778547387==--

