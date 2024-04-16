Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819FEC05023
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:16 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.13430.1713248038587367288
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DsiIZuHo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nnsiHyR6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018ee58a9cf8-f25a31eb-f8d1-4762-9ce9-ef5c11155571-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248050;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=m5eGhSp2bOjLwbPmVt1jGsOGNMmCqhOVJJqWeBpn92I=;
	b=DsiIZuHoQDXfuLEx6q+OmFXxClWhHffjzic/Wd5YS9mCquo69M4hjzgnIyhizmZz
	KteZtv04cc9WeP3/A0m0Y05RqePu+9YSWKWiiwN569Xa+ry6T4sXfQwOoiG6dqvO9Hp
	CTV4S9BDkd18UXTLaMw8ibhjpEEGwIP0iGb/YXbw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248050;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=m5eGhSp2bOjLwbPmVt1jGsOGNMmCqhOVJJqWeBpn92I=;
	b=nnsiHyR6aU+CReC/1sWD1Xrii+1NKAXz1EApGe1IEi5C4arhSPojY/IX8rDrsXLm
	OMWBep9TbrTOse3bo+2jdcipa30/npVUwfLZ2wWlHS38GGxY92wjIXZ804UAm2OKvPM
	Sk3wjeCGe6OlymDp+ubr4UDNb7jmOMbgEcHDBYTQ=
Content-Type: multipart/mixed; boundary="===============8949095314938183947=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xserver-xorg: upgrading to 21.1.13 SUCCEEDED
Message-ID: <0101018ee58a9cf8-f25a31eb-f8d1-4762-9ce9-ef5c11155571-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198384

--===============8949095314938183947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xserver-xorg* to *21.1.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xserver-xorg-upgrade-21.1.11-21.1.13.patch
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
From dde7710241665cf9a07bfad555fb9b78e7dd7190 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 00:53:34 +0000
Subject: [PATCH] xserver-xorg: upgrade 21.1.11 -> 21.1.13

---
 .../0001-Avoid-duplicate-definitions-of-IOPortBase.patch | 3 +--
 ...ciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 9 +++------
 .../{xserver-xorg_21.1.11.bb => xserver-xorg_21.1.13.bb} | 2 +-
 3 files changed, 5 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.11.bb => xserver-xorg_21.1.13.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
index 11d5546537..3604877c3f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
@@ -1,4 +1,4 @@
-From ce3b8a230a3805c9b557c1f106795675bd034860 Mon Sep 17 00:00:00 2001
+From 61c2834e0e394c2346c372b4d5d0627c587bef3a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 17 Aug 2020 10:50:51 -0700
 Subject: [PATCH] Avoid duplicate definitions of IOPortBase
