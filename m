Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71332D591D7
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:49 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.4643.1731964601777918275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RkGCGAYA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=RlJUJFI5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019341228c30-4ebd60f9-2331-4072-9780-3d3d7f5e6106-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2FCXfFwIJAqQWSmFUYTeS7tc8YDaJuX2wdnmn4dzzY0=;
	b=RkGCGAYAvE0weyEqdote4eo5IO4OtU0z8bNlqobaGc/a/lp6E49MQzukf1K7hCyc
	KQ3DcKHkINFGKoginNRgl79krhEFt8u1NAg/M4hqlPf3DGBgC12qD7VkcgPPmYx2Vby
	FdJy79bPS1qbQOKQuY3o/QYPxCXn5V4ctt6eLph4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2FCXfFwIJAqQWSmFUYTeS7tc8YDaJuX2wdnmn4dzzY0=;
	b=RlJUJFI5RVKAGdKlydwOn/k03+18IHvuFWCPxb5BKhUA7trOg9C8tr6/IIUcPNWT
	cQlT6KgsjS5Z/RpoRx4h1tSV3Iq6sWB2+qV7Bvc0fGN+/XpHX0MtYOTew8HNOnWyNZu
	ofmwr8X1Kk1Yl4dyYhQyvR2r1J2ZVCteo1Mu38JE=
Content-Type: multipart/mixed; boundary="===============3304586943237052298=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libxcursor,xtrans: upgrading to 1.2.3,1.5.2 SUCCEEDED
Message-ID: <0101019341228c30-4ebd60f9-2331-4072-9780-3d3d7f5e6106-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207240

--===============3304586943237052298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxcursor,xtrans* to *1.2.3,1.5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxcursor-xtrans-upgrade-1.2.2-1.2.3-1.5.1-1.5.2.patch
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
From 7028cdb6b29a9113507cda049daa6412eb978dae Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Nov 2024 23:52:59 +0000
Subject: [PATCH] libxcursor,xtrans: upgrade 1.2.2 -> 1.2.3,1.5.1 -> 1.5.2

---
 .../{libxcursor_1.2.2.bb => libxcursor_1.2.3.bb} |  2 +-
 .../xorg-lib/xtrans/multilibfix.patch            | 16 ++++++++++++----
 .../{xtrans_1.5.1.bb => xtrans_1.5.2.bb}         |  2 +-
 3 files changed, 14 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.2.2.bb => libxcursor_1.2.3.bb} (87%)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.5.1.bb => xtrans_1.5.2.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb
rename to meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb
index 159ac4f7fa..29a73a3061 100644
--- a/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb
@@ -18,6 +18,6 @@ PE = "1"
 
 XORG_PN = "libXcursor"
 
-SRC_URI[sha256sum] = "53d071bd2cc56e517a30998d5e685c8a74556ddada43c6985d14da9a023a88ee"
+SRC_URI[sha256sum] = "fde9402dd4cfe79da71e2d96bb980afc5e6ff4f8a7d74c159e1966afb2b2c2c0"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch b/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch
index c513bad20e..096a98a0af 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch
+++ b/meta/recipes-graphics/xorg-lib/xtrans/multilibfix.patch
@@ -1,14 +1,22 @@
+From 855a65763ffb57bbd4c520ee07258ca953f8cd6b Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb
rename to meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb
index ea362750df..e391bf8a2b 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.5.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb
@@ -22,4 +22,4 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "dea80fbd8c3c941495b4b1d2785cb652815d016849a0d2ef90d1140de916993e"
+SRC_URI[sha256sum] = "5c5cbfe34764a9131d048f03c31c19e57fb4c682d67713eab6a65541b4dff86c"
-- 
2.44.1


--===============3304586943237052298==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxcursor-xtrans-upgrade-1.2.2-1.2.3-1.5.1-1.5.2.patch"

