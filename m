Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CB4CD3439
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15611.1777645533609425998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ay7q/g4J;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Kgl95s03;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de3ee3698-ccce9a25-4272-4afe-bd86-90b3bd93dbbf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645532;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QzQ/BSkTD+0u2UDWrPKtABH+1Y7++tbB44V3V0OTxh4=;
	b=Ay7q/g4JKoJtMm81QvURwIcFVgODMQJQYfc0FnjV+uIb+rsNAQ1HiXNGgjHeB9qA
	UJORZBVRfZtmfKUtJd86hO2+2wm438Gp3Qb/o0dIncCDg3qZBN0DlhO+UKDkKAptKH0
	jyjagxQDrIGQ5WK0WixJy8L1aOo2oKhGuhyl9Cws=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645532;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QzQ/BSkTD+0u2UDWrPKtABH+1Y7++tbB44V3V0OTxh4=;
	b=Kgl95s03Zx8gAQSA13AD+WMztJ6xDseNugxq29lGI+AMV8HaTL9WguO0WZlkWmRW
	KiYKKI6WqR1j4qztmElOFinPD6qgFiFk6UfGoQ378PNse6xFFj2I9GdKi2pnYFs/8VO
	D/V3clnNp3Iwbt4tIehv8kFh36lwbpxea4GOeOac=
Content-Type: multipart/mixed; boundary="===============4322155908308558432=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] iproute2: upgrading to 7.0.0 SUCCEEDED
Message-ID: <0101019de3ee3698-ccce9a25-4272-4afe-bd86-90b3bd93dbbf-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236211

--===============4322155908308558432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *iproute2* to *7.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-6.19.0-7.0.0.patch
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
From 69424cc17f242453b4537f6b402ed0fbad401563 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 06:48:19 +0000
Subject: [PATCH] iproute2: upgrade 6.19.0 -> 7.0.0

---
 ...lude-libnetlink.h-add-missing-include-for-htobe64.patch | 4 ++--
 ...002-include-color.h-add-missing-include-for-types.patch | 7 ++-----
 .../iproute2/{iproute2_6.19.0.bb => iproute2_7.0.0.bb}     | 2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.19.0.bb => iproute2_7.0.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
index 614cd00499..efca33b6cf 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-include-libnetlink.h-add-missing-include-for-htobe64.patch
@@ -1,4 +1,4 @@
-From 228a051a53a4e6b1ca2640932cb78a23e44454a8 Mon Sep 17 00:00:00 2001
+From c32fe3424c067baebbf6c263886e04bb99a5af77 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 24 Aug 2024 15:32:25 +0200
 Subject: [PATCH] include/libnetlink.h: add missing include for htobe64
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+)
 
 diff --git a/include/libnetlink.h b/include/libnetlink.h
-index 7074e91..3dbfa42 100644
+index e91505d..938bb40 100644
 --- a/include/libnetlink.h
 +++ b/include/libnetlink.h
 @@ -13,6 +13,7 @@
diff --git a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch b/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
index 146f2f42a9..c5c7254c61 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0002-include-color.h-add-missing-include-for-types.patch
@@ -1,4 +1,4 @@
-From 1bcc784f5c2406eb1898f1b935ad0f534cc281ad Mon Sep 17 00:00:00 2001
+From 2289366b53c5bdc117907e88578d24d2007fd035 Mon Sep 17 00:00:00 2001
 From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
 Date: Thu, 5 Mar 2026 08:06:54 +0100
 Subject: [PATCH] include/color.h: add missing include for types
@@ -12,7 +12,7 @@ Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/include/color.h b/include/color.h
-index b543c267..3794a2aa 100644
+index b543c26..3794a2a 100644
 --- a/include/color.h
 +++ b/include/color.h
 @@ -3,6 +3,7 @@
