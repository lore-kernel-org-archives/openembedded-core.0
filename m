Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C9AD216A0
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:25 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.11783.1728994543212041021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=I75wngTD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=i2gH8J9u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010192901b861d-6d652b36-1c50-4e6f-837c-a6b6a67f9d5f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994576;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uyePBq/vvQ8TLODEO+J0BPpj5cmg83z1O3o1YpTLR+g=;
	b=I75wngTDIEA4NkQPuZn1KNsnddVQQD22KLIiosUFDg+0Y+2yWNjipplRDYpb9d1Y
	dGRuu2nhtNnnaym6mIhHfs9GGLUJ43bZif0qJ9xwEsVJ8T7cKefFyBHW+PY3S69KJUP
	RYsRRtJ7Gau6KdgB1qkOANdMjvutN54egum2p/AI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994576;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uyePBq/vvQ8TLODEO+J0BPpj5cmg83z1O3o1YpTLR+g=;
	b=i2gH8J9uXb3P0v++nNGKc4T/LiJLKOnGz/Gb9TAsY0pkdfKGhH8zkrlqtpMa0ljQ
	xTOg5yqblbygiUwbPBn34kbGv2up51V9W7O2b2HdEvRXIr4GIeewqQgT0+etMfTzMid
	99VvQ3M5ZHAYzVcpTC25tynElQWTWClQOYh6FV3g=
Content-Type: multipart/mixed; boundary="===============1676394050152031902=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.5.1 FAILED
Message-ID: <01010192901b861d-6d652b36-1c50-4e6f-837c-a6b6a67f9d5f-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205905

--===============1676394050152031902==
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
From 12362abfc2474614a674cf031aeb1c3e59897035 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 12:13:50 +0000
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
index 77d7507edc..b1601639af 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 6392cb71a23adfd601537049da4e5e06e51d2e50 Mon Sep 17 00:00:00 2001
+From 964ec85606f76c86928bf8fad3c46da767eb5dc7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 12b1447138..0d7b536d90 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From a0e986b487891ef8e3bb41b95f969e00edd4923f Mon Sep 17 00:00:00 2001
+From 82f35e8f4e5980634b5bc2ed1175fef6ec06344e Mon Sep 17 00:00:00 2001
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
index fef05cf3c8..90adebfc4b 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
@@ -1,4 +1,4 @@
-From 4a7d4d6e45c68708ec95335b0f11d6596b23095a Mon Sep 17 00:00:00 2001
+From 82764b92c13cf92421906b3b2098ffd156a3d759 Mon Sep 17 00:00:00 2001
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
index 945abb55ff..df0b9d69b7 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From fa93b5f7c2da0e5846b80de9c6296966ca2a3d83 Mon Sep 17 00:00:00 2001
+From 09aa6c396d989ec562c0f5473ca0c49875b5df5e Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index 761fd6c608..575d48a19b 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From e8f67e3bbbdbaa17cfe88c1f7a8f488eb4936281 Mon Sep 17 00:00:00 2001
+From e538d4bd9b7c2720f5eda1e47972eb3fc964e006 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 5c4d81f87a..819588bdf6 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 4e556a5edde8a97312abae63f8e9b5f989ca5c91 Mon Sep 17 00:00:00 2001
+From e731f95dcc77798aa9590b48df761328dbab7931 Mon Sep 17 00:00:00 2001
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


--===============1676394050152031902==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.5.0-2.5.1.patch"

