Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C364ED1D860
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:15:50 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.11789.1728994549806250973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hOt7ypUu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dmpEDeep;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010192901b1d66-58191110-dd66-4006-8122-a73d821d8043-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pVLsYm2fVAi7Q06DkQdjY7XOn4Y7orCb3vTmpiePJhU=;
	b=hOt7ypUuO0KRIMzTD7vwmE+eMYZl3GVr2UIPlCqeNzHQIvES6odLk/pn9jGn9ZIX
	cJKDc41ZHEE8sGTiC65HQxqJuK/B30LeuM2wzEYPqI9DvuJTUqq2ovzUWsFEPmsScHA
	RBEBJ3g5LMQsOSvAsDch44NkrPkE6OghonA7fp08=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pVLsYm2fVAi7Q06DkQdjY7XOn4Y7orCb3vTmpiePJhU=;
	b=dmpEDeep2smVZatwbGgtXshsvBinjSuQLeB3cdbXZOpULF2JVkM6k2AoBdQ9RUpv
	2XrRxfZ+i+0BLQ1kY4NzPJzOvcvebvWJEkkMomr214zi7J5fUBSB+j0PY2s3Hu2mInn
	crLNyJJZMHTK7pLpntJKwsvN1h+hkAjNfkkGKUvU=
Content-Type: multipart/mixed; boundary="===============2911147312612064416=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xtrans: upgrading to 1.5.1 SUCCEEDED
Message-ID: <01010192901b1d66-58191110-dd66-4006-8122-a73d821d8043-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205818

--===============2911147312612064416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xtrans* to *1.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xtrans-upgrade-1.5.0-1.5.1.patch
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
From 517d3f476828712d71519b29eaf83926e0d2fa57 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 06:39:08 +0000
Subject: [PATCH] xtrans: upgrade 1.5.0 -> 1.5.1

---
 .../xorg-lib/xtrans/multilibfix.patch            | 16 ++++++++++++----
 .../{xtrans_1.5.0.bb => xtrans_1.5.1.bb}         |  2 +-
 2 files changed, 13 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.5.0.bb => xtrans_1.5.1.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch b/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch
index c513bad20e..d757d765df 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch
+++ b/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch
@@ -1,14 +1,22 @@
+From 91ecdefffec69c04012c61df525dce1bd4a31fe1 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 29 Jun 2018 08:02:16 +0000
+Subject: [PATCH] xtrans: Fix multilib .pc file conflict
+
 The xtrans.pc file is installed into a non-arch directory yet contains libdir
 which can vary depending on which multilib is configured. The .pc file does
 not require libdir so remove this to fix multilib builds.
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Upstream-Status: Pending
+---
+ xtrans.pc.in | 1 -
+ 1 file changed, 1 deletion(-)
 
-Index: xtrans-1.3.5/xtrans.pc.in
-===================================================================
---- xtrans-1.3.5.orig/xtrans.pc.in
-+++ xtrans-1.3.5/xtrans.pc.in
+diff --git a/xtrans.pc.in b/xtrans.pc.in
+index b8d135b..3e1a92d 100644
+--- a/xtrans.pc.in
++++ b/xtrans.pc.in
 @@ -1,6 +1,5 @@
  prefix=@prefix@
  exec_prefix=@exec_prefix@
diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb
rename to meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb
index 781382e516..ea362750df 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb
@@ -22,4 +22,4 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "1ba4b703696bfddbf40bacf25bce4e3efb2a0088878f017a50e9884b0c8fb1bd"
+SRC_URI[sha256sum] = "dea80fbd8c3c941495b4b1d2785cb652815d016849a0d2ef90d1140de916993e"
-- 
2.44.1


--===============2911147312612064416==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xtrans-upgrade-1.5.0-1.5.1.patch"