@@ -23,6 +23,3 @@ index b543c267..3794a2aa 100644
  
  enum color_attr {
  	COLOR_IFNAME,
--- 
-2.47.3
-
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.19.0.bb b/meta/recipes-connectivity/iproute2/iproute2_7.0.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.19.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_7.0.0.bb
index 28ed1093ab..15f626de3e 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.19.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_7.0.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0002-include-color.h-add-missing-include-for-types.patch \
            "
 
-SRC_URI[sha256sum] = "9332213d35480b647086a70c302de8568de83455a98774d35de216c4ce191006"
+SRC_URI[sha256sum] = "e62890f7b5de63c05a3bf331dc8deb4c015c336013f341a4edf46969797f2f4e"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.47.1


--===============4322155908308558432==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.19.0-7.0.0.patch"

RnJvbSA2OTQyNGNjMTdmMjQyNDUzYjQ1MzdmNmI0MDJlZDBmYmFkNDAxNTYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNjo0ODoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlw
cm91dGUyOiB1cGdyYWRlIDYuMTkuMCAtPiA3LjAuMAoKLS0tCiAuLi5sdWRlLWxpYm5ldGxpbmsu
aC1hZGQtbWlzc2luZy1pbmNsdWRlLWZvci1odG9iZTY0LnBhdGNoIHwgNCArKy0tCiAuLi4wMDIt
aW5jbHVkZS1jb2xvci5oLWFkZC1taXNzaW5nLWluY2x1ZGUtZm9yLXR5cGVzLnBhdGNoIHwgNyAr
Ky0tLS0tCiAuLi4vaXByb3V0ZTIve2lwcm91dGUyXzYuMTkuMC5iYiA9PiBpcHJvdXRlMl83LjAu
MC5iYn0gICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi97aXBy
b3V0ZTJfNi4xOS4wLmJiID0+IGlwcm91dGUyXzcuMC4wLmJifSAoOTclKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTIvMDAwMS1pbmNsdWRl
LWxpYm5ldGxpbmsuaC1hZGQtbWlzc2luZy1pbmNsdWRlLWZvci1odG9iZTY0LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAxLWluY2x1ZGUtbGli
bmV0bGluay5oLWFkZC1taXNzaW5nLWluY2x1ZGUtZm9yLWh0b2JlNjQucGF0Y2gKaW5kZXggNjE0
Y2QwMDQ5OS4uZWZjYTMzYjZjZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAxLWluY2x1ZGUtbGlibmV0bGluay5oLWFkZC1taXNzaW5n
LWluY2x1ZGUtZm9yLWh0b2JlNjQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9pcHJvdXRlMi9pcHJvdXRlMi8wMDAxLWluY2x1ZGUtbGlibmV0bGluay5oLWFkZC1taXNzaW5n
LWluY2x1ZGUtZm9yLWh0b2JlNjQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDIyOGEwNTFh
NTNhNGU2YjFjYTI2NDA5MzJjYjc4YTIzZTQ0NDU0YTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGMzMmZlMzQyNGMwNjdiYWViYmY2YzI2Mzg4NmUwNGJiOTlhNWFmNzcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4
LmRlPgogRGF0ZTogU2F0LCAyNCBBdWcgMjAyNCAxNTozMjoyNSArMDIwMAogU3ViamVjdDogW1BB
VENIXSBpbmNsdWRlL2xpYm5ldGxpbmsuaDogYWRkIG1pc3NpbmcgaW5jbHVkZSBmb3IgaHRvYmU2
NApAQCAtMTEsNyArMTEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eEBsaW51dHJvbml4LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saWJuZXRsaW5rLmggYi9pbmNsdWRlL2xpYm5ldGxpbmsuaAotaW5k
ZXggNzA3NGU5MS4uM2RiZmE0MiAxMDA2NDQKK2luZGV4IGU5MTUwNWQuLjkzOGJiNDAgMTAwNjQ0
CiAtLS0gYS9pbmNsdWRlL2xpYm5ldGxpbmsuaAogKysrIGIvaW5jbHVkZS9saWJuZXRsaW5rLmgK
IEBAIC0xMyw2ICsxMyw3IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2lwcm91dGUyL2lwcm91dGUyLzAwMDItaW5jbHVkZS1jb2xvci5oLWFkZC1taXNzaW5nLWluY2x1
ZGUtZm9yLXR5cGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9p
cHJvdXRlMi8wMDAyLWluY2x1ZGUtY29sb3IuaC1hZGQtbWlzc2luZy1pbmNsdWRlLWZvci10eXBl
cy5wYXRjaAppbmRleCAxNDZmMmY0MmE5Li5jNWM3MjU0YzYxIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyLzAwMDItaW5jbHVkZS1jb2xvci5o
LWFkZC1taXNzaW5nLWluY2x1ZGUtZm9yLXR5cGVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTIvMDAwMi1pbmNsdWRlLWNvbG9yLmgtYWRkLW1p
c3NpbmctaW5jbHVkZS1mb3ItdHlwZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFiY2M3
ODRmNWMyNDA2ZWIxODk4ZjFiOTM1YWQwZjUzNGNjMjgxYWQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDIyODkzNjZiNTNjNWJkYzExNzkwN2U4ODU3OGQyNGQyMDA3ZmQwMzUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZWogS296ZW1jYWsgPGFuZHJlai5rb3plbWNh
a0BzaWVtZW5zLmNvbT4KIERhdGU6IFRodSwgNSBNYXIgMjAyNiAwODowNjo1NCArMDEwMAogU3Vi
amVjdDogW1BBVENIXSBpbmNsdWRlL2NvbG9yLmg6IGFkZCBtaXNzaW5nIGluY2x1ZGUgZm9yIHR5
cGVzCkBAIC0xMiw3ICsxMiw3IEBAIFNpZ25lZC1vZmYtYnk6IEFuZHJlaiBLb3plbWNhayA8YW5k
cmVqLmtvemVtY2FrQHNpZW1lbnMuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQogCiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9jb2xvci5oIGIvaW5jbHVkZS9jb2xvci5oCi1pbmRl
eCBiNTQzYzI2Ny4uMzc5NGEyYWEgMTAwNjQ0CitpbmRleCBiNTQzYzI2Li4zNzk0YTJhIDEwMDY0
NAogLS0tIGEvaW5jbHVkZS9jb2xvci5oCiArKysgYi9pbmNsdWRlL2NvbG9yLmgKIEBAIC0zLDYg
KzMsNyBAQApAQCAtMjMsNiArMjMsMyBAQCBpbmRleCBiNTQzYzI2Ny4uMzc5NGEyYWEgMTAwNjQ0
CiAgCiAgZW51bSBjb2xvcl9hdHRyIHsKICAJQ09MT1JfSUZOQU1FLAotLS0gCi0yLjQ3LjMKLQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl82
LjE5LjAuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzcu
MC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4xOS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzcuMC4wLmJiCmluZGV4IDI4ZWQxMDkz
YWIuLjE1ZjYyNmRlM2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXBy
b3V0ZTIvaXByb3V0ZTJfNi4xOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
aXByb3V0ZTIvaXByb3V0ZTJfNy4wLjAuYmIKQEAgLTE2LDcgKzE2LDcgQEAgU1JDX1VSSSA9ICIk
e0tFUk5FTE9SR19NSVJST1J9L2xpbnV4L3V0aWxzL25ldC8ke0JQTn0vJHtCUH0udGFyLnh6IFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDItaW5jbHVkZS1jb2xvci5oLWFkZC1taXNzaW5nLWluY2x1
ZGUtZm9yLXR5cGVzLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiOTMzMjIxM2QzNTQ4MGI2NDcwODZhNzBjMzAyZGU4NTY4ZGU4MzQ1NWE5ODc3NGQzNWRlMjE2
YzRjZTE5MTAwNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlNjI4OTBmN2I1ZGU2M2MwNWEzYmYz
MzFkYzhkZWI0YzAxNWMzMzYwMTNmMzQxYTRlZGY0Njk2OTc5N2YyZjRlIgogCiBpbmhlcml0IHVw
ZGF0ZS1hbHRlcm5hdGl2ZXMgYmFzaC1jb21wbGV0aW9uIHBrZ2NvbmZpZwogCi0tIAoyLjQ3LjEK
Cg==

--===============4322155908308558432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/iproute2/iproute2-bash-completion: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-bash-completion: PKGSIZE changed from 64180 to 64338 (+0%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-bridge: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-bridge: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 9424448 to 9519088 (+1%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-dev: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-dev: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-devlink: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-devlink: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-doc: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-doc: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-genl: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-genl: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ifstat: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ip: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-ip: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-ip: PKGSIZE changed from 735299 to 739395 (+1%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-lnstat: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-locale: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-locale: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-nstat: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-nstat: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-rdma: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-rdma: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-routel: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-routel: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-rtacct: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: FILELIST: directory renamed /usr/src/debug/iproute2/6.19.0/bridge -> /usr/src/debug/iproute2/7.0.0/bridge, directory renamed /usr/src/debug/iproute2/6.19.0/tc -> /usr/src/debug/iproute2/7.0.0/tc, directory renamed /usr/src/debug/iproute2/6.19.0/include/uapi/asm-generic -> /usr/src/debug/iproute2/7.0.0/include/uapi/asm-generic, directory renamed /usr/src/debug/iproute2/6.19.0/include/uapi/linux/netfilter -> /usr/src/debug/iproute2/7.0.0/include/uapi/linux/netfilter, directory renamed /usr/src/debug/iproute2/6.19.0/devlink -> /usr/src/debug/iproute2/7.0.0/devlink, directory renamed /usr/src/debug/iproute2/6.19.0/include/uapi/linux/netfilter/ipset -> /usr/src/debug/iproute2/7.0.0/include/uapi/linux/netfilter/ipset, directory renamed /usr/src/debug/iproute2/6.19.0/include/uapi/linux/hdlc -> /usr/src/debug/iproute2/7.0.0/include/uapi/linux/hdlc, directory renamed /usr/src/debug/iproute2/6.19.0/genl -> /usr/src/debug/iproute2/7.0.0/genl,
  directory renamed /usr/src/debug/iproute2/6.19.0/ip -> /usr/src/debug/iproute2/7.0.0/ip, directory renamed /usr/src/debug/iproute2/6.19.0/tipc -> /usr/src/debug/iproute2/7.0.0/tipc, directory renamed /usr/src/debug/iproute2/6.19.0/misc -> /usr/src/debug/iproute2/7.0.0/misc, directory renamed /usr/src/debug/iproute2/6.19.0/include/uapi/linux/tc_act -> /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tc_act, directory renamed /usr/src/debug/iproute2/6.19.0/include/uapi/linux/tc_ematch -> /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tc_ematch, directory renamed /usr/src/debug/iproute2/6.19.0/include/uapi/linux/can -> /usr/src/debug/iproute2/7.0.0/include/uapi/linux/can, removed "/usr/src/debug/iproute2/6.19.0/lib/names.c /usr/src/debug/iproute2/6.19.0/lib/color.c /usr/src/debug/iproute2/6.19.0/include/xtables.h /usr/src/debug/iproute2/6.19.0/lib/utils.c /usr/src/debug/iproute2/6.19.0/lib/bridge.c /usr/src/debug/iproute2/6.19.0/lib/netrom_ntop.c /usr/src/debug/iproute2/6.19.0/lib/s
 elinux.c /usr/src/debug/iproute2/6.19.0/include/uapi/linux/xfrm.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/sctp.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/tipc_sockets_diag.h /usr/src/debug/iproute2/6.19.0/include/ll_map.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/seg6_local.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/ioam6_genl.h /usr/src/debug/iproute2/6.19.0/lib/utils_math.c /usr/src/debug/iproute2/6.19.0/include/uapi/linux/if_tunnel.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/filter.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/if_alg.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/socket.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/fib_rules.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/ip6_tunnel.h /usr/src/debug/iproute2/6.19.0/lib/mpls_pton.c /usr/src/debug/iproute2/6.19.0/lib/ll_proto.c /usr/src/debug/iproute2/6.19.0/include/uapi/linux/lwtunnel.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/ila.h /usr/src
 /debug/iproute2/6.19.0/include/uapi/linux/snmp.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/netlink_diag.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/tls.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/batman_adv.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/ax25.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/tcp.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/bpf.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/if_addr.h /usr/src/debug/iproute2/6.19.0/lib/bpf_glue.c /usr/src/debug/iproute2/6.19.0/include/uapi/linux/netfilter.h /usr/src/debug/iproute2/6.19.0/lib/fs.c /usr/src/debug/iproute2/6.19.0/include/uapi/linux/mptcp_pm.h /usr/src/debug/iproute2/6.19.0/lib/ll_addr.c /usr/src/debug/iproute2/6.19.0/include/namespace.h /usr/src/debug/iproute2/6.19.0/lib/mpls_ntop.c /usr/src/debug/iproute2/6.19.0/lib/rose_ntop.c /usr/src/debug/iproute2/6.19.0/lib/ax25_ntop.c /usr/src/debug/iproute2/6.19.0/include/uapi/linux/can.h /usr/src/debug/iproute2/6.19.0/in
 clude/json_writer.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/ife.h /usr/src/debug/iproute2/6.19.0/include/color.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/nexthop.h /usr/src/debug/iproute2/6.19.0/include/names.h /usr/src/debug/iproute2/6.19.0/lib/cg_map.c /usr/src/debug/iproute2/6.19.0/lib/ll_map.c /usr/src/debug/iproute2/6.19.0/include/uapi/linux/if_bridge.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/tipc.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/if_bonding.h /usr/src/debug/iproute2/6.19.0/lib/ppp_proto.c /usr/src/debug/iproute2/6.19.0/lib/exec.c /usr/src/debug/iproute2/6.19.0/lib/mnlg.c /usr/src/debug/iproute2/6.19.0/include/uapi/linux/if_addrlabel.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/mpls_iptunnel.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/seg6_iptunnel.h /usr/src/debug/iproute2/6.19.0/lib/mnl_utils.c /usr/src/debug/iproute2/6.19.0/lib/json_writer.c /usr/src/debug/iproute2/6.19.0/include/bridge.h /usr/src/debug/iproute2/6
 .19.0/lib/rt_names.c /usr/src/debug/iproute2/6.19.0/include/json_print.h /usr/src/debug/iproute2/6.19.0/include/utils.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/if.h /usr/src/debug/iproute2/6.19.0/include/libgenl.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/amt.h /usr/src/debug/iproute2/6.19.0/include/list.h /usr/src/debug/iproute2/6.19.0/lib/json_print_math.c /usr/src/debug/iproute2/6.19.0/include/bpf_scm.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/if_macsec.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/pkt_cls.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/rpl.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/gen_stats.h /usr/src/debug/iproute2/6.19.0/lib/libgenl.c /usr/src/debug/iproute2/6.19.0/include/uapi/linux/seg6_genl.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/if_vlan.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/fou.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/neighbour.h /usr/src/debug/iproute2/6.19.0/lib/bpf_legac
 y.c /usr/src/debug/iproute2/6.19.0/include/uapi/linux/packet_diag.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/l2tp.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/genetlink.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/rtnetlink.h /usr/src/debug/iproute2/6.19.0/include/version.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/net_namespace.h /usr/src/debug/iproute2/6.19.0/lib/namespace.c /usr/src/debug/iproute2/6.19.0/include/uapi/linux/veth.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/pkt_sched.h /usr/src/debug/iproute2/6.19.0/include/libnetlink.h /usr/src/debug/iproute2/6.19.0/lib/inet_proto.c /usr/src/debug/iproute2/6.19.0/include/uapi/linux/btf.h /usr/src/debug/iproute2/6.19.0/include/rtm_map.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/vm_sockets_diag.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/tcp_metrics.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/wwan.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/rpl_iptunnel.h /usr/src
 /debug/iproute2/6.19.0/include/uapi/linux/sysinfo.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/rose.h /usr/src/debug/iproute2/6.19.0/include/mnlg.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/seg6.h /usr/src/debug/iproute2/6.19.0/include/bpf_elf.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/seg6_hmac.h /usr/src/debug/iproute2/6.19.0/include/bpf_util.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/netconf.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/ip.h /usr/src/debug/iproute2/6.19.0/lib/libnetlink.c /usr/src/debug/iproute2/6.19.0/include/rt_names.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/inet_diag.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/sock_diag.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/unix_diag.h /usr/src/debug/iproute2/6.19.0/lib/json_print.c /usr/src/debug/iproute2/6.19.0/include/uapi/linux/ioam6.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/mptcp.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/types.h /us
 r/src/debug/iproute2/6.19.0/include/uapi/linux/ioam6_iptunnel.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/devlink.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/if_link.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/netlink.h /usr/src/debug/iproute2/6.19.0/include/mnl_utils.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/xdp_diag.h /usr/src/debug/iproute2/6.19.0/include/selinux.h /usr/src/debug/iproute2/6.19.0/include/uapi/linux/mpls.h /usr/src/debug/iproute2/6.19.0/lib/ll_types.c /usr/src/debug/iproute2/6.19.0/include/uapi/linux/tipc_netlink.h /usr/src/debug/iproute2/6.19.0/include/cg_map.h", added "/usr/src/debug/iproute2/7.0.0/include/uapi/linux/btf.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_bonding.h /usr/src/debug/iproute2/7.0.0/lib/netrom_ntop.c /usr/src/debug/iproute2/7.0.0/include/list.h /usr/src/debug/iproute2/7.0.0/include/json_print.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/types.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/
 veth.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/mptcp.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tcp_metrics.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/net_namespace.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/mptcp_pm.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/packet_diag.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/sock_diag.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/fib_rules.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/inet_diag.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/unix_diag.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/amt.h /usr/src/debug/iproute2/7.0.0/include/namespace.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/seg6.h /usr/src/debug/iproute2/7.0.0/include/bpf_util.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/rpl_iptunnel.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_addr.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/genetlink.h /usr/src/debug/iproute2/7.0.0/include/uapi/l
 inux/if_link.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_vlan.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/sysinfo.h /usr/src/debug/iproute2/7.0.0/include/bridge.h /usr/src/debug/iproute2/7.0.0/lib/libnetlink.c /usr/src/debug/iproute2/7.0.0/lib/ppp_proto.c /usr/src/debug/iproute2/7.0.0/lib/utils_math.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/seg6_hmac.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ioam6.h /usr/src/debug/iproute2/7.0.0/lib/libgenl.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ife.h /usr/src/debug/iproute2/7.0.0/lib/ll_proto.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/netlink_diag.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/fou.h /usr/src/debug/iproute2/7.0.0/include/color.h /usr/src/debug/iproute2/7.0.0/include/bpf_scm.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tcp.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ip6_tunnel.h /usr/src/debug/iproute2/7.0.0/include/mnl_utils.h /usr/src/debug/iproute2/7.0.0/inclu
 de/uapi/linux/snmp.h /usr/src/debug/iproute2/7.0.0/include/xtables.h /usr/src/debug/iproute2/7.0.0/lib/ll_types.c /usr/src/debug/iproute2/7.0.0/lib/rt_names.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/filter.h /usr/src/debug/iproute2/7.0.0/include/bpf_elf.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_macsec.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ila.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/lwtunnel.h /usr/src/debug/iproute2/7.0.0/lib/fs.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/netfilter.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/bpf.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ax25.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/mpls.h /usr/src/debug/iproute2/7.0.0/include/names.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/batman_adv.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_tunnel.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/seg6_local.h /usr
 /src/debug/iproute2/7.0.0/lib/json_print.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ip.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tipc_sockets_diag.h /usr/src/debug/iproute2/7.0.0/lib/json_writer.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/neighbour.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tls.h /usr/src/debug/iproute2/7.0.0/include/utils.h /usr/src/debug/iproute2/7.0.0/include/rt_names.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/rose.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_addrlabel.h /usr/src/debug/iproute2/7.0.0/include/mnlg.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ioam6_genl.h /usr/src/debug/iproute2/7.0.0/lib/ax25_ntop.c /usr/src/debug/iproute2/7.0.0/lib/bridge.c /usr/src/debug/iproute2/7.0.0/lib/cg_map.c /usr/src/debug/iproute2/7.0.0/lib/escape.c /usr/src/debug/iproute2/7.0.0/lib/ll_map.c /usr/src/debug/iproute2/7.0.0/lib/mpls_ntop.c /usr/src/debug/iproute2/7.0.0/include/version.h /usr/src/debug/iproute2/7.0.0/lib
 /rose_ntop.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/xfrm.h /usr/src/debug/iproute2/7.0.0/include/libnetlink.h /usr/src/debug/iproute2/7.0.0/lib/sha1.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/if_bridge.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/wwan.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/l2tp.h /usr/src/debug/iproute2/7.0.0/include/selinux.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/gen_stats.h /usr/src/debug/iproute2/7.0.0/lib/exec.c /usr/src/debug/iproute2/7.0.0/lib/namespace.c /usr/src/debug/iproute2/7.0.0/include/rtm_map.h /usr/src/debug/iproute2/7.0.0/lib/selinux.c /usr/src/debug/iproute2/7.0.0/lib/bpf_legacy.c /usr/src/debug/iproute2/7.0.0/lib/mpls_pton.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/pkt_cls.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/rtnetlink.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/devlink.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/netconf.h /usr/src/debug/iproute2/7.0.0/include/uapi/l
 inux/seg6_iptunnel.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/mpls_iptunnel.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/netlink.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/nexthop.h /usr/src/debug/iproute2/7.0.0/lib/inet_proto.c /usr/src/debug/iproute2/7.0.0/lib/json_print_math.c /usr/src/debug/iproute2/7.0.0/lib/color.c /usr/src/debug/iproute2/7.0.0/lib/names.c /usr/src/debug/iproute2/7.0.0/lib/utils.c /usr/src/debug/iproute2/7.0.0/lib/ll_addr.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tipc_netlink.h /usr/src/debug/iproute2/7.0.0/include/sha1.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/vm_sockets_diag.h /usr/src/debug/iproute2/7.0.0/include/json_writer.h /usr/src/debug/iproute2/7.0.0/lib/mnl_utils.c /usr/src/debug/iproute2/7.0.0/lib/mnlg.c /usr/src/debug/iproute2/7.0.0/include/uapi/linux/pkt_sched.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/socket.h /usr/src/debug/iproute2/7.0.0/lib/bpf_glue.c /usr/src/debug/iproute2/7.0.0/include/uapi/li
 nux/sctp.h /usr/src/debug/iproute2/7.0.0/include/cg_map.h /usr/src/debug/iproute2/7.0.0/include/ll_map.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/ioam6_iptunnel.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/seg6_genl.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/tipc.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/rpl.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/xdp_diag.h /usr/src/debug/iproute2/7.0.0/include/uapi/linux/can.h /usr/src/debug/iproute2/7.0.0/include/libgenl.h"
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3774838 to 3784323 (+0%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-ss: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-ss: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-staticdev: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-tc: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-tc: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2-tc: PKGSIZE changed from 601600 to 605760 (+1%)
packages/x86-64-v3-poky-linux/iproute2/iproute2-tipc: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2-tipc: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2/iproute2: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2/iproute2: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2: PV changed from "6.19.0" to "7.0.0"
packages/x86-64-v3-poky-linux/iproute2: PKGV changed from 6.19.0 [default] to 7.0.0 [default]
packages/x86-64-v3-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.19.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch file://0002-include-color.h-add-missing-include-for-types.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-7.0.0.tar.xz file://0001-include-libnetlink.h-add-missing-include-for-htobe64.patch file://0002-include-color.h-add-missing-include-for-types.patch"

--===============4322155908308558432==--

