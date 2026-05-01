Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800DACD3438
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15614.1777645533764533323
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lnf5A+f8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=q8IlV6Gr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019de3ee36de-40cf90a9-c5d4-49ba-9fcd-956e2caefb26-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pFuG7j5wAwmdcXcehGDzgvYGw/Sq7vOOS3GjnPbcrHs=;
	b=lnf5A+f8a/qIMdxZ4M9ZK92YIyM6I8h7Yr+S/iDkx2s3eKWSglSQIHQEN/DYknyT
	lCuoAvzB/Mh8EsglNt/ZUPHy2HXkxMdNkaTUV7287nCcUDgxa1BD2ttDRhlXF95gz78
	N1O+4CJw96aGTTq4JIBCOPK7AA6Y9m08KnzH8Q1M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pFuG7j5wAwmdcXcehGDzgvYGw/Sq7vOOS3GjnPbcrHs=;
	b=q8IlV6Grs6uBj9BpZM08RMMWwQYfcRKVQ9Gt/54wLJVxizDaCeu9+sNmCORBU9Ys
	7jMtY32v0OtV5BC33Tn1JDQhk25fchwlQ/ESSNfQ/38T8VPdzWvKeI+6M6/GMD/pPCy
	+55arvRpSj6tTOkAII4ssnnY76SJCkyx5ACec19A=
Content-Type: multipart/mixed; boundary="===============2455522142757325134=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dhcpcd: upgrading to 10.3.2 SUCCEEDED
Message-ID: <0101019de3ee36de-40cf90a9-c5d4-49ba-9fcd-956e2caefb26-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236213

--===============2455522142757325134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dhcpcd* to *10.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dhcpcd-upgrade-10.3.1-10.3.2.patch
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
From 38a2aeebe71ef1c16050fb3a7499620ecdab8330 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 06:38:54 +0000
Subject: [PATCH] dhcpcd: upgrade 10.3.1 -> 10.3.2

---
 .../dhcpcd/{dhcpcd_10.3.1.bb => dhcpcd_10.3.2.bb}             | 2 +-
 ...20-resolv.conf-improve-the-sitation-of-working-with-.patch | 2 +-
 ...001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch | 4 ++--
 .../0001-remove-INCLUDEDIR-to-prevent-build-issues.patch      | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.3.1.bb => dhcpcd_10.3.2.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
index 6a77ab9f1f..6ebfc19532 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "42ff6d2548209af3185473e6cb6f9d235c48bbf4"
+SRCREV = "243ad84ac67a87d631ff7eb83b2eed2727acebb5"
 
 # Doesn't use automake so we can't do out-of-tree builds
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 512e33aebf..7e04b5c303 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From d1581ce103db0a5db0b1761907fff9ddd6b55a8a Mon Sep 17 00:00:00 2001
+From c91f9cdc0ef56fa64f6ffdd811cc5b0e41991b2e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index 484b84f94a..9d3065a48b 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From e9b1376c59b15e7b03611429187d9d89167154b5 Mon Sep 17 00:00:00 2001
+From dd892eba0147120efdcae923746c444a9d2a76d2 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
@@ -29,7 +29,7 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/dhcpcd.8.in b/src/dhcpcd.8.in
-index 91fdde2c..b467dc3b 100644
+index ebbf06c0..c7ffee6b 100644
 --- a/src/dhcpcd.8.in
 +++ b/src/dhcpcd.8.in
 @@ -826,7 +826,7 @@ Configuration file for dhcpcd.
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
index fd3fae7e7e..bebc79831d 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From c2ebc32112e0cd29390b4dc951b65efae36d607b Mon Sep 17 00:00:00 2001
+From 0775eb1b965bbf9b0efb0b1c42c3adf3d8cd31cb Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -11,7 +11,7 @@ Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
  1 file changed, 5 deletions(-)
 
 diff --git a/configure b/configure
-index a60da137..3673de8b 100755
+index e9c08f18..3f0770b7 100755
 --- a/configure
 +++ b/configure
 @@ -26,7 +26,6 @@ BUILD=
-- 
2.47.1


--===============2455522142757325134==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dhcpcd-upgrade-10.3.1-10.3.2.patch"

