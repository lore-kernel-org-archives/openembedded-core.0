Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA6AC54EF7
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:40 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.20153.1708018344042098966
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ael3jn/9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OrwB6B4a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018dadd39c22-9391f61e-1b9f-4967-9e51-18cb727a3539-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/JBjG/s944fmxdadLCyN6a5L5sAdgPD9owhd8gUMRT4=;
	b=Ael3jn/9/Z2ttFy5xItizgiu14we/jwgjGKeXDYjv9+1km0pKZ7fhTJ6VEDlweRc
	RYmd7hEpxZd0REvk2cryWDRNx0mIUG9Q2tk9QCBo3B39nVkIyud2XXWI8u6L0csgyGW
	jROu9YFwcb7ihUQ7gLt0YxZYC51V037Ffm+hJU2I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/JBjG/s944fmxdadLCyN6a5L5sAdgPD9owhd8gUMRT4=;
	b=OrwB6B4aR8yfZiwJM21MFNOKN00RegVH8K1+wZA4s4Ms3tPugjfDLB+tI20y23mJ
	lMcZ2ybc9FhDKPrDTTQYObwB4Qz8pEWRlWdxLVgGFuHuFTqhqHAUP9V0oPn062syoUo
	dt+6X7Sr4rFCGOUTKZwKaPPpKMtjMTCe/gwpwLjU=
Content-Type: multipart/mixed; boundary="===============9169224578668054122=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.4 FAILED
Message-ID: <0101018dadd39c22-9391f61e-1b9f-4967-9e51-18cb727a3539-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195562

--===============9169224578668054122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ofono* to *2.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.3-2.4.patch
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
From 804bfba72b8b9f8b0cd256d2885ece0701ab06ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 05:41:02 +0000
Subject: [PATCH] ofono: upgrade 2.3 -> 2.4

---
 ...mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch | 6 ++----
 ...im-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch | 5 +++--
 .../ofono/{ofono_2.3.bb => ofono_2.4.bb}                    | 2 +-
 3 files changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.3.bb => ofono_2.4.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch b/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
index 8a5a300adc..f5def3b222 100644
--- a/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
+++ b/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
@@ -1,4 +1,4 @@
-From 22b52db4842611ac31a356f023fc09595384e2ad Mon Sep 17 00:00:00 2001
+From 4c72571b6dde16406fce49906b0d69aa193adfef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 23 May 2019 18:11:22 -0700
 Subject: [PATCH] mbim: add an optional TEMP_FAILURE_RETRY macro copy
