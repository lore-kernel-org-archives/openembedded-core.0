Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3062C3ABA3
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:43 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.1786.1746113615645740914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Vxz4y9iV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UUkMkiwf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101968c7b5479-82db3931-ae62-4803-beb3-5c9ff632a4b5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113615;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t2Um/BkliAD22hul2U5hBKbjZFMDs6AOMfgMg24G6L4=;
	b=Vxz4y9iVVSrrV4IKNyhlR58S0O2xVi2IQujyqQAvqSowtBVicaPlDcbknW+lo/y9
	jrrMJmSLZAqW53p/vjzooVcdXiK+d1aYu2k8l/tA2CymgsPRwCCir69CVXYPh5L18AV
	y9W3yoJwK1BzOD5hN1b6KUkizgZ5I1NMBipa8vXs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113615;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t2Um/BkliAD22hul2U5hBKbjZFMDs6AOMfgMg24G6L4=;
	b=UUkMkiwfU8wLN0q9RY9r3Byn+pjFreCRJuzvqVlgNaE8xuDq7XMIA/l3FXzyQdZy
	R9gSAcyZA1QIGrdB51lU0Ot+BHUu62t78g4QfNn5sKGvwUwxIzeb10dxhinsXVm21ux
	LBK+uSS2fUTiURYZhE3mFUmj/ue3WBZ+UAzpJxBc=
Content-Type: multipart/mixed; boundary="===============1655444365202904140=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffstat: upgrading to 1.68 SUCCEEDED
Message-ID: <010101968c7b5479-82db3931-ae62-4803-beb3-5c9ff632a4b5-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215800

--===============1655444365202904140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffstat* to *1.68* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffstat-upgrade-1.67-1.68.patch
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
From e2f1b35886887122f0586d26e1eb71e9dfa16c0e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 08:07:27 +0000
Subject: [PATCH] diffstat: upgrade 1.67 -> 1.68

---
 .../diffstat/avoid-check-user-break-cc.patch  |  4 ++--
 .../{diffstat_1.67.bb => diffstat_1.68.bb}    | 23 +++++++++++++++++--
 2 files changed, 23 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.67.bb => diffstat_1.68.bb} (45%)

diff --git a/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch b/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
index fc42c8cba7..d6955e3fe9 100644
--- a/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
+++ b/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
@@ -1,4 +1,4 @@
-From 04fd678939ad0c21f57222c48305bfa29c8f6cf3 Mon Sep 17 00:00:00 2001
+From bc2f675cd1e2ccca1524f35462c61f2dcb9ee8df Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 15 May 2018 17:17:01 +0800
 Subject: [PATCH] diffstat: fix wrong evaluation of CC
@@ -17,7 +17,7 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index 1c653ea..8f0540d 100644
+index 7ee539c..fcc48fd 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
 @@ -1584,7 +1584,7 @@ CF_GCC_VERSION
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.67.bb b/meta/recipes-devtools/diffstat/diffstat_1.68.bb
similarity index 45%
rename from meta/recipes-devtools/diffstat/diffstat_1.67.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.68.bb
index 8c84b30975..ab0bed100b 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.67.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.68.bb
@@ -1,3 +1,22 @@
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
+# @@ -1,4 +1,4 @@
+# -Copyright 1994-2023,2024 by Thomas E.  Dickey
+# +Copyright 1994-2024,2025 by Thomas E.  Dickey
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy of
+#  this software and associated documentation files (the "Software"), to deal in
+# 
+#
+
 SUMMARY = "Tool to produce a statistics based on a diff"
 DESCRIPTION = "diffstat reads the output of diff and displays a histogram of \
 the insertions, deletions, and modifications per-file. It is useful for \
@@ -5,14 +24,14 @@ reviewing large, complex patch files."
 HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "X11"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6232ea974e4cbc4ee06b49ed53df6ece"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0c432d3aeb935855b2ca1ad2a0542ce4"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
            file://avoid-check-user-break-cc.patch \
            "
 
