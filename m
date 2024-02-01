Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D36C54E42
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.2155.1706810405462465526
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CFScnUAb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q3VR4D3E;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018d65d3f58f-9e3f6c6a-cb51-4cc6-a5fa-4c0bd2669a44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=m8aJjuGRvXovM0LVzp7c8MBTbwuMLIkC/pzfU+p9ZRo=;
	b=CFScnUAbplvA4D0YNbnR8XHMWt/Xye5ImnIDpcn5dsYAUDO6AATaBuzYkF3dJ1av
	YuPas4Kc3HXiemVxC85v9ewqrkxUxW149uI0Yy1elqRIR1SCM8myOIcEjSRIQWb8dhD
	5HZPBdgfVLzaieddV0HD35X1RYBn/xkzA5iLXbN8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=m8aJjuGRvXovM0LVzp7c8MBTbwuMLIkC/pzfU+p9ZRo=;
	b=Q3VR4D3EC4ArftAt1NPmSuCv/4bWq21cGY+oJG8bF4L01cLliGgHkCbC22CZG0OW
	F1VIltGcKUC3QC2RKqrkFVyyarjaMqobGkJv/rC0JWqUGtEL/WGzGLUVlns84ENFkAk
	xfEPsM0nrKgWM6KLL2/zI1gcPLg756QpHu4n/u4c=
Content-Type: multipart/mixed; boundary="===============1582254998609339732=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libidn2: upgrading to 2.3.7 SUCCEEDED
Message-ID: <0101018d65d3f58f-9e3f6c6a-cb51-4cc6-a5fa-4c0bd2669a44-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194662

--===============1582254998609339732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libidn2* to *2.3.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libidn2-upgrade-2.3.4-2.3.7.patch
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
From 89695cd40687c970aba444e6d2027b40b0971585 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 10:56:49 +0000
Subject: [PATCH] libidn2: upgrade 2.3.4 -> 2.3.7

---
 .../{libidn2_2.3.4.bb => libidn2_2.3.7.bb}    | 35 +++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/libidn/{libidn2_2.3.4.bb => libidn2_2.3.7.bb} (50%)

diff --git a/meta/recipes-extended/libidn/libidn2_2.3.4.bb b/meta/recipes-extended/libidn/libidn2_2.3.7.bb
similarity index 50%
rename from meta/recipes-extended/libidn/libidn2_2.3.4.bb
rename to meta/recipes-extended/libidn/libidn2_2.3.7.bb
index b48de39fa0..ca0af8c025 100644
--- a/meta/recipes-extended/libidn/libidn2_2.3.4.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.3.7.bb
@@ -1,3 +1,32 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- src/idn2.c
+# +++ src/idn2.c
+# @@ -1,5 +1,5 @@
+#  /* idn2.c - command line interface to libidn2
+# -   Copyright (C) 2011-2022 Simon Josefsson, Tim Ruehsen
+# +   Copyright (C) 2011-2024 Simon Josefsson, Tim Ruehsen
+#  
+#     This program is free software: you can redistribute it and/or modify
+#     it under the terms of the GNU General Public License as published by
+# --- lib/idn2.h.in
+# +++ lib/idn2.h.in
+# @@ -1,5 +1,5 @@
+#  /* idn2.h - header file for idn2
+# -   Copyright (C) 2011-2022 Simon Josefsson
+# +   Copyright (C) 2011-2024 Simon Josefsson
+#  
+#     Libidn2 is free software: you can redistribute it and/or modify it
+#     under the terms of either:
+# 
+#
+
 SUMMARY = "Internationalized Domain Name support library"
 DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specifications defined by the IETF Internationalized Domain Names (IDN) working group."
 HOMEPAGE = "http://www.gnu.org/software/libidn/"