@@ -10,7 +10,6 @@ compiler.h:528: multiple definition of `IOPortBase';
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  hw/xfree86/os-support/linux/lnx_video.c | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index d05eec5bb9..e46f9d1e4e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From d77cdc5e1eee26821ab98c947abea53fb7b18fe5 Mon Sep 17 00:00:00 2001
+From dcb4e29284967dc0a28c6ce05e76b3b815b0c743 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
@@ -20,10 +20,10 @@ Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
  1 file changed, 17 insertions(+), 1 deletion(-)
 
 diff --git a/hw/xfree86/common/xf86pciBus.c b/hw/xfree86/common/xf86pciBus.c
-index e61ae0cd4..d70c99197 100644
+index aeeed8b..db705bf 100644
 --- a/hw/xfree86/common/xf86pciBus.c
 +++ b/hw/xfree86/common/xf86pciBus.c
-@@ -1173,7 +1173,23 @@ xf86VideoPtrToDriverList(struct pci_device *dev,
+@@ -1174,7 +1174,23 @@ xf86VideoPtrToDriverList(struct pci_device *dev, XF86MatchedDrivers *md)
  		case 0x0bef:
  			/* Use fbdev/vesa driver on Oaktrail, Medfield, CDV */
  			break;
@@ -48,6 +48,3 @@ index e61ae0cd4..d70c99197 100644
  			driverList[0] = "intel";
  			break;
          }
--- 
-2.14.3
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
index 6506d775ca..1f18c22fa8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.11.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "1d3dadbd57fb86b16a018e9f5f957aeeadf744f56c0553f55737628d06d326ef"
+SRC_URI[sha256sum] = "b45a02d5943f72236a360d3cc97e75134aa4f63039ff88c04686b508a3dc740c"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.42.0


--===============8949095314938183947==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-21.1.11-21.1.13.patch"

RnJvbSBkZGU3NzEwMjQxNjY1Y2Y5YTA3YmZhZDU1NWZiOWI3OGU3ZGQ3MTkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDA6NTM6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
c2VydmVyLXhvcmc6IHVwZ3JhZGUgMjEuMS4xMSAtPiAyMS4xLjEzCgotLS0KIC4uLi8wMDAxLUF2
b2lkLWR1cGxpY2F0ZS1kZWZpbml0aW9ucy1vZi1JT1BvcnRCYXNlLnBhdGNoIHwgMyArLS0KIC4u
LmNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoIHwg
OSArKystLS0tLS0KIC4uLi97eHNlcnZlci14b3JnXzIxLjEuMTEuYmIgPT4geHNlcnZlci14b3Jn
XzIxLjEuMTMuYmJ9IHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci97
eHNlcnZlci14b3JnXzIxLjEuMTEuYmIgPT4geHNlcnZlci14b3JnXzIxLjEuMTMuYmJ9ICg5MiUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVy
LXhvcmcvMDAwMS1Bdm9pZC1kdXBsaWNhdGUtZGVmaW5pdGlvbnMtb2YtSU9Qb3J0QmFzZS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEt
QXZvaWQtZHVwbGljYXRlLWRlZmluaXRpb25zLW9mLUlPUG9ydEJhc2UucGF0Y2gKaW5kZXggMTFk
NTU0NjUzNy4uMzYwNDg3N2MzZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAwMS1Bdm9pZC1kdXBsaWNhdGUtZGVmaW5pdGlvbnMt
b2YtSU9Qb3J0QmFzZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2Vy
dmVyL3hzZXJ2ZXIteG9yZy8wMDAxLUF2b2lkLWR1cGxpY2F0ZS1kZWZpbml0aW9ucy1vZi1JT1Bv
cnRCYXNlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjZTNiOGEyMzBhMzgwNWM5YjU1N2Mx
ZjEwNjc5NTY3NWJkMDM0ODYwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2MWMyODM0
ZTBlMzk0YzIzNDZjMzcyYjRkNWQwNjI3YzU4N2JlZjNhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMTcgQXVn
IDIwMjAgMTA6NTA6NTEgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gQXZvaWQgZHVwbGljYXRlIGRl
ZmluaXRpb25zIG9mIElPUG9ydEJhc2UKQEAgLTEwLDcgKzEwLDYgQEAgY29tcGlsZXIuaDo1Mjg6
IG11bHRpcGxlIGRlZmluaXRpb24gb2YgYElPUG9ydEJhc2UnOwogCiBVcHN0cmVhbS1TdGF0dXM6
IFBlbmRpbmcKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0K
IC0tLQogIGh3L3hmcmVlODYvb3Mtc3VwcG9ydC9saW51eC9sbnhfdmlkZW8uYyB8IDEgKwogIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUlu
dGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUlu
dGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoCmluZGV4IGQwNWVlYzViYjku
LmU0NmY5ZDFlNGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2
ZXIveHNlcnZlci14b3JnLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgtb25seS1mb3It
cHJlLWdlbjQtaGFyZHdhci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14
c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhmODZwY2lCdXMuYy11c2UtSW50ZWwtZGR4LW9ubHkt
Zm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ3N2NkYzVl
MWVlZTI2ODIxYWI5OGM5NDdhYmVhNTNmYjdiMThmZTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGRjYjRlMjkyODQ5NjdkYzBhMjhjNmNlMDVlNzZiM2I4MTViMGM3NDMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBDYWxpZm9ybmlhIFN1bGxpdmFuIDxjYWxpZm9ybmlhLmwu
c3VsbGl2YW5AaW50ZWwuY29tPgogRGF0ZTogRnJpLCAxNiBNYXIgMjAxOCAxNzoyMzoxMSAtMDcw
MAogU3ViamVjdDogW1BBVENIXSB4Zjg2cGNpQnVzLmM6IHVzZSBJbnRlbCBkZHggb25seSBmb3Ig
cHJlLWdlbjQgaGFyZHdhcmUKQEAgLTIwLDEwICsyMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBDYWxp
Zm9ybmlhIFN1bGxpdmFuIDxjYWxpZm9ybmlhLmwuc3VsbGl2YW5AaW50ZWwuY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQg
YS9ody94ZnJlZTg2L2NvbW1vbi94Zjg2cGNpQnVzLmMgYi9ody94ZnJlZTg2L2NvbW1vbi94Zjg2
cGNpQnVzLmMKLWluZGV4IGU2MWFlMGNkNC4uZDcwYzk5MTk3IDEwMDY0NAoraW5kZXggYWVlZWQ4
Yi4uZGI3MDViZiAxMDA2NDQKIC0tLSBhL2h3L3hmcmVlODYvY29tbW9uL3hmODZwY2lCdXMuYwog
KysrIGIvaHcveGZyZWU4Ni9jb21tb24veGY4NnBjaUJ1cy5jCi1AQCAtMTE3Myw3ICsxMTczLDIz
IEBAIHhmODZWaWRlb1B0clRvRHJpdmVyTGlzdChzdHJ1Y3QgcGNpX2RldmljZSAqZGV2LAorQEAg
LTExNzQsNyArMTE3NCwyMyBAQCB4Zjg2VmlkZW9QdHJUb0RyaXZlckxpc3Qoc3RydWN0IHBjaV9k
ZXZpY2UgKmRldiwgWEY4Nk1hdGNoZWREcml2ZXJzICptZCkKICAJCWNhc2UgMHgwYmVmOgogIAkJ
CS8qIFVzZSBmYmRldi92ZXNhIGRyaXZlciBvbiBPYWt0cmFpbCwgTWVkZmllbGQsIENEViAqLwog
IAkJCWJyZWFrOwpAQCAtNDgsNiArNDgsMyBAQCBpbmRleCBlNjFhZTBjZDQuLmQ3MGM5OTE5NyAx
MDA2NDQKICAJCQlkcml2ZXJMaXN0WzBdID0gImludGVsIjsKICAJCQlicmVhazsKICAgICAgICAg
IH0KLS0tIAotMi4xNC4zCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMTEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjEzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14
b3JnXzIxLjEuMTEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2
ZXIveHNlcnZlci14b3JnXzIxLjEuMTMuYmIKaW5kZXggNjUwNmQ3NzVjYS4uMWYxOGMyMmZhOCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhv
cmdfMjEuMS4xMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hz
ZXJ2ZXIteG9yZ18yMS4xLjEzLmJiCkBAIC0zLDcgKzMsNyBAQCByZXF1aXJlIHhzZXJ2ZXIteG9y
Zy5pbmMKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLXhmODZwY2lCdXMuYy11c2UtSW50ZWwtZGR4
LW9ubHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAw
MS1Bdm9pZC1kdXBsaWNhdGUtZGVmaW5pdGlvbnMtb2YtSU9Qb3J0QmFzZS5wYXRjaCBcCiAgICAg
ICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxZDNkYWRiZDU3ZmI4NmIxNmEwMThlOWY1
Zjk1N2FlZWFkZjc0NGY1NmMwNTUzZjU1NzM3NjI4ZDA2ZDMyNmVmIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImI0NWEwMmQ1OTQzZjcyMjM2YTM2MGQzY2M5N2U3NTEzNGFhNGY2MzAzOWZmODhjMDQ2
ODZiNTA4YTNkYzc0MGMiCiAKICMgVGhlc2UgZXh0ZW5zaW9ucyBhcmUgbm93IGludGVncmF0ZWQg
aW50byB0aGUgc2VydmVyLCBzbyBkZWNsYXJlIHRoZSBtaWdyYXRpb24KICMgcGF0aCBmb3IgaW4t
cGxhY2UgdXBncmFkZXMuCi0tIAoyLjQyLjAKCg==

--===============8949095314938183947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xserver-xorg: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-21.1.11.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-21.1.13.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch"
packages/core2-64-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 17225960 to 17227080 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PKGSIZE changed from 1154395 to 1154495 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PKGSIZE changed from 132193 to 132633 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PKGSIZE changed from 11846167 to 11847850 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xwayland: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xwayland: PV changed from "21.1.11" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PKGSIZE changed from 2724477 to 2724509 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 21.1.11 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PV changed from "21.1.11" to "21.1.13"

--===============8949095314938183947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 85 recipes from the core2-64 sysroot...done.
Removing 85 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-49d9702583390870242bca23512e617525cb6720"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:49d9702583390870242bca23512e617525cb6720"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 597 Local 572 Mirrors 0 Missed 25 Current 322 (95% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 332 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 333 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 334 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 336 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 337 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 342 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 343 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 345 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 346 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 349 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 352 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 353 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_create_spdx_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 354 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_create_spdx_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 356 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 357 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 358 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_create_spdx_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 360 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx_setscene)
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 370 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 371 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 372 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 373 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 375 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_create_spdx_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 376 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_packagedata_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 381 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 383 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 384 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 386 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 393 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 394 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 395 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 396 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata_setscene)
NOTE: recipe libinput-1.25.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 397 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/mtdev/1.1.6/temp/log.do_packagedata_setscene.1221424
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 398 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 402 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 406 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: Running setscene task 412 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 413 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 433 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 437 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 440 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 442 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 449 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 452 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_create_spdx_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 454 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 460 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_create_spdx_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 465 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 466 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_package_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 468 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 473 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_packagedata_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 489 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 491 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libfontenc/1.1.7/temp/log.do_packagedata_setscene.1222349
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 494 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.42-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 497 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 498 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 502 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 504 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_create_spdx_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 508 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 528 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 621 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 623 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_recipe_qa_setscene)
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 626 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_packagedata_setscene)
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 629 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 630 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.42-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 642 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 476 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_fetch)
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 650 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 655 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running task 575 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_write_config)
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 600 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_recipe_qa)
NOTE: Running task 606 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_write_config)
NOTE: Running task 614 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_fetch)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_fetch: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.25.0-r0: task do_write_config: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_write_config: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_write_config: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 664 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libinput-1.25.0-r0: task do_fetch: Succeeded
NOTE: Running task 646 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_recipe_qa: Succeeded
NOTE: Running task 647 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 668 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 670 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_unpack: Succeeded
NOTE: Running task 1260 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: Running task 1429 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_unpack)
NOTE: Running task 1444 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_unpack: Started
NOTE: recipe libinput-1.25.0-r0: task do_patch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 681 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 684 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1523 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_patch)
NOTE: recipe wayland-protocols-1.33-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 697 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 699 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 703 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 711 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 716 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 717 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 723 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_unpack: Succeeded
NOTE: Running setscene task 725 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1566 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libpciaccess/0.18/temp/log.do_packagedata_setscene.1224244
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 733 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_package_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 738 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 739 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 742 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 744 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_patch: Started
NOTE: recipe libxml2-2.12.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18-r0: task do_package_setscene: Started
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_patch: Succeeded
NOTE: Running setscene task 754 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running task 1599 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1600 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_populate_lic)
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 757 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18-r0: task do_package_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 759 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_populate_lic: Started
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 761 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 762 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.12.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_populate_lic unihash changed to 34eb6dee4a8874fc11fb17feb86b499690a88ca2338d23f580a2051c316d2c91
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 764 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.12.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 786 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/xcb-proto/1.16.0/temp/log.do_packagedata_setscene.1225278
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 792 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 801 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 811 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 815 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_package_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 820 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 822 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 824 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_package_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 826 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 827 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 830 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 834 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 837 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 841 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 843 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 844 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 845 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 848 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/xorgproto/2023.2/temp/log.do_packagedata_setscene.1225927
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 849 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package_setscene)
NOTE: Running setscene task 851 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 853 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 856 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 859 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 865 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 867 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 869 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 870 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 872 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 874 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_package_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 875 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 880 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 885 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 887 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 889 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 890 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 891 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 894 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 898 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 899 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 901 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 908 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 909 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 914 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 919 of 919 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2008 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata)
NOTE: Running task 2062 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata)
NOTE: Running task 2198 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2211 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_packagedata)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata: Started
NOTE: Running task 2282 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata: Started
NOTE: Running task 2305 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe libinput-1.25.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.18-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2396 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libpciaccess-0.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_package_write_ipk)
NOTE: Running task 2475 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_package_write_deb)
NOTE: Running task 2476 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_package_write_rpm)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2478 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_collect_spdx_deps)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libinput-1.25.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_24.0.2-r0: task do_package_write_ipk: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_package_write_deb: Started
NOTE: Running task 2479 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_configure)
NOTE: recipe libinput-1.25.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.25.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2486 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_configure: Succeeded
NOTE: Running task 2487 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.25.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.25.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2488 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_compile)
NOTE: recipe libinput-1.25.0-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_configure: Succeeded
NOTE: Running task 2489 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_compile: Started
NOTE: recipe libinput-1.25.0-r0: task do_compile: Succeeded
NOTE: Running task 2490 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.25.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.25.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2491 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_install)
NOTE: recipe libinput-1.25.0-r0: task do_install: Started
NOTE: recipe libinput-1.25.0-r0: task do_install: Succeeded
NOTE: Running task 2492 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_install_ptest_base)
NOTE: recipe libinput-1.25.0-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.25.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2493 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_package)
NOTE: Running task 2494 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_populate_sysroot)
NOTE: recipe libinput-1.25.0-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.25.0-r0: task do_package: Started
NOTE: recipe libinput-1.25.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_24.0.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_package: Succeeded
NOTE: Running task 2495 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_packagedata)
NOTE: recipe libinput-1.25.0-r0: task do_packagedata: Started
NOTE: recipe libinput-1.25.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_packagedata unihash changed to c819f7fa51a5b7cc0fd4b46fc5e2eaa5a2e121f63bf00e2d846c91e1cf2d6680
NOTE: recipe mesa-2_24.0.2-r0: task do_package_write_ipk: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2496 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_create_spdx)
NOTE: recipe libinput-1.25.0-r0: task do_create_spdx: Started
NOTE: recipe libinput-1.25.0-r0: task do_create_spdx: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_compile: Succeeded
NOTE: Running task 2497 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_install: Succeeded
NOTE: Running task 2498 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_package)
NOTE: Running task 2499 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2500 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2501 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package: Succeeded
NOTE: Running task 2502 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2503 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_create_spdx)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_create_spdx: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 2504 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2505 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2506 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2507 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_package)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2508 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_packagedata unihash changed to 6d983d734eefb398df12b6e5cd2b8efadc90a653880c166afece6bd10a2c6b22
NOTE: Setscene tasks completed
NOTE: Running task 2509 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_create_spdx)
NOTE: Running task 2510 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_package_write_ipk)
NOTE: Running task 2511 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_package_write_deb)
NOTE: Running task 2512 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 2513 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_package_write_ipk)
NOTE: Running task 2514 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_package_write_deb)
NOTE: Running task 2515 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_package_write_rpm)
NOTE: Running task 2516 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_create_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package_write_ipk: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package_write_deb: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_write_ipk: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_write_deb: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2517 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_create_runtime_spdx)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_create_runtime_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2518 of 2518 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_build)
NOTE: Tasks Summary: Attempted 2518 tasks of which 2458 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 41 ERROR messages, returning a non-zero exit code.
ERROR: mtdev-1.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mtdev-src went backwards which would break package feeds (from 0:1.1.7-r0 to 0:1.1.6-r0) [version-going-backwards]
ERROR: mtdev-1.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mtdev-dbg went backwards which would break package feeds (from 0:1.1.7-r0 to 0:1.1.6-r0) [version-going-backwards]
ERROR: mtdev-1.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mtdev-staticdev went backwards which would break package feeds (from 0:1.1.7-r0 to 0:1.1.6-r0) [version-going-backwards]
ERROR: mtdev-1.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mtdev-dev went backwards which would break package feeds (from 0:1.1.7-r0 to 0:1.1.6-r0) [version-going-backwards]
ERROR: mtdev-1.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mtdev-doc went backwards which would break package feeds (from 0:1.1.7-r0 to 0:1.1.6-r0) [version-going-backwards]
ERROR: mtdev-1.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mtdev-locale went backwards which would break package feeds (from 0:1.1.7-r0 to 0:1.1.6-r0) [version-going-backwards]
ERROR: mtdev-1.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mtdev went backwards which would break package feeds (from 0:1.1.7-r0 to 0:1.1.6-r0) [version-going-backwards]
ERROR: mtdev-1.1.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libfontenc-1_1.1.7-r0 do_packagedata_setscene: QA Issue: Package version for package libfontenc-src went backwards which would break package feeds (from 1:1.1.8-r0 to 1:1.1.7-r0) [version-going-backwards]
ERROR: libfontenc-1_1.1.7-r0 do_packagedata_setscene: QA Issue: Package version for package libfontenc-dbg went backwards which would break package feeds (from 1:1.1.8-r0 to 1:1.1.7-r0) [version-going-backwards]
ERROR: libfontenc-1_1.1.7-r0 do_packagedata_setscene: QA Issue: Package version for package libfontenc-staticdev went backwards which would break package feeds (from 1:1.1.8-r0 to 1:1.1.7-r0) [version-going-backwards]
ERROR: libfontenc-1_1.1.7-r0 do_packagedata_setscene: QA Issue: Package version for package libfontenc-dev went backwards which would break package feeds (from 1:1.1.8-r0 to 1:1.1.7-r0) [version-going-backwards]
ERROR: libfontenc-1_1.1.7-r0 do_packagedata_setscene: QA Issue: Package version for package libfontenc-doc went backwards which would break package feeds (from 1:1.1.8-r0 to 1:1.1.7-r0) [version-going-backwards]
ERROR: libfontenc-1_1.1.7-r0 do_packagedata_setscene: QA Issue: Package version for package libfontenc-locale went backwards which would break package feeds (from 1:1.1.8-r0 to 1:1.1.7-r0) [version-going-backwards]
ERROR: libfontenc-1_1.1.7-r0 do_packagedata_setscene: QA Issue: Package version for package libfontenc went backwards which would break package feeds (from 1:1.1.8-r0 to 1:1.1.7-r0) [version-going-backwards]
ERROR: libfontenc-1_1.1.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libpciaccess-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package libpciaccess-src went backwards which would break package feeds (from 0:0.18.1-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: libpciaccess-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package libpciaccess-dbg went backwards which would break package feeds (from 0:0.18.1-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: libpciaccess-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package libpciaccess-staticdev went backwards which would break package feeds (from 0:0.18.1-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: libpciaccess-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package libpciaccess-dev went backwards which would break package feeds (from 0:0.18.1-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: libpciaccess-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package libpciaccess-doc went backwards which would break package feeds (from 0:0.18.1-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: libpciaccess-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package libpciaccess-locale went backwards which would break package feeds (from 0:0.18.1-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: libpciaccess-0.18-r0 do_packagedata_setscene: QA Issue: Package version for package libpciaccess went backwards which would break package feeds (from 0:0.18.1-r0 to 0:0.18-r0) [version-going-backwards]
ERROR: libpciaccess-0.18-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xcb-proto-1.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-src went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.0-r0) [version-going-backwards]
ERROR: xcb-proto-1.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-dbg went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.0-r0) [version-going-backwards]
ERROR: xcb-proto-1.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-staticdev went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.0-r0) [version-going-backwards]
ERROR: xcb-proto-1.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-dev went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.0-r0) [version-going-backwards]
ERROR: xcb-proto-1.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-doc went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.0-r0) [version-going-backwards]
ERROR: xcb-proto-1.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto-locale went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.0-r0) [version-going-backwards]
ERROR: xcb-proto-1.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package xcb-proto went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.0-r0) [version-going-backwards]
ERROR: xcb-proto-1.16.0-r0 do_packagedata_setscene: QA Issue: Package version for package python-xcbgen went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.0-r0) [version-going-backwards]
ERROR: xcb-proto-1.16.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xorgproto-2023.2-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.2-r0) [version-going-backwards]
ERROR: xorgproto-2023.2-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.2-r0) [version-going-backwards]
ERROR: xorgproto-2023.2-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.2-r0) [version-going-backwards]
ERROR: xorgproto-2023.2-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.2-r0) [version-going-backwards]
ERROR: xorgproto-2023.2-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.2-r0) [version-going-backwards]
ERROR: xorgproto-2023.2-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.2-r0) [version-going-backwards]
ERROR: xorgproto-2023.2-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2024.1-r0 to 0:2023.2-r0) [version-going-backwards]
ERROR: xorgproto-2023.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8949095314938183947==--