RnJvbSA1MTdkM2Y0NzY4Mjg3MTJkNzE1MTliMjllYWY4MzkyNmUwZDJmYTU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDY6Mzk6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
dHJhbnM6IHVwZ3JhZGUgMS41LjAgLT4gMS41LjEKCi0tLQogLi4uL3hvcmctbGliL3h0cmFucy9t
dWx0aWxpYmZpeC5wYXRjaCAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrLS0tLQogLi4uL3t4
dHJhbnNfMS41LjAuYmIgPT4geHRyYW5zXzEuNS4xLmJifSAgICAgICAgIHwgIDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve3h0cmFuc18xLjUuMC5iYiA9PiB4dHJhbnNfMS41
LjEuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGli
L3h0cmFucy9tdWx0aWxpYmZpeC5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxp
Yi94dHJhbnMvbXVsdGlsaWJmaXgucGF0Y2gKaW5kZXggYzUxM2JhZDIwZS4uZDc1N2Q3NjVkZiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3h0cmFucy9tdWx0aWxp
YmZpeC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIveHRyYW5zL211
bHRpbGliZml4LnBhdGNoCkBAIC0xLDE0ICsxLDIyIEBACitGcm9tIDkxZWNkZWZmZmVjNjljMDQw
MTJjNjFkZjUyNWRjZTFiZDRhMzFmZTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBS
aWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KK0RhdGU6
IEZyaSwgMjkgSnVuIDIwMTggMDg6MDI6MTYgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0geHRyYW5z
OiBGaXggbXVsdGlsaWIgLnBjIGZpbGUgY29uZmxpY3QKKwogVGhlIHh0cmFucy5wYyBmaWxlIGlz
IGluc3RhbGxlZCBpbnRvIGEgbm9uLWFyY2ggZGlyZWN0b3J5IHlldCBjb250YWlucyBsaWJkaXIK
IHdoaWNoIGNhbiB2YXJ5IGRlcGVuZGluZyBvbiB3aGljaCBtdWx0aWxpYiBpcyBjb25maWd1cmVk
LiBUaGUgLnBjIGZpbGUgZG9lcwogbm90IHJlcXVpcmUgbGliZGlyIHNvIHJlbW92ZSB0aGlzIHRv
IGZpeCBtdWx0aWxpYiBidWlsZHMuCiAKIFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogVXBzdHJlYW0tU3RhdHVzOiBQZW5k
aW5nCistLS0KKyB4dHJhbnMucGMuaW4gfCAxIC0KKyAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlv
bigtKQogCi1JbmRleDogeHRyYW5zLTEuMy41L3h0cmFucy5wYy5pbgotPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0t
IHh0cmFucy0xLjMuNS5vcmlnL3h0cmFucy5wYy5pbgotKysrIHh0cmFucy0xLjMuNS94dHJhbnMu
cGMuaW4KK2RpZmYgLS1naXQgYS94dHJhbnMucGMuaW4gYi94dHJhbnMucGMuaW4KK2luZGV4IGI4
ZDEzNWIuLjNlMWE5MmQgMTAwNjQ0CistLS0gYS94dHJhbnMucGMuaW4KKysrKyBiL3h0cmFucy5w
Yy5pbgogQEAgLTEsNiArMSw1IEBACiAgcHJlZml4PUBwcmVmaXhACiAgZXhlY19wcmVmaXg9QGV4
ZWNfcHJlZml4QApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3h0
cmFuc18xLjUuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi94dHJhbnNfMS41
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctbGliL3h0cmFuc18xLjUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctbGliL3h0cmFuc18xLjUuMS5iYgppbmRleCA3ODEzODJlNTE2Li5lYTM2Mjc1MGRm
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIveHRyYW5zXzEuNS4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi94dHJhbnNfMS41LjEuYmIK
QEAgLTIyLDQgKzIyLDQgQEAgaW5oZXJpdCBnZXR0ZXh0CiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0
aXZlIG5hdGl2ZXNkayIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFiYTRiNzAzNjk2YmZkZGJm
NDBiYWNmMjViY2U0ZTNlZmIyYTAwODg4NzhmMDE3YTUwZTk4ODRiMGM4ZmIxYmQiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZGVhODBmYmQ4YzNjOTQxNDk1YjRiMWQyNzg1Y2I2NTI4MTVkMDE2ODQ5
YTBkMmVmOTBkMTE0MGRlOTE2OTkzZSIKLS0gCjIuNDQuMQoK

--===============2911147312612064416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xtrans: PV changed from "1.5.0" to "1.5.1"
packages/core2-64-poky-linux/xtrans: SRC_URI changed from "https://www.x.org/releases//individual/lib/xtrans-1.5.0.tar.xz file://multilibfix.patch" to "https://www.x.org/releases//individual/lib/xtrans-1.5.1.tar.xz file://multilibfix.patch"
packages/core2-64-poky-linux/xtrans: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/xtrans/xtrans-dbg: PV changed from "1.5.0" to "1.5.1"
packages/core2-64-poky-linux/xtrans/xtrans-dbg: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/xtrans/xtrans-dev: PV changed from "1.5.0" to "1.5.1"
packages/core2-64-poky-linux/xtrans/xtrans-dev: PKGSIZE changed from 167490 to 168170 (+0%)
packages/core2-64-poky-linux/xtrans/xtrans-dev: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/xtrans/xtrans-doc: PV changed from "1.5.0" to "1.5.1"
packages/core2-64-poky-linux/xtrans/xtrans-doc: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/xtrans/xtrans-locale: PV changed from "1.5.0" to "1.5.1"
packages/core2-64-poky-linux/xtrans/xtrans-locale: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/xtrans/xtrans-src: PV changed from "1.5.0" to "1.5.1"
packages/core2-64-poky-linux/xtrans/xtrans-src: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/xtrans/xtrans-staticdev: PV changed from "1.5.0" to "1.5.1"
packages/core2-64-poky-linux/xtrans/xtrans-staticdev: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/core2-64-poky-linux/xtrans/xtrans: PV changed from "1.5.0" to "1.5.1"
packages/core2-64-poky-linux/xtrans/xtrans: PKGV changed from 1.5.0 [default] to 1.5.1 [default]

--===============2911147312612064416==--

