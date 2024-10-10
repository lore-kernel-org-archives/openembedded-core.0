Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38061CFD37D
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:29 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.53369.1728588954782951292
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jfyxSEjM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XBdtxwMf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019277ee9aee-9c083935-9284-4ef6-b1a7-9ea73a5e68bb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588979;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+3RYAlcE7p7hoeIpIF1fmaScTzxhLZ3l2q4xinZAdzM=;
	b=jfyxSEjMQG5GKX9UuxYU6xQq5Cdb/Jdl6pTjLuozgIy+Q8y5U7kCI+01do/WA7js
	FcDQOzziitl8b5b7wzJBxbtOk7ky3sA1OXd0nrJ1FilApH40bV4oKE9GYdekg6iHs9x
	9cL1ZUE3b7JdxVLWC0qg1WC1uLOi8CaZdVQyNwvM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588979;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+3RYAlcE7p7hoeIpIF1fmaScTzxhLZ3l2q4xinZAdzM=;
	b=XBdtxwMffHRTqtFuLELvphDGabw0w9EZqQgz95hkXsM353fWpktJJVjEJNqWn2BW
	riKvydPZT6uJlFL49HC/9y4CRJOOVkvdEoYETnG5LG1jsTlkn8GNzlAQ7+lAD63aRT+
	XrSPuCVIaeRvAd8k0PAR6wFRzToCMLpuRvhybIHM=
Content-Type: multipart/mixed; boundary="===============0503827190138717637=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.5.1 FAILED
Message-ID: <0101019277ee9aee-9c083935-9284-4ef6-b1a7-9ea73a5e68bb-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205553

--===============0503827190138717637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnupg* to *2.5.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.5.0-2.5.1.patch
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
From 63a53d8c6f39248330c1ae926b35036b1b8a8c7d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 06:31:51 +0000
Subject: [PATCH] gnupg: upgrade 2.5.0 -> 2.5.1

---
 ...0001-Woverride-init-is-not-needed-with-gcc-9.patch |  2 +-
 ...e.ac-use-a-custom-value-for-the-location-of-.patch |  6 +++---
 .../gnupg/0001-fix-compile-failure-with-musl.patch    | 11 ++++-------
 .../0002-use-pkgconfig-instead-of-npth-config.patch   |  2 +-
 ...utogen.sh-fix-find-version-for-beta-checking.patch |  2 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch       |  4 ++--
 .../gnupg/{gnupg_2.5.0.bb => gnupg_2.5.1.bb}          |  2 +-
 7 files changed, 13 insertions(+), 16 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.0.bb => gnupg_2.5.1.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 77d7507edc..1b75680faa 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 6392cb71a23adfd601537049da4e5e06e51d2e50 Mon Sep 17 00:00:00 2001
+From 9749e2372d7b92b202b9d4ec3c9b104e1e265a42 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 12b1447138..fd0f02ea7f 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From a0e986b487891ef8e3bb41b95f969e00edd4923f Mon Sep 17 00:00:00 2001
+From 4dd4fba59831bffbfacf3a5c2c819a17a8eb56ef Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index e4f8c0e..fa75ec8 100644
+index 29592fd..7286862 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1925,7 +1925,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1911,7 +1911,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
index fef05cf3c8..3b8db42b86 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
@@ -1,4 +1,4 @@
-From 4a7d4d6e45c68708ec95335b0f11d6596b23095a Mon Sep 17 00:00:00 2001
+From c546918280e88ef953339a08c66908cb84e09343 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 22 Aug 2024 15:31:16 +0800
 Subject: [PATCH] fix compile failure with musl
@@ -20,17 +20,14 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/scd/app.c b/scd/app.c
-index 926ab79..7bf58a2 100644
+index 525950e..7180178 100644
 --- a/scd/app.c
 +++ b/scd/app.c
-@@ -23,6 +23,7 @@
- #include <stdlib.h>
+@@ -24,6 +24,7 @@
  #include <string.h>