@@ -7,12 +36,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d834ea7d480438ada04e5d846152395 \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.unicode;md5=684cf5f7e3fded3546679424528261a9 \
-                    file://src/idn2.c;endline=16;md5=0f347a5b17acf44440bf53e406f1df70 \
-                    file://lib/idn2.h.in;endline=27;md5=4d7b3771faa9c60067ed1da914508bc5 \
+                    file://src/idn2.c;endline=16;md5=afc1531bda991ba6338e33a7eff758a0 \
+                    file://lib/idn2.h.in;endline=27;md5=f88d218005a5c45b68a83cecb5bd7f26 \
                     "
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "93caba72b4e051d1f8d4f5a076ab63c99b77faee019b72b9783b267986dbb45f"
+SRC_URI[sha256sum] = "4c21a791b610b9519b9d0e12b8097bf2f359b12f8dd92647611a929e6bfd7d64"
 
 DEPENDS = "virtual/libiconv libunistring"
 
-- 
2.42.0


--===============1582254998609339732==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libidn2-upgrade-2.3.4-2.3.7.patch"

RnJvbSA4OTY5NWNkNDA2ODdjOTcwYWJhNDQ0ZTZkMjAyN2I0MGIwOTcxNTg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxMDo1Njo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmlkbjI6IHVwZ3JhZGUgMi4zLjQgLT4gMi4zLjcKCi0tLQogLi4uL3tsaWJpZG4yXzIuMy40LmJi
ID0+IGxpYmlkbjJfMi4zLjcuYmJ9ICAgIHwgMzUgKysrKysrKysrKysrKysrKystLQogMSBmaWxl
IGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpYmlkbi97bGliaWRuMl8yLjMuNC5iYiA9PiBsaWJpZG4yXzIuMy43
LmJifSAoNTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJpZG4vbGli
aWRuMl8yLjMuNC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJpZG4vbGliaWRuMl8yLjMu
Ny5iYgpzaW1pbGFyaXR5IGluZGV4IDUwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbGliaWRuL2xpYmlkbjJfMi4zLjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9saWJpZG4vbGliaWRuMl8yLjMuNy5iYgppbmRleCBiNDhkZTM5ZmEwLi5jYTBhZjhjMDI1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliaWRuL2xpYmlkbjJfMi4zLjQuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmlkbi9saWJpZG4yXzIuMy43LmJiCkBAIC0x
LDMgKzEsMzIgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJl
ZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUg
ZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQ
bGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0
aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTon
IHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0
ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBzcmMvaWRuMi5jCisjICsrKyBzcmMv
aWRuMi5jCisjIEBAIC0xLDUgKzEsNSBAQAorIyAgLyogaWRuMi5jIC0gY29tbWFuZCBsaW5lIGlu
dGVyZmFjZSB0byBsaWJpZG4yCisjIC0gICBDb3B5cmlnaHQgKEMpIDIwMTEtMjAyMiBTaW1vbiBK
b3NlZnNzb24sIFRpbSBSdWVoc2VuCisjICsgICBDb3B5cmlnaHQgKEMpIDIwMTEtMjAyNCBTaW1v
biBKb3NlZnNzb24sIFRpbSBSdWVoc2VuCisjICAKKyMgICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVl
IHNvZnR3YXJlOiB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisjICAgICBp
dCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1
Ymxpc2hlZCBieQorIyAtLS0gbGliL2lkbjIuaC5pbgorIyArKysgbGliL2lkbjIuaC5pbgorIyBA
QCAtMSw1ICsxLDUgQEAKKyMgIC8qIGlkbjIuaCAtIGhlYWRlciBmaWxlIGZvciBpZG4yCisjIC0g
ICBDb3B5cmlnaHQgKEMpIDIwMTEtMjAyMiBTaW1vbiBKb3NlZnNzb24KKyMgKyAgIENvcHlyaWdo
dCAoQykgMjAxMS0yMDI0IFNpbW9uIEpvc2Vmc3NvbgorIyAgCisjICAgICBMaWJpZG4yIGlzIGZy
ZWUgc29mdHdhcmU6IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkgaXQKKyMg
ICAgIHVuZGVyIHRoZSB0ZXJtcyBvZiBlaXRoZXI6CisjIAorIworCiBTVU1NQVJZID0gIkludGVy
bmF0aW9uYWxpemVkIERvbWFpbiBOYW1lIHN1cHBvcnQgbGlicmFyeSIKIERFU0NSSVBUSU9OID0g
IkltcGxlbWVudGF0aW9uIG9mIHRoZSBTdHJpbmdwcmVwLCBQdW55Y29kZSBhbmQgSUROQSBzcGVj
aWZpY2F0aW9ucyBkZWZpbmVkIGJ5IHRoZSBJRVRGIEludGVybmF0aW9uYWxpemVkIERvbWFpbiBO
YW1lcyAoSUROKSB3b3JraW5nIGdyb3VwLiIKIEhPTUVQQUdFID0gImh0dHA6Ly93d3cuZ251Lm9y
Zy9zb2Z0d2FyZS9saWJpZG4vIgpAQCAtNywxMiArMzYsMTIgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9MmQ4MzRlYTdkNDgwNDM4YWRhMDRlNWQ4NDYxNTIzOTUgXAog
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy5MRVNTRVJ2MzttZDU9ZTZhNjAwZmQ1
ZTFkOWNiZGUyZDk4MzY4MDIzM2FkMDIgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09Q
WUlOR3YyO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCiAgICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HLnVuaWNvZGU7bWQ1PTY4NGNmNWY3ZTNmZGVkMzU0NjY3
OTQyNDUyODI2MWE5IFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9pZG4yLmM7ZW5k
bGluZT0xNjttZDU9MGYzNDdhNWIxN2FjZjQ0NDQwYmY1M2U0MDZmMWRmNzAgXAotICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vbGliL2lkbjIuaC5pbjtlbmRsaW5lPTI3O21kNT00ZDdiMzc3MWZh
YTljNjAwNjdlZDFkYTkxNDUwOGJjNSBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMv
aWRuMi5jO2VuZGxpbmU9MTY7bWQ1PWFmYzE1MzFiZGE5OTFiYTYzMzhlMzNhN2VmZjc1OGEwIFwK
KyAgICAgICAgICAgICAgICAgICAgZmlsZTovL2xpYi9pZG4yLmguaW47ZW5kbGluZT0yNzttZDU9
Zjg4ZDIxODAwNWE1YzQ1YjY4YTgzY2VjYjViZDdmMjYgXAogICAgICAgICAgICAgICAgICAgICAi
CiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9saWJpZG4vJHtCUE59LSR7UFZ9LnRhci5neiIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5M2NhYmE3MmI0ZTA1MWQxZjhkNGY1YTA3NmFiNjNjOTli
NzdmYWVlMDE5YjcyYjk3ODNiMjY3OTg2ZGJiNDVmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRj
MjFhNzkxYjYxMGI5NTE5YjlkMGUxMmI4MDk3YmYyZjM1OWIxMmY4ZGQ5MjY0NzYxMWE5MjllNmJm
ZDdkNjQiCiAKIERFUEVORFMgPSAidmlydHVhbC9saWJpY29udiBsaWJ1bmlzdHJpbmciCiAKLS0g
CjIuNDIuMAoK

