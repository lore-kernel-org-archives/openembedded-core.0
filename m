Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F47C021AF
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:31 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.17869.1736936768451810378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BK+GRrSg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ICdwhmQg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010194697fffa1-48133ec6-fd61-465f-b8bc-216dcf99fda0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936783;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Lqyn6GnKLoUOYjBF4ZB2XIqHTWIS4kzrTT1d3MUmZ9U=;
	b=BK+GRrSgqoR4pUIBvdbNS+SmozVkHZR04mCt1+pzpUrF3uOaISddCU8+y6buZFLv
	KPHFMA2k4dfeu0iHG+7omyUHHefKg1v5dRea9bdW0lF908INhI45/Rl9uJECSLVcqea
	uIOu/GhVxIM7NeA9xQOCnnwyyLYGWnYgMBx0855g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936783;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Lqyn6GnKLoUOYjBF4ZB2XIqHTWIS4kzrTT1d3MUmZ9U=;
	b=ICdwhmQgNuhHZjBeXuhtOQJuVgQ0/a1UEjnK5W5zc/zSSPNLxUAefgbdr8/P3+Rm
	DnbguLJJBfVVyM8/oCffz8FqJG4cdpY7xIdgjvqyCJWmCwgQHyz2mCQHqhYB6haROd2
	ipRz1/ei3Hz2bGUs70czLolhyZu26VRuqyEOd2vI=
Content-Type: multipart/mixed; boundary="===============8461819087325755970=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.5.3 SUCCEEDED
Message-ID: <01010194697fffa1-48133ec6-fd61-465f-b8bc-216dcf99fda0-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209887

--===============8461819087325755970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnupg* to *2.5.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.5.2-2.5.3.patch
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
From e83e0bdef1ee6c6433d04e4cc3b297484b7ac98f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 10:21:36 +0000
Subject: [PATCH] gnupg: upgrade 2.5.2 -> 2.5.3

---
 .../gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch  | 2 +-
 ...configure.ac-use-a-custom-value-for-the-location-of-.patch | 4 ++--
 .../gnupg/gnupg/0001-fix-compile-failure-with-musl.patch      | 4 ++--
 .../gnupg/0002-use-pkgconfig-instead-of-npth-config.patch     | 2 +-
 .../0004-autogen.sh-fix-find-version-for-beta-checking.patch  | 2 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch               | 2 +-
 meta/recipes-support/gnupg/{gnupg_2.5.2.bb => gnupg_2.5.3.bb} | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.2.bb => gnupg_2.5.3.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 024f4a9f10..78dcfb182b 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 69d132c4cca738f148551af24932010fb1029ea1 Mon Sep 17 00:00:00 2001
+From e954e359d7a9aeaab5271467f14e18afe946b561 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 702cba4b71..eec94f8631 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From d9ef954b602c17839c52a1d7dc73e2354e5fbbbb Mon Sep 17 00:00:00 2001
+From 1611a2ce4fde7a41efb0de74ba3a3b373a29416f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 29592fd..7286862 100644
+index 6252d57..1da2c6f 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1911,7 +1911,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
index ec99f4b10c..efb4dca230 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
@@ -1,4 +1,4 @@
-From 81c222ea179ef73fcae4b50c56342bdad4787a28 Mon Sep 17 00:00:00 2001
+From 52cfa08551ce8c8a2f3d3118859ccaa7f8ad2f89 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 22 Aug 2024 15:31:16 +0800
 Subject: [PATCH] fix compile failure with musl