+ #include <unistd.h>
  #include <npth.h>
 +#include <unistd.h>
  
  #include "scdaemon.h"
  #include "../common/exechelp.h"
--- 
-2.27.0
-
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 945abb55ff..bb0dff364a 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From fa93b5f7c2da0e5846b80de9c6296966ca2a3d83 Mon Sep 17 00:00:00 2001
+From 202af7a19de7a9653843fa72eb1e08de88729c51 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index 761fd6c608..e6e0de32df 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From e8f67e3bbbdbaa17cfe88c1f7a8f488eb4936281 Mon Sep 17 00:00:00 2001
+From aabbc2ff50da86ea1142dd8cab423d81659b2c40 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 5c4d81f87a..a7a2ca6fa4 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 4e556a5edde8a97312abae63f8e9b5f989ca5c91 Mon Sep 17 00:00:00 2001
+From 94f79a1889ecaa6f272d6d93a546bb80e7a70fec Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 3929108..d3a7b8f 100644
+index a73182e..9994a9a 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
 @@ -1439,7 +1439,7 @@ gnupg_socketdir (void)
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.0.bb b/meta/recipes-support/gnupg/gnupg_2.5.1.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.0.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.1.bb
index 9cfdbdf0a4..76bd5a3773 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.0.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.1.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "2222c827d4e7087f15e7f72739d004abc1d05c6c5f0a5a12b24c6a6cc5d173fb"
+SRC_URI[sha256sum] = "8a34bb318499867962c939e156666ada93ed81f01926590ac68f3ff79178375e"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.44.1


--===============0503827190138717637==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.5.0-2.5.1.patch"