--===============1582254998609339732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libidn2/libidn2-locale-fur: PKGSIZE changed from 4542 to 6709 (+48%)
packages/core2-64-poky-linux/libidn2/libidn2-src: PKGSIZE changed from 1287226 to 1480840 (+15%)
packages/core2-64-poky-linux/libidn2/libidn2: FILELIST: removed "/usr/lib/libidn2.so.0.3.8", added "/usr/lib/libidn2.so.0.4.0"
Changes to packages/core2-64-poky-linux/libidn2 (sysroot):
  /usr/lib/libidn2.so.0 changed symlink target from libidn2.so.0.3.8 to libidn2.so.0.4.0
  /usr/lib/libidn2.so changed symlink target from libidn2.so.0.3.8 to libidn2.so.0.4.0
  /usr/lib/libidn2.so.0.3.8 moved to /usr/lib/libidn2.so.0.4.0
Changes to packages/x86_64-linux/libidn2-native (sysroot):
  /usr/lib/libidn2.so.0 changed symlink target from libidn2.so.0.3.8 to libidn2.so.0.4.0
  /usr/lib/libidn2.so changed symlink target from libidn2.so.0.3.8 to libidn2.so.0.4.0
  /usr/lib/libidn2.so.0.3.8 moved to /usr/lib/libidn2.so.0.4.0

