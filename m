Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66920C3DA4D
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:28 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1295.1715794339872696956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=O8ND8nxP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=tcenJelP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f7d4fe4ea-88af153f-bd72-4f60-87dc-c789446e525a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=y++9keV015uoJKilLm3Qy3z3QVLHZ/LzlfmqwBlTjTA=;
	b=O8ND8nxP8FLyjq+Z0vY9y/NrVGcHWqTAydmv+FJ6y8LbXtAeWa2xxdvxVj+FJbdm
	Nb3kQU2akMBHSD8/QdcvJlfB8U1PwZQPNv4R/DDSk0SqYLGCkft7RGgzfXEe8fMXkfS
	0dhl8kuux6sBpdxU8/6bQlU8pqic9HwE5qQ1t3ks=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=y++9keV015uoJKilLm3Qy3z3QVLHZ/LzlfmqwBlTjTA=;
	b=tcenJelPtc47NfE0fAJ3b7WSbSJXnGkx2KckPDCTiguqvkioALukV9bDdYRgecEo
	VeKwyLsZl2DS1jHK6X3KHAKruMsvNil7hsBDi8E3XXMCT4M/NykALhFLzpdByS6sXTS
	2ouFy8m7KrikZE0YRikhn0ehOR0mPCYzc4il9dtY=
Content-Type: multipart/mixed; boundary="===============4064134234558301618=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xserver-xorg: upgrading to 21.1.13 SUCCEEDED
Message-ID: <0101018f7d4fe4ea-88af153f-bd72-4f60-87dc-c789446e525a-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199405

--===============4064134234558301618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xserver-xorg* to *21.1.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xserver-xorg-upgrade-21.1.12-21.1.13.patch
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
From cadf5444eeb8749f9f2487fc1ab8aead3d57b4bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 14:55:51 +0000
Subject: [PATCH] xserver-xorg: upgrade 21.1.12 -> 21.1.13

---
 .../0001-Avoid-duplicate-definitions-of-IOPortBase.patch | 3 +--
 ...ciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 9 +++------
 .../{xserver-xorg_21.1.12.bb => xserver-xorg_21.1.13.bb} | 2 +-
 3 files changed, 5 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.12.bb => xserver-xorg_21.1.13.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
index 11d5546537..e9cbc9b4da 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
@@ -1,4 +1,4 @@
-From ce3b8a230a3805c9b557c1f106795675bd034860 Mon Sep 17 00:00:00 2001
+From cedc797e1a0850039a25b7e387b342e54fffcc97 Mon Sep 17 00:00:00 2001
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
index d05eec5bb9..d1516c2f52 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From d77cdc5e1eee26821ab98c947abea53fb7b18fe5 Mon Sep 17 00:00:00 2001
+From ad8967de36e6e2a185b71ce1d701448cda4ef3e2 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.12.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.12.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
index 570e08d5ae..1f18c22fa8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.12.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "1e016e2be1b5ccdd65eac3ea08e54bd13ce8f4f6c3fb32ad6fdac4e71729a90f"
+SRC_URI[sha256sum] = "b45a02d5943f72236a360d3cc97e75134aa4f63039ff88c04686b508a3dc740c"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.44.0


--===============4064134234558301618==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-21.1.12-21.1.13.patch"