RnJvbSAxMjM2MmFiZmMyNDc0NjE0YTY3NGNmMDMxYWViMWMzZTU5ODk3MDM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMTI6MTM6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
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
dGNoCmluZGV4IDc3ZDc1MDdlZGMuLmIxNjAxNjM5YWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtV292ZXJyaWRlLWluaXQtaXMtbm90LW5lZWRlZC13
aXRoLWdjYy05LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAw
MDEtV292ZXJyaWRlLWluaXQtaXMtbm90LW5lZWRlZC13aXRoLWdjYy05LnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA2MzkyY2I3MWEyM2FkZmQ2MDE1MzcwNDlkYTRlNWUwNmU1MWQyZTUwIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5NjRlYzg1NjA2Zjc2Yzg2OTI4YmY4ZmFkM2M0
NmRhNzY3ZWI1ZGM3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjAgRGVjIDIwMTggMTc6Mzc6NDggLTA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gV292ZXJyaWRlLWluaXQgaXMgbm90IG5lZWRlZCB3aXRoIGdjYyA5
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLWNvbmZp
Z3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1j
dXN0b20tdmFsdWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2gKaW5kZXggMTJiMTQ0NzEzOC4u
MGQ3YjUzNmQ5MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcv
MDAwMS1jb25maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2Yt
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtY29uZmln
dXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gYTBlOTg2YjQ4Nzg5MWVmOGUzYmI0MWI5NWY5NjllMDBlZGQ0OTIz
ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODJmMzVlOGY0ZTU5ODA2MzRiNWJjMmVk
MTE3NWZlZjZlYzA2MzQ0ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRl
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
LnBhdGNoCmluZGV4IGZlZjA1Y2YzYzguLjkwYWRlYmZjNGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtZml4LWNvbXBpbGUtZmFpbHVyZS13aXRoLW11
c2wucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1maXgt
Y29tcGlsZS1mYWlsdXJlLXdpdGgtbXVzbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNGE3
ZDRkNmU0NWM2ODcwOGVjOTUzMzViMGYxMWQ2NTk2YjIzMDk1YSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gODI3NjRiOTJjMTNjZjkyNDIxOTA2YjNiMjA5OGZmZDE1NmEzZDc1OSBNb24g
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
OTQ1YWJiNTVmZi4uZGYwYjlkNjliNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Z251cGcvZ251cGcvMDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMi11c2UtcGtnY29u
ZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGZh
OTNiNWY3YzJkYTBlNTg0NmI4MGRlOWM2Mjk2OTY2Y2EyYTNkODMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDA5YWE2YzM5NmQ5ODllYzU2MmMwZjU0NzNjYTBjNDk4NzViNWRmNWUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBTYXVsIFdvbGQgPHNnd0BsaW51eC5pbnRlbC5j
b20+CiBEYXRlOiBXZWQsIDE2IEF1ZyAyMDE3IDExOjE2OjMwICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHVzZSBwa2djb25maWcgaW5zdGVhZCBvZiBucHRoIGNvbmZpZwpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwNC1hdXRvZ2VuLnNoLWZpeC1maW5kLXZl
cnNpb24tZm9yLWJldGEtY2hlY2tpbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVw
Zy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lvbi1mb3ItYmV0YS1jaGVja2lu
Zy5wYXRjaAppbmRleCA3NjFmZDZjNjA4Li41NzVkNDhhMTliIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lv
bi1mb3ItYmV0YS1jaGVja2luZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVw
Zy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lvbi1mb3ItYmV0YS1jaGVja2lu
Zy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZThmNjdlM2JiYmRiYWExN2NmZTg4YzFmN2E4
ZjQ4OGViNDkzNjI4MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTUzOGQ0YmQ5Yjdj
MjcyMGY1ZWRhMWU0Nzk3MmViM2ZjOTY0ZTAwNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IFdlbnpvbmcgRmFuIDx3ZW56b25nLmZhbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAx
NiBBdWcgMjAxNyAxMToyMzoyMiArMDgwMAogU3ViamVjdDogW1BBVENIXSBhdXRvZ2VuLnNoOiBm
aXggZmluZC12ZXJzaW9uIGZvciBiZXRhIGNoZWNraW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2dudXBnL2dudXBnL3JlbG9jYXRlLnBhdGNoCmluZGV4IDVjNGQ4MWY4N2EuLjgxOTU4OGJk
ZjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9jYXRl
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9jYXRlLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0ZTU1NmE1ZWRkZThhOTczMTJhYmFlNjNmOGU5YjVm
OTg5Y2E1YzkxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlNzMxZjk1ZGNjNzc3OThh
YTk1OTBiNDhkZjc2MTMyOGRiYWI3OTMxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
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

--===============1676394050152031902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:97a3d3c76facf23f47430b4b6067a53570dfa8c8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 168 Local 157 Mirrors 0 Missed 11 Current 291 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 343 of 459 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnupg-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnupg-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
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
NOTE: recipe gnupg-2.5.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gnupg-2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_populate_lic unihash changed to aacc16a4fdab499bb2374fc0044509da01473b42edb63271e2c112ef8f716699
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_deploy_source_date_epoch unihash changed to 00db8dd10a42782edf8785bc36c4a6361c3e8a5058e6479955fc3072c46f37e8
NOTE: Setscene tasks completed
NOTE: Running task 1286 of 1298 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_configure)
NOTE: recipe gnupg-2.5.1-r0: task do_configure: Started
NOTE: recipe gnupg-2.5.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1286 tasks of which 1278 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015121325.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015121325.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.1/temp/log.do_configure.3828686
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gnupg-2.5.1-r0 do_configure: QA Issue: gnupg: configure was passed unrecognised options: --enable-gpg-is-gpg2 [unknown-configure-option]
ERROR: gnupg-2.5.1-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gnupg/2.5.1/temp/log.do_configure.3828686
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.5.1.bb:do_configure) failed with exit code '1'

--===============1676394050152031902==--