--===============1582254998609339732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libidn2: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2: SRC_URI changed from "https://ftp.gnu.org/gnu/libidn/libidn2-2.3.4.tar.gz" to "https://ftp.gnu.org/gnu/libidn/libidn2-2.3.7.tar.gz"
packages/core2-64-poky-linux/libidn2/libidn2-bin: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-bin: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-dbg: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-dbg: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-dbg: FILELIST: removed "/usr/lib/.debug/libidn2.so.0.3.8", added "/usr/lib/.debug/libidn2.so.0.4.0"
packages/core2-64-poky-linux/libidn2/libidn2-dbg: PKGSIZE changed from 262352 to 265848 (+1%)
packages/core2-64-poky-linux/libidn2/libidn2-dev: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-dev: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-dev: PKGSIZE changed from 14427 to 14433 (+0%)
packages/core2-64-poky-linux/libidn2/libidn2-doc: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-doc: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-doc: PKGSIZE changed from 80113 to 80407 (+0%)
packages/core2-64-poky-linux/libidn2/libidn2-locale-cs: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-cs: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-da: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-da: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-de: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-de: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-eo: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-eo: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-es: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-es: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-fi: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-fi: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-fr: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-fr: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-fur: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-fur: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-fur: PKGSIZE changed from 4542 to 6709 (+48%)
packages/core2-64-poky-linux/libidn2/libidn2-locale-hr: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-hr: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-hu: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-hu: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-id: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-id: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-it: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-it: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-ja: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-ja: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-ka: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-ka: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-ko: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-ko: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-nl: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-nl: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-pl: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-pl: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-pt-br: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-pt-br: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-ro: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-ro: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-ru: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-ru: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-sr: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-sr: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-sv: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-sv: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-uk: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-uk: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-vi: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-vi: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-locale-zh-cn: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-locale-zh-cn: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-src: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-src: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2-src: FILELIST: directory renamed /usr/src/debug/libidn2/2.3.4/unistring/uninorm -> /usr/src/debug/libidn2/2.3.7/unistring/uninorm, directory renamed /usr/src/debug/libidn2/2.3.4/src -> /usr/src/debug/libidn2/2.3.7/src, removed "/usr/src/debug/libidn2/2.3.4/lib/idna.h /usr/src/debug/libidn2/2.3.4/unistring/striconveha.c /usr/src/debug/libidn2/2.3.4/lib/idna.c /usr/src/debug/libidn2/2.3.4/gl/basename-lgpl.c /usr/src/debug/libidn2/2.3.4/lib/free.c /usr/src/debug/libidn2/2.3.4/unistring/c-strcase.h /usr/src/debug/libidn2/2.3.4/lib/register.c /usr/src/debug/libidn2/2.3.4/unistring/striconveh.h /usr/src/debug/libidn2/2.3.4/unistring/array-mergesort.h /usr/src/debug/libidn2/2.3.4/lib/puny_decode.c /usr/src/debug/libidn2/2.3.4/lib/puny_encode.c /usr/src/debug/libidn2/2.3.4/unistring/striconveh.c /usr/src/debug/libidn2/2.3.4/unistring/c-ctype.h /usr/src/debug/libidn2/2.3.4/lib/decode.c /usr/src/debug/libidn2/2.3.4/gl/fcntl.h /usr/src/debug/libidn2/
 2.3.4/gl/getopt-ext.h /usr/src/debug/libidn2/2.3.4/gl/version-etc.c /usr/src/debug/libidn2/2.3.4/lib/lookup.c /usr/src/debug/libidn2/2.3.4/lib/tables.c /usr/src/debug/libidn2/2.3.4/lib/tables.h /usr/src/debug/libidn2/2.3.4/lib/idn2.h /usr/src/debug/libidn2/2.3.4/unistring/stdlib.h /usr/src/debug/libidn2/2.3.4/gl/fcntl.c /usr/src/debug/libidn2/2.3.4/gl/version-etc.h /usr/src/debug/libidn2/2.3.4/lib/tr46map_data.c /usr/src/debug/libidn2/2.3.4/unistring/c-strcasecmp.c /usr/src/debug/libidn2/2.3.4/gl/error.h /usr/src/debug/libidn2/2.3.4/gl/getprogname.c /usr/src/debug/libidn2/2.3.4/lib/context.c /usr/src/debug/libidn2/2.3.4/lib/tr46map.c /usr/src/debug/libidn2/2.3.4/lib/version.c /usr/src/debug/libidn2/2.3.4/gl/cloexec.c /usr/src/debug/libidn2/2.3.4/unistring/c-strcaseeq.h /usr/src/debug/libidn2/2.3.4/gl/getopt.c /usr/src/debug/libidn2/2.3.4/lib/context.h /usr/src/debug/libidn2/2.3.4/lib/tr46map.h /usr/src/debug/libidn2/2.3.4/gl/progname.h /usr/src/debug/libidn2/2.3.4/lib/bidi.h /usr/sr
 c/debug/libidn2/2.3.4/gl/getopt1.c /usr/src/debug/libidn2/2.3.4/unistring/iconveh.h /usr/src/debug/libidn2/2.3.4/lib/punycode.h /usr/src/debug/libidn2/2.3.4/gl/progname.c /usr/src/debug/libidn2/2.3.4/lib/bidi.c /usr/src/debug/libidn2/2.3.4/gl/stat-time.h /usr/src/debug/libidn2/2.3.4/gl/malloca.h /usr/src/debug/libidn2/2.3.4/gl/getopt_int.h /usr/src/debug/libidn2/2.3.4/lib/data.c /usr/src/debug/libidn2/2.3.4/gl/getopt-core.h /usr/src/debug/libidn2/2.3.4/unistring/c-strncasecmp.c /usr/src/debug/libidn2/2.3.4/gl/malloca.c /usr/src/debug/libidn2/2.3.4/gl/idx.h /usr/src/debug/libidn2/2.3.4/lib/data.h /usr/src/debug/libidn2/2.3.4/lib/error.c /usr/src/debug/libidn2/2.3.4/unistring/localcharset.c /usr/src/debug/libidn2/2.3.4/unistring/localcharset.h /usr/src/debug/libidn2/2.3.4/gl/string.h /usr/src/debug/libidn2/2.3.4/unistring/string.h", added "/usr/src/debug/libidn2/2.3.7/lib/idna.h /usr/src/debug/libidn2/2.3.7/unistring/striconveha.c /usr/src/debug/libidn2/2.3.7/lib/idna.c /usr/src/debug
 /libidn2/2.3.7/gl/basename-lgpl.c /usr/src/debug/libidn2/2.3.7/lib/free.c /usr/src/debug/libidn2/2.3.7/unistring/c-strcase.h /usr/src/debug/libidn2/2.3.7/lib/register.c /usr/src/debug/libidn2/2.3.7/unistring/striconveh.h /usr/src/debug/libidn2/2.3.7/unistring/unictype.h /usr/src/debug/libidn2/2.3.7/unistring/array-mergesort.h /usr/src/debug/libidn2/2.3.7/unistring/unistr/u8-mbtouc-aux.c /usr/src/debug/libidn2/2.3.7/unistring/striconveh.c /usr/src/debug/libidn2/2.3.7/unistring/c-ctype.h /usr/src/debug/libidn2/2.3.7/lib/decode.c /usr/src/debug/libidn2/2.3.7/gl/fcntl.h /usr/src/debug/libidn2/2.3.7/gl/getopt-ext.h /usr/src/debug/libidn2/2.3.7/gl/version-etc.c /usr/src/debug/libidn2/2.3.7/lib/lookup.c /usr/src/debug/libidn2/2.3.7/lib/tables.c /usr/src/debug/libidn2/2.3.7/lib/tables.h /usr/src/debug/libidn2/2.3.7/gl/stdlib.h /usr/src/debug/libidn2/2.3.7/unistring/unictype/categ_none.c /usr/src/debug/libidn2/2.3.7/lib/idn2.h /usr/src/debug/libidn2/2.3.7/unistring/stdlib.h /usr/src/debug/li
 bidn2/2.3.7/gl/fcntl.c /usr/src/debug/libidn2/2.3.7/gl/version-etc.h /usr/src/debug/libidn2/2.3.7/lib/tr46map_data.c /usr/src/debug/libidn2/2.3.7/unistring/c-strcasecmp.c /usr/src/debug/libidn2/2.3.7/gl/getprogname.c /usr/src/debug/libidn2/2.3.7/lib/context.c /usr/src/debug/libidn2/2.3.7/lib/tr46map.c /usr/src/debug/libidn2/2.3.7/lib/version.c /usr/src/debug/libidn2/2.3.7/gl/cloexec.c /usr/src/debug/libidn2/2.3.7/unistring/unistr.h /usr/src/debug/libidn2/2.3.7/unistring/c-strcaseeq.h /usr/src/debug/libidn2/2.3.7/gl/getopt.c /usr/src/debug/libidn2/2.3.7/lib/context.h /usr/src/debug/libidn2/2.3.7/lib/tr46map.h /usr/src/debug/libidn2/2.3.7/gl/progname.h /usr/src/debug/libidn2/2.3.7/lib/bidi.h /usr/src/debug/libidn2/2.3.7/lib/punycode.c /usr/src/debug/libidn2/2.3.7/gl/getopt1.c /usr/src/debug/libidn2/2.3.7/unistring/iconveh.h /usr/src/debug/libidn2/2.3.7/gl/progname.c /usr/src/debug/libidn2/2.3.7/lib/bidi.c /usr/src/debug/libidn2/2.3.7/gl/stat-time.h /usr/src/debug/libidn2/2.3.7/gl/mall
 oca.h /usr/src/debug/libidn2/2.3.7/gl/getopt_int.h /usr/src/debug/libidn2/2.3.7/lib/data.c /usr/src/debug/libidn2/2.3.7/gl/getopt-core.h /usr/src/debug/libidn2/2.3.7/unistring/c-strncasecmp.c /usr/src/debug/libidn2/2.3.7/gl/malloca.c /usr/src/debug/libidn2/2.3.7/gl/idx.h /usr/src/debug/libidn2/2.3.7/lib/data.h /usr/src/debug/libidn2/2.3.7/lib/error.c /usr/src/debug/libidn2/2.3.7/unistring/uninorm.h /usr/src/debug/libidn2/2.3.7/unistring/localcharset.c /usr/src/debug/libidn2/2.3.7/unistring/localcharset.h /usr/src/debug/libidn2/2.3.7/gl/string.h /usr/src/debug/libidn2/2.3.7/unistring/string.h"