@@ -20,7 +20,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/scd/app.c b/scd/app.c
-index ba7bb23..7d41e53 100644
+index f08067e..1fbe9ff 100644
 --- a/scd/app.c
 +++ b/scd/app.c
 @@ -24,6 +24,7 @@
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index a7a6f03c7d..adba9d6689 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From d5fc05998d7260fd94a558c53f6e6c35a384d163 Mon Sep 17 00:00:00 2001
+From aaf0d76c1eb2b875fe355ebb427de549b6b1724e Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index 8aeb87dfd4..2e5418b151 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From 21396a6e74d188a2198439aa27403c29c1dbcea8 Mon Sep 17 00:00:00 2001
+From 226ec1f4f09288fb148f74b5aacbbdf33a0bcbdc Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 08e70fb444..9d64dababd 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 93fef8f493ee66856ef02351da25583eea94202d Mon Sep 17 00:00:00 2001
+From ca4aae6a52055fe09016ff63f7a00605d58b1dae Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.2.bb b/meta/recipes-support/gnupg/gnupg_2.5.3.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.2.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.3.bb
index 64c63e31ce..435066c9eb 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.2.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.3.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "7f404ccc6a58493fedc15faef59f3ae914831cff866a23f0bf9d66cfdd0fea29"
+SRC_URI[sha256sum] = "23128b136aed4e5121e793d1b6c60ee50c8007a9d926c1313e524d05386b54ac"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.44.1


--===============8461819087325755970==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.5.2-2.5.3.patch"