RnJvbSA2M2E1M2Q4YzZmMzkyNDgzMzBjMWFlOTI2YjM1MDM2YjFiOGE4YzdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDY6MzE6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bnVwZzogdXBncmFkZSAyLjUuMCAtPiAyLjUuMQoKLS0tCiAuLi4wMDAxLVdvdmVycmlkZS1pbml0
LWlzLW5vdC1uZWVkZWQtd2l0aC1nY2MtOS5wYXRjaCB8ICAyICstCiAuLi5lLmFjLXVzZS1hLWN1
c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaCB8ICA2ICsrKy0tLQogLi4uL2du
dXBnLzAwMDEtZml4LWNvbXBpbGUtZmFpbHVyZS13aXRoLW11c2wucGF0Y2ggICAgfCAxMSArKysr
LS0tLS0tLQogLi4uLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFkLW9mLW5wdGgtY29uZmlnLnBh
dGNoICAgfCAgMiArLQogLi4udXRvZ2VuLnNoLWZpeC1maW5kLXZlcnNpb24tZm9yLWJldGEtY2hl
Y2tpbmcucGF0Y2ggfCAgMiArLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVs
b2NhdGUucGF0Y2ggICAgICAgfCAgNCArKy0tCiAuLi4vZ251cGcve2dudXBnXzIuNS4wLmJiID0+
IGdudXBnXzIuNS4xLmJifSAgICAgICAgICB8ICAyICstCiA3IGZpbGVzIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2dudXBnL3tnbnVwZ18yLjUuMC5iYiA9PiBnbnVwZ18yLjUuMS5iYn0gKDk3JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLVdvdmVycmlkZS1pbml0
LWlzLW5vdC1uZWVkZWQtd2l0aC1nY2MtOS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2du
dXBnL2dudXBnLzAwMDEtV292ZXJyaWRlLWluaXQtaXMtbm90LW5lZWRlZC13aXRoLWdjYy05LnBh
dGNoCmluZGV4IDc3ZDc1MDdlZGMuLjFiNzU2ODBmYWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtV292ZXJyaWRlLWluaXQtaXMtbm90LW5lZWRlZC13
aXRoLWdjYy05LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAw
MDEtV292ZXJyaWRlLWluaXQtaXMtbm90LW5lZWRlZC13aXRoLWdjYy05LnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA2MzkyY2I3MWEyM2FkZmQ2MDE1MzcwNDlkYTRlNWUwNmU1MWQyZTUwIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5NzQ5ZTIzNzJkN2I5MmIyMDJiOWQ0ZWMzYzli
MTA0ZTFlMjY1YTQyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjAgRGVjIDIwMTggMTc6Mzc6NDggLTA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gV292ZXJyaWRlLWluaXQgaXMgbm90IG5lZWRlZCB3aXRoIGdjYyA5
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLWNvbmZp
Z3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1j
dXN0b20tdmFsdWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2gKaW5kZXggMTJiMTQ0NzEzOC4u
ZmQwZjAyZWE3ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcv
MDAwMS1jb25maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2Yt
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtY29uZmln
dXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gYTBlOTg2YjQ4Nzg5MWVmOGUzYmI0MWI5NWY5NjllMDBlZGQ0OTIz
ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNGRkNGZiYTU5ODMxYmZmYmZhY2YzYTVj
MmM4MTlhMTdhOGViNTZlZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogTW9uLCAyMiBKYW4gMjAx
OCAxODowMDoyMSArMDIwMAogU3ViamVjdDogW1BBVENIXSBjb25maWd1cmUuYWM6IHVzZSBhIGN1
c3RvbSB2YWx1ZSBmb3IgdGhlIGxvY2F0aW9uIG9mCkBAIC0xMywxMCArMTMsMTAgQEAgU2lnbmVk
LW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQg
YS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGU0ZjhjMGUuLmZhNzVlYzggMTAw
NjQ0CitpbmRleCAyOTU5MmZkLi43Mjg2ODYyIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiAr
KysgYi9jb25maWd1cmUuYWMKLUBAIC0xOTI1LDcgKzE5MjUsNyBAQCBBQ19ERUZJTkVfVU5RVU9U
RUQoR1BHQ09ORl9ESVNQX05BTUUsICJHUEdDb25mIiwKK0BAIC0xOTExLDcgKzE5MTEsNyBAQCBB
Q19ERUZJTkVfVU5RVU9URUQoR1BHQ09ORl9ESVNQX05BTUUsICJHUEdDb25mIiwKICAKICBBQ19E
RUZJTkVfVU5RVU9URUQoR1BHVEFSX05BTUUsICJncGd0YXIiLCBbVGhlIG5hbWUgb2YgdGhlIGdw
Z3RhciB0b29sXSkKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2du
dXBnLzAwMDEtZml4LWNvbXBpbGUtZmFpbHVyZS13aXRoLW11c2wucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLWZpeC1jb21waWxlLWZhaWx1cmUtd2l0aC1tdXNs
LnBhdGNoCmluZGV4IGZlZjA1Y2YzYzguLjNiOGRiNDJiODYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtZml4LWNvbXBpbGUtZmFpbHVyZS13aXRoLW11
c2wucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1maXgt
Y29tcGlsZS1mYWlsdXJlLXdpdGgtbXVzbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNGE3
ZDRkNmU0NWM2ODcwOGVjOTUzMzViMGYxMWQ2NTk2YjIzMDk1YSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gYzU0NjkxODI4MGU4OGVmOTUzMzM5YTA4YzY2OTA4Y2I4NGUwOTM0MyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJp
dmVyLmNvbT4KIERhdGU6IFRodSwgMjIgQXVnIDIwMjQgMTU6MzE6MTYgKzA4MDAKIFN1YmplY3Q6
IFtQQVRDSF0gZml4IGNvbXBpbGUgZmFpbHVyZSB3aXRoIG11c2wKQEAgLTIwLDE3ICsyMCwxNCBA
QCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9zY2QvYXBwLmMg
Yi9zY2QvYXBwLmMKLWluZGV4IDkyNmFiNzkuLjdiZjU4YTIgMTAwNjQ0CitpbmRleCA1MjU5NTBl
Li43MTgwMTc4IDEwMDY0NAogLS0tIGEvc2NkL2FwcC5jCiArKysgYi9zY2QvYXBwLmMKLUBAIC0y
Myw2ICsyMyw3IEBACi0gI2luY2x1ZGUgPHN0ZGxpYi5oPgorQEAgLTI0LDYgKzI0LDcgQEAKICAj
aW5jbHVkZSA8c3RyaW5nLmg+CisgI2luY2x1ZGUgPHVuaXN0ZC5oPgogICNpbmNsdWRlIDxucHRo
Lmg+CiArI2luY2x1ZGUgPHVuaXN0ZC5oPgogIAogICNpbmNsdWRlICJzY2RhZW1vbi5oIgogICNp
bmNsdWRlICIuLi9jb21tb24vZXhlY2hlbHAuaCIKLS0tIAotMi4yNy4wCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0
ZWFkLW9mLW5wdGgtY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251
cGcvMDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0Y2gKaW5kZXgg
OTQ1YWJiNTVmZi4uYmIwZGZmMzY0YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Z251cGcvZ251cGcvMDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMi11c2UtcGtnY29u
ZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGZh
OTNiNWY3YzJkYTBlNTg0NmI4MGRlOWM2Mjk2OTY2Y2EyYTNkODMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDIwMmFmN2ExOWRlN2E5NjUzODQzZmE3MmViMWUwOGRlODg3MjljNTEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBTYXVsIFdvbGQgPHNnd0BsaW51eC5pbnRlbC5j
b20+CiBEYXRlOiBXZWQsIDE2IEF1ZyAyMDE3IDExOjE2OjMwICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHVzZSBwa2djb25maWcgaW5zdGVhZCBvZiBucHRoIGNvbmZpZwpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwNC1hdXRvZ2VuLnNoLWZpeC1maW5kLXZl
cnNpb24tZm9yLWJldGEtY2hlY2tpbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVw
Zy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lvbi1mb3ItYmV0YS1jaGVja2lu
Zy5wYXRjaAppbmRleCA3NjFmZDZjNjA4Li5lNmUwZGUzMmRmIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lv
bi1mb3ItYmV0YS1jaGVja2luZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVw
Zy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lvbi1mb3ItYmV0YS1jaGVja2lu
Zy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZThmNjdlM2JiYmRiYWExN2NmZTg4YzFmN2E4
ZjQ4OGViNDkzNjI4MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWFiYmMyZmY1MGRh
ODZlYTExNDJkZDhjYWI0MjNkODE2NTliMmM0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IFdlbnpvbmcgRmFuIDx3ZW56b25nLmZhbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAx
NiBBdWcgMjAxNyAxMToyMzoyMiArMDgwMAogU3ViamVjdDogW1BBVENIXSBhdXRvZ2VuLnNoOiBm
aXggZmluZC12ZXJzaW9uIGZvciBiZXRhIGNoZWNraW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2dudXBnL2dudXBnL3JlbG9jYXRlLnBhdGNoCmluZGV4IDVjNGQ4MWY4N2EuLmE3YTJjYTZm
YTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9jYXRl
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9jYXRlLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0ZTU1NmE1ZWRkZThhOTczMTJhYmFlNjNmOGU5YjVm
OTg5Y2E1YzkxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5NGY3OWExODg5ZWNhYTZm
MjcyZDZkOTNhNTQ2YmI4MGU3YTcwZmVjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Um9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFdlZCwgMTkgU2VwIDIw
MTggMTQ6NDQ6NDAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gQWxsb3cgdGhlIGVudmlyb25tZW50
IHRvIG92ZXJyaWRlIHdoZXJlIGdudXBnIGxvb2tzIGZvciBpdHMKQEAgLTEzLDcgKzEzLDcgQEAg
U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogCiBkaWZmIC0t
Z2l0IGEvY29tbW9uL2hvbWVkaXIuYyBiL2NvbW1vbi9ob21lZGlyLmMKLWluZGV4IDM5MjkxMDgu
LmQzYTdiOGYgMTAwNjQ0CitpbmRleCBhNzMxODJlLi45OTk0YTlhIDEwMDY0NAogLS0tIGEvY29t
bW9uL2hvbWVkaXIuYwogKysrIGIvY29tbW9uL2hvbWVkaXIuYwogQEAgLTE0MzksNyArMTQzOSw3
IEBAIGdudXBnX3NvY2tldGRpciAodm9pZCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2dudXBnL2dudXBnXzIuNS4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251
cGdfMi41LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvZ251cGcvZ251cGdfMi41LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2dudXBnL2dudXBnXzIuNS4xLmJiCmluZGV4IDljZmRiZGYwYTQuLjc2YmQ1YTM3NzMgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNS4wLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNS4xLmJiCkBAIC0yNCw3ICsyNCw3
IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovLzAwMDEtY29uZmlndXJl
LmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9yZWxvY2F0ZS5wYXRjaCIKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZXNk
ayA9ICIgZmlsZTovL3JlbG9jYXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjIy
MmM4MjdkNGU3MDg3ZjE1ZTdmNzI3MzlkMDA0YWJjMWQwNWM2YzVmMGE1YTEyYjI0YzZhNmNjNWQx
NzNmYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4YTM0YmIzMTg0OTk4Njc5NjJjOTM5ZTE1NjY2
NmFkYTkzZWQ4MWYwMTkyNjU5MGFjNjhmM2ZmNzkxNzgzNzVlIgogCiBFWFRSQV9PRUNPTkYgPSAi
LS1kaXNhYmxlLWxkYXAgXAogCQktLWRpc2FibGUtY2NpZC1kcml2ZXIgXAotLSAKMi40NC4xCgo=

