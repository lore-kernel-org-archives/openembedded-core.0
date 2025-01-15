Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB11FC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:19 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.17873.1736936771296281950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=eShYpszl;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=u1A1HoI8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194697fd5af-35987ea9-754f-4cf5-a685-4cf88187758d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936773;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Av9BnFCULvLiz9rm9jXgLUCh9bjKG0fLZwSl/+hYBAM=;
	b=eShYpszlWCWKDSc5Ot8PwK+FEvDsgGNRkY6y4zrWtTKCldfPKD0SFvfsmySyjB5v
	Fkpdl9/7sVEbZV9cC7gJM1bz4dW3n44JiRp/iJRvxooh1WdSbLkm6voaawvyAHW+0MB
	jdp2KehS1RbgVjE52YX6cZB8cWa9OJy2nEq0i9ug=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936773;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Av9BnFCULvLiz9rm9jXgLUCh9bjKG0fLZwSl/+hYBAM=;
	b=u1A1HoI8/apbaSZqPQBK2DkSbu65d7XszWWxJcFl/TYUxphI81J9oZSeFkumosmA
	ycFV79DEIY5+rqtlbkufOcyquqKW95ZdZs3aQOW4y2GGsqgEmxPsyBVzqJDZfwLeIMv
	rrU00qH1pTm9PIveUkBgHWJEdKC7FLDuVN//4yOw=
Content-Type: multipart/mixed; boundary="===============4481477219498585587=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ed: upgrading to 1.21 SUCCEEDED
Message-ID: <01010194697fd5af-35987ea9-754f-4cf5-a685-4cf88187758d-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209857

--===============4481477219498585587==
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
From ee4738c3cf4df04fcafe9359c8d78eaf5cc93987 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 08:15:47 +0000
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


--===============4481477219498585587==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ed-upgrade-1.20.2-1.21.patch"