RnJvbSBlODNlMGJkZWYxZWU2YzY0MzNkMDRlNGNjM2IyOTc0ODRiN2FjOThmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMTA6MjE6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bnVwZzogdXBncmFkZSAyLjUuMiAtPiAyLjUuMwoKLS0tCiAuLi4vZ251cGcvMDAwMS1Xb3ZlcnJp
ZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2ggIHwgMiArLQogLi4uY29uZmln
dXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaCB8IDQg
KystLQogLi4uL2dudXBnL2dudXBnLzAwMDEtZml4LWNvbXBpbGUtZmFpbHVyZS13aXRoLW11c2wu
cGF0Y2ggICAgICB8IDQgKystLQogLi4uL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFk
LW9mLW5wdGgtY29uZmlnLnBhdGNoICAgICB8IDIgKy0KIC4uLi8wMDA0LWF1dG9nZW4uc2gtZml4
LWZpbmQtdmVyc2lvbi1mb3ItYmV0YS1jaGVja2luZy5wYXRjaCAgfCAyICstCiBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaCAgICAgICAgICAgICAgIHwgMiAr
LQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcve2dudXBnXzIuNS4yLmJiID0+IGdudXBnXzIu
NS4zLmJifSB8IDIgKy0KIDcgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL3tnbnVwZ18yLjUuMi5i
YiA9PiBnbnVwZ18yLjUuMy5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9nbnVwZy9nbnVwZy8wMDAxLVdvdmVycmlkZS1pbml0LWlzLW5vdC1uZWVkZWQtd2l0aC1n
Y2MtOS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtV292ZXJy
aWRlLWluaXQtaXMtbm90LW5lZWRlZC13aXRoLWdjYy05LnBhdGNoCmluZGV4IDAyNGY0YTlmMTAu
Ljc4ZGNmYjE4MmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBn
LzAwMDEtV292ZXJyaWRlLWluaXQtaXMtbm90LW5lZWRlZC13aXRoLWdjYy05LnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtV292ZXJyaWRlLWluaXQtaXMt
bm90LW5lZWRlZC13aXRoLWdjYy05LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2OWQxMzJj
NGNjYTczOGYxNDg1NTFhZjI0OTMyMDEwZmIxMDI5ZWExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBlOTU0ZTM1OWQ3YTlhZWFhYjUyNzE0NjdmMTRlMThhZmU5NDZiNTYxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERh
dGU6IFRodSwgMjAgRGVjIDIwMTggMTc6Mzc6NDggLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gV292
ZXJyaWRlLWluaXQgaXMgbm90IG5lZWRlZCB3aXRoIGdjYyA5CmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20t
dmFsdWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9n
bnVwZy9nbnVwZy8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1s
b2NhdGlvbi1vZi0ucGF0Y2gKaW5kZXggNzAyY2JhNGI3MS4uZWVjOTRmODYzMSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1jb25maWd1cmUuYWMtdXNl
LWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12
YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDll
Zjk1NGI2MDJjMTc4MzljNTJhMWQ3ZGM3M2UyMzU0ZTVmYmJiYiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gMTYxMWEyY2U0ZmRlN2E0MWVmYjBkZTc0YmEzYTNiMzczYTI5NDE2ZiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogRGF0ZTogTW9uLCAyMiBKYW4gMjAxOCAxODowMDoyMSArMDIwMAogU3Vi
amVjdDogW1BBVENIXSBjb25maWd1cmUuYWM6IHVzZSBhIGN1c3RvbSB2YWx1ZSBmb3IgdGhlIGxv
Y2F0aW9uIG9mCkBAIC0xMyw3ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmln
dXJlLmFjCi1pbmRleCAyOTU5MmZkLi43Mjg2ODYyIDEwMDY0NAoraW5kZXggNjI1MmQ1Ny4uMWRh
MmM2ZiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAt
MTkxMSw3ICsxOTExLDcgQEAgQUNfREVGSU5FX1VOUVVPVEVEKEdQR0NPTkZfRElTUF9OQU1FLCAi
R1BHQ29uZiIsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8w
MDAxLWZpeC1jb21waWxlLWZhaWx1cmUtd2l0aC1tdXNsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ251cGcvZ251cGcvMDAwMS1maXgtY29tcGlsZS1mYWlsdXJlLXdpdGgtbXVzbC5wYXRj
aAppbmRleCBlYzk5ZjRiMTBjLi5lZmI0ZGNhMjMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLWZpeC1jb21waWxlLWZhaWx1cmUtd2l0aC1tdXNsLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtZml4LWNvbXBp
bGUtZmFpbHVyZS13aXRoLW11c2wucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDgxYzIyMmVh
MTc5ZWY3M2ZjYWU0YjUwYzU2MzQyYmRhZDQ3ODdhMjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDUyY2ZhMDg1NTFjZThjOGEyZjNkMzExODg1OWNjYWE3ZjhhZDJmODkgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5j
b20+CiBEYXRlOiBUaHUsIDIyIEF1ZyAyMDI0IDE1OjMxOjE2ICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGZpeCBjb21waWxlIGZhaWx1cmUgd2l0aCBtdXNsCkBAIC0yMCw3ICsyMCw3IEBAIFNpZ25l
ZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL3NjZC9hcHAuYyBiL3NjZC9h
cHAuYwotaW5kZXggYmE3YmIyMy4uN2Q0MWU1MyAxMDA2NDQKK2luZGV4IGYwODA2N2UuLjFmYmU5
ZmYgMTAwNjQ0CiAtLS0gYS9zY2QvYXBwLmMKICsrKyBiL3NjZC9hcHAuYwogQEAgLTI0LDYgKzI0
LDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDIt
dXNlLXBrZ2NvbmZpZy1pbnN0ZWFkLW9mLW5wdGgtY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1j
b25maWcucGF0Y2gKaW5kZXggYTdhNmYwM2M3ZC4uYWRiYTlkNjY4OSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQt
b2YtbnB0aC1jb25maWcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251
cGcvMDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGQ1ZmMwNTk5OGQ3MjYwZmQ5NGE1NThjNTNmNmU2YzM1YTM4NGQxNjMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGFhZjBkNzZjMWViMmI4NzVmZTM1NWViYjQy
N2RlNTQ5YjZiMTcyNGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBTYXVsIFdvbGQg
PHNnd0BsaW51eC5pbnRlbC5jb20+CiBEYXRlOiBXZWQsIDE2IEF1ZyAyMDE3IDExOjE2OjMwICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHVzZSBwa2djb25maWcgaW5zdGVhZCBvZiBucHRoIGNvbmZp
ZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwNC1hdXRv
Z2VuLnNoLWZpeC1maW5kLXZlcnNpb24tZm9yLWJldGEtY2hlY2tpbmcucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lv
bi1mb3ItYmV0YS1jaGVja2luZy5wYXRjaAppbmRleCA4YWViODdkZmQ0Li4yZTU0MThiMTUxIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDA0LWF1dG9nZW4u
c2gtZml4LWZpbmQtdmVyc2lvbi1mb3ItYmV0YS1jaGVja2luZy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lv
bi1mb3ItYmV0YS1jaGVja2luZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjEzOTZhNmU3
NGQxODhhMjE5ODQzOWFhMjc0MDNjMjljMWRiY2VhOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gMjI2ZWMxZjRmMDkyODhmYjE0OGY3NGI1YWFjYmJkZjMzYTBiY2JkYyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFdlbnpvbmcgRmFuIDx3ZW56b25nLmZhbkB3aW5kcml2ZXIu
Y29tPgogRGF0ZTogV2VkLCAxNiBBdWcgMjAxNyAxMToyMzoyMiArMDgwMAogU3ViamVjdDogW1BB
VENIXSBhdXRvZ2VuLnNoOiBmaXggZmluZC12ZXJzaW9uIGZvciBiZXRhIGNoZWNraW5nCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9jYXRlLnBhdGNoCmluZGV4IDA4
ZTcwZmI0NDQuLjlkNjRkYWJhYmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2du
dXBnL2dudXBnL3JlbG9jYXRlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBn
L2dudXBnL3JlbG9jYXRlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5M2ZlZjhmNDkzZWU2
Njg1NmVmMDIzNTFkYTI1NTgzZWVhOTQyMDJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBjYTRhYWU2YTUyMDU1ZmUwOTAxNmZmNjNmN2EwMDYwNWQ1OGIxZGFlIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERh
dGU6IFdlZCwgMTkgU2VwIDIwMTggMTQ6NDQ6NDAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gQWxs
b3cgdGhlIGVudmlyb25tZW50IHRvIG92ZXJyaWRlIHdoZXJlIGdudXBnIGxvb2tzIGZvciBpdHMK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNS4yLmJiIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi41LjMuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi41LjIu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNS4zLmJiCmlu
ZGV4IDY0YzYzZTMxY2UuLjQzNTA2NmM5ZWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2dudXBnL2dudXBnXzIuNS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBn
L2dudXBnXzIuNS4zLmJiCkBAIC0yNCw3ICsyNCw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5h
dGl2ZSA9ICIgZmlsZTovLzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3It
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9yZWxvY2F0ZS5wYXRjaCIK
IFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgZmlsZTovL3JlbG9jYXRlLnBhdGNo
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2Y0MDRjY2M2YTU4NDkzZmVkYzE1ZmFlZjU5ZjNh
ZTkxNDgzMWNmZjg2NmEyM2YwYmY5ZDY2Y2ZkZDBmZWEyOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIyMzEyOGIxMzZhZWQ0ZTUxMjFlNzkzZDFiNmM2MGVlNTBjODAwN2E5ZDkyNmMxMzEzZTUyNGQw
NTM4NmI1NGFjIgogCiBFWFRSQV9PRUNPTkYgPSAiLS1kaXNhYmxlLWxkYXAgXAogCQktLWRpc2Fi
bGUtY2NpZC1kcml2ZXIgXAotLSAKMi40NC4xCgo=

--===============8461819087325755970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gnupg/gnupg-dbg: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-dbg: PKGSIZE changed from 20352560 to 20353632 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-dbg: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-dev: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-dev: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-doc: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-doc: PKGSIZE changed from 11392 to 12141 (+7%)
packages/core2-64-poky-linux/gnupg/gnupg-doc: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ca: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ca: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PKGSIZE changed from 246789 to 247454 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-el: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-el: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGSIZE changed from 224842 to 225410 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PKGSIZE changed from 222458 to 223026 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-eo: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-eo: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-et: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-et: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-fi: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-fi: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PKGSIZE changed from 200153 to 253564 (+27%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-gl: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-gl: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-hu: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-hu: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-id: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-id: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PKGSIZE changed from 253303 to 254023 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-nl: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-nl: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ro: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ro: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-sk: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-sk: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-src: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-src: PKGSIZE changed from 9026305 to 9027364 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-src: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-staticdev: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-staticdev: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.5.2.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch file://0001-fix-compile-failure-with-musl.patch" to "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.5.3.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch file://0001-fix-compile-failure-with-musl.patch"

--===============8461819087325755970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PKGSIZE changed from 200153 to 253564 (+27%)

--===============8461819087325755970==--