RnJvbSAzOGEyYWVlYmU3MWVmMWMxNjA1MGZiM2E3NDk5NjIwZWNkYWI4MzMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNjozODo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRo
Y3BjZDogdXBncmFkZSAxMC4zLjEgLT4gMTAuMy4yCgotLS0KIC4uLi9kaGNwY2Qve2RoY3BjZF8x
MC4zLjEuYmIgPT4gZGhjcGNkXzEwLjMuMi5iYn0gICAgICAgICAgICAgfCAyICstCiAuLi4yMC1y
ZXNvbHYuY29uZi1pbXByb3ZlLXRoZS1zaXRhdGlvbi1vZi13b3JraW5nLXdpdGgtLnBhdGNoIHwg
MiArLQogLi4uMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJvci13aGVuLWVuYWJsZS1tdWx0
aWxpYi5wYXRjaCB8IDQgKystLQogLi4uLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8tcHJldmVu
dC1idWlsZC1pc3N1ZXMucGF0Y2ggICAgICB8IDQgKystLQogNCBmaWxlcyBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9kaGNwY2Qve2RoY3BjZF8xMC4zLjEuYmIgPT4gZGhjcGNkXzEwLjMuMi5iYn0gKDk3JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAu
My4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEwLjMuMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2RoY3BjZC9kaGNwY2RfMTAuMy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2RoY3BjZC9kaGNwY2RfMTAuMy4yLmJiCmluZGV4IDZhNzdhYjlmMWYuLjZlYmZjMTk1
MzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2RoY3BjZF8x
MC4zLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZGhjcGNkXzEw
LjMuMi5iYgpAQCAtMTcsNyArMTcsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vTmV0
d29ya0NvbmZpZ3VyYXRpb24vZGhjcGNkO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYQogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1kaGNwY2QuOC1GaXgtY29uZmxpY3QtZXJyb3Itd2hlbi1lbmFibGUt
bXVsdGlsaWIucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICI0MmZmNmQyNTQ4MjA5
YWYzMTg1NDczZTZjYjZmOWQyMzVjNDhiYmY0IgorU1JDUkVWID0gIjI0M2FkODRhYzY3YTg3ZDYz
MWZmN2ViODNiMmVlZDI3MjdhY2ViYjUiCiAKICMgRG9lc24ndCB1c2UgYXV0b21ha2Ugc28gd2Ug
Y2FuJ3QgZG8gb3V0LW9mLXRyZWUgYnVpbGRzCiBpbmhlcml0IHBrZ2NvbmZpZyBhdXRvdG9vbHMt
YnJva2Vuc2VwIHN5c3RlbWQgdXNlcmFkZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS0yMC1yZXNvbHYuY29uZi1pbXByb3ZlLXRoZS1zaXRh
dGlvbi1vZi13b3JraW5nLXdpdGgtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9k
aGNwY2QvZmlsZXMvMDAwMS0yMC1yZXNvbHYuY29uZi1pbXByb3ZlLXRoZS1zaXRhdGlvbi1vZi13
b3JraW5nLXdpdGgtLnBhdGNoCmluZGV4IDUxMmUzM2FlYmYuLjdlMDRiNWMzMDMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtMjAtcmVzb2x2
LmNvbmYtaW1wcm92ZS10aGUtc2l0YXRpb24tb2Ytd29ya2luZy13aXRoLS5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2RoY3BjZC9maWxlcy8wMDAxLTIwLXJlc29sdi5jb25m
LWltcHJvdmUtdGhlLXNpdGF0aW9uLW9mLXdvcmtpbmctd2l0aC0ucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGQxNTgxY2UxMDNkYjBhNWRiMGIxNzYxOTA3ZmZmOWRkZDZiNTVhOGEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM5MWY5Y2RjMGVmNTZmYTY0ZjZmZmRkODExY2M1YjBl
NDE5OTFiMmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVu
QHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDkgTm92IDIwMjIgMTY6MzM6MTggKzA4MDAKIFN1
YmplY3Q6IFtQQVRDSF0gMjAtcmVzb2x2LmNvbmY6IGltcHJvdmUgdGhlIHNpdGF0aW9uIG9mIHdv
cmtpbmcgd2l0aCBzeXN0ZW1kCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2RoY3BjZC9maWxlcy8wMDAxLWRoY3BjZC44LUZpeC1jb25mbGljdC1lcnJvci13aGVuLWVuYWJs
ZS1tdWx0aWxpYi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVz
LzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4tZW5hYmxlLW11bHRpbGliLnBh
dGNoCmluZGV4IDQ4NGI4NGY5NGEuLjlkMzA2NWE0OGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVy
cm9yLXdoZW4tZW5hYmxlLW11bHRpbGliLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvZGhjcGNkL2ZpbGVzLzAwMDEtZGhjcGNkLjgtRml4LWNvbmZsaWN0LWVycm9yLXdoZW4t
ZW5hYmxlLW11bHRpbGliLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlOWIxMzc2YzU5YjE1
ZTdiMDM2MTE0MjkxODdkOWQ4OTE2NzE1NGI1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBkZDg5MmViYTAxNDcxMjBlZmRjYWU5MjM3NDZjNDQ0YTlkMmE3NmQyIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPgogRGF0
ZTogRnJpLCAxMCBNYXIgMjAyMyAwMzo0ODo0NiArMDAwMAogU3ViamVjdDogW1BBVENIXSBkaGNw
Y2QuODogRml4IGNvbmZsaWN0IGVycm9yIHdoZW4gZW5hYmxlIG11bHRpbGliLgpAQCAtMjksNyAr
MjksNyBAQCBTaWduZWQtb2ZmLWJ5OiBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+
CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYg
LS1naXQgYS9zcmMvZGhjcGNkLjguaW4gYi9zcmMvZGhjcGNkLjguaW4KLWluZGV4IDkxZmRkZTJj
Li5iNDY3ZGMzYiAxMDA2NDQKK2luZGV4IGViYmYwNmMwLi5jN2ZmZWU2YiAxMDA2NDQKIC0tLSBh
L3NyYy9kaGNwY2QuOC5pbgogKysrIGIvc3JjL2RoY3BjZC44LmluCiBAQCAtODI2LDcgKzgyNiw3
IEBAIENvbmZpZ3VyYXRpb24gZmlsZSBmb3IgZGhjcGNkLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1yZW1vdmUtSU5DTFVERURJUi10by1w
cmV2ZW50LWJ1aWxkLWlzc3Vlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvZGhj
cGNkL2ZpbGVzLzAwMDEtcmVtb3ZlLUlOQ0xVREVESVItdG8tcHJldmVudC1idWlsZC1pc3N1ZXMu
cGF0Y2gKaW5kZXggZmQzZmFlN2U3ZS4uYmViYzc5ODMxZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9kaGNwY2QvZmlsZXMvMDAwMS1yZW1vdmUtSU5DTFVERURJUi10by1w
cmV2ZW50LWJ1aWxkLWlzc3Vlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2RoY3BjZC9maWxlcy8wMDAxLXJlbW92ZS1JTkNMVURFRElSLXRvLXByZXZlbnQtYnVpbGQtaXNz
dWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMmViYzMyMTEyZTBjZDI5MzkwYjRkYzk1
MWI2NWVmYWUzNmQ2MDdiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwNzc1ZWIxYjk2
NWJiZjliMGVmYjBiMWM0MmMzYWRmM2Q4Y2QzMWNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogU3RlZmFubyBDYXBwYSA8c3RlZmFuby5jYXBwYS5rczg5QGdtYWlsLmNvbT4KIERhdGU6
IFN1biwgMTMgSmFuIDIwMTkgMDE6NTA6NTIgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gcmVtb3Zl
IElOQ0xVREVESVIgdG8gcHJldmVudCBidWlsZCBpc3N1ZXMKQEAgLTExLDcgKzExLDcgQEAgU2ln
bmVkLW9mZi1ieTogU3RlZmFubyBDYXBwYSA8c3RlZmFuby5jYXBwYS5rczg5QGdtYWlsLmNvbT4K
ICAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3Vy
ZSBiL2NvbmZpZ3VyZQotaW5kZXggYTYwZGExMzcuLjM2NzNkZThiIDEwMDc1NQoraW5kZXggZTlj
MDhmMTguLjNmMDc3MGI3IDEwMDc1NQogLS0tIGEvY29uZmlndXJlCiArKysgYi9jb25maWd1cmUK
IEBAIC0yNiw3ICsyNiw2IEBAIEJVSUxEPQotLSAKMi40Ny4xCgo=