RnJvbSBlZTQ3MzhjM2NmNGRmMDRmY2FmZTkzNTljOGQ3OGVhZjVjYzkzOTg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDg6MTU6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
ZDogdXBncmFkZSAxLjIwLjIgLT4gMS4yMQoKLS0tCiAuLi4vZWQve2VkXzEuMjAuMi5iYiA9PiBl
ZF8xLjIxLmJifSAgICAgICAgICAgfCA1NyArKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZWQve2VkXzEuMjAuMi5iYiA9PiBlZF8xLjIxLmJifSAoMzElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9lZC9lZF8xLjIwLjIuYmIgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZWQvZWRfMS4yMS5iYgpzaW1pbGFyaXR5IGluZGV4IDMxJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4yMC4yLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4yMS5iYgppbmRleCAyYjc4YjA4MGJhLi42YjVmYTdhZjE5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4yMC4yLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9lZC9lZF8xLjIxLmJiCkBAIC0xLDExICsxLDYwIEBACisj
IEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkg
J2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0
aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4K
KyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFt
cGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRo
ZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMSw4ICsx
LDcgQEAKKyMgICAgICAgICAgICAgICAgICAgICAgR05VIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UK
KyMgICAgICAgICAgICAgICAgICAgICAgICAgVmVyc2lvbiAyLCBKdW5lIDE5OTEKKyMgIAorIyAt
IENvcHlyaWdodCAoQykgMTk4OSwgMTk5MSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4s
CisjIC0gNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0x
MzAxIFVTQQorIyArIENvcHlyaWdodCAoQykgMTk4OSwgMTk5MSBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb24sIEluYy4gPGh0dHA6Ly9mc2Yub3JnLz4KKyMgICBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQg
dG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMgICBvZiB0aGlzIGxpY2Vu
c2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgIAorIyAtLS0g
ZWQuaAorIyArKysgZWQuaAorIyBAQCAtMSw3ICsxLDcgQEAKKyMgIC8qIEdsb2JhbCBkZWNsYXJh
dGlvbnMgZm9yIHRoZSBlZCBlZGl0b3IuICAqLworIyAgLyogR05VIGVkIC0gVGhlIEdOVSBsaW5l
IGVkaXRvci4KKyMgICAgIENvcHlyaWdodCAoQykgMTk5MywgMTk5NCBBbmRyZXcgTC4gTW9vcmUs
IFRhbGtlIFN0dWRpbworIyAtICAgQ29weXJpZ2h0IChDKSAyMDA2LTIwMjQgQW50b25pbyBEaWF6
IERpYXouCisjICsgICBDb3B5cmlnaHQgKEMpIDIwMDYtMjAyNSBBbnRvbmlvIERpYXogRGlhei4K
KyMgIAorIyAgICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU6IHlvdSBjYW4gcmVkaXN0
cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyMgICAgIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUg
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisjIEBAIC0xNyw0ICsx
Nyw0IEBACisjICAgICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbS4gIElmIG5vdCwgc2VlIDxodHRw
Oi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyMgICovCisjICAKKyMgLSNpZm5kZWYgX19jcGx1
c3BsdXMKKyMgKyNpbmNsdWRlIDxzdGRib29sLmg+CisjIC0tLSBtYWluLmMKKyMgKysrIG1haW4u
YworIyBAQCAtMSw1ICsxLDUgQEAKKyMgIC8qIEdOVSBlZCAtIFRoZSBHTlUgbGluZSBlZGl0b3Iu
CisjIC0gICBDb3B5cmlnaHQgKEMpIDIwMDYtMjAyNCBBbnRvbmlvIERpYXogRGlhei4KKyMgKyAg
IENvcHlyaWdodCAoQykgMjAwNi0yMDI1IEFudG9uaW8gRGlheiBEaWF6LgorIyAgCisjICAgICBU
aGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTogeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5k
L29yIG1vZGlmeQorIyAgICAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyMgCisjCisKIFNVTU1BUlkgPSAiTGluZS1v
cmllbnRlZCB0ZXh0IGVkaXRvciIKIEhPTUVQQUdFID0gImh0dHA6Ly93d3cuZ251Lm9yZy9zb2Z0
d2FyZS9lZC8iCiBERVNDUklQVElPTiA9ICJHTlUgZWQgaXMgYSBsaW5lLW9yaWVudGVkIHRleHQg
ZWRpdG9yLiBJdCBpcyB1c2VkIHRvIGNyZWF0ZSwgZGlzcGxheSwgbW9kaWZ5IGFuZCBvdGhlcndp
c2UgbWFuaXB1bGF0ZSB0ZXh0IGZpbGVzLCBib3RoIGludGVyYWN0aXZlbHkgYW5kIHZpYSBzaGVs
bCBzY3JpcHRzLiBBIHJlc3RyaWN0ZWQgdmVyc2lvbiBvZiBlZCwgcmVkLCBjYW4gb25seSBlZGl0
IGZpbGVzIGluIHRoZSBjdXJyZW50IGRpcmVjdG9yeSBhbmQgY2Fubm90IGV4ZWN1dGUgc2hlbGwg
Y29tbWFuZHMuIgogCiBMSUNFTlNFID0gIkdQTC0yLjAtb25seSIKLUxJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTc2ZDZlMzAwZmZkOGZiOWQxOGJkOWIxMzZhOWJiYTEzIFwK
LSAgICAgICAgICAgICAgICAgICAgZmlsZTovL2VkLmg7ZW5kbGluZT0yMDttZDU9YzMyMTJiNmM1
M2IwOTY2ODEwNzQyMGFmOTM2OGMwZWYgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbWFp
bi5jO2VuZGxpbmU9MTc7bWQ1PWU1ZDJhZTVkZGQxZWNiODdkYzcxNzAyYzA2ZGQwNmRjIFwKK0xJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWNjYTdmNzRlYzgzYjdhOWNlN2Nj
ZDE5NWFhZDQ3MWJkIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL2VkLmg7ZW5kbGluZT0y
MDttZDU9YTI0ZTdmOTFjMGZiODNlNjVhNzQ2ZjU5OTQ3NjJhNDkgXAorICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vbWFpbi5jO2VuZGxpbmU9MTc7bWQ1PWZkNmFkOWYxODUzZjEyM2Y0YWU3YTMx
ZDU5NzYxZjA5IFwKICAgICAgICAgICAgICAgICAgICAgIgogCiBTRUNUSU9OID0gImJhc2UiCkBA
IC0xOSw3ICs2OCw3IEBAIGJpbmRpciA9ICIke2Jhc2VfYmluZGlyfSIKIFNSQ19VUkkgPSAiJHtH
TlVfTUlSUk9SfS9lZC8ke0JQfS50YXIubHoiCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiJHtHTlVf
TUlSUk9SfS9lZC8iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2NWZlYzczMThmNDhjMmNhMTdm
MzM0YWMwZjQ3MDNkZWZlNjIwMzdiYjEzY2MyMzkyMGRlMDc3YjVmYTI0NTIzIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjYwZTI0OTk4NzI3ZDQ1M2E1Y2YwMmM1NDY2NGI5NzUzNmRlNDZhMmIzNGNk
MWY0ZjY3YzFjMWE2MWJiYmFkNzUiCiAKIEVYVFJBX09FTUFLRSA9ICItZSBNQUtFRkxBR1M9Igog
Ci0tIAoyLjQ0LjEKCg==

--===============4481477219498585587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ed/ed-dbg: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed/ed-dbg: PKGSIZE changed from 158464 to 157904 (-0%)
packages/core2-64-poky-linux/ed/ed-dbg: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed/ed-dev: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed/ed-dev: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed/ed-doc: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed/ed-doc: PKGSIZE changed from 73723 to 75706 (+3%)
packages/core2-64-poky-linux/ed/ed-doc: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed/ed-locale: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed/ed-locale: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed/ed-src: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed/ed-src: PKGSIZE changed from 113189 to 113401 (+0%)
packages/core2-64-poky-linux/ed/ed-src: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed/ed-staticdev: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed/ed-staticdev: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed/ed: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed/ed: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed: PV changed from "1.20.2" to "1.21"
packages/core2-64-poky-linux/ed: PKGV changed from 1.20.2 [default] to 1.21 [default]
packages/core2-64-poky-linux/ed: SRC_URI changed from "https://ftp.gnu.org/gnu/ed/ed-1.20.2.tar.lz" to "https://ftp.gnu.org/gnu/ed/ed-1.21.tar.lz"

--===============4481477219498585587==--