RnJvbSBjYWRmNTQ0NGVlYjg3NDlmOWYyNDg3ZmMxYWI4YWVhZDNkNTdiNGJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTQ6NTU6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
c2VydmVyLXhvcmc6IHVwZ3JhZGUgMjEuMS4xMiAtPiAyMS4xLjEzCgotLS0KIC4uLi8wMDAxLUF2
b2lkLWR1cGxpY2F0ZS1kZWZpbml0aW9ucy1vZi1JT1BvcnRCYXNlLnBhdGNoIHwgMyArLS0KIC4u
LmNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoIHwg
OSArKystLS0tLS0KIC4uLi97eHNlcnZlci14b3JnXzIxLjEuMTIuYmIgPT4geHNlcnZlci14b3Jn
XzIxLjEuMTMuYmJ9IHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci97
eHNlcnZlci14b3JnXzIxLjEuMTIuYmIgPT4geHNlcnZlci14b3JnXzIxLjEuMTMuYmJ9ICg5MiUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVy
LXhvcmcvMDAwMS1Bdm9pZC1kdXBsaWNhdGUtZGVmaW5pdGlvbnMtb2YtSU9Qb3J0QmFzZS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEt
QXZvaWQtZHVwbGljYXRlLWRlZmluaXRpb25zLW9mLUlPUG9ydEJhc2UucGF0Y2gKaW5kZXggMTFk
NTU0NjUzNy4uZTljYmM5YjRkYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAwMS1Bdm9pZC1kdXBsaWNhdGUtZGVmaW5pdGlvbnMt
b2YtSU9Qb3J0QmFzZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2Vy
dmVyL3hzZXJ2ZXIteG9yZy8wMDAxLUF2b2lkLWR1cGxpY2F0ZS1kZWZpbml0aW9ucy1vZi1JT1Bv
cnRCYXNlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjZTNiOGEyMzBhMzgwNWM5YjU1N2Mx
ZjEwNjc5NTY3NWJkMDM0ODYwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjZWRjNzk3
ZTFhMDg1MDAzOWEyNWI3ZTM4N2IzNDJlNTRmZmZjYzk3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
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
LmQxNTE2YzJmNTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2
ZXIveHNlcnZlci14b3JnLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgtb25seS1mb3It
cHJlLWdlbjQtaGFyZHdhci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14
c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhmODZwY2lCdXMuYy11c2UtSW50ZWwtZGR4LW9ubHkt
Zm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ3N2NkYzVl
MWVlZTI2ODIxYWI5OGM5NDdhYmVhNTNmYjdiMThmZTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGFkODk2N2RlMzZlNmUyYTE4NWI3MWNlMWQ3MDE0NDhjZGE0ZWYzZTIgTW9uIFNlcCAx
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
LXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuMTIuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjEzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14
b3JnXzIxLjEuMTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2
ZXIveHNlcnZlci14b3JnXzIxLjEuMTMuYmIKaW5kZXggNTcwZTA4ZDVhZS4uMWYxOGMyMmZhOCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhv
cmdfMjEuMS4xMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hz
ZXJ2ZXIteG9yZ18yMS4xLjEzLmJiCkBAIC0zLDcgKzMsNyBAQCByZXF1aXJlIHhzZXJ2ZXIteG9y
Zy5pbmMKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLXhmODZwY2lCdXMuYy11c2UtSW50ZWwtZGR4
LW9ubHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAw
MS1Bdm9pZC1kdXBsaWNhdGUtZGVmaW5pdGlvbnMtb2YtSU9Qb3J0QmFzZS5wYXRjaCBcCiAgICAg
ICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxZTAxNmUyYmUxYjVjY2RkNjVlYWMzZWEw
OGU1NGJkMTNjZThmNGY2YzNmYjMyYWQ2ZmRhYzRlNzE3MjlhOTBmIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImI0NWEwMmQ1OTQzZjcyMjM2YTM2MGQzY2M5N2U3NTEzNGFhNGY2MzAzOWZmODhjMDQ2
ODZiNTA4YTNkYzc0MGMiCiAKICMgVGhlc2UgZXh0ZW5zaW9ucyBhcmUgbm93IGludGVncmF0ZWQg
aW50byB0aGUgc2VydmVyLCBzbyBkZWNsYXJlIHRoZSBtaWdyYXRpb24KICMgcGF0aCBmb3IgaW4t
cGxhY2UgdXBncmFkZXMuCi0tIAoyLjQ0LjAKCg==

