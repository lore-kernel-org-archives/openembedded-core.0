Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17030C83F05
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.8893.1749993285953782973
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jt5D/3XC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=c1O3fdB9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019773ba9681-86b5ab06-a8ce-4124-a7c1-fcb3e58c1003-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eIvTHMstWiYgcBtKL/0eggfEd6j0KFMMwC4lBLx3I8I=;
	b=jt5D/3XCaCqpV9htKDCPyRBl/KEWd3Ip7DRpZ8GD2kHz46mv+FH79ZDCQq06nhXR
	/pHZ1wAAcSsmWByoR430N/t3KWsek+GBUVFuRUjiD1+4Hlf8SyqJMc37antXTFOZhwg
	mCCUNxYall0NtbnrVMr2MP6Pd/ru5JigBX6kgaP4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eIvTHMstWiYgcBtKL/0eggfEd6j0KFMMwC4lBLx3I8I=;
	b=c1O3fdB9IEw7iw4+XtKIsTdsJ/GnsWKwHNVgDSPDmnov4N/lt6E7WPSjuPT4mzDB
	sjdt7oS6XIqhNh5l2rqWi2h4fZNjUszmJ4rsP34ezGmyaGdA3gjU4WVHyA7fNBbnX3I
	AIvvEHVV5qd4thzeHtCBD9LZXHdjFinb5tO3xoi8=
Content-Type: multipart/mixed; boundary="===============7167890918436182583=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.18.6 SUCCEEDED
Message-ID: <0101019773ba9681-86b5ab06-a8ce-4124-a7c1-fcb3e58c1003-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218716

--===============7167890918436182583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk4* to *4.18.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.18.5-4.18.6.patch
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
From 866495ed6c957ade85e37ccc09496e0b9353476d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 11:04:39 +0000
Subject: [PATCH] gtk4: upgrade 4.18.5 -> 4.18.6

---
 meta/recipes-gnome/gtk+/{gtk4_4.18.5.bb => gtk4_4.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.18.5.bb => gtk4_4.18.6.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.5.bb b/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.18.5.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
index 85773b1174..092f8d309f 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.18.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
@@ -38,7 +38,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "bb5267a062f5936947d34c9999390a674b0b2b0d8aa3472fe0d05e2064955abc"
+SRC_URI[sha256sum] = "e1817c650ddc3261f9a8345b3b22a26a5d80af154630dedc03cc7becefffd0fa"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.47.1


--===============7167890918436182583==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.18.5-4.18.6.patch"

RnJvbSA4NjY0OTVlZDZjOTU3YWRlODVlMzdjY2MwOTQ5NmUwYjkzNTM0NzZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTE6MDQ6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMTguNSAtPiA0LjE4LjYKCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2d0
aysve2d0azRfNC4xOC41LmJiID0+IGd0azRfNC4xOC42LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
bm9tZS9ndGsrL3tndGs0XzQuMTguNS5iYiA9PiBndGs0XzQuMTguNi5iYn0gKDk4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTguNS5iYiBiL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xOC42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xOC41LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTguNi5iYgppbmRleCA4NTc3M2IxMTc0Li4w
OTJmOGQzMDlmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTgu
NS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTguNi5iYgpAQCAtMzgs
NyArMzgsNyBAQCBNQUpfVkVSID0gIiR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAy
KX0iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJndGstKD9QPHB2ZXI+XGQrXC4oXGQqWzAyNDY4
XSkrKFwuXGQrKSspXC50YXIueHoiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2Z0cC5nbm9tZS5vcmcv
cHViL2dub21lL3NvdXJjZXMvZ3RrLyR7TUFKX1ZFUn0vZ3RrLSR7UFZ9LnRhci54eiIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJiYjUyNjdhMDYyZjU5MzY5NDdkMzRjOTk5OTM5MGE2NzRiMGIyYjBk
OGFhMzQ3MmZlMGQwNWUyMDY0OTU1YWJjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImUxODE3YzY1
MGRkYzMyNjFmOWE4MzQ1YjNiMjJhMjZhNWQ4MGFmMTU0NjMwZGVkYzAzY2M3YmVjZWZmZmQwZmEi
CiAKIFMgPSAiJHtXT1JLRElSfS9ndGstJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============7167890918436182583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 71073968 to 71094456 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.1800.5", added "/usr/lib/.debug/libgtk-4.so.1.1800.6"
packages/core2-64-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-dbg: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 23243362 to 23243705 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-dev: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-doc: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca: PKGSIZE changed from 121732 to 121782 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-de: PKGSIZE changed from 118083 to 121534 (+3%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fi: PKGSIZE changed from 76947 to 76919 (-0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-he: PKGSIZE changed from 127166 to 128572 (+1%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kab: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kab: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kg: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kg: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sk: PKGSIZE changed from 79439 to 107245 (+35%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tk: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tk: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-printbackend-file: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-printbackend-file: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-src: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-src: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1800.5", added "/usr/lib/libgtk-4.so.1.1800.6"
packages/core2-64-poky-linux/gtk4/gtk4: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4/gtk4: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4: PKGV changed from 4.18.5 [default] to 4.18.6 [default]
packages/core2-64-poky-linux/gtk4: PV changed from "4.18.5" to "4.18.6"
packages/core2-64-poky-linux/gtk4: SRC_URI changed from "http://ftp.gnome.org/pub/gnome/sources/gtk/4.18/gtk-4.18.5.tar.xz" to "http://ftp.gnome.org/pub/gnome/sources/gtk/4.18/gtk-4.18.6.tar.xz"
Changes to packages/core2-64-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1800.5 to libgtk-4.so.1.1800.6
  /usr/lib/libgtk-4.so.1.1800.5 moved to /usr/lib/libgtk-4.so.1.1800.6

--===============7167890918436182583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gtk4/gtk4-locale-sk: PKGSIZE changed from 79439 to 107245 (+35%)
packages/core2-64-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1800.5", added "/usr/lib/libgtk-4.so.1.1800.6"
Changes to packages/core2-64-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1800.5 to libgtk-4.so.1.1800.6
  /usr/lib/libgtk-4.so.1.1800.5 moved to /usr/lib/libgtk-4.so.1.1800.6

--===============7167890918436182583==--