packages/core2-64-poky-linux/libidn2/libidn2-src: PKGSIZE changed from 1287226 to 1480840 (+15%)
packages/core2-64-poky-linux/libidn2/libidn2-staticdev: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2-staticdev: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2: PV changed from "2.3.4" to "2.3.7"
packages/core2-64-poky-linux/libidn2/libidn2: PKGV changed from 2.3.4 [default] to 2.3.7 [default]
packages/core2-64-poky-linux/libidn2/libidn2: FILELIST: removed "/usr/lib/libidn2.so.0.3.8", added "/usr/lib/libidn2.so.0.4.0"
packages/core2-64-poky-linux/libidn2/libidn2: PKGSIZE changed from 202960 to 207056 (+2%)
Changes to packages/core2-64-poky-linux/libidn2 (sysroot):
  /usr/lib/libidn2.so.0 changed symlink target from libidn2.so.0.3.8 to libidn2.so.0.4.0
  /usr/lib/libidn2.so changed symlink target from libidn2.so.0.3.8 to libidn2.so.0.4.0
  /usr/lib/libidn2.so.0.3.8 moved to /usr/lib/libidn2.so.0.4.0
Changes to packages/x86_64-linux/libidn2-native (sysroot):
  /usr/lib/libidn2.so.0 changed symlink target from libidn2.so.0.3.8 to libidn2.so.0.4.0
  /usr/lib/libidn2.so changed symlink target from libidn2.so.0.3.8 to libidn2.so.0.4.0
  /usr/lib/libidn2.so.0.3.8 moved to /usr/lib/libidn2.so.0.4.0

--===============1582254998609339732==--