--===============4064134234558301618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1880 targets, 46 skipped, 0 masked, 0 errors.
Removing 86 recipes from the core2-64 sysroot...done.
Removing 87 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-c353516bec7f8918c35a6186641b2abae7032b86"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c353516bec7f8918c35a6186641b2abae7032b86"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 614 Local 586 Mirrors 0 Missed 28 Current 303 (95% match, 96% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 312 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 313 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 314 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 316 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 317 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 322 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 323 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 325 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 326 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 329 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 331 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 332 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_create_spdx_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 333 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_create_spdx_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 337 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: Running setscene task 338 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 339 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 340 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 341 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 342 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 343 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_create_spdx_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 344 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 345 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 346 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_create_spdx_setscene)
NOTE: recipe libinput-1.25.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 349 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 354 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xkbcomp_1.4.7.bb:do_packagedata_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 355 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 358 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_packagedata_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 359 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 360 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 361 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 362 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 363 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 366 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 369 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 370 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 371 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 372 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 385 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: recipe xkbcomp-1.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata_setscene)
NOTE: recipe libinput-1.25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 397 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 398 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 399 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 402 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 408 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 410 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 414 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_packagedata_setscene)
NOTE: recipe libinput-1.25.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/libinput_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 419 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 425 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 426 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libinput-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 427 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 436 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libinput-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 443 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mtdev-1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 460 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 462 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/mtdev_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 468 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 477 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 482 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 484 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mtdev-1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 485 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 486 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 492 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 500 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/encodings_1.1.0.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 501 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 502 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 504 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 506 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 508 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 509 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 511 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.280.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 513 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 514 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 517 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe encodings-1_1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 522 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 525 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 527 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libfontenc-1_1.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 530 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 534 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 536 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 537 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 538 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 540 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 544 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 545 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 548 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 550 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 551 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.280.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 553 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 555 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_recipe_qa_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 557 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 559 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 562 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 563 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 565 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 566 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 568 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 570 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 575 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 578 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 580 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 581 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 595 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 598 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 604 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 608 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxcb/1.16.1/temp/log.do_packagedata_setscene.2621478
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 614 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_package_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.16.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 615 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.16.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 620 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 623 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 631 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 639 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 641 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 644 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 646 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 653 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 657 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 661 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 668 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 671 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 673 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 681 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 683 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 684 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 685 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_package_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 690 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 692 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 822 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 834 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 838 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1055 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_fetch)
NOTE: Running task 1209 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_fetch: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: Running task 1429 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_unpack)
NOTE: Running task 1553 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_write_config)
NOTE: Running task 1564 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_fetch)
NOTE: Running task 1574 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1586 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_write_config)
NOTE: Running task 1596 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_fetch)
NOTE: recipe libxcb-1.16.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 842 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 844 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 848 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 851 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.5-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 1679 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_write_config: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_write_config: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1680 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_unpack)
NOTE: Running task 1681 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_write_config: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libxcb-1.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 856 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 861 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 863 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 864 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 867 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1700 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_patch)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 870 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1723 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_unpack: Succeeded
NOTE: Running task 1724 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_patch)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 876 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 878 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_patch: Succeeded
NOTE: Running task 1741 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1742 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_populate_lic)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_populate_lic: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 885 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 887 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 888 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 894 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_populate_lic: Succeeded
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_populate_lic unihash changed to 91ddd8fa337d3c82d3644ca4795e5e82f2d23e984082a6d43ad6d338767740b4
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_deploy_source_date_epoch unihash changed to bf8e423a226710329ef6a0ab96491985988019d34a0caf5f12e9e104a022fe9c
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 882 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 883 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 885 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 1749 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 906 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 907 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 912 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 913 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 915 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 917 of 917 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2066 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_packagedata)
NOTE: Running task 2210 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.16.1-r0: task do_packagedata: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2410 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_configure)
NOTE: recipe libxcb-1.16.1-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_configure: Started
NOTE: Running task 2458 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_collect_spdx_deps)
NOTE: recipe mesa-2_24.0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mesa-2_24.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2471 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_compile)
NOTE: recipe mesa-2_24.0.5-r0: task do_compile: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2472 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_install)
NOTE: recipe mesa-2_24.0.5-r0: task do_install: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_install: Succeeded
NOTE: Running task 2473 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_populate_sysroot)
NOTE: Running task 2474 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_package)
NOTE: recipe mesa-2_24.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_package: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2475 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2476 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 2477 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe mesa-2_24.0.5-r0: task do_package: Succeeded
NOTE: Running task 2478 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_packagedata)
NOTE: recipe mesa-2_24.0.5-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 2479 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 2480 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2481 of 2514 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_24.0.5-r0: task do_packagedata: Failed
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 2481 tasks of which 2449 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515145314.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515145314.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_packagedata
Summary: There were 66 ERROR messages, returning a non-zero exit code.
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-src went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-dbg went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-staticdev went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-dev went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-doc went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-locale went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-composite went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-damage went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-dbe went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-dpms went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-dri2 went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-dri3 went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-glx went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-present went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-randr went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-record went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-render went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-res went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-screensaver went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-shape went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-shm went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-sync went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xf86dri went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xfixes went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xinerama went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xinput went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xkb went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xtest went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xv went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxcb-xvmc went backwards which would break package feeds (from 0:1.17.0-r0 to 0:1.16.1-r0) [version-going-backwards]
ERROR: libxcb-1.16.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:24.0.7-r0 to 2:24.0.5-r0) [version-going-backwards]
ERROR: mesa-2_24.0.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/mesa/24.0.5/temp/log.do_packagedata.2633160
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.5.bb:do_packagedata) failed with exit code '1'

--===============4064134234558301618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-21.1.12.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-21.1.13.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch"
packages/core2-64-poky-linux/xserver-xorg: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 17227216 to 17227080 (-0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PKGSIZE changed from 11847940 to 11847850 (-0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xwayland: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xwayland: PV changed from "21.1.12" to "21.1.13"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 21.1.12 [default] to 21.1.13 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PV changed from "21.1.12" to "21.1.13"

--===============4064134234558301618==--

