Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5A1FA0C27
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:55 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19820.1776261879823134887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Hg6RksWX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jnRzYoGM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d91756a4d-3fd01231-f90a-4274-a4e3-d1eced670b6a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261884;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o26heX2NIg4EcNytkTcZwOkb4/EytUu+qwBLgISRo7E=;
	b=Hg6RksWXmlqzhoSVLd9CWdKegpqXADGSAlgY5n7ITRnWrw6Mos4/agp8way0O892
	bJuv+8uckX7Tz2WHXX3Q2DvsgTIzKyuJToUd2lNfZsXNmkQD2JW5t6lt+75FqPJE9Wz
	+6xmZvrjGcUHfzUvLCcF0QRs9H2Q6/US4Mk925DE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261884;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o26heX2NIg4EcNytkTcZwOkb4/EytUu+qwBLgISRo7E=;
	b=jnRzYoGM3fDSSKhNjZFb9lyGDjIvmZ8W1VVNIb2Q09X8eDPV9Rp4gtnTtjd95szP
	8bG8diFwnNpDRs7sOnD25/f5/NAPTP3fpzqbyWbVYA+TAbbUB8wDMHB4E2w58/HgKCL
	tgWXeABYASmokb9/68LTMDJU40LNUWsHZ3Rny+qw=
Content-Type: multipart/mixed; boundary="===============3267687085143507569=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.23.1 SUCCEEDED
Message-ID: <0101019d91756a4d-3fd01231-f90a-4274-a4e3-d1eced670b6a-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235253

--===============3267687085143507569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-zipp* to *3.23.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.23.0-3.23.1.patch
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
From 021d6d43a9d839004a5c3379903f78cd6832c735 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 09:15:44 +0000
Subject: [PATCH] python3-zipp: upgrade 3.23.0 -> 3.23.1

---
 ...-zipp_3.23.0.bb => python3-zipp_3.23.1.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.23.0.bb => python3-zipp_3.23.1.bb} (29%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.23.0.bb b/meta/recipes-devtools/python/python3-zipp_3.23.1.bb
similarity index 29%
rename from meta/recipes-devtools/python/python3-zipp_3.23.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.23.1.bb
index 31420dcb83..6e51772347 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.23.1.bb
@@ -1,9 +1,30 @@
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
+# @@ -1,6 +1,6 @@
+#  MIT License
+#  
+# -Copyright (c) 2025 <copyright holders>
+# +Copyright (c) 2026 <copyright holders>
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
+#  associated documentation files (the "Software"), to deal in the Software without restriction, including
+# 
+#
+
 SUMMARY = "Backport of pathlib-compatible object wrapper for zip files"
 HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1aeae65f25a15b1e46d4381f2f094e0a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2e21c3f75eb8d9427c8a611a8e83e9d6"
 
-SRC_URI[sha256sum] = "a07157588a12518c9d4034df3fbbee09c814741a33ff63c05fa29d26a2404166"
+SRC_URI[sha256sum] = "32120e378d32cd9714ad503c1d024619063ec28aad2248dc6672ad13edfa5110"
 
 DEPENDS += "python3-setuptools-scm-native python3-coherent-licensed-native"
 
-- 
2.47.1


--===============3267687085143507569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.14/site-packages/zipp-3.23.0.dist-info -> /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/zipp-3.23.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.14/site-packages/zipp-3.23.0.dist-info moved to /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info

--===============3267687085143507569==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.23.0-3.23.1.patch"

RnJvbSAwMjFkNmQ0M2E5ZDgzOTAwNGE1YzMzNzk5MDNmNzhjZDY4MzJjNzM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDk6MTU6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXppcHA6IHVwZ3JhZGUgMy4yMy4wIC0+IDMuMjMuMQoKLS0tCiAuLi4temlwcF8zLjIz
LjAuYmIgPT4gcHl0aG9uMy16aXBwXzMuMjMuMS5iYn0gfCAyNSArKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXppcHBfMy4yMy4wLmJiID0+
IHB5dGhvbjMtemlwcF8zLjIzLjEuYmJ9ICgyOSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4yMy4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4yMy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMjkl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMu
MjMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXpp
cHBfMy4yMy4xLmJiCmluZGV4IDMxNDIwZGNiODMuLjZlNTE3NzIzNDcgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuMjMuMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjIzLjEuYmIKQEAgLTEs
OSArMSwzMCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVl
biB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBs
ZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRo
ZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicg
dGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRl
ZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UK
KyMgQEAgLTEsNiArMSw2IEBACisjICBNSVQgTGljZW5zZQorIyAgCisjIC1Db3B5cmlnaHQgKGMp
IDIwMjUgPGNvcHlyaWdodCBob2xkZXJzPgorIyArQ29weXJpZ2h0IChjKSAyMDI2IDxjb3B5cmln
aHQgaG9sZGVycz4KKyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBv
ZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weSBvZiB0aGlzIHNvZnR3YXJl
IGFuZAorIyAgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiks
IHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZwor
IyAKKyMKKwogU1VNTUFSWSA9ICJCYWNrcG9ydCBvZiBwYXRobGliLWNvbXBhdGlibGUgb2JqZWN0
IHdyYXBwZXIgZm9yIHppcCBmaWxlcyIKIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9q
YXJhY28vemlwcCIKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRTttZDU9MWFlYWU2NWYyNWExNWIxZTQ2ZDQzODFmMmYwOTRlMGEiCitMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yZTIxYzNmNzVlYjhkOTQyN2M4YTYxMWE4ZTgz
ZTlkNiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImEwNzE1NzU4OGExMjUxOGM5ZDQwMzRkZjNm
YmJlZTA5YzgxNDc0MWEzM2ZmNjNjMDVmYTI5ZDI2YTI0MDQxNjYiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMzIxMjBlMzc4ZDMyY2Q5NzE0YWQ1MDNjMWQwMjQ2MTkwNjNlYzI4YWFkMjI0OGRjNjY3
MmFkMTNlZGZhNTExMCIKIAogREVQRU5EUyArPSAicHl0aG9uMy1zZXR1cHRvb2xzLXNjbS1uYXRp
dmUgcHl0aG9uMy1jb2hlcmVudC1saWNlbnNlZC1uYXRpdmUiCiAKLS0gCjIuNDcuMQoK

--===============3267687085143507569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-zipp: PV changed from "3.23.0" to "3.23.1"
packages/x86-64-v3-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.23.0.tar.gz;downloadfilename=zipp-3.23.0.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.23.1.tar.gz;downloadfilename=zipp-3.23.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-zipp: PKGV changed from 3.23.0 [default] to 3.23.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "3.23.0" to "3.23.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 3.23.0 [default] to 3.23.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "3.23.0" to "3.23.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 3.23.0 [default] to 3.23.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "3.23.0" to "3.23.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 3.23.0 [default] to 3.23.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "3.23.0" to "3.23.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 3.23.0 [default] to 3.23.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-src: PV changed from "3.23.0" to "3.23.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 3.23.0 [default] to 3.23.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "3.23.0" to "3.23.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 3.23.0 [default] to 3.23.1 [default]
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 53567 to 54221 (+1%)
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: PV changed from "3.23.0" to "3.23.1"
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.14/site-packages/zipp-3.23.0.dist-info -> /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/zipp-3.23.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-zipp/python3-zipp: PKGV changed from 3.23.0 [default] to 3.23.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.14/site-packages/zipp-3.23.0.dist-info moved to /usr/lib/python3.14/site-packages/zipp-3.23.1.dist-info

--===============3267687085143507569==--