RnJvbSA3MDI4Y2RiNmIyOWE5MTEzNTA3Y2RhMDQ5ZGFhNjQxMmViOTc4ZGFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTm92IDIwMjQgMjM6NTI6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4Y3Vyc29yLHh0cmFuczogdXBncmFkZSAxLjIuMiAtPiAxLjIuMywxLjUuMSAtPiAxLjUuMgoK
LS0tCiAuLi4ve2xpYnhjdXJzb3JfMS4yLjIuYmIgPT4gbGlieGN1cnNvcl8xLjIuMy5iYn0gfCAg
MiArLQogLi4uL3hvcmctbGliL3h0cmFucy9tdWx0aWxpYmZpeC5wYXRjaCAgICAgICAgICAgIHwg
MTYgKysrKysrKysrKysrLS0tLQogLi4uL3t4dHJhbnNfMS41LjEuYmIgPT4geHRyYW5zXzEuNS4y
LmJifSAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve2xp
YnhjdXJzb3JfMS4yLjIuYmIgPT4gbGlieGN1cnNvcl8xLjIuMy5iYn0gKDg3JSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve3h0cmFuc18xLjUuMS5iYiA9PiB4dHJhbnNf
MS41LjIuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
bGliL2xpYnhjdXJzb3JfMS4yLjIuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIv
bGlieGN1cnNvcl8xLjIuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGN1cnNvcl8xLjIuMi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhjdXJzb3JfMS4yLjMuYmIKaW5kZXgg
MTU5YWM0ZjdmYS4uMjlhNzNhMzA2MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmctbGliL2xpYnhjdXJzb3JfMS4yLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmctbGliL2xpYnhjdXJzb3JfMS4yLjMuYmIKQEAgLTE4LDYgKzE4LDYgQEAgUEUgPSAiMSIK
IAogWE9SR19QTiA9ICJsaWJYY3Vyc29yIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTNkMDcx
YmQyY2M1NmU1MTdhMzA5OThkNWU2ODVjOGE3NDU1NmRkYWRhNDNjNjk4NWQxNGRhOWEwMjNhODhl
ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmZGU5NDAyZGQ0Y2ZlNzlkYTcxZTJkOTZiYjk4MGFm
YzVlNmZmNGY4YTdkNzRjMTU5ZTE5NjZhZmIyYjJjMmMwIgogCiBCQkNMQVNTRVhURU5EID0gIm5h
dGl2ZSBuYXRpdmVzZGsiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1s
aWIveHRyYW5zL211bHRpbGliZml4LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
bGliL3h0cmFucy9tdWx0aWxpYmZpeC5wYXRjaAppbmRleCBjNTEzYmFkMjBlLi4wOTZhOThhMGFm
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIveHRyYW5zL211bHRp
bGliZml4LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi94dHJhbnMv
bXVsdGlsaWJmaXgucGF0Y2gKQEAgLTEsMTQgKzEsMjIgQEAKK0Zyb20gODU1YTY1NzYzZmZiNTdi
YmQ0YzUyMGVlMDcyNThjYTk1M2Y4Y2Q2YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206
IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgorRGF0
ZTogRnJpLCAyOSBKdW4gMjAxOCAwODowMjoxNiArMDAwMAorU3ViamVjdDogW1BBVENIXSB4dHJh
bnM6IEZpeCBtdWx0aWxpYiAucGMgZmlsZSBjb25mbGljdAorCiBUaGUgeHRyYW5zLnBjIGZpbGUg
aXMgaW5zdGFsbGVkIGludG8gYSBub24tYXJjaCBkaXJlY3RvcnkgeWV0IGNvbnRhaW5zIGxpYmRp
cgogd2hpY2ggY2FuIHZhcnkgZGVwZW5kaW5nIG9uIHdoaWNoIG11bHRpbGliIGlzIGNvbmZpZ3Vy
ZWQuIFRoZSAucGMgZmlsZSBkb2VzCiBub3QgcmVxdWlyZSBsaWJkaXIgc28gcmVtb3ZlIHRoaXMg
dG8gZml4IG11bHRpbGliIGJ1aWxkcy4KIAogU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBVcHN0cmVhbS1TdGF0dXM6IFBl
bmRpbmcKKy0tLQorIHh0cmFucy5wYy5pbiB8IDEgLQorIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0
aW9uKC0pCiAKLUluZGV4OiB4dHJhbnMtMS4zLjUveHRyYW5zLnBjLmluCi09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0t
LS0geHRyYW5zLTEuMy41Lm9yaWcveHRyYW5zLnBjLmluCi0rKysgeHRyYW5zLTEuMy41L3h0cmFu
cy5wYy5pbgorZGlmZiAtLWdpdCBhL3h0cmFucy5wYy5pbiBiL3h0cmFucy5wYy5pbgoraW5kZXgg
YjhkMTM1Yi4uM2UxYTkyZCAxMDA2NDQKKy0tLSBhL3h0cmFucy5wYy5pbgorKysrIGIveHRyYW5z
LnBjLmluCiBAQCAtMSw2ICsxLDUgQEAKICBwcmVmaXg9QHByZWZpeEAKICBleGVjX3ByZWZpeD1A
ZXhlY19wcmVmaXhACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIv
eHRyYW5zXzEuNS4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3h0cmFuc18x
LjUuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveG9yZy1saWIveHRyYW5zXzEuNS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MveG9yZy1saWIveHRyYW5zXzEuNS4yLmJiCmluZGV4IGVhMzYyNzUwZGYuLmUzOTFiZjhh
MmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi94dHJhbnNfMS41
LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3h0cmFuc18xLjUuMi5i
YgpAQCAtMjIsNCArMjIsNCBAQCBpbmhlcml0IGdldHRleHQKIAogQkJDTEFTU0VYVEVORCA9ICJu
YXRpdmUgbmF0aXZlc2RrIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGVhODBmYmQ4YzNjOTQx
NDk1YjRiMWQyNzg1Y2I2NTI4MTVkMDE2ODQ5YTBkMmVmOTBkMTE0MGRlOTE2OTkzZSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI1YzVjYmZlMzQ3NjRhOTEzMWQwNDhmMDNjMzFjMTllNTdmYjRjNjgy
ZDY3NzEzZWFiNmE2NTU0MWI0ZGZmODZjIgotLSAKMi40NC4xCgo=