@@ -7,6 +7,7 @@ Fixes build on musl which does not provide this macro
 
 Upstream-Status: Submitted [https://lists.ofono.org/pipermail/ofono/2019-May/019370.html]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  drivers/mbimmodem/mbim-private.h | 9 +++++++++
  1 file changed, 9 insertions(+)
@@ -31,6 +32,3 @@ index e159235..51693ea 100644
  enum mbim_control_message {
  	MBIM_OPEN_MSG = 0x1,
  	MBIM_CLOSE_MSG = 0x2,
--- 
-2.21.0
-
diff --git a/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch b/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
index 3655b3fd66..eb2573b697 100644
--- a/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
+++ b/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
@@ -1,4 +1,4 @@
-From 76e4054801350ebd4a44057379431a33d460ad0f Mon Sep 17 00:00:00 2001
+From 79f62dd09cb33ac5022cfa28a967dc482749c725 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 21 Apr 2021 11:01:34 +0000
 Subject: [PATCH] mbim: Fix build with ell-0.39 by restoring unlikely macro
@@ -7,12 +7,13 @@ Subject: [PATCH] mbim: Fix build with ell-0.39 by restoring unlikely macro
 Upstream-Status: Pending
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
  drivers/mbimmodem/mbim-private.h | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/drivers/mbimmodem/mbim-private.h b/drivers/mbimmodem/mbim-private.h
-index 51693eae..d917312c 100644
+index 51693ea..d917312 100644
 --- a/drivers/mbimmodem/mbim-private.h
 +++ b/drivers/mbimmodem/mbim-private.h
 @@ -30,6 +30,10 @@
diff --git a/meta/recipes-connectivity/ofono/ofono_2.3.bb b/meta/recipes-connectivity/ofono/ofono_2.4.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.3.bb
rename to meta/recipes-connectivity/ofono/ofono_2.4.bb
index db5c8173de..dae5cc3c25 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.3.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.4.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
 "
-SRC_URI[sha256sum] = "658f9c16aec09c56bd36424982afc6ef292c0942b3a9e8ffefdda5974f01dac3"
+SRC_URI[sha256sum] = "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.42.0


--===============9169224578668054122==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.3-2.4.patch"

RnJvbSA4MDRiZmJhNzJiOGI5ZjhiMGNkMjU2ZDI4ODVlY2UwNzAxYWIwNmVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDU6NDE6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
Zm9ubzogdXBncmFkZSAyLjMgLT4gMi40CgotLS0KIC4uLm1iaW0tYWRkLWFuLW9wdGlvbmFsLVRF
TVBfRkFJTFVSRV9SRVRSWS1tYWNyby1jb3B5LnBhdGNoIHwgNiArKy0tLS0KIC4uLmltLUZpeC1i
dWlsZC13aXRoLWVsbC0wLjM5LWJ5LXJlc3RvcmluZy11bmxpa2VseS1tLnBhdGNoIHwgNSArKyst
LQogLi4uL29mb25vL3tvZm9ub18yLjMuYmIgPT4gb2Zvbm9fMi40LmJifSAgICAgICAgICAgICAg
ICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL3tvZm9ub18yLjMu
YmIgPT4gb2Zvbm9fMi40LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb2Zvbm8vb2Zvbm8vMDAwMS1tYmltLWFkZC1hbi1vcHRpb25hbC1URU1QX0ZBSUxV
UkVfUkVUUlktbWFjcm8tY29weS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zv
bm8vb2Zvbm8vMDAwMS1tYmltLWFkZC1hbi1vcHRpb25hbC1URU1QX0ZBSUxVUkVfUkVUUlktbWFj
cm8tY29weS5wYXRjaAppbmRleCA4YTVhMzAwYWRjLi5mNWRlZjNiMjIyIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vLzAwMDEtbWJpbS1hZGQtYW4tb3B0
aW9uYWwtVEVNUF9GQUlMVVJFX1JFVFJZLW1hY3JvLWNvcHkucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9uby8wMDAxLW1iaW0tYWRkLWFuLW9wdGlvbmFsLVRF
TVBfRkFJTFVSRV9SRVRSWS1tYWNyby1jb3B5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAy
MmI1MmRiNDg0MjYxMWFjMzFhMzU2ZjAyM2ZjMDk1OTUzODRlMmFkIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA0YzcyNTcxYjZkZGUxNjQwNmZjZTQ5OTA2YjBkNjlhYTE5M2FkZmVmIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KIERhdGU6IFRodSwgMjMgTWF5IDIwMTkgMTg6MTE6MjIgLTA3MDAKIFN1YmplY3Q6IFtQQVRD
SF0gbWJpbTogYWRkIGFuIG9wdGlvbmFsIFRFTVBfRkFJTFVSRV9SRVRSWSBtYWNybyBjb3B5CkBA
IC03LDYgKzcsNyBAQCBGaXhlcyBidWlsZCBvbiBtdXNsIHdoaWNoIGRvZXMgbm90IHByb3ZpZGUg
dGhpcyBtYWNybwogCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9saXN0cy5v
Zm9uby5vcmcvcGlwZXJtYWlsL29mb25vLzIwMTktTWF5LzAxOTM3MC5odG1sXQogU2lnbmVkLW9m
Zi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KKwogLS0tCiAgZHJpdmVycy9tYmlt
bW9kZW0vbWJpbS1wcml2YXRlLmggfCA5ICsrKysrKysrKwogIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKykKQEAgLTMxLDYgKzMyLDMgQEAgaW5kZXggZTE1OTIzNS4uNTE2OTNlYSAxMDA2
NDQKICBlbnVtIG1iaW1fY29udHJvbF9tZXNzYWdlIHsKICAJTUJJTV9PUEVOX01TRyA9IDB4MSwK
ICAJTUJJTV9DTE9TRV9NU0cgPSAweDIsCi0tLSAKLTIuMjEuMAotCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vLzAwMDItbWJpbS1GaXgtYnVpbGQtd2l0
aC1lbGwtMC4zOS1ieS1yZXN0b3JpbmctdW5saWtlbHktbS5wYXRjaCBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm8vMDAwMi1tYmltLUZpeC1idWlsZC13aXRoLWVsbC0wLjM5
LWJ5LXJlc3RvcmluZy11bmxpa2VseS1tLnBhdGNoCmluZGV4IDM2NTViM2ZkNjYuLmViMjU3M2I2
OTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm8vMDAw
Mi1tYmltLUZpeC1idWlsZC13aXRoLWVsbC0wLjM5LWJ5LXJlc3RvcmluZy11bmxpa2VseS1tLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm8vMDAwMi1tYmlt
LUZpeC1idWlsZC13aXRoLWVsbC0wLjM5LWJ5LXJlc3RvcmluZy11bmxpa2VseS1tLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA3NmU0MDU0ODAxMzUwZWJkNGE0NDA1NzM3OTQzMWEzM2Q0NjBh
ZDBmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3OWY2MmRkMDljYjMzYWM1MDIyY2Zh
MjhhOTY3ZGM0ODI3NDljNzI1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWFydGlu
IEphbnNhIDxNYXJ0aW4uSmFuc2FAZ21haWwuY29tPgogRGF0ZTogV2VkLCAyMSBBcHIgMjAyMSAx
MTowMTozNCArMDAwMAogU3ViamVjdDogW1BBVENIXSBtYmltOiBGaXggYnVpbGQgd2l0aCBlbGwt
MC4zOSBieSByZXN0b3JpbmcgdW5saWtlbHkgbWFjcm8KQEAgLTcsMTIgKzcsMTMgQEAgU3ViamVj
dDogW1BBVENIXSBtYmltOiBGaXggYnVpbGQgd2l0aCBlbGwtMC4zOSBieSByZXN0b3JpbmcgdW5s
aWtlbHkgbWFjcm8KIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogCiBTaWduZWQtb2ZmLWJ5OiBN
YXJ0aW4gSmFuc2EgPE1hcnRpbi5KYW5zYUBnbWFpbC5jb20+CisKIC0tLQogIGRyaXZlcnMvbWJp
bW1vZGVtL21iaW0tcHJpdmF0ZS5oIHwgNCArKysrCiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYmltbW9kZW0vbWJpbS1wcml2YXRlLmgg
Yi9kcml2ZXJzL21iaW1tb2RlbS9tYmltLXByaXZhdGUuaAotaW5kZXggNTE2OTNlYWUuLmQ5MTcz
MTJjIDEwMDY0NAoraW5kZXggNTE2OTNlYS4uZDkxNzMxMiAxMDA2NDQKIC0tLSBhL2RyaXZlcnMv
bWJpbW1vZGVtL21iaW0tcHJpdmF0ZS5oCiArKysgYi9kcml2ZXJzL21iaW1tb2RlbS9tYmltLXBy
aXZhdGUuaAogQEAgLTMwLDYgKzMwLDEwIEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29mb25vL29mb25vXzIuMy5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b2Zvbm8vb2Zvbm9fMi40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4zLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuNC5iYgppbmRleCBkYjVjODE3M2RlLi5k
YWU1Y2MzYzI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29m
b25vXzIuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIu
NC5iYgpAQCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJID0gIlwKICAgICBmaWxlOi8vMDAwMS1tYmlt
LWFkZC1hbi1vcHRpb25hbC1URU1QX0ZBSUxVUkVfUkVUUlktbWFjcm8tY29weS5wYXRjaCBcCiAg
ICAgZmlsZTovLzAwMDItbWJpbS1GaXgtYnVpbGQtd2l0aC1lbGwtMC4zOS1ieS1yZXN0b3Jpbmct
dW5saWtlbHktbS5wYXRjaCBcCiAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjU4ZjljMTZhZWMw
OWM1NmJkMzY0MjQ5ODJhZmM2ZWYyOTJjMDk0MmIzYTllOGZmZWZkZGE1OTc0ZjAxZGFjMyIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICI5MzU4MGFkYzFhZmQxODkwZGM1MTZlZmIwNjlkZTBjNWNkZmVm
MDE0NDE1MjU2ZGRmYjI4YWIxNzJkZjJkMTFkIgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25m
aWcgdXBkYXRlLXJjLmQgc3lzdGVtZCBnb2JqZWN0LWludHJvc3BlY3Rpb24tZGF0YQogCi0tIAoy
LjQyLjAKCg==

--===============9169224578668054122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1858 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1857 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d0253cdb70fff77817e8af9ae960cc34903a4fe4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d0253cdb70fff77817e8af9ae960cc34903a4fe4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 417 Local 404 Mirrors 0 Missed 13 Current 621 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2286 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.4.bb:do_recipe_qa)
NOTE: recipe ofono-2.4-r0: task do_recipe_qa: Started
NOTE: recipe ofono-2.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2806 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.4.bb:do_fetch)
NOTE: recipe ofono-2.4-r0: task do_fetch: Started
NOTE: recipe ofono-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2807 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.4.bb:do_unpack)
NOTE: Running task 2808 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.4-r0: task do_unpack: Started
NOTE: recipe ofono-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2809 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.4.bb:do_patch)
NOTE: Running task 2810 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.4.bb:do_collect_spdx_deps)
NOTE: recipe ofono-2.4-r0: task do_patch: Started
NOTE: recipe ofono-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe ofono-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ofono-2.4-r0: task do_patch: Succeeded
NOTE: Running task 2811 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2812 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.4.bb:do_populate_lic)
NOTE: recipe ofono-2.4-r0: task do_populate_lic: Started
NOTE: recipe ofono-2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.4-r0: task do_populate_lic: Succeeded
NOTE: recipe ofono-2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2813 of 2825 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.4.bb:do_configure)
NOTE: recipe ofono-2.4-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.61.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/
 systemd_255.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-
 worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'mobile-broadband-provider-info', 'openssl', 'base-files', 'base-passwd', 'dbus', 'ell', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd-systemctl-native', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'quilt-native', 'vala', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'wayland-protocols', 'wayland', 'libice', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxkbcommon', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'acl', 'attr', 'bash-completion', 'gdbm', 'icu', 'libcap-ng', 'libcap', 'libffi', 
 'libical', 'libpcre2', 'libseccomp', 'sqlite3', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'shadow-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libbsd-native', 'libmd-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| NOTE: Removing bundled ell from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/ofono-2.4/ell to prevent including it
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/ofono-2.4/build-aux/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/ofono-2.4/build-aux/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot-native/usr/share/aclocal/ --force -I build-aux
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
| libtoolize: copying file 'build-aux/ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'build-aux'.
| libtoolize: copying file 'build-aux/libtool.m4'
| libtoolize: copying file 'build-aux/ltoptions.m4'
| libtoolize: copying file 'build-aux/ltsugar.m4'
| libtoolize: copying file 'build-aux/ltversion.m4'
| libtoolize: copying file 'build-aux/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/ofono-2.4/build-aux/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot-native/usr/share/aclocal/ --force -I build-aux
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/ofono-2.4/build-aux/ --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/ofono-2.4/build-aux/ --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:23: installing 'build-aux/compile'
| configure.ac:8: installing 'build-aux/missing'
| Makefile.am: installing 'build-aux/depcomp'
| autoreconf: 'build-aux/install-sh' is updated
| autoreconf: 'build-aux/config.sub' is updated
| autoreconf: 'build-aux/config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../ofono-2.4/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot  --enable-test --enable-external-ell --disable-static  --enable-bluetooth --with-systemdunitdir=/usr/lib/systemd/system/
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot/usr/share/x86_64-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking how to create a pax tar archive... gnutar
| checking whether make supports nested variables... (cached) yes
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot-native/usr/bin/pkg-config
| checking pkg-config is at least version 0.9.0... configure: WARNING: using cross tools not prefixed with host triplet
| yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot... none
| checking for C/C++ restrict keyword... __restrict__
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot... (cached) none
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot accepts -fPIE... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot accepts -fsanitize=address... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot accepts -fsanitize=leak... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot accepts -fsanitize=undefined... yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot   option to reload object files... -r
| checking for x86_64-poky-linux-file... no
| checking for file... file
| checking for x86_64-poky-linux-objdump... x86_64-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for x86_64-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for x86_64-poky-linux-strip... (cached) x86_64-poky-linux-strip
| checking for x86_64-poky-linux-ranlib... x86_64-poky-linux-gcc-ranlib
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for _init in -lasan... no
| checking for _init in -llsan... no
| checking for _init in -lubsan... no
| checking for explicit_bzero... yes
| checking for rawmemchr... yes
| checking for signalfd... yes
| checking for dlopen in -ldl... yes
| checking for glib-2.0 >= 2.68... yes
| checking for dbus-1 >= 1.6... yes
| checking for libudev >= 143... yes
| checking for ell >= 0.62... no
| configure: error: Embedded Linux library >= 0.62 is required
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/temp/run.do_configure.144919:287 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/temp/run.do_configure.144919, line 287
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/temp/run.do_configure.144919, line 263
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/temp/run.do_configure.144919, line 233
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/temp/run.do_configure.144919, line 153
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/temp/run.do_configure.144919, line 291
NOTE: recipe ofono-2.4-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2813 tasks of which 2804 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215054008.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215054008.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.4.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ofono-2.4-r0 do_configure: configure failed
ERROR: ofono-2.4-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/temp/run.do_configure.144919', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.4/temp/log.do_configure.144919
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.4.bb:do_configure) failed with exit code '1'

--===============9169224578668054122==--