--===============2455522142757325134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PV changed from "10.3.1" to "10.3.2"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PKGSIZE changed from 1358696 to 1358680 (-0%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dbg: PKGV changed from 10.3.1 [default] to 10.3.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dev: PV changed from "10.3.1" to "10.3.2"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-dev: PKGV changed from 10.3.1 [default] to 10.3.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-doc: PV changed from "10.3.1" to "10.3.2"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-doc: PKGV changed from 10.3.1 [default] to 10.3.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-locale: PV changed from "10.3.1" to "10.3.2"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-locale: PKGV changed from 10.3.1 [default] to 10.3.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: FILELIST: directory renamed /usr/src/debug/dhcpcd/10.3.1/compat -> /usr/src/debug/dhcpcd/10.3.2/compat, directory renamed /usr/src/debug/dhcpcd/10.3.1/src/dev -> /usr/src/debug/dhcpcd/10.3.2/src/dev, directory renamed /usr/src/debug/dhcpcd/10.3.1/compat/crypt_openssl -> /usr/src/debug/dhcpcd/10.3.2/compat/crypt_openssl, directory renamed /usr/src/debug/dhcpcd/10.3.1/src -> /usr/src/debug/dhcpcd/10.3.2/src, directory renamed /usr/src/debug/dhcpcd/10.3.1/vendor -> /usr/src/debug/dhcpcd/10.3.2/vendor
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PV changed from "10.3.1" to "10.3.2"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PKGSIZE changed from 1122361 to 1122380 (+0%)
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-src: PKGV changed from 10.3.1 [default] to 10.3.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-staticdev: PV changed from "10.3.1" to "10.3.2"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd-staticdev: PKGV changed from 10.3.1 [default] to 10.3.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd: PV changed from "10.3.1" to "10.3.2"
packages/x86-64-v3-poky-linux/dhcpcd/dhcpcd: PKGV changed from 10.3.1 [default] to 10.3.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd: PV changed from "10.3.1" to "10.3.2"
packages/x86-64-v3-poky-linux/dhcpcd: PKGV changed from 10.3.1 [default] to 10.3.2 [default]
packages/x86-64-v3-poky-linux/dhcpcd: SRC_URI changed from "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master;tag=v10.3.1 file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch file://dhcpcd.service file://dhcpcd@.service file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch" to "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master;tag=v10.3.2 file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch file://dhcpcd.service file://dhcpcd@.service file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch"

--===============2455522142757325134==--