-SRC_URI[sha256sum] = "760ed0c99c6d643238d41b80e60278cf1683ffb94a283954ac7ef168c852766a"
+SRC_URI[sha256sum] = "89f9294a8ac74fcef6f1b9ac408f43ebedf8d208e3efe0b99b4acc16dc6582c7"
 
 inherit autotools gettext ptest
 
-- 
2.47.1


--===============1655444365202904140==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffstat-upgrade-1.67-1.68.patch"

RnJvbSBlMmYxYjM1ODg2ODg3MTIyZjA1ODZkMjZlMWViNzFlOWRmYTE2YzBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwODowNzoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZzdGF0OiB1cGdyYWRlIDEuNjcgLT4gMS42OAoKLS0tCiAuLi4vZGlmZnN0YXQvYXZvaWQtY2hl
Y2stdXNlci1icmVhay1jYy5wYXRjaCAgfCAgNCArKy0tCiAuLi4ve2RpZmZzdGF0XzEuNjcuYmIg
PT4gZGlmZnN0YXRfMS42OC5iYn0gICAgfCAyMyArKysrKysrKysrKysrKysrKy0tCiAyIGZpbGVz
IGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2RpZmZzdGF0L3tkaWZmc3RhdF8xLjY3LmJiID0+IGRpZmZzdGF0XzEu
NjguYmJ9ICg0NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RpZmZzdGF0
L2RpZmZzdGF0L2F2b2lkLWNoZWNrLXVzZXItYnJlYWstY2MucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXQvYXZvaWQtY2hlY2stdXNlci1icmVhay1jYy5wYXRj
aAppbmRleCBmYzQyYzhjYmE3Li5kNjk1NWUzZmU5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXQvYXZvaWQtY2hlY2stdXNlci1icmVhay1jYy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXQvYXZvaWQtY2hl
Y2stdXNlci1icmVhay1jYy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDRmZDY3ODkzOWFk
MGMyMWY1NzIyMmM0ODMwNWJmYTI5YzhmNmNmMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gYmMyZjY3NWNkMWUyY2NjYTE1MjRmMzU0NjJjNjFmMmRjYjllZThkZiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogRGF0
ZTogVHVlLCAxNSBNYXkgMjAxOCAxNzoxNzowMSArMDgwMAogU3ViamVjdDogW1BBVENIXSBkaWZm
c3RhdDogZml4IHdyb25nIGV2YWx1YXRpb24gb2YgQ0MKQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVk
LW9mZi1ieTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9hY2xvY2Fs
Lm00IGIvYWNsb2NhbC5tNAotaW5kZXggMWM2NTNlYS4uOGYwNTQwZCAxMDA2NDQKK2luZGV4IDdl
ZTUzOWMuLmZjYzQ4ZmQgMTAwNjQ0CiAtLS0gYS9hY2xvY2FsLm00CiArKysgYi9hY2xvY2FsLm00
CiBAQCAtMTU4NCw3ICsxNTg0LDcgQEAgQ0ZfR0NDX1ZFUlNJT04KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kaWZmc3RhdC9kaWZmc3RhdF8xLjY3LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RpZmZzdGF0L2RpZmZzdGF0XzEuNjguYmIKc2ltaWxhcml0eSBpbmRleCA0NSUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RpZmZzdGF0L2RpZmZzdGF0XzEuNjcu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kaWZmc3RhdC9kaWZmc3RhdF8xLjY4
LmJiCmluZGV4IDhjODRiMzA5NzUuLmFiMGJlZDEwMGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9kaWZmc3RhdC9kaWZmc3RhdF8xLjY3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kaWZmc3RhdC9kaWZmc3RhdF8xLjY4LmJiCkBAIC0xLDMgKzEsMjIgQEAKKyMgRklY
TUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2
dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVu
IHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBM
SUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0
aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6
ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNo
YW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0xLDQgKzEsNCBA
QAorIyAtQ29weXJpZ2h0IDE5OTQtMjAyMywyMDI0IGJ5IFRob21hcyBFLiAgRGlja2V5CisjICtD
b3B5cmlnaHQgMTk5NC0yMDI0LDIwMjUgYnkgVGhvbWFzIEUuICBEaWNrZXkKKyMgIAorIyAgUGVy
bWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24g
b2J0YWluaW5nIGEgY29weSBvZgorIyAgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1
bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwgaW4KKyMgCisjCisKIFNV
TU1BUlkgPSAiVG9vbCB0byBwcm9kdWNlIGEgc3RhdGlzdGljcyBiYXNlZCBvbiBhIGRpZmYiCiBE
RVNDUklQVElPTiA9ICJkaWZmc3RhdCByZWFkcyB0aGUgb3V0cHV0IG9mIGRpZmYgYW5kIGRpc3Bs
YXlzIGEgaGlzdG9ncmFtIG9mIFwKIHRoZSBpbnNlcnRpb25zLCBkZWxldGlvbnMsIGFuZCBtb2Rp
ZmljYXRpb25zIHBlci1maWxlLiBJdCBpcyB1c2VmdWwgZm9yIFwKQEAgLTUsMTQgKzI0LDE0IEBA
IHJldmlld2luZyBsYXJnZSwgY29tcGxleCBwYXRjaCBmaWxlcy4iCiBIT01FUEFHRSA9ICJodHRw
Oi8vaW52aXNpYmxlLWlzbGFuZC5uZXQvZGlmZnN0YXQvIgogU0VDVElPTiA9ICJkZXZlbCIKIExJ
Q0VOU0UgPSAiWDExIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NjIz
MmVhOTc0ZTRjYmM0ZWUwNmI0OWVkNTNkZjZlY2UiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZSU5HO21kNT0wYzQzMmQzYWViOTM1ODU1YjJjYTFhZDJhMDU0MmNlNCIKIAogU1JDX1VS
SSA9ICJodHRwOi8vaW52aXNpYmxlLW1pcnJvci5uZXQvYXJjaGl2ZXMvJHtCUE59LyR7QlB9LnRn
eiBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICBmaWxlOi8vYXZv
aWQtY2hlY2stdXNlci1icmVhay1jYy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjc2MGVkMGM5OWM2ZDY0MzIzOGQ0MWI4MGU2MDI3OGNmMTY4M2ZmYjk0YTI4
Mzk1NGFjN2VmMTY4Yzg1Mjc2NmEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODlmOTI5NGE4YWM3
NGZjZWY2ZjFiOWFjNDA4ZjQzZWJlZGY4ZDIwOGUzZWZlMGI5OWI0YWNjMTZkYzY1ODJjNyIKIAog
aW5oZXJpdCBhdXRvdG9vbHMgZ2V0dGV4dCBwdGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============1655444365202904140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffstat/diffstat-dbg: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/diffstat/diffstat-dbg: PKGSIZE changed from 155320 to 155072 (-0%)
packages/core2-64-poky-linux/diffstat/diffstat-dbg: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/diffstat/diffstat-dev: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/diffstat/diffstat-dev: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/diffstat/diffstat-doc: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/diffstat/diffstat-doc: PKGSIZE changed from 9113 to 9068 (-0%)
packages/core2-64-poky-linux/diffstat/diffstat-doc: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/diffstat/diffstat-locale: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/diffstat/diffstat-locale: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/diffstat/diffstat-ptest: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/diffstat/diffstat-ptest: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/diffstat/diffstat-src: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/diffstat/diffstat-src: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/diffstat/diffstat-staticdev: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/diffstat/diffstat-staticdev: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/diffstat/diffstat: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/diffstat/diffstat: PV changed from "1.67" to "1.68"
packages/core2-64-poky-linux/diffstat: PKGV changed from 1.67 [default] to 1.68 [default]
packages/core2-64-poky-linux/diffstat: SRC_URI changed from "http://invisible-mirror.net/archives/diffstat/diffstat-1.67.tgz file://run-ptest file://avoid-check-user-break-cc.patch" to "http://invisible-mirror.net/archives/diffstat/diffstat-1.68.tgz file://run-ptest file://avoid-check-user-break-cc.patch"
packages/core2-64-poky-linux/diffstat: PV changed from "1.67" to "1.68"

--===============1655444365202904140==--