--===============3304586943237052298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxcursor/libxcursor-src: PKGSIZE changed from 96993 to 111279 (+15%)

--===============3304586943237052298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxcursor: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXcursor-1.2.2.tar.xz" to "https://www.x.org/releases//individual/lib/libXcursor-1.2.3.tar.xz"
packages/core2-64-poky-linux/libxcursor: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/libxcursor: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/libxcursor/libxcursor-dbg: PKGSIZE changed from 185720 to 192056 (+3%)
packages/core2-64-poky-linux/libxcursor/libxcursor-dbg: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/libxcursor/libxcursor-dbg: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/libxcursor/libxcursor-dev: PKGSIZE changed from 13353 to 13507 (+1%)
packages/core2-64-poky-linux/libxcursor/libxcursor-dev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/libxcursor/libxcursor-dev: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/libxcursor/libxcursor-doc: PKGSIZE changed from 25699 to 26204 (+2%)
packages/core2-64-poky-linux/libxcursor/libxcursor-doc: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/libxcursor/libxcursor-doc: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/libxcursor/libxcursor-locale: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/libxcursor/libxcursor-locale: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/libxcursor/libxcursor-src: PKGSIZE changed from 96993 to 111279 (+15%)
packages/core2-64-poky-linux/libxcursor/libxcursor-src: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/libxcursor/libxcursor-src: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/libxcursor/libxcursor-staticdev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/libxcursor/libxcursor-staticdev: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/libxcursor/libxcursor: PV changed from "1.2.2" to "1.2.3"
packages/core2-64-poky-linux/libxcursor/libxcursor: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-64-poky-linux/xtrans: SRC_URI changed from "https://www.x.org/releases//individual/lib/xtrans-1.5.1.tar.xz file://multilibfix.patch" to "https://www.x.org/releases//individual/lib/xtrans-1.5.2.tar.xz file://multilibfix.patch"
packages/core2-64-poky-linux/xtrans: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-64-poky-linux/xtrans: PV changed from "1.5.1" to "1.5.2"
packages/core2-64-poky-linux/xtrans/xtrans-dbg: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-64-poky-linux/xtrans/xtrans-dbg: PV changed from "1.5.1" to "1.5.2"
packages/core2-64-poky-linux/xtrans/xtrans-dev: PKGSIZE changed from 168170 to 168207 (+0%)
packages/core2-64-poky-linux/xtrans/xtrans-dev: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-64-poky-linux/xtrans/xtrans-dev: PV changed from "1.5.1" to "1.5.2"
packages/core2-64-poky-linux/xtrans/xtrans-doc: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-64-poky-linux/xtrans/xtrans-doc: PV changed from "1.5.1" to "1.5.2"
packages/core2-64-poky-linux/xtrans/xtrans-locale: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-64-poky-linux/xtrans/xtrans-locale: PV changed from "1.5.1" to "1.5.2"
packages/core2-64-poky-linux/xtrans/xtrans-src: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-64-poky-linux/xtrans/xtrans-src: PV changed from "1.5.1" to "1.5.2"
packages/core2-64-poky-linux/xtrans/xtrans-staticdev: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-64-poky-linux/xtrans/xtrans-staticdev: PV changed from "1.5.1" to "1.5.2"
packages/core2-64-poky-linux/xtrans/xtrans: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-64-poky-linux/xtrans/xtrans: PV changed from "1.5.1" to "1.5.2"

--===============3304586943237052298==--