--===============0503827190138717637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1873 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (916 cached, 1 parsed). 1871 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:520d76f16e051f84ca7b2bd9add48e08ca7ef6c6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 162 Local 150 Mirrors 0 Missed 12 Current 297 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1080 of 1298 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_recipe_qa)
NOTE: recipe gnupg-2.5.1-r0: task do_recipe_qa: Started
NOTE: recipe gnupg-2.5.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1279 of 1298 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_fetch)
NOTE: recipe gnupg-2.5.1-r0: task do_fetch: Started
NOTE: recipe gnupg-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1280 of 1298 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_unpack)
NOTE: Running task 1281 of 1298 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnupg-2.5.1-r0: task do_unpack: Started
NOTE: recipe gnupg-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnupg-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1282 of 1298 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_patch)
NOTE: Running task 1283 of 1298 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_collect_spdx_deps)
NOTE: recipe gnupg-2.5.1-r0: task do_patch: Started
NOTE: recipe gnupg-2.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnupg-2.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnupg-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1284 of 1298 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1285 of 1298 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_populate_lic)
NOTE: recipe gnupg-2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnupg-2.5.1-r0: task do_populate_lic: Started
NOTE: recipe gnupg-2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnupg-2.5.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1286 of 1298 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_configure)
NOTE: recipe gnupg-2.5.1-r0: task do_configure: Started
NOTE: recipe gnupg-2.5.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1286 tasks of which 1277 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010063125.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010063125.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.1/temp/log.do_configure.3280829
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gnupg-2.5.1-r0 do_configure: QA Issue: gnupg: configure was passed unrecognised options: --enable-gpg-is-gpg2 [unknown-configure-option]
ERROR: gnupg-2.5.1-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.1/temp/log.do_configure.3280829
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_configure) failed with exit code '1'

--===============0503827190138717637==--

